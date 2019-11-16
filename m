Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D00CFECF4
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2019 16:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727693AbfKPPkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Nov 2019 10:40:35 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35955 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727655AbfKPPkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Nov 2019 10:40:35 -0500
Received: by mail-pl1-f194.google.com with SMTP id d7so6821752pls.3
        for <linux-gpio@vger.kernel.org>; Sat, 16 Nov 2019 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=etg9fHYz7WXIc2RfXQnqDEfb4uSTSSnNU6MTQluwib4=;
        b=CKQuuFrSpJiTnUmnm1n1w2v779AZJcdjmYb2OjDwOabjtF4WY9M4o4/A3gctf3e0Ax
         ldKDWqcoXrS3MRyPMTz7JVbzMR4lctelQIPwM4IEDAqHQ5FC3FYi61jPG+ZSerGQyqYZ
         86SPsMUV8sxL55+baqRhYUNZoetKlrCABZw2LJqEHGAWG4XVr8RiwmtnoDb+68+eP/QB
         msdREXKo4MFENGo7NwCE30xTDCFmwOo94JtSKYZe8zncUPUPzSpmxY356x5QmH0377GQ
         kZoWgxqH85CM5bT0QLR7u2lDcm7lkh980q/rUkJfdLFMWxmhrOCP23Xogeg4kcF9vjj8
         rh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=etg9fHYz7WXIc2RfXQnqDEfb4uSTSSnNU6MTQluwib4=;
        b=nTDTQy8j80BMjpKjm4Yo0ki03WT19fok5mTXy70JWUGgv0lmPJ7JwZGry93kvmabkz
         471UlaaJ+4mjTuLfHn/y4IMXU6zGzal4epqA3QWT34jzyhaFMeBTiujKvU3Z8YC5gkTU
         MlJoUC2dtZIevG48CWXAVcIgHJt+wOy0G8dj89y+YzfxVi18R83PKgllNvDeYVVKWIVG
         8n6eRVjJnLf7u55+SF0PyfewtLbo8QYr93eojhX0qbkaiRVEsbwiUECW9FGtSUcfnXvP
         Uq934VVlBp/jdVSMQFYJjzGoNG5SbinCvlw5rvFmoE2I9Z6jNHehKKxj+6X7LEQJehXq
         HxBA==
X-Gm-Message-State: APjAAAWRbPzsi0AS2UxAexTqEMm0EA33JAof8unBoIpACWNrtok6zoxU
        TSCpE1VMFlgJL1J+fxaJ5VxbBhCnJVwemw==
X-Google-Smtp-Source: APXvYqxnjro41OhvyH7nvi9utaY9NiGMdSUsBUL+7XTUGXlU6gZXFJBtidKEW2MdnMDbip2G9yhM6A==
X-Received: by 2002:a17:90b:11cb:: with SMTP id gv11mr27419477pjb.61.1573918834069;
        Sat, 16 Nov 2019 07:40:34 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b82sm14649831pfb.33.2019.11.16.07.40.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Nov 2019 07:40:33 -0800 (PST)
Date:   Sat, 16 Nov 2019 23:40:28 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: Re: [libgpiod] [PATCH 18/19] tools: add support for bias flags
Message-ID: <20191116154028.GA30166@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-19-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115144355.975-19-warthog618@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 15, 2019 at 10:43:54PM +0800, Kent Gibson wrote:
> Add support for bias flags to applicable tools - gpioget, gpioset, and
> gpiomon.
> 
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tools/gpioget.c | 24 ++++++++++++++++++++----
>  tools/gpiomon.c | 28 ++++++++++++++++++++++------
>  tools/gpioset.c | 26 +++++++++++++++++++++-----
>  3 files changed, 63 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/gpioget.c b/tools/gpioget.c
> index 196ebeb..025811a 100644
> --- a/tools/gpioget.c
> +++ b/tools/gpioget.c
> @@ -17,10 +17,13 @@ static const struct option longopts[] = {
>  	{ "help",	no_argument,	NULL,	'h' },
>  	{ "version",	no_argument,	NULL,	'v' },
>  	{ "active-low",	no_argument,	NULL,	'l' },
> +	{ "pull-down",	no_argument,	NULL,	'D' },
> +	{ "pull-up",	no_argument,	NULL,	'U' },
> +	{ "bias-disable", no_argument,	NULL,	'B' },
>  	{ GETOPT_NULL_LONGOPT },
>  };
>  
> -static const char *const shortopts = "+hvl";
> +static const char *const shortopts = "+hvlDUB";
>  
>  static void print_help(void)
>  {
> @@ -32,6 +35,9 @@ static void print_help(void)
>  	printf("  -h, --help:\t\tdisplay this message and exit\n");
>  	printf("  -v, --version:\tdisplay the version and exit\n");
>  	printf("  -l, --active-low:\tset the line active state to low\n");
> +	printf("  -D, --pull-down:\tenable internal pull-down\n");
> +	printf("  -U, --pull-up:\tenable internal pull-up\n");
> +	printf("  -B, --bias-disable:\tdisable internal bias\n");
>  }
>  
>  int main(int argc, char **argv)
> @@ -39,6 +45,7 @@ int main(int argc, char **argv)
>  	unsigned int *offsets, i, num_lines;
>  	int *values, optc, opti, rv;
>  	bool active_low = false;
> +	int flags = 0;
>  	char *device, *end;
>  
>  	for (;;) {
> @@ -56,6 +63,15 @@ int main(int argc, char **argv)
>  		case 'l':
>  			active_low = true;
>  			break;
> +		case 'D':
> +			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
> +			break;
> +		case 'U':
> +			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
> +			break;
> +		case 'B':
> +			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
> +			break;
>  		case '?':
>  			die("try %s --help", get_progname());
>  		default:
> @@ -86,9 +102,9 @@ int main(int argc, char **argv)
>  			die("invalid GPIO offset: %s", argv[i + 1]);
>  	}
>  

Nuts - this is wrong - it should be using the CTXLESS flags, not the 
LINE_REQUEST flags.  That applies to all three of the tools changed.
I forgot to propagate the last minute CTXLESS changes to the tools.
And unfortunately we don't have test cases for the tools :-(.
I've got a fix in my github branch that I will incorporate into v2.

I'm also wondering if it would be preferable to replace the individual
bias command line flags with a single bias parameter, e.g. --bias=pull-up
I've coded that in my github branch as well, if you would care to
compare.

Let me know if you'd like a v2, otherwise I'll hold off for a few days
in case something else crops up.

Cheers,
Kent.
