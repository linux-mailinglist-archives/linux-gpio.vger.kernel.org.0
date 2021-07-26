Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D973D5A48
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 15:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbhGZMov (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 08:44:51 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:35625 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbhGZMou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 08:44:50 -0400
Received: by mail-vk1-f180.google.com with SMTP id i26so2013743vkk.2;
        Mon, 26 Jul 2021 06:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiK1bEfZv0REyFeZQ6eGnheFa6agVqoobWMIj2sCXMM=;
        b=BUAaXbWyaea+TAdXGje71lH1LmPH5lRnbXWr2uJubVt1CLc+2pbroEzCylgLNEkxHh
         ZcJzPqfFBKSY1EXnNvcgkRcf5jDPC15tAq9ibx+QDPQx8UrV3PAFM2r9afDVAaNJuNac
         AYiVCRuf+pE6evMh2S4Rh1scrz830u0IylAYslXt4sGIc8b4Aps+KltoCSjahsK2xxdi
         Vl1L6o9xyxpCaCFzywAaw9uTa5TnClgKO8g6yaooc19ZtXZzeRiCRMwTp/yRlkQLVRy0
         wMVOVLHH3ZeCQO7uvUmKB7Vx3u73x6RoZvty09mw6/88l0Hco01Ax3zWb4DfSd16qizq
         o6hQ==
X-Gm-Message-State: AOAM531Eb7x2OB78IMBwwQ+GoMSORGUDkJ2rYSnYMDl3MndsUsewkqQA
        Ebru/gC0upMiVWkXVzPYaKbJHMeEhySWLyFCuHM=
X-Google-Smtp-Source: ABdhPJwOmNw+NUdyRa6fs6Yd24Srzz7LWuqCJoocbSYcr4aZR7cGIgHsBgXk63yc6Xppks8q98hgWQwqMuuVn+gfchs=
X-Received: by 2002:ac5:cd9b:: with SMTP id i27mr10079261vka.1.1627305918978;
 Mon, 26 Jul 2021 06:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210721191558.22484-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210721191558.22484-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 15:25:07 +0200
Message-ID: <CAMuHMdWD+p7w2_KSsM-sYoZfK-7z4BM7yXAOf+5amxkmq4xvPg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] pinctrl: renesas: Add RZ/G2L pin and gpio
 controller driver
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Wed, Jul 21, 2021 at 9:16 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for pin and gpio controller driver for RZ/G2L SoC.
>
> Based on a patch in the BSP by Hien Huynh <hien.huynh.px@renesas.com>.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> +#define RZG2L_MPXED_PIN_FUNCS          (PIN_CFG_IOLH | \
> +                                        PIN_CFG_SR | \
> +                                        PIN_CFG_PUPD | \
> +                                        PIN_CFG_FILONOFF | \
> +                                        PIN_CFG_FILNUM | \
> +                                        PIN_CFG_FILCLKSEL)
> +
> +#define RZG2L_MPXED_ETH_PIN_FUNCS(x)   ((x) | \
> +                                        PIN_CFG_FILONOFF | \
> +                                        PIN_CFG_FILNUM | \
> +                                        PIN_CFG_FILCLKSEL)

I thought you were going for MULTI? ;-)

> +
> +/*
> + * n indicates number of pins in the port, a is the register index
> + * and f is pin configuration capabilities supported.
> + */
> +#define RZG2L_GPIO_PORT_PACK(n, a, f)  (((n) << 28) | ((a) << 20) | (f))
> +#define RZG2L_GPIO_PORT_GET_PINCNT(x)  (((x) >> 28) & 0x7)
> +#define RZG2L_GPIO_PORT_GET_INDEX(x)   ((((x) & GENMASK(27, 20)) >> 20) & 0x7f)

Actually the "& 0x7f" can be removed, too, if you adjust the mask:

    (((x) & GENMASK(26, 20)) >> 20)

> +#define RZG2L_GPIO_PORT_GET_CFGS(x)    ((x) & GENMASK(19, 0))
> +
> +/*
> + * BIT(31) indicates dedicated pin, p is the register index while
> + * referencing to SR/IEN/IOLH/FILxx registers, b is the register bits
> + * (b * 8) and f is the pin configuration capabilities supported.
> + */
> +#define RZG2L_SINGLE_PIN               BIT(31)
> +#define RZG2L_SINGLE_PIN_PACK(p, b, f) (RZG2L_SINGLE_PIN | \
> +                                        ((p) << 24) | ((b) << 20) | (f))
> +#define RZG2L_SINGLE_PIN_GET_PORT(x)   (((x) >> 24) & 0x7f)
> +#define RZG2L_SINGLE_PIN_GET_BIT(x)    ((((x) & GENMASK(23, 20)) >> 20) & 0x7)

Likewise:

    (((x) & GENMASK(22, 20)) >> 20)

> +#define RZG2L_SINGLE_PIN_GET_CFGS(x)   ((x) & GENMASK(19, 0))

> +       struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +       struct function_desc *func;
> +       unsigned int i, *psel_val;
> +       struct group_desc *group;
> +       unsigned long data;
> +       int *pins;
> +
> +       func = pinmux_generic_get_function(pctldev, func_selector);
> +       if (!func)
> +               return -EINVAL;
> +       group = pinctrl_generic_get_group(pctldev, group_selector);
> +       if (!group)
> +               return -EINVAL;
> +
> +       psel_val = func->data;
> +       pins = group->pins;
> +       data = (unsigned long)group->data;

Lkp reports data is unused.
Which matches with passing NULL as the last parameter of
pinctrl_generic_add_group().

> +
> +       for (i = 0; i < group->num_pins; i++) {
> +               dev_dbg(pctrl->dev, "port:%u pin: %u PSEL:%u\n",
> +                       RZG2L_PIN_ID_TO_PORT(pins[i]), RZG2L_PIN_ID_TO_PIN(pins[i]),
> +                       psel_val[i]);
> +               rzg2l_pinctrl_set_pfc_mode(pctrl, RZG2L_PIN_ID_TO_PORT(pins[i]),
> +                                          RZG2L_PIN_ID_TO_PIN(pins[i]), psel_val[i]);
> +       }
> +
> +       return 0;
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
