#!/usr/bin/env perl

use Mojolicious::Lite;
use XML::Simple;

post '/' => sub {
	my $c = shift;

	my $from = $c->param('from');
	my $to   = $c->param('to');

	app->log->debug("from: '$from'");
	app->log->debug("to: '$to'");

	$c->render(
		format => "xml",
		data => XMLout( { Reject => [ { reason => "busy" } ] }, RootName => "Response"),
		# data => XMLout( { Reject => [ { } ] }, RootName => "Response"),
	);
};

app->start();
