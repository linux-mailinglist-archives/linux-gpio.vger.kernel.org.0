Return-Path: <linux-gpio+bounces-5247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54C89DFE9
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 18:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F7992853D9
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 16:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F5313D63A;
	Tue,  9 Apr 2024 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V5+mEtG8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97113D633
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712678414; cv=none; b=dtCBHUJmepdf1VxPZj7gnGz8fA/FFDaahRPh6jIQmkpiqVIukHwqLCHv2ntSlHysRaxlAREpzFrw3F9X4uEbFWvfESBskTBcOOeYt4JQTwKrO5SGnlT6SqAGHmTXxcwfPOl7WXbRc1aNP/EL6xSTjIRfQ9LdUIeGhEu0TLMmPCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712678414; c=relaxed/simple;
	bh=q0eG9Y1B7NsRwNYXWggXDxuSFo34QGvg8SN8nTsTwnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrEEGekKs+kl/b6x43Pm9YnGP2uHiRCkEn0+fD0klo9HqhNzy8gcnDYxoFHhd4zkQjF57im9jDwgHgO6JVxyjjqWavrl59rgjJ+9JVlc0bX3LzyUVFuYE0hGqXdbkUFjVCi1/EPLoQEPiZ3Aa6o73P0Qbr1ioPE2MhcZ42jErQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V5+mEtG8; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so53972631fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712678411; x=1713283211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF/wxgDoU88rbUYZi196685yKKulkXrSkXs3h/mZEYI=;
        b=V5+mEtG8WQI3Wx4t4e9aA7aeGQrgGELOE06mgAcDzCTM2folqg8fnIg6tmgQTvRsvq
         NIxsOZ+9CLoc3ipfsW7gltFQCNYIQpc32K/JyGX1kpWx00ZLFLJDAjaV9mVWCvZEYlTD
         K6KZeWjWw5Ye7MA+QaZrOHRMoWO0Azv7zRoNdTcjFvBwJIPTTja6Q/2xHcB3peMQiSsH
         Ld2MdTCPduh85vo7KeVHFDraLC1mr0pW06KlYqWeuJOwH3xaqI/l5o41K3/Iktz9tGcW
         gka4OBuwoTJEOg27sOBlxXRLtS56hOb1V7pIvaFQI8KXhcRoCy1rKSWVVxmTJ0eNbm5b
         C6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712678411; x=1713283211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF/wxgDoU88rbUYZi196685yKKulkXrSkXs3h/mZEYI=;
        b=ksqeIV2a7TyHgFe0+NuvWszFRlx3HMRJQhU3KHoVpla9yrFsVhffG/+wMdvaXk0oQi
         8C3hgN9bdkphLAHiYlxGbtsO99ZbvYOMO7U6G8wNcUN6a+bZ6qK/l1GZugy7DBfW3Qk6
         UD3DJK66yu4AUwO+hB4sACDJa5KPaaflqYw0BZEdUoWVPrvgGs9QfZZ8AqJb0G9WZ74p
         oeOxLUCjcNW19TVYMUffwYgL6ecCUeqzSIR4riaNiSA16s1BQTc5trIUaBy1pQ6rbJv8
         ZKP5KmzENmAgUiATBRb39rD1Xvpwf98s6yItDDjTsuUQI70U7e2VGtze6y1fEfa6ufLk
         FIsg==
X-Forwarded-Encrypted: i=1; AJvYcCV6VEk8tBA9o9UPwCSOpAFIu1+eUQxrFZa+r7ZxHnYhUDJrNUISKKg03NeJ9E58rzlLxFr4H/RUYmSm7pLAN0gnLZkOAJArXxuL8g==
X-Gm-Message-State: AOJu0YzwembS2YPbcOdRIHjBS/p5noHv+mSn+SW4ZBC/ltXtb1TvDH+P
	omcvLAsqZN7aTAh0EMKO/Z75yih9PLINZCgqhJv2w9CAhSr7anuMyq3NKEY4qnbFtsadYk7Xd9K
	fDt/WuYLmDCtvxTHMt9h/nKUhpkuv1xlH/5fV9w==
X-Google-Smtp-Source: AGHT+IEM+oeTKMbYWe6y1s3gfBGRqUB/GhTaVicfip87L/6aG91vSaT4wBdUG1VsqVzi7KBa1iDKjNC2iX/BxZT5BDQ=
X-Received: by 2002:a05:651c:154b:b0:2d8:5af9:9097 with SMTP id
 y11-20020a05651c154b00b002d85af99097mr163141ljp.42.1712678410997; Tue, 09 Apr
 2024 09:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409093333.138408-1-brgl@bgdev.pl> <20240409093333.138408-3-brgl@bgdev.pl>
 <20240409125551.GA69328@rigel>
In-Reply-To: <20240409125551.GA69328@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Apr 2024 17:59:59 +0200
Message-ID: <CAMRc=MfiUAfZ6RjNWJQQpD-Z20_L9n6P=2QGN1NtzSpTtvraxA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/2] tools: allow longer time periods
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Gunnar_Th=C3=B6rnqvist?= <gunnar@igl.se>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 2:56=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Tue, Apr 09, 2024 at 11:33:33AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We currently store time as milliseconds in 32-bit integers and allow
> > seconds as the longest time unit when parsing command-line arguments
> > limiting the time period possible to specify when passing arguments suc=
h
> > as --hold-period to 35 minutes. Let's use 64-bit integers to vastly
> > increase that.
> >
>
> I don't think all timers should be extended, only where it
> makes sense to do so, so gpioset (toggle and hold periods).
> And maybe gpiomon (idle timeout), though you haven't extended that one,
> cos poll()?  Maybe switch that to ppoll()?
>
> More on this below.

