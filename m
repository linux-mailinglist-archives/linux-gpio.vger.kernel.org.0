Return-Path: <linux-gpio+bounces-14316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6199FD5F6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A3553A2A38
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 16:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C941F76B6;
	Fri, 27 Dec 2024 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzgfcQqy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1071F1307
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735316947; cv=none; b=o1BD4D9p2A32JQ6TFVR1BaJA+Rzvg0zwkjY/r2kkT2qmnpDgFIEGTdPAdX1z5CgG5VV2/GLN9OV/9yIzD3rBQ2j6XjYqeds+iboSgK1cSYCdgwTrTUWTNEFL9e1kYduPSU2euzsjpgNXwrsAva5PxNoAX7OBPDVcGyepZL32gGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735316947; c=relaxed/simple;
	bh=zgYZUl5WkvllzAU1eF0FO9O5S+PDx+hLGZ5UZutAUCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmnuiebcWz939lEAM3KLEvUdsv82GcIAsgLzVRlOFlfV/BcejMpH77ky7x6RHiw8lfiyiMi8gUTo45bWz6RDbPAmFA1Q7eid7um4zOWKM4xcIJdn8XJMPeWGT1iSRpB+i52/GnFL1IHekMv2c5b/IyP0D6qNaAbpmLG0mumMAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzgfcQqy; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401c52000fso7723529e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 08:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735316944; x=1735921744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oW4mN8cC86oshtjqRgjsTaW7z+n3qOyOrUeMP9CRCk=;
        b=JzgfcQqyJCOfYV+lLpI0BMIxT4vXvxJecSzUiY6YmsnPDcSuSt8vYDvuNbH4W/hUDP
         8pPdbvpvhlg1I+vq47MkTiXTUhAxlPD7TYSVfZKutEIRWKUUyAKUlotOE5AUlw3X5vrv
         3wcv1CRwAvvQtuib8chFGt8gc9Vl0GYbN8qKGsh7oT1D7EqYaX7Dbnnn1lz4nINCzmvW
         jH7I+c/H5tUT1PXuQhxSyNnmsiM843UDW//Kcgot74RTG35Kbmq3A0q6ezhYw798tYgG
         niJ34QGOR0xw9g9Jf9zIw8aarw3B55Cbjn00Mxr2uLa3OwKD8+vUNS/HlZAskVbujeg8
         2F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735316944; x=1735921744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oW4mN8cC86oshtjqRgjsTaW7z+n3qOyOrUeMP9CRCk=;
        b=nhrH4yZZCYN2uZ1TTlzAqUAIEI4uepc/Jl0jefrWHvNBN1ybaBjXIyqTRPW6lMY5rw
         P5eBIsT3Y1CmrVWFI2u7X9RV/dLjtm3RIoqgnntiHloZ1XZhv4lFH1KyBOChMlYrUsSm
         tIkxUuziQSXLP6q52dkiLPQHMa4sPiLWiM96/O/xrEvqlzIb8XOi7CBoyzCcTqXBArdn
         BMemVFMzYxr2tU6R9VfYyRjL7JXsWt/S+V4hRNJdjxDZq862dg0uQyrdn2DLx21alaNv
         CIwt/TrJLn9jqmOpxI3wyCAVax/4J0tguNWk3GuaFNRTzaozBDxU+MdQjoJvnmvxutFD
         +vZg==
X-Forwarded-Encrypted: i=1; AJvYcCUUNUUqcEzdxLFSPXviTCsTHFw2M473r66xnMxZsLmEuzTrIOIjv0k5QqkX5J8Yp7Z+SRHN8uAyq3dF@vger.kernel.org
X-Gm-Message-State: AOJu0YziXvn1G/WBUEmbDAVPcQUpkPyu6ALW74wQIcMdJVHtImGjUWwn
	Jr+gMqt6j24sDyBy3SZbICJfgtNXqYf5dwgiGUIVfN4S08O+8YgDWOgBF7y7tghmM1PidQnKJTV
	xvfx/rDzhRLQgaHjq7g+pT1tuddlLFg2Ss1fCYQ==
