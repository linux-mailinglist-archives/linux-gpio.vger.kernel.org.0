Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77AC97217A1
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jun 2023 16:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjFDOVh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Jun 2023 10:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjFDOVg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Jun 2023 10:21:36 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF88CF
        for <linux-gpio@vger.kernel.org>; Sun,  4 Jun 2023 07:21:33 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-650c89c7e4fso3834800b3a.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jun 2023 07:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685888492; x=1688480492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W82R9xTXkgWUZyUHrcYJ5Xhh6M0jvmlISbrilJbcZwE=;
        b=TtYqfHQnJ8KEAaePs7MTZH8Bo/J2ykL9kZg20w5qJCO6vQ9h673b0n1xslp2bL7JY8
         ST8Csr0uPJurF9jKok7Kjr8YnDcyUbI1o4C9XZdDAS/cVOOpi18jKmiCmuwG6H1Wo8bp
         XL4Qj9L04bVJKTjLk/Oy4MafORoduIuA97Wl++8Jx5VSMuB1iRWpZg7sH86/cMFibds3
         N+3pVEVXjvFuSyB9wCKbbAoYnS5zPah8ipYSer3dgHDnQKiVHnBKDnWzhMkp4Bs9Eptp
         o9zrTm5NfDmhlMaRS9sPuuxqKSiUZtFTctdyBK1FIcyoU51+AQjm86uFLa3c8RtjQakh
         eIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685888492; x=1688480492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W82R9xTXkgWUZyUHrcYJ5Xhh6M0jvmlISbrilJbcZwE=;
        b=eQGzGJR0YM40wZOoFHfscsuVBrRBEGby26rwzaf0VBFBMQSsnzCcpSk0bdnPUzgWme
         P25pBpZFErPPOz5COdqVMEWMNnJXPDCJPIlIyFnQTAyKJwZ8gzg2/G5Msu5bEkTyuri2
         rbFibWjFAT3Oic3Ce0GcjyKBNFEO/TBVOh5Ui5kGcB8FNxoT7td3LJ6Gd5WUBeq1eCdx
         DXrqc3pR6NagbfS6iMgIhFKETXguJ6m0/LcmYpqAxHcE2jjRDQ0KIKmHvH6qkI/PGcuc
         Wa65/IhivOjcvrahBqq5R7Xpim2+UJJ9o3U2lfi8aycPJSJEMH9dEHCU3Hxt6DoM9MOa
         QvCg==
X-Gm-Message-State: AC+VfDzKBhH24wQLnc8LgdetpDgNtne/3/fg6/FhD1NoF5Qlg0a1T1sM
        slFky6Dbil0dM7n0vCDngc+ximZngu0=
X-Google-Smtp-Source: ACHHUZ5LsQ040mN2/4B/bVxpjcYgA7oCOHMT8HzNRZO5rO1U12+TtzTwAj9NaKA+xKGcsL8DKt4LlQ==
X-Received: by 2002:a05:6a00:2d1a:b0:652:c336:e63e with SMTP id fa26-20020a056a002d1a00b00652c336e63emr9445948pfb.31.1685888492274;
        Sun, 04 Jun 2023 07:21:32 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id j9-20020a62e909000000b0065992d334f4sm709356pfh.177.2023.06.04.07.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 07:21:31 -0700 (PDT)
Date:   Sun, 4 Jun 2023 22:21:27 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Matni <gabriel.matni@exfo.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod][PATCH V2] tools: gpiomon/gpionotify: add idle-timeout
 option
Message-ID: <ZHyd5+7rnRD8OcJU@sol>
References: <PH8PR11MB714268EC29F5D6A1C1CF6B8A864CA@PH8PR11MB7142.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH8PR11MB714268EC29F5D6A1C1CF6B8A864CA@PH8PR11MB7142.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 04, 2023 at 02:04:21PM +0000, Gabriel Matni wrote:
> From: Gabriel Matni <gabriel.matni@exfo.com>
> 
> Add an idle timeout option. It allows the tool to gracefully exit upon
> expiry.  This option is handy for scripting as it allows the developer to
> take an action when no event has been detected for a given period.
> 

"exit upon expiry" is vague - one of the reasons I wanted the option
renamed --idle-timeout.

So maybe just

"Add an idle timeout option to gpiomon and gpionotify to exit gracefully
when no event has been detected for a given period."

A few other minor nits below.

Otherwise looks good to me.

Cheers,
Kent.

> Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
> ---
> V1 -> V2: Addressed the following review comments:
> - Renamed timeout option to idle-timeout 
> - Timeout value is now signed
> - Reused print_period_help() for idle-timeout option
> - Added the idle-timeout option to gpionotify for consistency
> 
>  tools/gpiomon.c    | 15 ++++++++++++++-
>  tools/gpionotify.c | 16 +++++++++++++++-
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index c2684c2a4dd4..91e602cdbb5e 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -30,6 +30,7 @@ struct config {
>  	const char *fmt;
>  	enum gpiod_line_clock event_clock;
>  	int timestamp_fmt;
> +	int timeout;
>  };
>  
>  static void print_help(void)
> @@ -57,6 +58,8 @@ static void print_help(void)
>  	printf("\t\t\tBy default 'realtime' is formatted as UTC, others as raw u64.\n");
>  	printf("  -h, --help\t\tdisplay this help and exit\n");
>  	printf("  -F, --format <fmt>\tspecify a custom output format\n");
> +	printf("      --idle-timeout <period>\n");
> +	printf("\t\t\texit gracefully if no events occurred during the specified period\n");

