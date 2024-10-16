Return-Path: <linux-gpio+bounces-11409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6DD9A0313
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B872D1F21D95
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 07:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF6E1C4A29;
	Wed, 16 Oct 2024 07:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ps750OQo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1F81C32E4
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065074; cv=none; b=GQd2EHowpCkhqqvp0lavKtt7SrifRZo9kbee5diGCBYTSnM14/XabDkqLkcD6ppqrZjD8r77PiTQGkx3NQO9q30nrC6+icbqHBwx7f8e8qfZoLQuOq7LdSGrsBX83iV22OZ2l2dSDa17PkffpMjyvGmc0jRhCxRjiF+1v2yMgUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065074; c=relaxed/simple;
	bh=CX55jp38yfgiJKr7PEViU8B6zkCbH0ptnSEPA/hqHOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAWHlkF2ymd1CwmJqvlPptzKXJhz0F4D1Z7N2s9zm4EW2F6OrO0S1B/NT3M7+Yk6xfPBW5Ge0MSMX8g0JqeKJqBZKeCC23Nxy3FY+YtDSxsDhMbm0Iq2fhyz6WtmpCrj/FgzQlnsvVmG+Y8IzzhdOjnxOzv/AxPgbDCzBZ11CrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ps750OQo; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so39916041fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729065070; x=1729669870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKOecBDxA7R7ooyejGQiOrpnacbKGU17iQZ2JMHiXgA=;
        b=Ps750OQoShuQFEFIqXDUxpcUDZ7UC2DYW4igmY8byHdT4K+CUVxw6hPLmBluH2Dg54
         KTCY277H43mkvkZJlz75k//tKsYoeG9ezI74Gr+H++h1WIgWslf1mQ403I7cT8tCqs13
         TG7deBU8B35jPTEu/CHQUlIV+ECCT88ig9t5mWrME0HVUrfr8V6xDlqAImmJggQJIwW/
         avJX/McuUGzFOY9JqfDhDsQt0gJQ+v2H/LW+GzffTYK3tNE73Hh4ivVvqHQRKOzU/MAc
         t0yul8NK4EBbwGCZiltP9yEHHPKBWljrqLdXSQ++liTc/0MAKaVDyF5eCiP0+VuuRXpr
         mYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729065070; x=1729669870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKOecBDxA7R7ooyejGQiOrpnacbKGU17iQZ2JMHiXgA=;
        b=R9x+PKIFKBIf6RxUYWHl1CPCjKAQrBA+X/1n6y8e7K35x793FgfZSItJJKUr6Xlok6
         D9bMFxsz6tW7dciSqZuF0e68jtHKRnhbyo3jtun2yS7hy6lrzXy10VLcGFWqx9vTj4jm
         5tBdqqAVqTBL4eVkaSiQvptEe2BSjneuoW2/8kouMwEcRwX/1dvvN09MOXCcxOnYkwAW
         BY9ADdhRwS48qVUhbAxegaTwDGOvO5VDZnYg9mnJfm7WbXs+BMo7gMiZGr35shSePUsQ
         MyWzacTpvzUpcaI7yBRvTDyIWylLnADU1bWwuXWUo3JOkafQbEBJ/pGGAg4D6mJVbjW/
         GI8g==
X-Forwarded-Encrypted: i=1; AJvYcCXV1rRC33F0uJ1YWB0oKEYbZB0o6djnxVXNnQ+Cb4TCxp44fDeq50AyZpSV54D0EWwPy/16NTNmCnYq@vger.kernel.org
X-Gm-Message-State: AOJu0YzSaIZVSI1oE6kUJITebB5db3LglF1K7rywfC74S28E9zElh1EW
	heeh/xZlFA5uTKmeyJInz31hr864rbQRXnCN3ZFl4m5d1MVSAKGC5D07qNzOzY2gL7EWndNNEk8
	9E5pUHyrKQNR5QqbsMxq+HBuwKQ/qaMOaUHJqUQ==
X-Google-Smtp-Source: AGHT+IHyG9D2npkBCRGka0dVdATtnJvCOeazTrlR/QpCwLkD5hlTvCka/gqxC6UMfWoYnBuBjKG5yIB3fAAr0mZv6WY=
X-Received: by 2002:a2e:bc24:0:b0:2fb:51e0:951 with SMTP id
 38308e7fff4ca-2fb51e00cd9mr45796831fa.7.1729065070248; Wed, 16 Oct 2024
 00:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel> <20241016072730.GA120095@rigel>
In-Reply-To: <20241016072730.GA120095@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Oct 2024 09:50:58 +0200
Message-ID: <CAMRc=MeAfuObBodQu24yUnDbYVd7bFQAeimF5U75chcAK69r6Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 9:27=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Oct 16, 2024 at 01:19:44PM +0800, Kent Gibson wrote:
> > On Tue, Oct 15, 2024 at 12:56:18PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > -   return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), confi=
g);
> > > +   ret =3D gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), conf=
ig);
> > > +   if (ret =3D=3D 0) {
> > > +           /* These are the only options we notify the userspace abo=
ut. */
> > > +           switch (pinconf_to_config_param(config)) {
> > > +           case PIN_CONFIG_BIAS_DISABLE:
> > > +           case PIN_CONFIG_BIAS_PULL_DOWN:
> > > +           case PIN_CONFIG_BIAS_PULL_UP:
> > > +           case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > +           case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> > > +           case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > +           case PIN_CONFIG_INPUT_DEBOUNCE:
> > > +                   gpiod_line_state_notify(desc,
> > > +                                           GPIO_V2_LINE_CHANGED_CONF=
IG);
> > > +                   break;
> > > +           default:
> > > +                   break;
> > > +           }
> > > +   }
> > > +
> > > +   return ret;
> > >  }
> >
> > Ah, the debounce - I forgot about that, and other features that cdev
> > might emulate.
> >
> > What happens if userspace requests a line with debounce that is
> > supported by hardware?  Seems to me we'll see both a LINE_REQUESTED and=
 a
> > LINE_CONFIG_CHANGED when the line is requested.
> >
>
> This is problematic for me to test at the moment, as gpiosim doesn't supp=
ort
> debounce. Any chance we could make that configurable?  Similarly drive.
>
> > Conversely, what if a config change impacts features that don't result =
in a
> > notification from gpiod_set_config(), like active low, or emulated
> > drive or debounce?
> >
>
> Bah, drive is emulated in gpiolib itself, so that should be fine.
>
> When changing config cdev always calls gpiod_direction_input/output(), so=
 I
> think that covers the active low case.
>
> But I have a test taking a line from input to output|open_drain and I
> get two change events.  The first is the most interesting as it reports
> input|open_drain, the second then reports output|open_drain.
> That is due to gpiod_direction_output() calling gpiod_set_config() to

No, it never calls gpiod_set_config() but gpio_set_config() which
never emits an event.

> set the drive, and later to set the direction, in that order.
> Given it will be setting the direction, it should inhibit the event from
> the drive setting?

I think you're really hitting this:
https://github.com/brgl/linux/blob/b4/gpio-notify-in-kernel-events/drivers/=
gpio/gpiolib.c#L2863

These should be changed to nonotify variants too. Would you mind confirming=
?

Bart

>
> Still haven't tested any debounce changes...
>
> Cheers,
> Kent.

