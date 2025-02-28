Return-Path: <linux-gpio+bounces-16784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D80A4941D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0398A18949AA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD1225485D;
	Fri, 28 Feb 2025 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sbtmFseO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B0E253F13
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732969; cv=none; b=P7AeBFaCnfNutSW6V0buBybE0TqyFWO+DU9L/7JaxBjioLApO7vBHCx6BJGTVjo6j0mh7l91U54CiphVhj+dMLHc031jWL2xPbgGatA8UMSZJZYUNxZsgxuynrtMjvIn81U29qY8RGF9ldlI2AN1Zqs44CApVqj7ATSEGddfuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732969; c=relaxed/simple;
	bh=fOSP9X0MU9xZngceLn8N0mW8W7VKr9eXAAF5M926RpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRhKTssEuHV120JDJHTTJ2llpr3rsx6ion9fFdk9CP9iAa1L8XTTy0bOhVUD1InFN1CbFpWebNuA0jR3hX20yWBQk3vA/pxvs0VullLON4DgVdUA63wPEvK1m4/YrbqAKThBTj7ub8yeIuLgZ0/flB9i6Mf+4YT+JPUrSsuyiL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sbtmFseO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30a2cdb2b98so18690031fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740732963; x=1741337763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrcfSm2qSa/P0TN6UN0Iw+fNfmG8yQbiKR3v0FMOX20=;
        b=sbtmFseOyl3laSIhp/N7GKPU9KJzcLaC/uHH7UmduR6N6AKZUa5YF9aNZtG+eCe1SV
         +jf/BZFz2AS5l9tedB9LWQrNVinfHcE9OBrlt+lpBT4XeGxq6ki3G65hnmZ43DbpUC2w
         EVDNHsakhsYie7Kv0ivm9NGKotistpVwI7r+FvxxoL/qJknmF+15wG6JTYV6X3IAk1fy
         aOVCgi7yF6VGL/ywo3HgQ9uZuwVyi1ENIiW+SBayIlxmN4OAmm4W0gYPCgrp5o52zH23
         6l+F40jz65MJhA++HOlMOXMsuGf31+P0jFjVMjbVpsGxiy7aGXyLcoATFwrrgZfL//YH
         RVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732963; x=1741337763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrcfSm2qSa/P0TN6UN0Iw+fNfmG8yQbiKR3v0FMOX20=;
        b=kSy9skj9raLpH1yD0vD+XUn/M3msGxdzW0ig/z1Ouy4cYpylzmVyvNBqOplZOPp2Fw
         /6SN44+jVnELeP1Ittq3d02na1g2cqQay0tmO6yv0mi7Npv37IYTHNzHuyq3bEAqGUp9
         S/zpHj8+30IPpUUnloFjt+dt5qVAwOvj03FSDtkBqEQFytkeV46hn/39ZRkFHcVchukC
         RtbVoHlljrAAd/12U155an0uFIn2UaxWHPYVK4mOw5Qwa2wi5xFeYMhIOCDKOj5WrBKB
         LLORmXwb1Dyg1IeOrJ5ypdN7J6GA1UXoVHwJdzYanPim3s7OSy5F2DnHl1t5opkJe9Z3
         Nseg==
X-Forwarded-Encrypted: i=1; AJvYcCX1rxqqiMo+VM4MrKd95zvqcl5ghWl2KO2a/IYClwmD6pnI1YsMnRLiHCA/smigcaN0JLTMMMoL/dc1@vger.kernel.org
X-Gm-Message-State: AOJu0YxV7aRmunCBQq0Fy+x2qzfnmXnisOfmQmFJvtFX3FY1fEl3A85m
	oyuVS5hyX0DJ4OLP3v7b3d7+DNcpkiJ4EN4PcfQy2z23K/PF8S+Hcg7hwnLuThB9NHyqeGjJJ9R
	+AwYxRamtjVx8z7jDVi4DlFd79a6PUa9GJTBEZg==
X-Gm-Gg: ASbGncuXocOYioX9Cx7ElymnJXhbw++KyHsQg17iXecWuM8Lv1auA0KA/yrUTz29zBf
	kF4tB6TfOF12J76gEsLO29iqVlFp588kB0QWz6dvf1s0xybouDFVvwriCutT4mj4l4t/Pn0yUxt
	XDedIG//E=
X-Google-Smtp-Source: AGHT+IHzz/P0Hm8UdbRjgk1cR863O7F6r8W0W544Da3GvafYHmjSA1uvWlCCR3A9q7Wuu5VemN5IT7yf6lv0WMpBQOg=
X-Received: by 2002:a2e:be11:0:b0:308:f455:1f79 with SMTP id
 38308e7fff4ca-30b9325c7e7mr7882911fa.21.1740732963262; Fri, 28 Feb 2025
 00:56:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
 <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de> <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
 <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de> <CACRpkda-0+9u1mu8gJPwE_2ykY0TeoDS3t2_D-HoPgUQ45gfiw@mail.gmail.com>
 <CAMuHMdW=bttP01Jigtn1DPyzVzTNr3GguNTo4Kw=NOBhhhthRA@mail.gmail.com>
In-Reply-To: <CAMuHMdW=bttP01Jigtn1DPyzVzTNr3GguNTo4Kw=NOBhhhthRA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:55:51 +0100
X-Gm-Features: AQ5f1Jo_MLnR7-QJEyT-74278ePdsKiGXS52oQTUluELDapEtx9mHxpW6ep21NU
Message-ID: <CACRpkdZ4XOrcSOawd551tNx7qzexOguzboaA_6Z36QPfK7a0vA@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marex@denx.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 9:50=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > /sys/bus/gpio/gpiochip0
> > /sys/bus/gpio/gpiochip0/gpio0
> > /sys/bus/gpio/gpiochip0/gpio0/userspace
> > /sys/bus/gpio/gpiochip0/gpio0/value
> > /sys/bus/gpio/gpiochip0/gpio1
> > /sys/bus/gpio/gpiochip0/gpio1/userspace
> > /sys/bus/gpio/gpiochip0/gpio1/value
> >
> > Take a GPIO, shake it, give it back to the kernel:
> > echo 1 > /sys/bus/gpio/gpiochip0/gpio1/userspace
> > echo 0 > /sys/bus/gpio/gpiochip0/gpio1/value
> > sleep 1
> > echo 1 > /sys/bus/gpio/gpiochip0/gpio1/value
> > echo 0 > /sys/bus/gpio/gpiochip0/gpio1/userspace
> >
> > So we can always "see" this GPIO line, instead of
> > exporting/unexporting there is a knob to assign/unassign
> > it to userspace.
>
> Why would you want to always "see" all GPIO lines?
> What is the use case for that? What am I missing?

Because in the current ABI the user has to implicitly
know how many GPIOs there is on a gpiochip in order
to know which lines can be requested, and that's not
good.

You know you can probably request gpio 0 but can
you request GPIO 104?

Also sysfs is explicitly for topology and this is topology,
by the book.

> If it is recommended not to use this interface, I think all GPIOs
> should be invisible by default.  Hence I still prefer the (un)export
> interface.

I think the whole point of the thread is that this so-called
sysfs v2 is supposed to be recommendable because users
want something like this.

Yours,
Linus Walleij

