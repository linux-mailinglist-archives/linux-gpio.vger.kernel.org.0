Return-Path: <linux-gpio+bounces-15577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00685A2CE05
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85BE016AC59
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D63419EED3;
	Fri,  7 Feb 2025 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lIr2z3NK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EF723C8C7
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 20:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959525; cv=none; b=LLiqF0O1eaeNIHSo2jGy6SPZhz//2SgWyUjnAtRVReVGy/tE5uKJsjAniXLOgVDKQ4DiJWGCk2XTfzgFrZgQpk4+i/4sLm32yXHwOOTNEV3ADqIw+Mjr+yq8dkZJl93zSt3AbfNjteSP+fWC+v7pSn420zTekCF+DVkspB8BbK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959525; c=relaxed/simple;
	bh=S1Q97ej1Yv7PEZd4dszVP+NB68isqBEG5RE4qt0/xnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aka21DBUVcXrzTS2f2ankKUkYsqgq13ozm+KTZL7XXWrW40Qj8NuU6C1tfPIqNtPMSHHZHnqHxjEGlxrY2QpBAu17WYXLm94cbqrZRVfC54CUrC0VYEtnNLR5jvZ9CumgScXbBsVpp/fruiBT0BBY2x/OPwKQI3yVnZSpv1WhVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lIr2z3NK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-540215984f0so2686802e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 12:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738959521; x=1739564321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oGuCNL+nUC1dWRZFJQIJjz43Qw01GgnG2PVRxVycJ8=;
        b=lIr2z3NKWV2VihMRsdAA28+n/UdXaUrQVoM23Q/QezynT4LP6m1LjMrVpJP5ZJ/Rpc
         rZhaqVeEaF5ljJ6G7wtz0RFI8v/c3UgDSyEDYXRGd5JFBj0SceRW+EgTWb5FvFhuFXTa
         Zxsfr4+eVRhAvehaMGDX9/7QgXPMl9DDFpzpUG7hdw+PJcNW9hgv2YMNlriWa5wF2K63
         9CaoNQVAwsmtQjCgk/9a1sLElabVkDUbknibUZ+/JtQYw7sjmwa7R1ZVBQklFtJh8cEf
         Jwi8t8u1jwjZs+RA1qb8vO8mQf6eHltrnv1PaVKbqrFejpJe5pxA+6JKPdNZaHAtrY0P
         rEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959521; x=1739564321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oGuCNL+nUC1dWRZFJQIJjz43Qw01GgnG2PVRxVycJ8=;
        b=vYdQ9/C0e0xMJXaTtBj4CRQp3uHwjw3LVUpMeLbx+ue9cNU/aZy0mq5eKA2CgkhhNR
         ep6nB5fOOiT4cGWzBJ8Ozecnw/eNT9hdpmFiMllLjPOavT0ZgacrKESqLriLz4kuctdH
         Pd5PJMSo7S9g5bvtA7jCH/IJ25K7G7R2iusH8+0RZcoFEJKZ4uLbUQSCSVv4J9eDKUWG
         2LR5vhG1IAhRp7QZqzA3b0hGpgDy80zAdSYs6sY5ilfHQMIZHKjuB6+m4Q0OIfYCVoB3
         I1WwZq464IQFHKIh6U+SDXppamR9kDT+GEQz/b6zOfd9HU4qUfIerVhKtUIH6JE9ppof
         E5Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWPDtSt7zVIFE0BwezCLlYWX0C2SJjM8/oeDHrlWLMgSMz8x/vXJldevclsR2FOrQb7e+ewAr6YkDep@vger.kernel.org
X-Gm-Message-State: AOJu0Yy477Lut2NAPuimGob7VdFT4aZsaY4gvplpI11ANAsST04mrpkR
	0xvIIcyoYPyhQ5qbZwzHKx4f3PCh8y6eOLriqYcQeUELLfcPUvBKHO1uTXwV9LOQMvP7NOLHGGv
	7zsjmvZyqFF0t5InddfL2I/1zfZeAg3r1EKIWrg==
