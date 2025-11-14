Return-Path: <linux-gpio+bounces-28476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D5C5C601
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB62C4F59DD
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 09:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D618F305E02;
	Fri, 14 Nov 2025 09:41:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39842FB99C
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113263; cv=none; b=RIYW/ddHuRSaY5s0JX/6NR87Ut1MCmeD1RKik+v4z0cBSafIFzTwZkwxTJnezgB7ALcixN509R0cQAaPpZvB9mwrXu9PU0PnDf5apSEF2jquuo3TzP1a4uEcTEUxUH/YzrkeTjmD4BYT6Ec3bQpy/CuSTJooERYC1wjge6gVOLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113263; c=relaxed/simple;
	bh=NpM95N9DN3UFQ7COCkLjeUezCaohFHKQ5vC1GQJ5VCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsksZrZR5+cZizsPSs9fhYsg/ltoUP5splF64oFp/Q4w+ZMr97UGXhQ4GuZO2TPcisg+MjirqivtZkWh2SJIdFpUucs2Y1eFWzePKOYcGV191dB4lhKJVgcGoksfSg+hWqeFc/IQ/4V1YPrgZQzRN5QSbX+VIgwPaRvk52QMBlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5598942c187so1723519e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113256; x=1763718056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kfkPNlB0ztwDghu8aUOEh8JnL7NlmqdeOqG584soohM=;
        b=pvxkLv4/pBQnTxcSqNdXJJxLPLmDSlOiR2uuGe7Sb0uWPPMnQ+KLIGHDUIvzwRt1Ep
         NNlzTfK/zP0Usplqj5tf1yQ3EcdvsAw19hPPb90M+v+ke+LFuUhghwZePLH1iMpqe90y
         h1MKKl5UG125x2YgZHSzs42yqplENXzRomxA0Ki0UBugk32J+oRXSMEu8DyxT3mK8niY
         zm/wXaIVBA3kGsLs0zeiX6w3UfjG6OXdtcX+pX/kuBVxIPNjXBPrzOVaE4MVaZBZf/q5
         S8/Mt0ykjo/2/Lt+8yR6IJcOFfd91tkHORPgGXFgaX8HqSH5exiamFK2ew29P9O9+YVi
         /knQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoxvxvJ3ZPIAWp+0fvU6dePc/xkZ+mtvdQII2705C18vMFVYelNVqHiZDyS6cBg6F9o/0wnM2D+PP8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9O8j6w9CHyQHIajCqmNSMx+RVChZgiCkhGgLKF33Ulkujxi+v
	ssRwlprLtIQPK87BX331N8vkTAxM7s9xcuKQLmkVadFsec86MlAlnRIU425EIulP
X-Gm-Gg: ASbGnctkIQuUPtl9zwXllCoR866M8MnjM4HWwaSSS2M5GUuqC+1vdloKczeIPNhJMc9
	ezVetdUbvQelDXhyIG1U0vW9bytBeZxXjUg/Y/1/IRhEJU9gMIzzU2DUlvB02IpBS/T8X42jOnm
	2R3u09ohiagHeIptMx8wWWAcOC/oiszEytaODX4JVbu7fxQaxii4NIsjaBYFNQvfrbYFbUoN3Nv
	5P1BYouA311JoyUatGwfPSCmULrUjz4XY1bUKH4EjqmrXdrl2++1GCdGE191w7xIyyfq1gHPypT
	oM6amAAc2BQFONvd71QtRGAX8Q2HWS9L/ZRWqMGJUtSIX617JMc9pHqPHit6EEPlXFs98s6suiV
	wiEI5YhxW0kgFntrcEi++y84grAdVkPHA1Y8je5fduWHPJq/Ff1i6XQK6edu0dFJqg6IPLUHoaW
	gfrr7wJ0vPs3M0Ela6x45OrUO0wxlfTGB9aLyKeHkjcA==
X-Google-Smtp-Source: AGHT+IHb1xAvZMKHDTRuZYC+aE8weYBSCmHbKivHTXt5CR4WpntWAYmNdgE2okq5c1qOay52Ce24Ug==
X-Received: by 2002:a05:6122:3091:b0:559:ebd7:56b5 with SMTP id 71dfb90a1353d-55b1beaf1a6mr877192e0c.4.1763113255868;
        Fri, 14 Nov 2025 01:40:55 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f461abesm1653219e0c.16.2025.11.14.01.40.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:40:55 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93917ebde8aso82972241.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:40:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURrRBY38x1H33lYFBt7BkowkiriQqi5oYPzmhL7AqMGOfCiqA+vkoN2FIJW6cfthvBTh1dNQtymGN1@vger.kernel.org
X-Received: by 2002:a05:6102:1621:b0:5dd:37a3:c389 with SMTP id
 ada2fe7eead31-5dfb406b273mr2848749137.2.1763112818859; Fri, 14 Nov 2025
 01:33:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251027123601.77216-8-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-8-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:33:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKO_=OeepHwOdFE7wWjxVQTCnq_9g0qJUB3UXE6Vb8GA@mail.gmail.com>
