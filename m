Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F0144E841
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 15:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbhKLOPd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 09:15:33 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:43782 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbhKLOPd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 09:15:33 -0500
Received: by mail-ua1-f52.google.com with SMTP id v3so18977713uam.10;
        Fri, 12 Nov 2021 06:12:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ODq4xEGeD5W0X5IEWpSPJxMwWpEtxP4KZ12UIQVNQ+c=;
        b=rifJRaUubSmTxTOLYLaBVzV9unsayw7v9TtHKXJ0qcaehkVX6u5rz5PUS774AeF3j+
         JfS1ITVebh3KCSrWGIbawYmKJCprgOj25ePgUL/xE2VYN8JI40bKb03DTYSnBENvfN6Q
         HfPoPJClmgIsKyHnSA73GGIZ8O5jTal5dsfOKFWX7zxzjgdbxWkIHRnhQC4K2xYroPJG
         ycfg+YZ9BtAZTep/W5u/zkXQKHdvVfZImi/PFsgHcXj8yoS9LY1K0ADlnFef7m32XM+5
         nDHzl9JsgHs9UHrf6z59mm+rbTE8CMDuSuBSmsScs/TE4iQAynqXPxxtk1IM+P4xJHLg
         BzYQ==
X-Gm-Message-State: AOAM530Ifru1G8ltqyu4FVgwBoiwT+J9YcWoBVToMpZPrkuelxdObb1d
        j0LayBe7R2Wk+8Vt+dFNH+9VwuTAzyy91g==
X-Google-Smtp-Source: ABdhPJyQLZe8MJSZV274W1EpngvJWRZGGpFMx5ibh+/dMol9BMv5OzBx6K3GoX0Ztni6g4QCAdKUOA==
X-Received: by 2002:a05:6102:2748:: with SMTP id p8mr10802136vsu.13.1636726361928;
        Fri, 12 Nov 2021 06:12:41 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id e13sm4025093vkd.21.2021.11.12.06.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:12:41 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id e10so19143093uab.3;
        Fri, 12 Nov 2021 06:12:41 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr18426788uar.14.1636726361011;
 Fri, 12 Nov 2021 06:12:41 -0800 (PST)
MIME-Version: 1.0
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:12:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmvPgAeS1o8aubaYBihuFrggoVkpT8XtnTZ6nq-VXn9A@mail.gmail.com>
Message-ID: <CAMuHMdWmvPgAeS1o8aubaYBihuFrggoVkpT8XtnTZ6nq-VXn9A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/7] Renesas RZ/G2L IRQC support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Wed, Nov 10, 2021 at 11:58 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
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

IRQ0-IRQ7?

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

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
