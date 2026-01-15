Return-Path: <linux-gpio+bounces-30604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4423D24B2B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 14:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FC0030B3A79
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 13:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5EB39E6F5;
	Thu, 15 Jan 2026 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdC/tP9V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA49939B492
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482793; cv=none; b=hWiTYfMSftI/Q3TmEbsc5zNHQaS+zEki3NJ5Sa6GYN+/InAuRXE4mQ5LDuxciwcxhiKNcA1DYQaRyliQkK9s2ne7Iqt1r9gS1BnlZvvDbAeBLn78B2V8XNXvmWBT3P3oB38uJg2lDrTz8D4Hlv/YEwcjvgFjFNjckdSCn9uxUhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482793; c=relaxed/simple;
	bh=/7C1vhRdASPTMDMfdQtrm3XwzYwj0bOEBGu+5yC3C+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAsWEzENnT8JaKBJwK9rTDDjQHG2eLm+4iYdtP5xPWWYLKrTGxwnHE7rE2S4Wc0aMq2hkfIL4XZuKHlrJNvWGV0R93bD+EzmlE8t6xlr/SyyDlgk8lzyu0Yl5mIYQADFUduIBH39OHUZpNGSbZ5vGa34xGFX0tA3fB7CmyTD0Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdC/tP9V; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso1875917a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 05:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768482790; x=1769087590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7C1vhRdASPTMDMfdQtrm3XwzYwj0bOEBGu+5yC3C+4=;
        b=cdC/tP9VG6Fu6XchNGG6s1URIXhHftXqubwKYyvmj76o+B5OM6gXGd4/zGZdXuDy4m
         k/zqv1BEH2Mu//rMxXXhLyrTXAxI437UEtbqJmmQ6+dX1BcYTYfgkuaO2IRrxW/lmCYg
         M0hvTYgN97VGgj6eh/lARSrO/il6921c7mUNGsLIWOz69c2305yXbw+9gBZpiU2gRVrC
         D4DGc+2c4QYf/nYPvQJbs9MjyBa/3fQ65++yg19F/Y3ajNmyl2xoxjuIiPyN3VjG+0Hq
         grc0lJZomNbBiWSjXSSO8vMBVyxSN6McFKNu4OD8xPmvTQ1DCoAAlWIl58mwdyz8Tk5s
         YnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768482790; x=1769087590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7C1vhRdASPTMDMfdQtrm3XwzYwj0bOEBGu+5yC3C+4=;
        b=t5sjkDgmuY3jcZRXx01GarrrqWcFv+SHxokJ1ra2SM74IlFUhof5jHDsvWVAOIWCl/
         H+xxyX0DOXCFSaEpvC2OpKm0GABoPwAzpRBRVRVrBkk0XcJBxewZTCsanEhOqNyBQVXn
         yC8innVf5GrBjvP1fd9d5VvYLd4phdCqmA6bIf57WgG0iWYp/sfTyHKIoJQWVAB22Xma
         uWh9WvMUQAPZlYl55k7i45yhzILFYXjFp0b1TfMT12ZbjEqtm8KxG3uRJFFSVin6Fol8
         isKZrpnBVjg3pfv8MwCDL8/4KSCh7fWFUaGukTHB4eXrZoCmKuwNzFM/88pEEP1DLZrD
         KQ3w==
X-Forwarded-Encrypted: i=1; AJvYcCUHZTM0MSxUFWSCUlc05Y8Ps8oTYiPtGoGvtUPdGCpjJrhZnwgeSgWPXZi4YGyCmBt2HaaEc27JoFNC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25oTdc7BWDFncX7075sSK5RpyfXVS503VL+U5DaP92zVDArbM
	v8nVsRgqePWpfJaEEAmbalpiYd4oqDppIMwFg4iqWyt3NTnw1OoCMSf816OcpdrHQN1/Iyfe65W
	WIMkuZs0NsD/Ld+dpGwNhGHMGvXCqOpk=
X-Gm-Gg: AY/fxX77oEd6JH9WuPqJ49oxm+KX96cQfLFZos71BkGHIS1Klq45nU2r22dAKomdaEm
	hNtZGfXROmUg/nK30J2tpl+SaAHfOogrYukSYYblaGTWZ5j4Vma3x4pfBo6cvI+EJYmQU3WEPDO
	TLxpBRPcxsWHfLFI4ylogj2/OqH6s/m0WwpoBrcoLa1H/74sPCU6Ct9K7xbDScwty65ylfC+/NU
	0QONLTKJmLUdVMfGhQT+1AR4T5cxY0GMIUuDWmp0NHX0YMOHUivBSE+cvS/xR7JM95SUdDXRPu0
	juyN/ZRTkQE=
