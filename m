Return-Path: <linux-gpio+bounces-5234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EF889D980
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 14:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CDD028BFB8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 12:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899EE12DDAB;
	Tue,  9 Apr 2024 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDW8frEO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7D12D777
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712667366; cv=none; b=DX8fPlgaNl3f84AoAaxkpTyUzODQj9HTefW3EYUfNkoqdYHYFgVLZTd/bk/DxD3Q0pZE5HawHoTAP/QMMD7gEPKrwxaCjOIxP6bvKk1r2yDocrGF+F3Y2TkToBW9Sc2IDmSGU8gm2ShXF1Hdtn9cwxCCdLHIwH7STLdxnjFIUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712667366; c=relaxed/simple;
	bh=vZBS/QtvIhPGgPJdsGQ1OLpez40TGoDkwBRwVvPt/7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxluXTpFkIT3ze/Dh6QNsLuREpzLil/K/f3Nskkusi0+EpgJDCt7e/62QffSrodslSahuBb2uHxKbIKgiTyCCE3OiVi6T8LSJ7nsa7k3rRxyTkweTO3FS7a8WkGVbHNzgciYPHi3EgKLkJSBfY1PNiMPlYm4WrN0+kpUyPYa5SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDW8frEO; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5aa241232faso2280042eaf.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712667364; x=1713272164; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/g4p7eevy4+cgKIyB6W9QE8mvx3t8Q0YaCaoj9lz7n4=;
        b=ZDW8frEOdO7VNt7X9OlezXhFfXVPLvQHtNO6eaQ6v3rl5o9Ppj+M5cVixSDM0dNSPo
         M+9AjzBLijcH/Y98tkbDBkK/dOqRslomjgoCK2NZhw8hLsAWa8l/5o+cS59vfrkNARBg
         aUGhHJwEh8tFo7j5z5DdhiN0O1vBkMcaMzAN0wKVE1gqlpWTHsfWHYt32msNG2OIGnaM
         S8vPMMN2tJEgEit0yXip5V8fFQlTib9pu3zuHA/QqThE/O/EKVHXhXXyjYJpB6vSwkKD
         IY0Sxe/E2sc+MoaC2JGfp2JZJXaB9MMZCoJ9YbkIytuWBTFjyTczzrz2wS7rVIZbth/f
         HXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667364; x=1713272164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/g4p7eevy4+cgKIyB6W9QE8mvx3t8Q0YaCaoj9lz7n4=;
        b=djhbog6yG+Z+MowbKdPoRBq9q2oJ97QbhHfw45Y0tYLPd9yGevIH/WlYK/WFbpMzQ4
         A6A6M1EzYM0lnbxgaOzBLpThGX2XR+1mMb5FBsQU+6Ac5hc41ivnKd4VbwV5fiE/Q75I
         xE24/JAiV3l1XSG9H0rC4cERqMUds1Lmze4kyZJj2UzHZEv/GHN7cOKCcOkm0hgfSeFp
         4dN84KglhBwkYiqFPRisUcxEB2LzxA3JKdCaPBGYeu0azabCn85WhRb+GxunxUy2ijL0
         uddbcokQS7wOucWRVQfQ9yySxf2WqDE+skid2OGr4GpcMGxuCyhU7XPv1LBqtcLIXheF
         ndYw==
X-Forwarded-Encrypted: i=1; AJvYcCXMiUtHi9Pmc1JMJ06R5kvG3AhdyAIhyGTTYy2z5kK7wyjRqrq4NmTouFlW0DTE+YveXqqCH3aGQlI9rGdwImC6vmO8yJy2oA9zjw==
X-Gm-Message-State: AOJu0YwMSWcL/YqLua9Q/XBpE62ypUkUL+LanoI/Fo8Uw03ze5uc/3lh
	UmoY+fV9G9QZ6lg/82aa2xKP05mqlstfBxJmQNcVMiIPmHnDwqjpIa5vRtuk
X-Google-Smtp-Source: AGHT+IEEelCf9g0azoDsJ2b1NrTjwSB8gDk3JFe9EZ9GmY9FxttVC1VknpIBg3LxYu9ItOVZ3k+WRw==
X-Received: by 2002:a05:6358:729a:b0:186:5cb:30cb with SMTP id w26-20020a056358729a00b0018605cb30cbmr8636254rwf.29.1712667363602;
        Tue, 09 Apr 2024 05:56:03 -0700 (PDT)
Received: from rigel (194-223-186-215.tpgi.com.au. [194.223.186.215])
        by smtp.gmail.com with ESMTPSA id p16-20020a637410000000b005dbed0ffb10sm8042995pgc.83.2024.04.09.05.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:55:56 -0700 (PDT)
