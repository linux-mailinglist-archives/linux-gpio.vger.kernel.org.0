Return-Path: <linux-gpio+bounces-16998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E33A4D68E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B79483A8508
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB2F1FA854;
	Tue,  4 Mar 2025 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="up0Z5QoF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1AE1DFD8B
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077298; cv=none; b=mFf+MuAHCUMYmY3rydEjmd5X6qgDn4GkNkn2OJC/pS6r9EZpP09+EyKhQTjOvFZMSGo/e6aAjZkMPXJ1tLD5F5p9y9Of9GZXhX6c3JwwEj1a0HBtZrjmNFRvP56b80WUHyAoLkx1K0UVD1438E87S8/lQSj7XtqWpEHJiBSSwhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077298; c=relaxed/simple;
	bh=V2KSTpqN9yyPdPBDmFTpPQHR090zUwos7Uqal+nkViE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UniYueQ/rlXMRTUM0P2JeYiAMnYnnF7XLGnElJagZcp2ampx2Ux72zwqJub9MFDW2E8DnR6U8CDQm0Jokq51mTo2APdHVwaCpV7fleynjyG6TTGwLssmN6jhWP/zc8mRYYNVmrGvSGlJM/XraQ9DipW/UUvaxZCS6UhTRa0aFT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=up0Z5QoF; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f754678c29so49231627b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 00:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077295; x=1741682095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpYaFgX/DIeu+Y0M+C6PCuEaWiBduI0jsXCByUJfKZk=;
        b=up0Z5QoFeS9MG13eU/opb60ws/3fZAqoYqpjKOCbjeHlnrJAA7/+bUgWK8bC0xyCIU
         SlcgxGmZBpebZFH8dDpw4AD3hipvjF1GgMpr7tAEQ92igx88eGFwS68dQQyH3fVJ8Jby
         bB/KnBnGB7hbbcW6Iv61x7qp5TD5o+TGLyK1+p/i1itP6Qah8cy8/9IkDR/HljDZB6wB
         BFZ0mrihWU4ZyI+wOnbSJP5KPvtB/PSeuxh/HaG8bbi4q8LDbdS9mv0btJbfvVxM+asT
         gsII2XwDE3GQ3qIMzUFVv1/WixEpGL3hoJym7uLRF36loOcd46Or2d/b8C1wG2p7CirI
         VqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077295; x=1741682095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpYaFgX/DIeu+Y0M+C6PCuEaWiBduI0jsXCByUJfKZk=;
        b=df9NZAYf7ra8ckiLlCJGP18DkIPZstevd9m67gAQQPltwYc24we6u5tQZYHOOF+zYG
         W9bCZWnS1//VkR6lqrixjh9rEPvGLuArYZdaTTHo2Skx/VJNcazMxiVGOvISXeQY2tMJ
         5sC8WaAMYdt0OFd+ymxKytIyWvzNlsWxXD2bN4oOmNlj+80GBEPkqnp3M6gbCFE20UUc
         jN241PyGZDmQCcqStrLL1H4+1G61kmv8acXLYjMUzdcq5Tg6kKi4b+SVhWCa/fJ/H7V0
         LozcMol3Poif+KzCJErw4eFRMKRvDryndl1Xq30KAbhGudy+nJ3Vjv8t4f384oM0CIEk
         kPkw==
X-Gm-Message-State: AOJu0YyiyIoQHcjDmhxf6H1mF5Qy35H9dMBJgGlsnvjWA6wXYaS8f+4v
	aATDHxcrKExaGbsB1XCGROB5UeQnM3DH/WEIXPNEslJjyI/Hti67HBfHawcy5kLMfPJIwA7e+bg
	laCJEbu8KNMEgNyHc//RGwQ1kl4yTN4z4v4vAaFJgQDGJLssT+yY=
X-Gm-Gg: ASbGnct7L/L0LYncVFXLTfV+4sz9KPB2JhHlJfirxDOFfQiy756r8EYgy0sXala5+ic
	nfCkPm32k05XvNo0gFmhAKLBOvReWOJHO/PumDr8Pt7lVpR1f0/+YSuIaGE+sP9r/tYCWtx76St
	ln4qSk8hoaLa1KWRMCOVJkHyYfdQ==
X-Google-Smtp-Source: AGHT+IFhGPO8Z+0jx6KGBynNtPT6yYF9xszM4x36wjx9yMMgVztmaWf8Qs8IKShaST2LvOhz0lgri9jNyCWBfrQUF7s=
X-Received: by 2002:a05:690c:7006:b0:6fb:b2c0:71da with SMTP id
 00721157ae682-6fd4a15155bmr214892977b3.36.1741077295472; Tue, 04 Mar 2025
 00:34:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228165749.3476210-1-pratap.nirujogi@amd.com>
