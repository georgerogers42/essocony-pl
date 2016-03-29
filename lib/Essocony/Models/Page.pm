package Essocony::Models::Page;
use Moo;
use namespace::clean;

has title => (is => 'ro');
has slug => (is => 'ro');
has author => (is => 'ro');
has date => (is => 'ro');
has contents => (is => 'ro');

1;