X-Gm-Features: AWmQ_bkS97Bhw3nuMQeFYkA968hCya9xwSjNdd3dxLkusXF7TWSJCaeM8rc-7KQ
Message-ID: <CAMuHMdUKO_=OeepHwOdFE7wWjxVQTCnq_9g0qJUB3UXE6Vb8GA@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Mon, 27 Oct 2025 at 13:36, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
>
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -62,6 +62,7 @@ config ARCH_RZN1
>         select PM
>         select PM_GENERIC_DOMAINS
>         select ARM_AMBA
> +       select RZN1_IRQMUX

I guess it makes some sense to enable this unconditionally...
But as the GPIO driver it relies on is not enabled automatically,
perhaps

    select RZN1_IRQMUX if GPIO_DWAPB

?

>
>  if ARM && ARCH_RENESAS
>
> @@ -459,6 +460,9 @@ config PWC_RZV2M
>  config RST_RCAR
>         bool "Reset Controller support for R-Car" if COMPILE_TEST
>
> +config RZN1_IRQMUX
> +       bool "Renesas RZ/N1 GPIO IRQ multiplexer support" if COMPILE_TEST
> +
>  config SYSC_RZ
>         bool "System controller for RZ SoCs" if COMPILE_TEST
>         select MFD_SYSCON

> --- /dev/null
> +++ b/drivers/soc/renesas/rzn1_irqmux.c

> +static int rzn1_irqmux_parent_args_to_line_index(struct device *dev,
> +                                                const struct of_phandle_=
args *parent_args)
> +{
> +       /*
> +        * The parent interrupt should be one of the GIC controller.
> +        * Three arguments must be provided.
> +        *  - args[0]: GIC_SPI
> +        *  - args[1]: The GIC interrupt number
> +        *  - args[2]: The interrupt flags
> +        *
> +        * We retrieve the line index based on the GIC interrupt number
> +        * provided.
> +        */
> +
> +       if (parent_args->args_count !=3D 3 ||
> +           parent_args->args[0] !=3D GIC_SPI) {

Fits on a single line.

> +               dev_err(dev, "Invalid interrupt-map item\n");
> +               return -EINVAL;
> +       }
> +
> +       if (parent_args->args[1] < RZN1_IRQMUX_GIC_SPI_BASE ||
> +           parent_args->args[1] >=3D RZN1_IRQMUX_GIC_SPI_BASE + RZN1_IRQ=
MUX_NUM_OUTPUTS) {
> +               dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->a=
rgs[1]);
> +               return -EINVAL;
> +       }
> +
> +       return parent_args->args[1] - RZN1_IRQMUX_GIC_SPI_BASE;
> +}
> +
> +static int rzn1_irqmux_setup(struct device *dev, struct device_node *np,=
 u32 __iomem *regs)
> +{
> +       DECLARE_BITMAP(index_done, RZN1_IRQMUX_NUM_OUTPUTS) =3D {};
> +       struct of_imap_parser imap_parser;
> +       struct of_imap_item imap_item;
> +       int index;
> +       int ret;
> +       u32 tmp;
> +
> +       /* We support only #interrupt-cells =3D <1> and #address-cells =
=3D <0> */
> +       ret =3D of_property_read_u32(np, "#interrupt-cells", &tmp);
> +       if (ret)
> +               return ret;
> +       if (tmp !=3D 1)
> +               return -EINVAL;
> +
> +       ret =3D of_property_read_u32(np, "#address-cells", &tmp);
> +       if (ret)
> +               return ret;
> +       if (tmp !=3D 0)
> +               return -EINVAL;
> +
> +       ret =3D of_imap_parser_init(&imap_parser, np, &imap_item);
> +       if (ret)
> +               return ret;
> +
> +       for_each_of_imap_item(&imap_parser, &imap_item) {
> +               index =3D rzn1_irqmux_parent_args_to_line_index(dev, &ima=
p_item.parent_args);
> +               if (index < 0) {
> +                       of_node_put(imap_item.parent_args.np);
> +                       return index;
> +               }
> +
> +               if (test_and_set_bit(index, index_done)) {
> +                       of_node_put(imap_item.parent_args.np);
> +                       dev_err(dev, "Mux output line already defined\n")=
;

Perhaps print the actual index? E.g.

    dev_err(dev, "Duplicate GIC_SPI interrupt %u in interrupt-map\n",
            RZN1_IRQMUX_GIC_SPI_BASE + index);

Hmm, having to add the base again would be a reason to let
rzn1_irqmux_parent_args_to_line_index() return the actual GIC interrupt
number instead...

> +                       return -EINVAL;
> +               }
> +
> +               /*
> +                * The child #address-cells is 0 (already checked). The f=
irst
> +                * value in imap item is the src hwirq.
> +                */
> +               writel(imap_item.child_imap[0], regs + index);
> +       }
> +
> +       return 0;
> +}
> +
> +static int rzn1_irqmux_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       u32 __iomem *regs;
> +
> +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
> +
> +       return rzn1_irqmux_setup(dev, np, regs);

As Wolfram already pointed out, this function looks a bit shallow.

> +}

Nothing critical, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

