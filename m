Return-Path: <linux-gpio+bounces-11414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6DC9A04F8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3E691F26C39
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA29204F88;
	Wed, 16 Oct 2024 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y8bOcgoe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D520514A
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729069371; cv=none; b=LUQXP7ToiMXGxbFCmPPk9WW1DfkyqU6TLfbZAkJwxF/7/7eraINPkZ1xndh6DkuFhkEYponomOU90ooGsE21To5iwrW20s2lvam5WqXFbOEUSucOFO3/rqcK3maHxQSts7JftuojFZkCpNcfeiv2NE/WgrbHWUjhy2/bn+q5F9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729069371; c=relaxed/simple;
	bh=75iTt326Qo1iifqEbN5oZf1Amvb23K5CfhfwAm1v/I8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XynQ1ZBEigS6IF+TjYTtsbo4GgALRfNx94l8/jk+5puG787mR/SkzlgitHBNp6kARuiiYZ9dpS0k2EVUCqYVidd9Ml1BvphFb6cqPrt2RrzOKaoi7eBbl8XemzoMznGG5ifTtLvO9WFYkoAcgbvdl9CaCPn6EDmwE16wPtlxNpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y8bOcgoe; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso42832741fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729069368; x=1729674168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMXUrgToe89xgQYBl4Khev4CKJy7nqDnifoXpIAaoLY=;
        b=y8bOcgoeBoiA056vy7Z/2c5Hs4T5+VmcSPvE7vtRDCUeStkpjJbxCw67j8TqBPDXb+
         kRtddFV+loCumRkIn9dtY9UmKWzdjUFHTXVjY950PqCNt9Sf90K36caPKH91DAum5fxA
         +AWm8i3lCaaL34qiOinJ/O/Er1YoGla2NZp5J87PmHMagOrl0AXFOV1kuFl+gRRHbTvl
         1v1xDSGIX1COFal1VqvuCsp+drcNfJUKWknN0l4TLMVQP03tBTeKtI1QuXrwPNCaD9GO
         J+KGlRktZrrDZs4PzYsZB5qFpaensYx1yo5k/wgXQUNOaNXUb92QiTSZzp6d28ESlB2D
         Zz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729069368; x=1729674168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMXUrgToe89xgQYBl4Khev4CKJy7nqDnifoXpIAaoLY=;
        b=kKRYVNm1vWkN0/JkxOxqKpoZqBU099BApNU324pfd3RT19zZLLOXC7bpVsH293PfmS
         OJjMUKVL8c5g1QbAv8PAR2W2Lhcg/6/UJbZCtx/UODOAnwmSNX0vuCnpgwiutJh9E7mj
         l6O6AI1GplY1P+UkUhvIsOKxcIowE09pqx3tCbvyZZkT7izqIRX2FMXEAaDXVBYw7lmn
         DCEJ0XuydH+7SepA4i4T5mBc94UOTG8/eQex0uotrxu7oxHhKL8BkYUsW0SEmi0ILrQa
         ++Vmn9Im2t/Fr4i8Sv0W7uT9parIxCo+CVP0PsQdTQXMHQ+PBJjUTEbPiIKTouhCdfRy
         9HsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1ygnGWyn5pPazqEAd5xjhEjvmeOzNUXw1od8oADwQEfVNsRq7OkpvCOpM+owqa+xY2j0LzItjKC+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4vC9ZxFOz/trqSOar+uFLaO73aP4HyO+MFj8LMqJBOWbxIZak
	haQxuhmPFypUx4YBZxIQhoSXUbThfGJXt78Kt/ahkRN7hJpklk6DYnxEYXbwyGe54YKeUw4bANx
	g1bLdmfYAfYi/OZBzvcA3mmnPX4rzC9J2f4ABwg==
