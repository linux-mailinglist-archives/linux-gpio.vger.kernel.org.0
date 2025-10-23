Return-Path: <linux-gpio+bounces-27514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE577C001D1
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 11:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9F81A637C0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CF92FBE03;
	Thu, 23 Oct 2025 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xcDXKkZB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA382FB98D
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210371; cv=none; b=aomuEGkzsQITiWO27v6qa4lMH7+SQ8zTneOxf02H8EUketZXyPcwMnKn/rQPsuLDiYiqlbC4m5s8+FNQtsXqyXJjD1oYHXj8EMYcxFIUZTcdlOq7e4jNhpQhrnZriknAGk6Enkd2/cGqbvGE0vLqb7wh5Gj5qGClDc8PxxYLq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210371; c=relaxed/simple;
	bh=tRuqQfKfhQL0OLPucc1EA0bgdrYWVNgWFBGmyAKu/zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXM/ZfHg7z43cKYTFIl03w9ztherOy4/VcAyfAT2oBDuptunC+SWa5RaTob3X35yyBqMxedJkbovqgeqREleU2cDVf1kQCOLmRiC27XVDuNhL0uncdV3YIAZAaIZDNBfLJLu/9W7GwgL2t2F2oGgQc0wQcwyZVLUM28kuo3Kdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xcDXKkZB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so694407e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 02:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761210366; x=1761815166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1z3CDgESP91ImTgVOpRTIyiM4/M4Omf2Iv1zO187XY=;
        b=xcDXKkZBiXJIiR70YU1SX1S+Ui+L6U/YEnwgRy/UsBlmUdmJdes/dqfS1x4fVeOJye
         XExd+8vqaUc14p/K6LkbDs3gUAL//1rIsRrV8pvRd9fJqNc3qAS+VNvJqWHdZlIH+sDL
         bX349AzOfQyMKsr3MrfAarWSq4iW4ToHyXmqlzI13GAkVxdv1gQqkvmeViCRIp55sOGk
         xMC2qBhpPT8ANs2kk2/DZaX6PQvW+WTjz8pjy8Jk61Uhdv8s4CnjqwzW07lS/rM5SEGt
         tsOJETnxy1f+YZ8H40PQlbn/qZxF2liRmh76KO09U6ZoaV+NdTV1qt9e9jam/GnZAYwg
         85QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210366; x=1761815166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1z3CDgESP91ImTgVOpRTIyiM4/M4Omf2Iv1zO187XY=;
        b=uG+zpIU+EXy4PuTrGAsoJt4tvvfvgscyfwtpbbPaGuFFRwVTdoPq8C/mXaVxPlajg/
         YQxF96IR1F5WI3wZUsV9uEuvaDbr2S2DDeitF62yr55/H9Ff9I/Ajm00GPaAXPm4+G4o
         gM5lca8eVXQY2DXO+lXEwlCDzN6Mw5WiaoCljjlaG1S11wIYN3L+PzfSB+VfXzyfsQZk
         wNMl1oOT3IEmYiLzWzwjIM0z2DYqwE5qMmAR9JHEGceMI9ZKk+Dr7U0Rv6Soyjp81AaD
         To9JrljeEg/5rn254M2BZ8a+MJ9DeysW4b9EILcxROUfMei/9vDWrG2sjNNNgSXLNvPf
         dXnw==
X-Forwarded-Encrypted: i=1; AJvYcCUgb/HEkoQAp96JY7HrLb86QRDZF9SFxxsQhb7YOS8H3+XZZzc5YfMnD3JSpPPe5trvcpnnXhNz+3jg@vger.kernel.org
X-Gm-Message-State: AOJu0YxYCJf3yvCwigzS+wiKvr3S6JN8GkeDcI0gz5FZiqv8FStvfLlE
	88P/289IZikdteoQDK19EbRLyM+mK/9Pdmh7//TSeIeJGlJD9Qh3N342qJZa1X+HCZHqrdPVoXx
	uT4fCHNTpIHTSSX+y7FFE/oa/INa5GkffpoK6lvjiyQ==
X-Gm-Gg: ASbGncusnne9L5qvOVM692ZW5gWUZUP5QsSnD8kFmyAPkJDWgBrxUSPFQusdWEFJemO
	cay4RIRbskqjzIvLPy3zLyOc2qRsY7ZHE4l+PtUoQmcRj9W0Z+SVMCVLnPMqXQ+93nAMJdhq8Ou
	vlFwX/13Ad/dyiB7pOVuBgweHaYWpfTkrfWIZ237bcU4SoQ16gD4v9MLZDNopJ2dZlzaKblL39T
	EJ5KhsGPdQRdl8aqsfXjA7WKRdcStHnKyzzGD5FQdo8fqohBQ6hYbiy7xb+wwjmjpsmlQfiwLKj
	CnuQRHIyHYm5v+S+kW7+IYezbw==
