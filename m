Return-Path: <linux-gpio+bounces-16589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C52A44D6F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 21:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9C113B5C30
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 20:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D59720E71E;
	Tue, 25 Feb 2025 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ncges7W4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F73620E70C
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740514859; cv=none; b=ra+HHBM3ijBCKXYwljDxCmehpq26HngnJIauMB2wh1XRtsLkTsVjhpqj7JM8+s+9/UhZeNfkhKwjr3ZM1NVTk80Fe2bVXG2KkKdRtQ0EQJHXZCGK/wDUESsoxmE2vUsq4KAWf+yknKvWMOAKWezLAhu+zGDGGARUgI1z6fNaXzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740514859; c=relaxed/simple;
	bh=VEHsBcj59kzf8zhYuIw+jFQhfshZgcLE5PmgNgdwy/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6pjJWjp7MuWbjhFBdr5MiHjhLk4/GZgvliYuzZW3tlGdL0H4HMtk5eVpR6ctkK0OKc/6Zv/T0BG6FBDvkZYOfok5dxooFSdTrV72VfWCUnUTdeIGgdrEg8NiKMfTuLms25z+QI/aN7wIrby7CjQ1APHxkJOOFxvOmN/fohScew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ncges7W4; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e5dd697475dso4719168276.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 12:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740514856; x=1741119656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtsvWpOitdWZu0x9GfgeNtjm7TWseKaM/BFAo/3dI4Q=;
        b=Ncges7W4dwMDgfxnSQWDwUZxYnaCiKJjy+pNmfEAEzkrwcc9Q2r3S1yKQNHrx96gdp
         621InnceaM0du+InBhaMWVY6nISzpZ0oEDVIah3lW+9IySdqDKYu05ZNHOCFT6aX1K1C
         YYUO/xhWO+VcwRNONL4pXLtP4ILbrq8tsDvFzD8UI72HKatJd+ZkeXV8Gqs2VGOfifGq
         EOiB2F2DC2BwFFhw3lO7GNgCksLoulx1hMcxDm53jV2R+uNJy5+0ghTUzOsCa+eSE1Pz
         WRDaM1E6UCHvckGmnb3tNwSDDAZnhro4BcZnhnMSlmLHG0sgpFTgmD4GxH138/Sav5/v
         xzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514856; x=1741119656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtsvWpOitdWZu0x9GfgeNtjm7TWseKaM/BFAo/3dI4Q=;
        b=OIxPABC0Np/j7dm44avxuuvBsi7OkJwqTInxsrfxlSVu28WMMSCTLZwaGVFxkqMH22
         FH+2RuNOUapUYb+mzuXlC+IAIhXZtelUcueiaJUA+ARKJWx4SQX0lIfNYS7JU4B76oby
         pEL4b6KTdY97a5JfZSC2VzofQ+P+JgSmlwxDo0bw284WNAWj4B1Pt1/8KTOtNDljvm+h
         JXK1pJgU9xuDNznNtcBrEhlD7VOuvHJtvjuwMYwu0IyE+mNxO26PkO1tX4DrUf7i7zEN
         BgzUbg4sGWLOq8KQxXjP+lhTNDv0sSHfdEBLImtDcqZAJBRtu+WBJD6741pXbDFNasPV
         3XkA==
X-Forwarded-Encrypted: i=1; AJvYcCUjG3UioOUkFe7pNtn7LwMd8zkkOvzX3qxerwybttEyKXRuyP2kDdFrcIFZ+rx9dYWYY/8V6R9vSfn4@vger.kernel.org
X-Gm-Message-State: AOJu0Yybei2icq30oPFXmGVvSbM/KanlxYorlcSpQz3liIQX9lTqL+AQ
	q17yGjJdBqpSTpU/t4O/rOYVidkaW1Cfvj6EsofNI5dp1+yuefHtjIgtklIMJZm8CpQhm94noiy
	N+pq3699NQkw8+VCixzy51jxldqQV67W/PXA77g==
X-Gm-Gg: ASbGnctUPesIybwcL7N9d+35Pa6HCQCE+NuSIgc1srxwwHTtOP5CsL/suHeiW6Yt1yu
	Nzc6bihRqrGH2lBH4sqFkootZIXxNMXlS9nEkLSgd0wo9iB3Hv8bwOB3bdHcIBNWu22155AW9as
	Wl3qPTZ6g=