Date: Tue, 9 Apr 2024 20:55:51 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Gunnar =?iso-8859-1?Q?Th=F6rnqvist?= <gunnar@igl.se>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 2/2] tools: allow longer time periods
Message-ID: <20240409125551.GA69328@rigel>
References: <20240409093333.138408-1-brgl@bgdev.pl>
 <20240409093333.138408-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409093333.138408-3-brgl@bgdev.pl>

On Tue, Apr 09, 2024 at 11:33:33AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We currently store time as milliseconds in 32-bit integers and allow
> seconds as the longest time unit when parsing command-line arguments
> limiting the time period possible to specify when passing arguments such
> as --hold-period to 35 minutes. Let's use 64-bit integers to vastly
> increase that.
>

I don't think all timers should be extended, only where it
makes sense to do so, so gpioset (toggle and hold periods).
And maybe gpiomon (idle timeout), though you haven't extended that one,
cos poll()?  Maybe switch that to ppoll()?

More on this below.

> Use nanosleep() instead of usleep() to extend the possible sleep time
> range.
>
> Reported-by: Gunnar Thörnqvist <gunnar@igl.se>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  configure.ac         |  2 ++
>  tools/gpioget.c      |  4 ++--
>  tools/gpiomon.c      | 19 ++++++++++++++-----
>  tools/gpioset.c      | 16 ++++++++--------
>  tools/tools-common.c | 22 ++++++++++++++++------
>  tools/tools-common.h |  5 +++--
>  6 files changed, 45 insertions(+), 23 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 3b5bbf2..a2370c5 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -120,6 +120,8 @@ AS_IF([test "x$with_tools" = xtrue],
>  	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_TOOLS([asprintf])])
>  	AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_TOOLS([scandir])])
>  	AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_TOOLS([versionsort])])
> +	AC_CHECK_FUNC([strtoull], [], [FUNC_NOT_FOUND_TOOLS([strtoull])])
> +	AC_CHECK_FUNC([nanosleep], [], [FUNC_NOT_FOUND_TOOLS([nanosleep])])
>  	AS_IF([test "x$with_gpioset_interactive" = xtrue],
>  		[PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])])
>  	])
> diff --git a/tools/gpioget.c b/tools/gpioget.c
> index f611737..bad7667 100644
> --- a/tools/gpioget.c
> +++ b/tools/gpioget.c
> @@ -19,7 +19,7 @@ struct config {
>  	bool unquoted;
>  	enum gpiod_line_bias bias;
>  	enum gpiod_line_direction direction;
> -	unsigned int hold_period_us;
> +	unsigned long long hold_period_us;
>  	const char *chip_id;
>  	const char *consumer;
>  };
> @@ -205,7 +205,7 @@ int main(int argc, char **argv)
>  			die_perror("unable to request lines");
>
>  		if (cfg.hold_period_us)
> -			usleep(cfg.hold_period_us);
> +			sleep_us(cfg.hold_period_us);

Got a use case where a hold period is measured in more than seconds?
Specifically for a get.

>
>  		ret = gpiod_line_request_get_values(request, values);
>  		if (ret)
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index e3abb2d..a8a3302 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -5,6 +5,7 @@
>  #include <getopt.h>
>  #include <gpiod.h>
>  #include <inttypes.h>
> +#include <limits.h>
>  #include <poll.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> @@ -24,13 +25,13 @@ struct config {
>  	enum gpiod_line_bias bias;
>  	enum gpiod_line_edge edges;
>  	int events_wanted;
> -	unsigned int debounce_period_us;
> +	unsigned long long debounce_period_us;
>  	const char *chip_id;
>  	const char *consumer;
>  	const char *fmt;
>  	enum gpiod_line_clock event_clock;
>  	int timestamp_fmt;
> -	int timeout;
> +	long long timeout;

Can we rename this to idle_timeout?  A variable named "timeout" is
lacking context.

>  };
>
>  static void print_help(void)
> @@ -389,9 +390,17 @@ int main(int argc, char **argv)
>  	if (cfg.active_low)
>  		gpiod_line_settings_set_active_low(settings, true);
>
> -	if (cfg.debounce_period_us)
> +	if (cfg.debounce_period_us) {
> +		if (cfg.debounce_period_us > UINT_MAX)
> +			die("invalid debounce period: %llu",
> +			    cfg.debounce_period_us);
> +
>  		gpiod_line_settings_set_debounce_period_us(
> -			settings, cfg.debounce_period_us);
> +			settings, (unsigned long)cfg.debounce_period_us);
> +	}
> +
> +	if (cfg.timeout > INT_MAX)
> +		die("invalid idle timeout: %llu", cfg.timeout);
>

Not a fan of parsing to long, only to do a smaller range check here.
How about providing two parsers - one for int sized periods and
one for long periods, e.g. parse_long_period().

Cheers,
Kent.

