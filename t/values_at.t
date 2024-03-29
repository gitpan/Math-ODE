use Test::More tests => 1;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::ODE;

my $val;

my $o = new Math::ODE ( 
            file => 'data',
			step => 0.1,
			initial => [0], 
            keep_values => 0,
			ODE => [ \&DE1 ], 
			t0 => 0,
			tf => 1 );
if ( $o->evolve ) {
	eval { $val = $o->values_at( 0.1 ) };
	ok( !defined $val, "keep_values does what it is told"); 
} else {
	ok( 0, 'Constant Coefficient Equation died due to numerical shenanigans');
}
sub DE1 { my ($t,$y) = @_; return 5; }