X-Google-Smtp-Source: AGHT+IFEaeSkhTvAd3suQ657G7BpFP9kXRA6RSvoZGNdttgtquk3Cngu8YooswMd9rM8I7LI8+LrdfVWQWuwI60zlAY=
X-Received: by 2002:a2e:bc26:0:b0:2fb:36df:3b4 with SMTP id
 38308e7fff4ca-2fb3f2c7231mr93597461fa.34.1729069367998; Wed, 16 Oct 2024
 02:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel> <20241016072730.GA120095@rigel>
 <CAMRc=MeAfuObBodQu24yUnDbYVd7bFQAeimF5U75chcAK69r6Q@mail.gmail.com> <20241016085719.GA195243@rigel>
In-Reply-To: <20241016085719.GA195243@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Oct 2024 11:02:37 +0200
Message-ID: <CAMRc=MfcDK9u1T6=2kNoC-nfjkBHd8d38paZ-DvNG-1BLFr4_g@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 10:57=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Wed, Oct 16, 2024 at 09:50:58AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 16, 2024 at 9:27=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, Oct 16, 2024 at 01:19:44PM +0800, Kent Gibson wrote:
> > > > On Tue, Oct 15, 2024 at 12:56:18PM +0200, Bartosz Golaszewski wrote=
:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > -   return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), c=
onfig);
> > > > > +   ret =3D gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), =
config);
> > > > > +   if (ret =3D=3D 0) {
> > > > > +           /* These are the only options we notify the userspace=
 about. */
> > > > > +           switch (pinconf_to_config_param(config)) {
> > > > > +           case PIN_CONFIG_BIAS_DISABLE:
> > > > > +           case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > +           case PIN_CONFIG_BIAS_PULL_UP:
> > > > > +           case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > > > +           case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> > > > > +           case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > > > +           case PIN_CONFIG_INPUT_DEBOUNCE:
> > > > > +                   gpiod_line_state_notify(desc,
> > > > > +                                           GPIO_V2_LINE_CHANGED_=
CONFIG);
> > > > > +                   break;
> > > > > +           default:
> > > > > +                   break;
> > > > > +           }
> > > > > +   }
> > > > > +
> > > > > +   return ret;
> > > > >  }
> > > >
> > > > Ah, the debounce - I forgot about that, and other features that cde=
v
> > > > might emulate.
> > > >
> > > > What happens if userspace requests a line with debounce that is
> > > > supported by hardware?  Seems to me we'll see both a LINE_REQUESTED=
 and a
> > > > LINE_CONFIG_CHANGED when the line is requested.
> > > >
> > >
> > > This is problematic for me to test at the moment, as gpiosim doesn't =
support
> > > debounce. Any chance we could make that configurable?  Similarly driv=
e.
> > >
> > > > Conversely, what if a config change impacts features that don't res=
ult in a
> > > > notification from gpiod_set_config(), like active low, or emulated
> > > > drive or debounce?
> > > >
> > >
> > > Bah, drive is emulated in gpiolib itself, so that should be fine.
> > >
> > > When changing config cdev always calls gpiod_direction_input/output()=
, so I
> > > think that covers the active low case.
> > >
> > > But I have a test taking a line from input to output|open_drain and I
> > > get two change events.  The first is the most interesting as it repor=
ts
> > > input|open_drain, the second then reports output|open_drain.
> > > That is due to gpiod_direction_output() calling gpiod_set_config() to
> >
> > No, it never calls gpiod_set_config() but gpio_set_config() which
> > never emits an event.
> >
>
> Depends whether the driver supports drive or not.
>
> If it does then
> line 2858:
>
>                 ret =3D gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_DRAIN=
);
>

I'm seeing this:

gpiod_direction_output_nonotify()
  gpio_set_config()
    gpio_set_config_with_argument()
      gpio_do_set_config()
        gc->set_config()

There's no call to gpiod_line_state_notify() in this path.

Bart

> will emit.
>
> So your _nonotify function is calling a bunch of functions that can
> emit.
>
> Cheers,
> Kent.

