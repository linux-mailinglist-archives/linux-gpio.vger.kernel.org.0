Return-Path: <linux-gpio+bounces-5261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425C89E619
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 01:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6719C1C221E1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 23:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51BD1591E1;
	Tue,  9 Apr 2024 23:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQdSBHmk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC2D1591E0
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 23:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712705585; cv=none; b=jkzOdYQGd3hPISj0qnT8WYQiCDw4ahN7Pcwpghn1wEdyh2t+WMRsPI6N0csBD0V1PnnyDLcRaLadfZ2iIH3xdLebzBsFs+svkUoDeUUPZUmHvb9R+zW+9fe9C6rLcw15HpM3dO5kUVQ87d2go3v07spatUYjD4O19lRhUU1za1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712705585; c=relaxed/simple;
	bh=APh2p+9yJdQkRfzD6vxILr6e+hWSrr0+pbdmea5+RV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vd5fmiFhMq8QfpCVtQivU78FoaedHyRMumVlQ91uo6g2axCW4M7oPrEFNqSQcKUIohXVE+NYKjTaoojz+KelrKR9oLntVub4OJLrAhNFQb8/UR6kE0BilIQ3Wv3WWs64V0DsyTxCVqxCXidYx2Ytbai+wsXBeCiNRlpYwBzKxvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQdSBHmk; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5f034b4dcecso4176192a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 16:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712705583; x=1713310383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yq8usQ8SKhr9EuN31FwcsDr8GYsXKxXtBlmHu5t/Anc=;
        b=CQdSBHmkJBZEHF0aVwlFDwd9lTkyXb4R6KjZoZkaIlvE5GiXBhf5RvkNNcEl5nXs5a
         HzdQ6xHPGRbRC1T6tGplg7aqj9ayKlPUPWgh1mfyo7+y8tQMACa1oKifdzu7Ey1NMCmP
         r0kfJHkTXmRNVaPqrwMcJWryW8gFsEwva8qrzROMxREIZ5n564+mZ2GblLm8YSQ2p5d1
         BYx92FYHKSvlLhZ7OGGeHoTdXw0ePy5wFYk8qpYKLH24aTNR5ulZgy68QdwR29TV3DEI
         xgJlcTTYO1EoB0UDrXga71g5v+VV9w1moCzQBbCzcgSf/2c9+0IzwL+7yY1Cx61ZgXgO
         Rzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712705583; x=1713310383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yq8usQ8SKhr9EuN31FwcsDr8GYsXKxXtBlmHu5t/Anc=;
        b=aGw5Q3iIkylnfZUkdHVIFHXtHxZSpIfOfs8i1C91UN3ls/NGqmxCR6nLRknyVOpsrn
         nmZWsmBwnTfm9vlwTIR2IS4SdhNh5byjROAPiq+Ut037D7KnZjxj/Bq5rcks0uVc1x+/
         jAYQbsAGdIb0SIy/zEf+aldzjfS7l9ytlRs/vV1HIFyqaSnTdYa2T23hgSlkqCNOvPEa
         WiYQeE2+e1NPEcN6mj6C8tTPDshXlfLMgadKztQ8rmh8DVw9H6OedJ5Jep/jCetnI32T
         7Iag3MqHE6Vq+aXBThqxcOI0UobHd5NfLML9G6WIgu4Sp6htPQxb8v5PoIm9kTDLC8Ad
         qS+A==
X-Forwarded-Encrypted: i=1; AJvYcCWwEjmmWxEn+7yY+j7FLvr9vA7dNKKSt+iCdo6w6sU+uFRURMckmd8jN8egdwTA5OIH0D5pYFMq/mXUqXwbcp9EurwzM0VQiiNnkA==
X-Gm-Message-State: AOJu0YwTLnp6DcGJRGNIF/TKPJ3nz256ZnmKDh4CGcyBnPU8AEYFd5Z+
	n3ZGSt5q5H4BnxMbbjQDspnYFfliA4ypAPU4qEpJdVlSaNcCLyQ+Cf8An2qi
X-Google-Smtp-Source: AGHT+IGjaCCDiJXsjdk7ksT5cmg0uCCxGM3W/FUAf40NCmLqLmAjOqn7nPV+IskOZGXR/egBT3YYuQ==
X-Received: by 2002:a17:90b:4393:b0:2a5:6f5f:210d with SMTP id in19-20020a17090b439300b002a56f5f210dmr1390240pjb.23.1712705583123;
        Tue, 09 Apr 2024 16:33:03 -0700 (PDT)
Received: from rigel (194-223-186-215.tpgi.com.au. [194.223.186.215])
        by smtp.gmail.com with ESMTPSA id o9-20020a17090a5b0900b002a2b28de64esm163327pji.14.2024.04.09.16.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 16:33:02 -0700 (PDT)
Date: Wed, 10 Apr 2024 07:32:57 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Gunnar =?iso-8859-1?Q?Th=F6rnqvist?= <gunnar@igl.se>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 2/2] tools: allow longer time periods
Message-ID: <20240409233257.GA3000@rigel>
References: <20240409093333.138408-1-brgl@bgdev.pl>
 <20240409093333.138408-3-brgl@bgdev.pl>
 <20240409125551.GA69328@rigel>
 <CAMRc=MfiUAfZ6RjNWJQQpD-Z20_L9n6P=2QGN1NtzSpTtvraxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfiUAfZ6RjNWJQQpD-Z20_L9n6P=2QGN1NtzSpTtvraxA@mail.gmail.com>