X-Gm-Gg: ASbGnctCpaKUa09B2vx2KHkw9NMBmMGElSlQSAuZSpjRxWDd5SNbNxLSy4eTLIHxVDZ
	5OpdTXcnLUxWOzpW84SOfKdDN63F4VO8NAbzp
X-Google-Smtp-Source: AGHT+IFEVrD+v3aZLF1u0UgSdbK6XoWVvLireUe/cfd58JtoLPKDCHpDJcLqQ+n8HxbzaxWY6+YsJylFW7tZ4FIBybs=
X-Received: by 2002:a05:6512:1241:b0:53f:f074:801c with SMTP id
 2adb3069b0e04-5422958eaaemr9406977e87.41.1735316944181; Fri, 27 Dec 2024
 08:29:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org> <20241225-03-k1-gpio-v3-2-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-2-27bb7b441d62@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:28:53 +0100
Message-ID: <CACRpkdYgGho=VQabonq4HccEiXBH2qM76K45oDaV1Jyi0xZ-YA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

thanks for your patch!

Some comments below:

On Wed, Dec 25, 2024 at 1:33=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising/failing edge type trigger, or both.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
(...)
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/clk.h>
> +#include <linux/gpio.h>

Please drop this legacy include. It should not be needed.

> +#include <linux/gpio/driver.h>

This should be enough for any driver.

> +/* register offset */
> +#define GPLR           0x00
> +#define GPDR           0x0c
> +#define GPSR           0x18
> +#define GPCR           0x24
> +#define GRER           0x30
> +#define GFER           0x3c
> +#define GEDR           0x48
> +#define GSDR           0x54
> +#define GCDR           0x60
> +#define GSRER          0x6c
> +#define GCRER          0x78
> +#define GSFER          0x84
> +#define GCFER          0x90
> +#define GAPMASK                0x9c
> +#define GCPMASK                0xa8

This looks like the archetype of a memory-mapped GPIO chip.

> +#define spacemit_gpio_to_bank_idx(gpio)                ((gpio) / K1_BANK=
_GPIO_NUMBER)
> +#define spacemit_gpio_to_bank_offset(gpio)     ((gpio) & BANK_GPIO_MASK)
> +#define spacemit_bank_to_gpio(idx, offset)     \
> +       (((idx) * K1_BANK_GPIO_NUMBER) | ((offset) & BANK_GPIO_MASK))
> +
> +static u32 k1_gpio_bank_offset[] =3D { 0x0, 0x4, 0x8, 0x100 };

Yet this is not registered on a per-bank basis, instead all four banks
are hammered into one single chip. Why?

Can you please split this into 4 instances, also in the device
tree. It makes everything much simpler.

> +struct spacemit_gpio_chip {
> +       struct gpio_chip                chip;
> +       struct irq_domain               *domain;

If you're using GPIOLIB_IRQCHIP you should not
also define youe own irq_domain, the gpiolib handles this.

> +       struct spacemit_gpio_bank       *banks;
> +       void __iomem                    *reg_base;
> +       unsigned int                    ngpio;

Is this ever used after initialization?

> +       unsigned int                    nbank;
> +       int                             irq;

Or this?

> +static int spacemit_gpio_to_irq(struct gpio_chip *chip, unsigned int off=
set)
> +{
> +       struct spacemit_gpio_chip *schip =3D to_spacemit_gpio_chip(chip);
> +
> +       return irq_create_mapping(schip->domain, offset);
> +}

Should not be needed when using GPIOLIB_IRQCHIP.

> +       schip =3D to_spacemit_gpio_chip(chip);
> +       bank =3D spacemit_gpio_get_bank(schip, offset);
> +       bit =3D BIT(spacemit_gpio_to_bank_offset(offset));

#include <linux/bits.h> to use the BIT() macro.

This driver becomes unnecessarily complex due to collecting 4 GPIO chips
into one.

Please split it into 4 instances of the same driver, then look at other
drivers using select GPIO_GENERIC such as
drivers/gpio/gpio-pl061.c
drivers/gpio/gpio-ftgpio010.c
for examples of how to create a very compact and simple driver
reusing the generic GPIO helpers, this will also provide
get/set_multiple implementations and other useful things.

Yours,
Linus Walleij

