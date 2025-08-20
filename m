Return-Path: <linux-gpio+bounces-24655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0855B2E2BB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94D9C5A17AC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876C2334382;
	Wed, 20 Aug 2025 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ohqa7+3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA7334373;
	Wed, 20 Aug 2025 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755708926; cv=none; b=HW08sgvxA0ld9Hd0KDIMM2U37/97uzqX+MIOL7A8J+cgn8Xh9RMviKIpjBwmg7+nQvWpvh7wqesQ5GWZlGP32OkGlEUJrDMGhYczCZeOYiHwbEzdUHTPNjRzCi01HWB/unNJZgE8EAUnstTIha23RCHZ+VdZoOmJKbRQSJ47/tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755708926; c=relaxed/simple;
	bh=sknj6z5ZmfotTUJB0y9pf5Spfwt+R3+bspkXNKF/MS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnSB92qQpPfoNIOc7MkhgZ4d5yplsM5T8IYGM1f7j5PP/JMDwJ7CDq+cwbnOYx0Ei+gb6kmYRI7TxLldreI8c2/1TFLDVD+gI3DdUonJu/8xc/Y/bukewJSwf/lKmTF7yeMxGUo13zvML6kxO72ecUh3KXlUju2d8CDC36auawo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ohqa7+3Q; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-333f8f0dd71so821751fa.1;
        Wed, 20 Aug 2025 09:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755708923; x=1756313723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuAzH0ykyYiagr/z7lts1D1/bhNuD5Pbem4A9m+m2Tg=;
        b=Ohqa7+3QsvyGtJJf1uIMwNvSBMg+i3+J4ZbJ9IOAUY6iAtxivdNrsC9XBMtIp8h/7p
         vuN5yiKknnBjnaci1M6NXoXaGmav7El9zfVcsaEZBVYurUXTrzfTRlLEZWMv1pvlLaZP
         pNRwudBw3HScSOJhKHGTHIUFG+mqLAMP18FbUh/7JPL4Fex6EJuEESv7BU+hO38SyntV
         W2+El1pG/qajkCQHNHW4RGJJYHi77VpIKwj+FiF871QDlxhJIXS4uEXbcZle9pvmjHXL
         DYUg9z5E/y5J2JE3EnmOinLloJ000uu8qH46/UtBGD52TBR9G/ZNCiLn55PwPKqqQJEX
         zAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755708923; x=1756313723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuAzH0ykyYiagr/z7lts1D1/bhNuD5Pbem4A9m+m2Tg=;
        b=DhZTFVBZJES2FUb3YrkSeayH9u8XWsBNRN30qJ/6o3SRIhjIWvXFMFznxQFFam/3WA
         2056oCLNy83bFS0Z/MD1j521DtTqu8RflWtKLGe5i93oWxgLBEaeUOzJkXIJbrlnseHi
         BeBHN11uAztiDW4TmCCXcxYeilPTAoUW0B3w0SKpTzik9b4PA+z70NSQPrdpVKlIGE/4
         wzxHAeN0mVUsuyTmmOIbmzQXlMePkyR7zIF2GzhfwJYiGXQOtPBAAPUDCwZxlP1rGs7g
         Z+XRI/zSaDP+D3geWgYbLqaAOGD4QqvOZlYmMfPLM3ywmEejDHPzvMKX1V9riUpjGPh1
         29xw==
X-Forwarded-Encrypted: i=1; AJvYcCVB5p3YSoFbzjAYbpafiTYh+K2HtUMi8pNm9Dbk4wbqHTMBlGn4tAB4fwePYJICfRd3UlGNeHBRjkfQ@vger.kernel.org, AJvYcCXU1EDvubg0xJKGurl1UJWCCeGut0GUOyXjzViVbvS2i1e5+/1TR/IyLuBNyeaAXyZ6KM/+bz3SZj+2Gw==@vger.kernel.org, AJvYcCXum2bOyCExOI4Zs8Ok5V45Lz8ma9Qurrb5o6/DJYwPkJEbYAJ9rOfqcCyqwn+aOVX1Ru+o/rqBaqHrrBH5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqx66uipMh+0DXov0IcJ4mHpjrLuSdFG06VorxlAak4VY98MjY
	fV148JC3jD6ov1byMfbsAVkb0g7T6axPbyfPnVBVI3T23HHempQv/AGw/B2v/IhzEA4MO76aXxx
	zfT3R01sdMHPk3IDbWv4TpNI5Od8HU9Q=