X-Received: by 2002:a17:906:6a01:b0:b86:f81d:66b1 with SMTP id
 a640c23a62f3a-b8760fdf7dcmr483161766b.2.1768482789913; Thu, 15 Jan 2026
 05:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114141352.103425-1-jie.i.li@nokia.com> <CAD++jLkyTMXAE_M2JFF5jzzLZ2Z-CV89uEGh4xHopWrGoYncbA@mail.gmail.com>
In-Reply-To: <CAD++jLkyTMXAE_M2JFF5jzzLZ2Z-CV89uEGh4xHopWrGoYncbA@mail.gmail.com>
From: =?UTF-8?B?5p2O5p2w?= <lj29312931@gmail.com>
Date: Thu, 15 Jan 2026 14:12:54 +0100
X-Gm-Features: AZwV_QjKsJ_TH_EzWpJMMMax33gEHVuvQEPtXjiun3u76fWkZ3qK7mZFa73MhiE
Message-ID: <CAO3NRJgNi88uhtN0RfbUUKPz_SSoceQyBTbScS-LV=9oYkDJqw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] i2c: add support for forced SDA recovery
To: Linus Walleij <linusw@kernel.org>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linus,

Thank you for your feedback and the insightful suggestion regarding
GPIO_OPEN_DRAIN.

I have analyzed the current implementation of gpiod_get_direction() in
the kernel, and I believe that relying solely on standard GPIO flags
cannot resolve the "deadlock" on this specific hardware.

The issue lies in how gpiod_get_direction() interacts with certain
open-drain controllers. As seen in the source code:

Even if FLAG_OPEN_DRAIN is set, the function falls back to
gc->get_direction() if the FLAG_IS_OUT bit hasn't been established
yet. Crucially, some ASICs do not even implement a readable direction
bit in hardware.

In many true open-drain hardware implementations, a line driven "high"
(high-impedance) is physically reported as an Input by the hardware
register.

Consequently, gc->get_direction() returns 1 (Input), and the following
assign_bit(FLAG_IS_OUT, &desc->flags, !ret) explicitly clears the
output flag in the kernel's descriptor.

This creates a logic loop in i2c_init_recovery():

The I2C core queries the direction via gpiod_get_direction().

The function returns 1 because the line is currently high/floating or
the hardware lacks direction reporting.

The I2C core then assumes the pin is "Input-only" and skips the
assignment of bri->set_sda.

Bus recovery becomes impossible even though the hardware is fully
capable of driving the line low.

Regarding the suggestion to use GPIOD_OUT_HIGH_OPEN_DRAIN in the I2C
core: I am concerned that forcing the line to "Output" globally in the
core might be too aggressive for all platforms. My proposed
force-set-sda property provides a safe, explicit way for a specific
board to say: "I know this pin reports as Input, but it is safe to
treat it as an Output for recovery."

I believe this explicit opt-in mechanism is more robust than relying
on an automatic detection that is fundamentally tied to the
instantaneous state of a high-impedance line.

What do you think about this perspective?

Best regards,
Jie Li


On Thu, Jan 15, 2026 at 10:27=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Hi Jie,
>
> thanks for your patch!
>
> On Wed, Jan 14, 2026 at 3:13=E2=80=AFPM Jie Li <lj29312931@gmail.com> wro=
te:
>
> > This series addresses a limitation in the I2C bus recovery mechanism wh=
en
> > dealing with certain open-drain GPIO configurations where the direction
> > cannot be automatically detected.
>
> I'm sorry but I don't understand the premise. How can we even get here?
>
> So the mechanism is about I2C that is using a regular I2C block, and
> the pins get re-muxed to GPIO to drive recovery using the I2C
> core GPIO-mode recovery mechanism with bridge->sda_gpiod
> which is retrieved in the core from "sda" which in DT is
> sda-gpios =3D <....>; (calong with similarly named SCL) for
> GPIO-mode recovery.
>
> So if that is set in an input mode, such as during devm_gpiod_get()
> reading the initial direction of the line,
> so gpiod_get_direction(bri->sda_gpiod) =3D=3D 1.
> this patch set will go and write output values to the line
> *anyway* because "it works".
>
> This is how I understand the patch set.
>
> In which scenario do you have a device tree where you can add
> "force-set-sda" to a DT node, but you *can't* just fix up the
> SCL/SDA flags like this:
>
> #include <dt-bindings/gpio/gpio.h>
>
> sda-gpios =3D <&gpio0 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> scl-gpios =3D <&gpio0 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>
> ?
>
> We should possibly also enforce it from the I2C recovery core,
> for SDA we are currently doing:
>
> gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_IN);
>
> what happens if you patch i2c-core-base.c to simply do:
>
> gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH_OPEN_DRAIN);
>
> (Based on SDA resting polarity being high.)
> I'm more uncertain about that one because I don't know exactly
> how hardware behaves in response to this, but can you test this
> first if you have to hack around in the core?
>
> Yours,
> Linus Walleij