Makes sense.

>
> > Use nanosleep() instead of usleep() to extend the possible sleep time
> > range.
> >
> > Reported-by: Gunnar Th=C3=B6rnqvist <gunnar@igl.se>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  configure.ac         |  2 ++
> >  tools/gpioget.c      |  4 ++--
> >  tools/gpiomon.c      | 19 ++++++++++++++-----
> >  tools/gpioset.c      | 16 ++++++++--------
> >  tools/tools-common.c | 22 ++++++++++++++++------
> >  tools/tools-common.h |  5 +++--
> >  6 files changed, 45 insertions(+), 23 deletions(-)
> >
> > diff --git a/configure.ac b/configure.ac
> > index 3b5bbf2..a2370c5 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -120,6 +120,8 @@ AS_IF([test "x$with_tools" =3D xtrue],
> >       AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_TOOLS([asprintf])])
> >       AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_TOOLS([scandir])])
> >       AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_TOOLS([versionso=
rt])])
> > +     AC_CHECK_FUNC([strtoull], [], [FUNC_NOT_FOUND_TOOLS([strtoull])])
> > +     AC_CHECK_FUNC([nanosleep], [], [FUNC_NOT_FOUND_TOOLS([nanosleep])=
])
> >       AS_IF([test "x$with_gpioset_interactive" =3D xtrue],
> >               [PKG_CHECK_MODULES([LIBEDIT], [libedit >=3D 3.1])])
> >       ])
> > diff --git a/tools/gpioget.c b/tools/gpioget.c
> > index f611737..bad7667 100644
> > --- a/tools/gpioget.c
> > +++ b/tools/gpioget.c
> > @@ -19,7 +19,7 @@ struct config {
> >       bool unquoted;
> >       enum gpiod_line_bias bias;
> >       enum gpiod_line_direction direction;
> > -     unsigned int hold_period_us;
> > +     unsigned long long hold_period_us;
> >       const char *chip_id;
> >       const char *consumer;
> >  };
> > @@ -205,7 +205,7 @@ int main(int argc, char **argv)
> >                       die_perror("unable to request lines");
> >
> >               if (cfg.hold_period_us)
> > -                     usleep(cfg.hold_period_us);
> > +                     sleep_us(cfg.hold_period_us);
>
> Got a use case where a hold period is measured in more than seconds?
> Specifically for a get.
>

Yeah, like Gunnar responded, he needs to hold the line for an hour. I
think it makes sense.

> >
> >               ret =3D gpiod_line_request_get_values(request, values);
> >               if (ret)
> > diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> > index e3abb2d..a8a3302 100644
> > --- a/tools/gpiomon.c
> > +++ b/tools/gpiomon.c
> > @@ -5,6 +5,7 @@
> >  #include <getopt.h>
> >  #include <gpiod.h>
> >  #include <inttypes.h>
> > +#include <limits.h>
> >  #include <poll.h>
> >  #include <stdio.h>
> >  #include <stdlib.h>
> > @@ -24,13 +25,13 @@ struct config {
> >       enum gpiod_line_bias bias;
> >       enum gpiod_line_edge edges;
> >       int events_wanted;
> > -     unsigned int debounce_period_us;
> > +     unsigned long long debounce_period_us;
> >       const char *chip_id;
> >       const char *consumer;
> >       const char *fmt;
> >       enum gpiod_line_clock event_clock;
> >       int timestamp_fmt;
> > -     int timeout;
> > +     long long timeout;
>
> Can we rename this to idle_timeout?  A variable named "timeout" is
> lacking context.
>

Sure but it's a different patch. Also: it's your code, just send me
the patch. :)

> >  };
> >
> >  static void print_help(void)
> > @@ -389,9 +390,17 @@ int main(int argc, char **argv)
> >       if (cfg.active_low)
> >               gpiod_line_settings_set_active_low(settings, true);
> >
> > -     if (cfg.debounce_period_us)
> > +     if (cfg.debounce_period_us) {
> > +             if (cfg.debounce_period_us > UINT_MAX)
> > +                     die("invalid debounce period: %llu",
> > +                         cfg.debounce_period_us);
> > +
> >               gpiod_line_settings_set_debounce_period_us(
> > -                     settings, cfg.debounce_period_us);
> > +                     settings, (unsigned long)cfg.debounce_period_us);
> > +     }
> > +
> > +     if (cfg.timeout > INT_MAX)
> > +             die("invalid idle timeout: %llu", cfg.timeout);
> >
>
> Not a fan of parsing to long, only to do a smaller range check here.
> How about providing two parsers - one for int sized periods and
> one for long periods, e.g. parse_long_period().

I actually prefer to parse the larger range and then limit the max
size. I would be fine with adding a limit argument to parse_period()
like long long parse_period(const char *option, long long limit);

Bartosz

>
> Cheers,
> Kent.