if no events occur for the period specified

>  	printf("  -l, --active-low\ttreat the line as active low, flipping the sense of\n");
>  	printf("\t\t\trising and falling edges\n");
>  	printf("      --localtime\tformat event timestamps as local time\n");
> @@ -123,6 +126,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
>  		{ "event-clock", required_argument, NULL,	'E' },
>  		{ "format",	required_argument, NULL,	'F' },
>  		{ "help",	no_argument,	NULL,		'h' },
> +		{ "idle-timeout",	required_argument,	NULL,		'i' },
>  		{ "localtime",	no_argument,	&cfg->timestamp_fmt,	2 },
>  		{ "num-events",	required_argument, NULL,	'n' },
>  		{ "quiet",	no_argument,	NULL,		'q' },
> @@ -139,6 +143,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
>  	memset(cfg, 0, sizeof(*cfg));
>  	cfg->edges = GPIOD_LINE_EDGE_BOTH;
>  	cfg->consumer = "gpiomon";
> +	cfg->timeout = -1;
>  
>  	for (;;) {
>  		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
> @@ -170,6 +175,9 @@ static int parse_config(int argc, char **argv, struct config *cfg)
>  		case 'F':
>  			cfg->fmt = optarg;
>  			break;
> +		case 'i':
> +			cfg->timeout = parse_period_or_die(optarg) / 1000;
> +			break;
>  		case 'l':
>  			cfg->active_low = true;
>  			break;
> @@ -443,11 +451,16 @@ int main(int argc, char **argv)
>  		print_banner(argc, argv);
>  
>  	for (;;) {
> +		int ret;

Declare at the top of the function.
Hang on - there is one there already for gpiomon, so you don't need this at all.

>  		fflush(stdout);
>  
> -		if (poll(pollfds, resolver->num_chips, -1) < 0)
> +		ret = poll(pollfds, resolver->num_chips, cfg.timeout);
> +		if (ret < 0)
>  			die_perror("error polling for events");
>  
> +		if (ret == 0)
> +			goto done;
> +
>  		for (i = 0; i < resolver->num_chips; i++) {
>  			if (pollfds[i].revents == 0)
>  				continue;
> diff --git a/tools/gpionotify.c b/tools/gpionotify.c
> index 990ca04519b5..863c5d046542 100644
> --- a/tools/gpionotify.c
> +++ b/tools/gpionotify.c
> @@ -23,6 +23,7 @@ struct config {
>  	const char *chip_id;
>  	const char *fmt;
>  	int timestamp_fmt;
> +	int timeout;
>  };
>  
>  static void print_help(void)
> @@ -43,6 +44,8 @@ static void print_help(void)
>  	printf("\t\t\t(default is all events)\n");
>  	printf("  -h, --help\t\tdisplay this help and exit\n");
>  	printf("  -F, --format <fmt>\tspecify a custom output format\n");
> +	printf("      --idle-timeout <period>\n");
> +	printf("\t\t\texit gracefully if no events occurred during the specified period\n");

as per gpiomon

>  	printf("      --localtime\tconvert event timestamps to local time\n");
>  	printf("  -n, --num-events <num>\n");
>  	printf("\t\t\texit after processing num events\n");
> @@ -52,6 +55,7 @@ static void print_help(void)
>  	printf("      --utc\t\tconvert event timestamps to UTC\n");
>  	printf("  -v, --version\t\toutput version information and exit\n");
>  	print_chip_help();
> +	print_period_help();
>  	printf("\n");
>  	printf("Format specifiers:\n");
>  	printf("  %%o   GPIO line offset\n");
> @@ -89,6 +93,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
>  		{ "event",	required_argument, NULL,	'e' },
>  		{ "format",	required_argument, NULL,	'F' },
>  		{ "help",	no_argument,	NULL,		'h' },
> +		{ "idle-timeout",	required_argument,	NULL,		'i' },
>  		{ "localtime",	no_argument,	&cfg->timestamp_fmt, 2 },
>  		{ "num-events",	required_argument, NULL,	'n' },
>  		{ "quiet",	no_argument,	NULL,		'q' },
> @@ -103,6 +108,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
>  	int opti, optc;
>  
>  	memset(cfg, 0, sizeof(*cfg));
> +	cfg->timeout = -1;
>  
>  	for (;;) {
>  		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
> @@ -125,6 +131,9 @@ static int parse_config(int argc, char **argv, struct config *cfg)
>  		case 'F':
>  			cfg->fmt = optarg;
>  			break;
> +		case 'i':
> +			cfg->timeout = parse_period_or_die(optarg) / 1000;
> +			break;
>  		case 'n':
>  			cfg->events_wanted = parse_uint_or_die(optarg);
>  			break;
> @@ -411,11 +420,16 @@ int main(int argc, char **argv)
>  		print_banner(argc, argv);
>  
>  	for (;;) {
> +		int ret;

Declare at the top of the function.

>  		fflush(stdout);
>  
> -		if (poll(pollfds, resolver->num_chips, -1) < 0)
> +		ret = poll(pollfds, resolver->num_chips, cfg.timeout);
> +		if (ret < 0)
>  			die_perror("error polling for events");
>  
> +		if (ret == 0)
> +			goto done;
> +
>  		for (i = 0; i < resolver->num_chips; i++) {
>  			if (pollfds[i].revents == 0)
>  				continue;
> 
> base-commit: b10c5b769978412e315507ae07fa554b09ca189f
> -- 
> 2.25.1