X-Gm-Gg: ASbGnctwUKS7PUAgfwOOhB7LyZ2B85e5FKGg5SltzxKQjOcTEweGHM2L/Je9SUKavAa
	hiE9ms7/JGGe2ksHL7mVK+RFOs7THFMHmYW9bbQat5sbmEoXcoP3uyrFgmB5f3X4ioG6LKCzhZE
	GKS/XsA79104WVpKw1oz59JWDv1/k=
X-Google-Smtp-Source: AGHT+IEyCYAQsmJZJCBv6WF8i0PRiZ6GBDKW0dayokGcB0+OqpXILl3KeLrJevx5+MOowAO3kP1mgH5Ogd1IiiRmnpk=
X-Received: by 2002:a05:651c:b0b:b0:304:588a:99e1 with SMTP id
 38308e7fff4ca-307e5a73719mr14867611fa.26.1738959520687; Fri, 07 Feb 2025
 12:18:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CAMuHMdXgQPcUw-UuGC886RRBpeCz34OAz-Nx4FUxeAq0w2qBkA@mail.gmail.com>
In-Reply-To: <CAMuHMdXgQPcUw-UuGC886RRBpeCz34OAz-Nx4FUxeAq0w2qBkA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 21:18:29 +0100
X-Gm-Features: AWEUYZnAVkws_5mLciPLpepBqLnbN8i6-Xf2EgzW6QKNgOd1RIoG_ZOrSca0Eus
Message-ID: <CAMRc=Md7Z9zASsbDcy4prY8tZggS5505_gTQULzOweYYEpNsig@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 3:23=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Bartosz et al,
>
> On Sun, 2 Feb 2025 at 13:46, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > I floated an idea of introducing a backward compatible change to sysfs
> > that would allow users to identify GPIOs by the label of their parent
> > chip and the hardware offset of the line within that chip (like what
> > we do for the character device) in the form of the export/unexport
> > pair of attributes inside the gpiochipXYZ directory associated with
> > given controller. These attributes, unlike the "global"
> > export/unexport would take the hardware offset and create the line
> > directory within the chip directory of which the layout would be the
> > same as that of its global counterpart (in fact: it could point to the
> > same directory in sysfs as a single line can only be requested once).
> >
> > We could then encourage users to switch to using the chip-local
> > exports and eventually at least remove the global export/unexport pair
> > if we cannot make the entire sysfs class go away.
> >
> > Please let me know what you think about it?
>
> I like it. Note that there are other caveats of the old API to
> take into account...
>

I don't want to extend it more than this really.

> The other thing to consider is why people are playing with GPIOs
> directly: do they lack hardware descriptions? Or do they lack proper
> Linux drivers for their use cases? Something else (people brought up
> testing random pins, or plugging random things into a Pi)?
>

I think you're speaking from the position of an experienced kernel
hacker. The majority of libgpiod users with whom I interact on github
or via email have never even compiled the kernel. They're working on
some kind of RPi or BeagleBone project and want to have their python
script fiddle with the pins. These are hardware people and makers. So
to answer your question: they play with GPIOs from user-space because
they don't know better and can't be bothered to learn - developing
kernel drivers is not on their roadmap.

> Personally, I still use the GPIO sysfs interface to control my board
> farm (opto-couplers for reset, wake-up, and key-presses; MOSFETs
> for power).  If appropriate drivers would be available, incl. their
> own sysfs APIs, I could use that instead (technically I can already
> describe opto-couplers using gpio-leds, and be done with it ;-)
>
> Do we need (simple) driver(s) for relays, solenoids, motors?
> E.g. gpio-actuator?

Sure we do. Now if only we could just find volunteers...  :)

Bartosz

> A more advanced example would be an H-bridge motor driver, combining
> GPIO and (optionally) PWM.
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

