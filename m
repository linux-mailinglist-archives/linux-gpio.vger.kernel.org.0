Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E1D459591
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 20:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238942AbhKVT3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 14:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235437AbhKVT3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 14:29:12 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97649C061574;
        Mon, 22 Nov 2021 11:26:05 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id f9so19261408ybq.10;
        Mon, 22 Nov 2021 11:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WpBoJPtGwHRtTtDojsGvn1YkzSgQm2uWABhA3YSA9bw=;
        b=SJovytGp4NL+yPZphvXCdD+lewOJspuDRy5H2ntsTssq50KcQQKAk3rINy9HTZa/ho
         X+Hx6BqAa+fFPLdqXIUhLLjje6ItCdaB5oZ/SakQRah/+UjG20aM7NtKLFfHoyOF3nBl
         L+lmGxkUQLWP2GasZjyqou+gX2M4jrgqsr6jNXc1JPQ4RolfUvDp0yaKohhpn5jUfgHW
         zrO5JcHgZ4S+yL4yIIzoIBNuiLIC8EXcYHUiCByrAoSI7N5DQ38dE3BNGuJ7hMV+BIvF
         GoQ70JY8LQ4nsl5qHSodV3+vZcfcw3/4zBEFJsBMJO6m97q5LskuJ8EVWtpJJUjp9u2l
         G+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WpBoJPtGwHRtTtDojsGvn1YkzSgQm2uWABhA3YSA9bw=;
        b=3II7O6aY6JTx2EpzM5LA6A6HFrHTKQqv/Uc1i1fLliIzOpqZb15luzc3cs6pb0krny
         rTFkCFFq2CuDTVTQ0Tjfa5R2WSwIqKJh2r1NvPL5UmOCp1xqcNgQuVl5Op3z4TeCE5uC
         axDi7Z3VKLfjbOGt0bAhRceBXw9V5p9b6vEXLdGXxOVm7auJOyH8rbyuLmv4R2kg4LdN
         dlUv4RUVgjaY+v9HSZAO4cUVMVmgy7WZ/KwWdAeyVxy8FVOHCJ/PROQZmuj1OOsFNVFW
         CCBdqM+BvlMG/8Bq30+weiktoEtIHCb9x7qqo4OqRbuibubAXIUVVdNMJJ94JvHj0/G3
         4M+Q==
X-Gm-Message-State: AOAM531Njvg2jdng1AcD56tnDD4TvNj7L2bBPu/ByIZKogSjDi79D1cX
        LAThMOWELl/epPBlrpb8B+3pdszH316qZooDAis=
X-Google-Smtp-Source: ABdhPJyBIhHpbKRY6y13jTZj3IQvtHmKRzJhaoIGLDVcNciLfU3zrJJc6L/dnoy1S/ui2GroLB+tejEtTBQmeQ13VdY=
X-Received: by 2002:a25:f502:: with SMTP id a2mr67034073ybe.254.1637609164770;
 Mon, 22 Nov 2021 11:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 22 Nov 2021 19:25:38 +0000
Message-ID: <CA+V-a8sCVkbwYeVGsQpv2q0OjwUSB_jqmjPptHN-ENSdU+pT1Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/7] Renesas RZ/G2L IRQC support
To:     Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc and Linus,

On Wed, Nov 10, 2021 at 10:58 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> The RZ/G2L Interrupt Controller is a front-end for the GIC found on
> Renesas RZ/G2L SoC's with below pins:
> - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts
> - GPIO pins used as external interrupt input pins out of GPIOINT0-122 a
>   maximum of only 32 can be mapped to 32 GIC SPI interrupts,
> - NMI edge select.
>
>                                                                 _____________
>                                                                 |    GIC     |
>                                                                 |  ________  |
>                                          ____________           | |        | |
> NMI ------------------------------------>|          |  SPI0-479 | | GIC-600| |
>                 _______                  |          |------------>|        | |
>                 |      |                 |          |  PPI16-31 | |        | |
>                 |      | IRQ0-IRQ8       |   IRQC   |------------>|        | |
> P0_P48_4 ------>| GPIO |---------------->|          |           | |________| |
>                 |      |GPIOINT0-122     |          |           |            |
>                 |      |---------------->| TINT0-31 |           |            |
>                 |______|                 |__________|           |____________|
>
> The proposed RFC patches, add the IRQ domains in GPIO (pinctrl driver) and the
> IRQC driver. The IRQC domain handles the actual SPI interrupt and upon reception
> of the interrupt it propagates to the GPIO IRQ domain to handle virq.
> Out of GPIOINT0-122 only 32 can be mapped to GIC SPI, this mapping is handled by
> the IRQC driver.
>
> Cheers,
> Prabhakar
>
> Changes for v3:
> -> Re-structured the driver as a hierarchical irq domain instead of chained
> -> made use of IRQCHIP_* macros
> -> dropped locking
> -> Added support for IRQ0-7 interrupts
> -> Introduced 2 new patches for GPIOLIB
> -> Switched to using GPIOLIB for irqdomains in pinctrl
>
Gentle ping.

Cheers,
Prabhakar

> RFC v2: https://patchwork.kernel.org/project/linux-renesas-soc/cover/
> 20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> RFC v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/
> 20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> Lad Prabhakar (7):
>   dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt
>     Controller
>   irqchip: Add RZ/G2L IA55 Interrupt Controller driver
>   soc: renesas: Enable IRQC driver for RZ/G2L
>   gpio: gpiolib: Allow free() callback to be overridden
>   gpio: gpiolib: Add ngirq member to struct gpio_irq_chip
>   pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to handle GPIO
>     interrupt
>   arm64: dts: renesas: r9a07g044: Add IRQC node to SoC DTSI
>
>  .../renesas,rzg2l-irqc.yaml                   | 137 ++++++
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  60 +++
>  drivers/gpio/gpiolib.c                        |  13 +-
>  drivers/irqchip/Kconfig                       |   8 +
>  drivers/irqchip/Makefile                      |   1 +
>  drivers/irqchip/irq-renesas-rzg2l.c           | 465 ++++++++++++++++++
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 197 ++++++++
>  drivers/soc/renesas/Kconfig                   |   1 +
>  include/linux/gpio/driver.h                   |   8 +
>  9 files changed, 885 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
>  create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c
>
> --
> 2.17.1
>