X-Gm-Gg: ASbGncsxrSN/ePdUWwBXLQ5F62oN5nVjmPb7L+cxjI0fA37Bf76uI5Lr/Q5wSaR7O1y
	sNDKV52YrGHXpdgtIzAK6Mgeuu/Jddb6Cl1g6JbN7dLJzoiFWGcoVcwkCm9mVduxGBQOcByMBu4
	V5nOqAASIaw0+hJWJ8TPkELVbg1picNECTBEb0+uMXimXIs17ehQGPyB7qxrGhgxD0o9oMlKXXm
	MJOTuFu9g==
X-Google-Smtp-Source: AGHT+IG92IoA2AqCrHNZ4KLxUNPzBodaSC8TC/cL/HxR2lwiS6CTezTFwiN6A5FTnbMQgl63MEzKwQKNYnc5KKI+YfE=
X-Received: by 2002:a2e:ae06:0:b0:333:ad65:c549 with SMTP id
 38308e7fff4ca-3353bd0e3f5mr10956591fa.25.1755708922348; Wed, 20 Aug 2025
 09:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-2-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-2-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 19:54:44 +0300
X-Gm-Features: Ac12FXxM7XPYPLdV05A87IZXsfGsg-W3cLkTiT8TRS3erU1NEZV3eHHBOgSvqrU
Message-ID: <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 6:58=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> The dwapb_context structure is always embedded into struct
> dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> data overhead for !CONFIG_PM_SLEP.

I don't think it's a good approach to add a lot of data for peanuts in
case of PM_SLEEP=3Dn.
Can you just drop that part from the patch and we can discuss it separately=
?


...

> -#ifdef CONFIG_PM_SLEEP
>  static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  {
>         struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
>         struct dwapb_gpio *gpio =3D to_dwapb_gpio(gc);
> -       struct dwapb_context *ctx =3D gpio->ports[0].ctx;
> +       struct dwapb_context *ctx =3D &gpio->ports[0].ctx;
>         irq_hw_number_t bit =3D irqd_to_hwirq(d);
>
>         if (enable)
> @@ -372,9 +367,6 @@ static int dwapb_irq_set_wake(struct irq_data *d, uns=
igned int enable)
>
>         return 0;
>  }
> -#else
> -#define dwapb_irq_set_wake     NULL
> -#endif
>
>  static const struct irq_chip dwapb_irq_chip =3D {
>         .name           =3D DWAPB_DRIVER_NAME,
> @@ -384,7 +376,7 @@ static const struct irq_chip dwapb_irq_chip =3D {
>         .irq_set_type   =3D dwapb_irq_set_type,
>         .irq_enable     =3D dwapb_irq_enable,
>         .irq_disable    =3D dwapb_irq_disable,
> -       .irq_set_wake   =3D dwapb_irq_set_wake,
> +       .irq_set_wake   =3D pm_sleep_ptr(dwapb_irq_set_wake),
>         .flags          =3D IRQCHIP_IMMUTABLE,
>         GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };

This is an interesting piece. I haven't seen much similar in other
GPIO drivers, I would suggest to split it to a separate patch. Also, I
would always have a callback assigned.

...

> -static SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend,
> -                        dwapb_gpio_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend, d=
wapb_gpio_resume);

I think Bart wants the 80 limit to be enforced. Can you just make the
split rather logical?

static DEFINE_SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops,
              dwapb_gpio_suspend, dwapb_gpio_resume);

--=20
With Best Regards,
Andy Shevchenko