On Tue, Apr 09, 2024 at 05:59:59PM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 9, 2024 at 2:56 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Apr 09, 2024 at 11:33:33AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > We currently store time as milliseconds in 32-bit integers and allow
> > > seconds as the longest time unit when parsing command-line arguments
> > > limiting the time period possible to specify when passing arguments such
> > > as --hold-period to 35 minutes. Let's use 64-bit integers to vastly
> > > increase that.
> > >
> >
> > I don't think all timers should be extended, only where it
> > makes sense to do so, so gpioset (toggle and hold periods).
> > And maybe gpiomon (idle timeout), though you haven't extended that one,
> > cos poll()?  Maybe switch that to ppoll()?
> >
> > More on this below.
>
> Makes sense.
>
> >
> > > Use nanosleep() instead of usleep() to extend the possible sleep time
> > > range.
> > >
> > > Reported-by: Gunnar Thörnqvist <gunnar@igl.se>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  configure.ac         |  2 ++
> > >  tools/gpioget.c      |  4 ++--
> > >  tools/gpiomon.c      | 19 ++++++++++++++-----
> > >  tools/gpioset.c      | 16 ++++++++--------
> > >  tools/tools-common.c | 22 ++++++++++++++++------
> > >  tools/tools-common.h |  5 +++--
> > >  6 files changed, 45 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/configure.ac b/configure.ac
> > > index 3b5bbf2..a2370c5 100644
> > > --- a/configure.ac
> > > +++ b/configure.ac
> > > @@ -120,6 +120,8 @@ AS_IF([test "x$with_tools" = xtrue],
> > >       AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_TOOLS([asprintf])])
> > >       AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_TOOLS([scandir])])
> > >       AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_TOOLS([versionsort])])
> > > +     AC_CHECK_FUNC([strtoull], [], [FUNC_NOT_FOUND_TOOLS([strtoull])])
> > > +     AC_CHECK_FUNC([nanosleep], [], [FUNC_NOT_FOUND_TOOLS([nanosleep])])
> > >       AS_IF([test "x$with_gpioset_interactive" = xtrue],
> > >               [PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])])
> > >       ])
> > > diff --git a/tools/gpioget.c b/tools/gpioget.c
> > > index f611737..bad7667 100644
> > > --- a/tools/gpioget.c
> > > +++ b/tools/gpioget.c
> > > @@ -19,7 +19,7 @@ struct config {
> > >       bool unquoted;
> > >       enum gpiod_line_bias bias;
> > >       enum gpiod_line_direction direction;
> > > -     unsigned int hold_period_us;
> > > +     unsigned long long hold_period_us;
> > >       const char *chip_id;
> > >       const char *consumer;
> > >  };
> > > @@ -205,7 +205,7 @@ int main(int argc, char **argv)
> > >                       die_perror("unable to request lines");
> > >
> > >               if (cfg.hold_period_us)
> > > -                     usleep(cfg.hold_period_us);
> > > +                     sleep_us(cfg.hold_period_us);
> >
> > Got a use case where a hold period is measured in more than seconds?
> > Specifically for a get.
> >
>
> Yeah, like Gunnar responded, he needs to hold the line for an hour. I
> think it makes sense.
>

And as I noted, I was interested in the get, the point being is a long
period always necessary and appropriate?

> > >
> > >               ret = gpiod_line_request_get_values(request, values);
> > >               if (ret)
> > > diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> > > index e3abb2d..a8a3302 100644
> > > --- a/tools/gpiomon.c
> > > +++ b/tools/gpiomon.c
> > > @@ -5,6 +5,7 @@
> > >  #include <getopt.h>
> > >  #include <gpiod.h>
> > >  #include <inttypes.h>
> > > +#include <limits.h>
> > >  #include <poll.h>
> > >  #include <stdio.h>
> > >  #include <stdlib.h>
> > > @@ -24,13 +25,13 @@ struct config {
> > >       enum gpiod_line_bias bias;
> > >       enum gpiod_line_edge edges;
> > >       int events_wanted;
> > > -     unsigned int debounce_period_us;
> > > +     unsigned long long debounce_period_us;
> > >       const char *chip_id;
> > >       const char *consumer;
> > >       const char *fmt;
> > >       enum gpiod_line_clock event_clock;
> > >       int timestamp_fmt;
> > > -     int timeout;
> > > +     long long timeout;
> >
> > Can we rename this to idle_timeout?  A variable named "timeout" is
> > lacking context.
> >
>
> Sure but it's a different patch. Also: it's your code, just send me
> the patch. :)
>

Check the blame - NOT my code.

> > >  };
> > >
> > >  static void print_help(void)
> > > @@ -389,9 +390,17 @@ int main(int argc, char **argv)
> > >       if (cfg.active_low)
> > >               gpiod_line_settings_set_active_low(settings, true);
> > >
> > > -     if (cfg.debounce_period_us)
> > > +     if (cfg.debounce_period_us) {
> > > +             if (cfg.debounce_period_us > UINT_MAX)
> > > +                     die("invalid debounce period: %llu",
> > > +                         cfg.debounce_period_us);
> > > +
> > >               gpiod_line_settings_set_debounce_period_us(
> > > -                     settings, cfg.debounce_period_us);
> > > +                     settings, (unsigned long)cfg.debounce_period_us);
> > > +     }
> > > +
> > > +     if (cfg.timeout > INT_MAX)
> > > +             die("invalid idle timeout: %llu", cfg.timeout);
> > >
> >
> > Not a fan of parsing to long, only to do a smaller range check here.
> > How about providing two parsers - one for int sized periods and
> > one for long periods, e.g. parse_long_period().
>
> I actually prefer to parse the larger range and then limit the max
> size. I would be fine with adding a limit argument to parse_period()
> like long long parse_period(const char *option, long long limit);
>

I can live with that.

Cheers,
Kent.

