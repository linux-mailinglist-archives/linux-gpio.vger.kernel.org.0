Return-Path: <linux-gpio+bounces-28734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8C1C6D794
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 09:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A29614F14A2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 08:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE5A31B133;
	Wed, 19 Nov 2025 08:33:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B28B2F690E
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 08:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541212; cv=none; b=dIi88KbvW6p46x6RN/GWbDRO6ci+6ogVeIdThHgspfKQ4F6L2AbC5ZYtqyFNB/CZn+XmC8EUG8SleO2EtaE8YFj0xi1YoBVqKv8HOrmT9k4f8feX1FgFO9uATGDwWG5I6mJ5klUVGRak2rGeYmrR5XT7UjZM0vJEN3aRvI6tx4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541212; c=relaxed/simple;
	bh=Dz2RNjo2Pw0XOcm+SGn1fEPdASUKESrZTRijPS7lbP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exiPg3PcEBAXV4jL+UdpRxH6li2/KX5l1bUoY3db5bJMOLL+fe0ERX+2e8ckU9P8l1AXxPORw+JaQOcG7645ZLITf90Ey9AboqIRm0cSfbox+ElcFxRg32gTzL0wbbwQoH4J3F//2iJczHXkt1QZOGJD7JK8RvEBpr91WT48a0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55b24eedd37so3077983e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 00:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541209; x=1764146009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKBmRJ4RypI8GAVhhXpGdOuKGmWr/ovhm00lN6IEqrs=;
        b=D0qeaRmdL15X7pgwMZ+gmHX4xMX5KoiTGyhOf/5GNL96+EBJ7jFT08/RSJDAclQfO0
         7Yg7FOTAN4kos39t6z+pTlzsGiTPtbGrbZilwPeX7QtzHiVnZAlkfLttygvmBJkyBZF2
         Ybyd/zgAh0D7uyDRrZMH+CPfKuHTScg3IkVc/+KmNqwi2ApJB0baRySmFnQy02J7hwI7
         8bETv6dQSqaKhVGUPyQynkuqibyykxSZaPNZK0t1kqSdxLM3WCXeGXDTMVXkRHaRxTH+
         p4SRHh0xAiv556IqhckJgbIWQgTYr5zsZWncGgZyTnxWZJXlDDkMjHZtMMDK0ngcjpHC
         ubFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnvG9Y5araCosYk63UtnLS306CFkYTnzAwCwHKNP3YMuPF/YVSVQ3CJzIHpz9RXgY/UjeOsJ+Unmu2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw3Sv2sCpxXI+y5IYkaKtp4fTTM3e8BevTGkFmHRruIhKH7Dpl
	8EV8C17I1JgjyW3khdVZYyZEPGAbKDirUA0sMESzu+aJ6LS7AbDfNtvu9aQTVTRs
X-Gm-Gg: ASbGncvnndSWrijUDGOsYzrZzDZMeYPc2djbkPanVVSGgl8pgFLKyBC9WgP1QREr6+p
	X4v2uC5khdLkXD7FvbhjnMPniNkKDSmLkniRnra3Ce90R/ax2fJHJjA6ga98uAftBSxnj4ilhC2
	Qm64AgRPS/ZIPBGeVys5S9/N5QvM7w5F9fDB8UMm9p9MeaLEQRfVRWcwpsSWUVH24ZHzMOu4fKt
	m+KVgdaTTi1UvfCviaXNhLCHA7398lPtJPXAqwT3DZ41KGNlA/zH3cYtcr3KWWhPh9Qr+THhIZ+
	oF+5hZMU5uPVCVlzH5smJqA+dcA6oxgTA5nOeehVHcd/pkyqxvm8CAhdhinn1jCfdtoKJ1S5ols
	ujnUSiRvZCXtVsDUCjJTpUitm3enr34iJLGMIBrJ5qs6f2FinrHVbOc6vkYx1nWX3FuKwayPMnj
	9x8CgNR+CR8cOtGZoknCbCVwv1qZ8NGZQnkclif1oaCm7kS0PhLnMGWj9dpY4=
X-Google-Smtp-Source: AGHT+IGhoRgxU0oFv1/3LiW1vXPO9lDddllo/vfaPz+HWUVsJEHYWIk4+gGvVo4uLrFHYRGy1XoNXA==
X-Received: by 2002:a05:6122:d06:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-55b1bd05a9emr7039508e0c.4.1763541208720;
        Wed, 19 Nov 2025 00:33:28 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f4425f7sm6345153e0c.13.2025.11.19.00.33.27
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:33:27 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso3248337241.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 00:33:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYhApy7zffX2QUaTkXfp3MA3Q1m/HpfMqbqAgXZr1EV4DU+Y11f1NL/jkL2XZbOX7U4Dey2vsEcYvg@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5db:e179:1c21 with SMTP id
 ada2fe7eead31-5dfc5c0488dmr6881252137.41.1763541207113; Wed, 19 Nov 2025
 00:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
In-Reply-To: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 09:33:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
X-Gm-Features: AWmQ_bnsTpUUScnL6xOjY4S7f_b3_VnG_mVkF87eF8BY7eFC84gNc7MAR704Al0
Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 19 Nov 2025 at 00:24, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > We have a long-standing use-case on various Renesas R-Car Gen3 boards
> > (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> > key switches.  Basically, the GPIO is connected to:
> >   1. A key switch connecting to GND when closed, with pull-up.
> >   2. The gate of an N-channel MOSFET, turning on an LED when driven
> >      high.
> >
> > Hence:
> >   - In output mode, the LED can be controlled freely,
> >   - In input mode, the LED is on, unless the key is pressed,
> >   - Hence the switch state can only be read when the LED is turned on.
>
> > If you have any idea how to handle this, feel free to reply ;-)
>
> Isn't it pretty clear from the system-level DTS how the line
> is used?
>
> If it is connected to a gpio key it gets assigned for that usecase
> and handled by that driver and if it is connected to a gpio LED
> it is handled by that driver.
>
> For the input usecase the status of the LED is a byproduct and
> should not reflect in software I think. It surely should not be
> controllable and possible to set into output mode because
> that sounds like a recipe for HW damage if you drive it
> actively high and press the key at the same time.

Suitable resistors are present to prevent hardware damage.

> gpio_keys {
>     compatible =3D "gpio-keys";
>
>     button-ok {
>         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
>     };
> };

But only one of the gpio-keys and gpio-leds drivers can bind to the
GPIO, or am I missing something?
So I do think I need a new combined key-and-led driver, like Bartosz
suggested:
  - When the user turns the LED on, the GPIO is switched to input mode,
    and the switch works,
  - When the user turns the LED off, the GPIO is switched to output
    and driven low, and the switch does not work.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