X-Google-Smtp-Source: AGHT+IFMDjQSxC8i27NvZvV+QPpRuhQpy2687aN6kbWKwb5pgOxSbO9NBZ//dU90tBMyoJP8nrJgvUp2Jkmlcch4XQg=
X-Received: by 2002:a05:6512:3ca9:b0:57d:80f2:5364 with SMTP id
 2adb3069b0e04-591d855a3e2mr7707851e87.26.1761210366122; Thu, 23 Oct 2025
 02:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021142407.307753-1-sander@svanheule.net>
In-Reply-To: <20251021142407.307753-1-sander@svanheule.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 11:05:53 +0200
X-Gm-Features: AS18NWAJjSskDq2mcYC5AbCEWxeU2SiPM7ypZymLTbwXqYM8_zLN8I4t1ZVA2j8
Message-ID: <CAMRc=MeGehj3EHP=W3E3fJOpOAqXXg_D8XRRuv2SMxF8_UYpbQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] RTL8231 GPIO expander support
To: Sander Vanheule <sander@svanheule.net>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 4:24=E2=80=AFPM Sander Vanheule <sander@svanheule.n=
et> wrote:
>
> The RTL8231 GPIO and LED expander can be configured for use as an MDIO
> or SMI bus device. Currently only the MDIO mode is supported, although
> SMI mode support should be fairly straightforward, once an SMI bus
> driver is available.
>
> Provided features by the RTL8231:
>   - Up to 37 GPIOs
>     - Configurable drive strength: 8mA or 4mA (currently unsupported)
>     - Input debouncing on GPIOs 31-36
>   - Up to 88 LEDs in multiple scan matrix groups
>     - On, off, or one of six toggling intervals
>     - "single-color mode": 2=C3=9736 single color LEDs + 8 bi-color LEDs
>     - "bi-color mode": (12 + 2=C3=976) bi-color LEDs + 24 single color LE=
Ds
>   - Up to one PWM output (currently unsupported)
>     - Fixed duty cycle, 8 selectable frequencies (1.2kHz - 4.8kHz)
>
> The patches have been in use downstream by OpenWrt for some months. As
> the original patches are already a few years old, I would like to request
> all patches to be reviewed again (and I've dropped all provided tags and
> changelogs).
> ---
> RFC for gpio-regmap changes:
> Link: https://lore.kernel.org/lkml/20251020115636.55417-1-sander@svanheul=
e.net/
>
> Patch series v5 (June 2021):
> Link: https://lore.kernel.org/lkml/cover.1623532208.git.sander@svanheule.=
net/
>
> Sander Vanheule (8):
>   gpio: regmap: Force writes for aliased data regs
>   gpio: regmap: Bypass cache for aliased inputs

If I'm not mistaken, nothing depends on these two at build-time, so I
can just take them through the GPIO tree for v6.19?

Bart

>   dt-bindings: leds: Binding for RTL8231 scan matrix
>   dt-bindings: mfd: Binding for RTL8231
>   mfd: Add RTL8231 core device
>   pinctrl: Add RTL8231 pin control and GPIO support
>   leds: Add support for RTL8231 LED scan matrix
>   MAINTAINERS: Add RTL8231 MFD driver
>
>  .../bindings/leds/realtek,rtl8231-leds.yaml   | 167 ++++++
>  .../bindings/mfd/realtek,rtl8231.yaml         | 189 ++++++
>  MAINTAINERS                                   |  10 +
>  drivers/gpio/gpio-regmap.c                    |  18 +-
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-rtl8231.c                   | 285 ++++++++++
>  drivers/mfd/Kconfig                           |   9 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/rtl8231.c                         | 193 +++++++
>  drivers/pinctrl/Kconfig                       |  11 +
>  drivers/pinctrl/Makefile                      |   1 +
>  drivers/pinctrl/pinctrl-rtl8231.c             | 538 ++++++++++++++++++
>  include/linux/mfd/rtl8231.h                   |  71 +++
>  14 files changed, 1500 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl823=
1-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231=
.yaml
>  create mode 100644 drivers/leds/leds-rtl8231.c
>  create mode 100644 drivers/mfd/rtl8231.c
>  create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
>  create mode 100644 include/linux/mfd/rtl8231.h
>
> --
> 2.51.0
>