X-Google-Smtp-Source: AGHT+IErguiomfiKkp1tGJW/dsi/rgTb0LlDv+F3hDMtg9p8hQWKoee/nBGnnrIWNreObZ/wWlBgLb5Q3wFwV980B7I=
X-Received: by 2002:a05:6902:1581:b0:e5b:2a51:deb7 with SMTP id
 3f1490d57ef6-e607a4e3a35mr3842425276.14.1740514856199; Tue, 25 Feb 2025
 12:20:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdVxZab5X4HyKj2d_21WohKfpFrsnRYYjx9X1ys22xCvLA@mail.gmail.com>
 <6c53bc06-34d1-4ac3-be12-f29d4e5031f8@gmail.com>
In-Reply-To: <6c53bc06-34d1-4ac3-be12-f29d4e5031f8@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 21:20:43 +0100
X-Gm-Features: AQ5f1JqRXFVzNaJNIfDjWmIvbZs3Auiuv1sL6hUxmkCF_b9wbu8QYY1OeTvxSCk
Message-ID: <CACRpkdZOYz6do2r+HNTJu0Zzs+3KqEgJ7SRM0Q0TQKH8fs8VRQ@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Ayush Singh <ayushsingh1325@gmail.com>
Cc: geert@linux-m68k.org, a.fatoum@pengutronix.de, brgl@bgdev.pl, 
	jlu@pengutronix.de, linux-gpio@vger.kernel.org, marex@denx.de, 
	warthog618@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 7:25=E2=80=AFPM Ayush Singh <ayushsingh1325@gmail.c=
om> wrote:

> One of the reasons of the prevalence of userspace drivers (and probably
> the reason why kernel drivers for stuff like motors are not attractive)
> is the lack of upstream solution for runtime devicetree overlays.

Given how long device tree overlays have been talked about
and hypothesized I am of the opinion that they are never
going to fly.

My main complaints being that they are just too complex and hard
on users: special tools needed, compile files, files relate to other
existing dts(i) files that you also need to have at your disposal etc.

It's harder to use than BPF, which is already really hard to use.

I don't think the ACPI situation is any better for the matter, and
a solution using DT overlays will not play nice with ACPI systems
so we just leave that part of the world out.

> It is
> simply not attractive to have tutorials or examples that will require a
> reboot to work. And since a lot of people will start with those examples,
> they will continue using userspace drivers for their future projects.

I agree.

I have an idea about this.

If we want to use an existing kernel drivers for dynamic devices,
something in-kernel and Linux-specific that is easy to use is
needed. I would rather look into something that enables
creation of some devices using the Linux-specific software nodes,
because *those* we can control how we configure, preferably
from configfs I suppose, but Bartosz already burnt himself trying
to use configfs once so I don't know about that specific.

Consider for example, if we have a sysfs like I suggested:

/sys/bus/gpio/gpiochip0
/sys/bus/gpio/gpiochip0/gpio0
/sys/bus/gpio/gpiochip0/gpio0/
userspace
/sys/bus/gpio/gpiochip0/gpio0/value
/sys/bus/gpio/gpiochip0/gpio1
/sys/bus/gpio/gpiochip0/gpio1/userspace
/sys/bus/gpio/gpiochip0/gpio1/value

With software nodes we can:

cd /sys/bus/gpio
cat available_gpio_drivers
i2c-gpio leds-gpio
echo leds-gpio > gpio_drivers

[/sys/bus/gpio/drivers/leds-gpio.0 appears in sysfs]

ln -s gpiochip0/gpio4 drivers/leds-gpio.0/gpios

[ probe of leds-gpio driver happens using that gpio line
  now that its GPIO resources are provided]

I easily see this working for any of the drivers in
Documentation/driver-api/gpio/drivers-on-gpio.rst

Yes, it is not a solution to everything no matter how
complex a user may attach to their system, which is
the ambition of device tree overlays.

It solves the issue of dynamically probing devices
*only* using GPIO lines.

Yes: it will drive a truck through any kind of kernel integrity
and security, it provides a userspace footgun to shoot
oneself in the foot. But users want it, so hey. We point it
out. We put it as an expert option. Whatever of those.

However these devices *will* be performant as they are
regular kernel drivers, and they *will* be able to use
interrupts in a proper way.

Yours,
Linus Walleij