In-Reply-To: <20250228165749.3476210-1-pratap.nirujogi@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:34:37 +0100
X-Gm-Features: AQ5f1Jr9Zy0fCfWDPGh4yq2xUe8K7tk64A7TE75BVReNHw7SurNadKCZOEUvAVc
Message-ID: <CACRpkdZv6ykTPWUNmbPNv+VS=a_YTFBqiDS0eojt28Myvs-ZZQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.chan@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pratap,

thanks for your patch!

On Fri, Feb 28, 2025 at 5:58=E2=80=AFPM Pratap Nirujogi <pratap.nirujogi@am=
d.com> wrote:

> +config PINCTRL_AMDISP
> +       tristate "AMDISP GPIO pin control"
> +       depends on HAS_IOMEM
> +       select GPIOLIB
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       help
> +         The driver for memory mapped GPIO functionality on AMD platform=
s
> +         with ISP support. All the pins are output controlled only
> +
> +         Requires AMDGPU to MFD add device for enumeration to set up as
> +         platform device.

> +/* SPDX-License-Identifier: MIT */

OK we have this...

> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
> + * All Rights Reserved.
> + *

That can be kept

> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.

This is already in:
LICENSES/preferred/MIT

Which is referenced by the SPDX tag.

Can we just drop it? It's very annoying with all this boilerplate.

> +#ifdef CONFIG_GPIOLIB

You select GPIOLIB in the Kconfig so drop the ifdef, it's always
available.

> +static int amdisp_gpio_set_config(struct gpio_chip *gc, unsigned int gpi=
o,
> +                                 unsigned long config)
> +{
> +       /* Nothing to do, amdisp gpio has no other config */
> +       return 0;
> +}

Don't even assign the callback then, that's fine.

> +static int amdisp_gpiochip_add(struct platform_device *pdev,
> +                              struct amdisp_pinctrl *pctrl)
> +{
> +       struct gpio_chip *gc =3D &pctrl->gc;
> +       struct pinctrl_gpio_range *grange =3D &pctrl->gpio_range;
> +       int ret;
> +
> +       gc->label               =3D dev_name(pctrl->dev);
> +       gc->owner               =3D THIS_MODULE;

I think the core default-assigns owner so you don't need to
assign this.

> +       gc->parent              =3D &pdev->dev;
> +       gc->names               =3D amdisp_range_pins_name;
> +       gc->request             =3D gpiochip_generic_request;
> +       gc->free                =3D gpiochip_generic_free;
> +       gc->get_direction       =3D amdisp_gpio_get_direction;
> +       gc->direction_input     =3D amdisp_gpio_direction_input;
> +       gc->direction_output    =3D amdisp_gpio_direction_output;
> +       gc->get                 =3D amdisp_gpio_get;
> +       gc->set                 =3D amdisp_gpio_set;
> +       gc->set_config          =3D amdisp_gpio_set_config;

I.e. drop this.

> +       gc->base                =3D -1;
> +       gc->ngpio               =3D ARRAY_SIZE(amdisp_range_pins);
> +#if defined(CONFIG_OF_GPIO)
> +       gc->of_node             =3D pdev->dev.of_node;
> +       gc->of_gpio_n_cells     =3D 2;
> +#endif

Drop the ifdefs.

> +#ifdef CONFIG_GPIOLIB
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (IS_ERR(res))
> +               return PTR_ERR(res);
> +
> +       pctrl->gpiobase =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(pctrl->gpiobase))
> +               return PTR_ERR(pctrl->gpiobase);
> +#endif

Drop ifdefs

> +#ifdef CONFIG_GPIOLIB
> +       ret =3D amdisp_gpiochip_add(pdev, pctrl);
> +       if (ret)
> +               return ret;
> +#endif

Drop ifdefs

> +static int __init amdisp_pinctrl_init(void)
> +{
> +       return platform_driver_register(&amdisp_pinctrl_driver);
> +}
> +arch_initcall(amdisp_pinctrl_init);
> +
> +static void __exit amdisp_pinctrl_exit(void)
> +{
> +       platform_driver_unregister(&amdisp_pinctrl_driver);
> +}
> +module_exit(amdisp_pinctrl_exit);

Why do you need arch_initcall()?

Try to just use module_platform_driver() for the
whole module.

> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("AMDISP pinctrl driver");
> +MODULE_LICENSE("GPL and additional rights");

Well that does not correspond to MIT does it?

> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
> + * All Rights Reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.

Can we drop this?

Yours,
Linus Walleij

