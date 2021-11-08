Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A084449860
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 16:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240902AbhKHPft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 10:35:49 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:36469 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240901AbhKHPfs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 10:35:48 -0500
Received: by mail-ua1-f43.google.com with SMTP id e10so32293872uab.3;
        Mon, 08 Nov 2021 07:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VTpS+ObghtKC7xPz2lM+kE7ggidy/4BWxc00rHslQ+I=;
        b=gWwy3gFh+So5NTeMQbTFasFlGyAMFg3woiC4uHfFmZ1nEU/uoJbDRUVmfKEoa6oNmP
         /u1B6TmIzeVoOcNS+72nIstkegvCluQh/Vblg9MLaTMjmyLIpML41uQH9qHAkMwmFaLE
         MmXiWqH19PqVOEkgUswJ7BQZxRA82po/Zf/AT7YBnWbxFw0X01opUmY9usB5pfgW5luH
         jCX/jiRICGJ9RORTYLxIqbdnL8iTU/rRCoV/YAqpoVJTxRsBpRvFvFtNdp+HKQzlDGst
         FCu3knoYfa76Z94RS+aq9TpHaXRaDl1tWPQpHciSy8Dc0GyFgD343wlDe3ZV+rXJFrKk
         bDDA==
X-Gm-Message-State: AOAM530snvjGsxjnXo0uXdWzoH/IlmwbMerAU0LKKN3V/4YCCP0EKlBJ
        qiVpTkg2An+9ONDntLJ4oIOhqq773tRDWgIQ
X-Google-Smtp-Source: ABdhPJwgqcClZIE5WX2DMIrzxhX7mr0L1NhN3UETWudQ1nHbOI4rRKvQA2RwQHtal+VzbAB+tLJYCQ==
X-Received: by 2002:a67:c11c:: with SMTP id d28mr979832vsj.54.1636385583483;
        Mon, 08 Nov 2021 07:33:03 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id v13sm3486260vsi.0.2021.11.08.07.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 07:33:03 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id e2so32227583uax.7;
        Mon, 08 Nov 2021 07:33:03 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr39514390vsb.9.1636385582860;
 Mon, 08 Nov 2021 07:33:02 -0800 (PST)
MIME-Version: 1.0
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211029124437.20721-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211029124437.20721-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 16:32:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUG4A26kBP_8fbraYxVOhtR5GZuwZyO8z6X5a8K6hmmYg@mail.gmail.com>
Message-ID: <CAMuHMdUG4A26kBP_8fbraYxVOhtR5GZuwZyO8z6X5a8K6hmmYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: renesas: pinctrl-rzg2l: Add helper
 functions to read/write pin config
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Fri, Oct 29, 2021 at 2:44 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add helper functions to read/read modify write pin config.
>
> Switch to use helper functions for pins supporting PIN_CONFIG_INPUT_ENABLE
> capabilities.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -91,6 +91,8 @@
>  #define SD_CH(n)               (0x3000 + (n) * 4)
>  #define QSPI                   (0x3008)
>
> +#define PORT_PIN_CFG_OFFSET    0x80

This definition belongs in [PATCH v2 5/5].

> +
>  #define PVDD_1800              1       /* I/O domain voltage <= 1.8V */
>  #define PVDD_3300              0       /* I/O domain voltage >= 3.3V */
>
> @@ -424,6 +426,52 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
>         return ret;
>  }
>
> +static u32 rzg2l_read_pin_config(struct rzg2l_pinctrl *pctrl, bool port_pin,
> +                                u32 offset, u8 bit, u32 mask)
> +{
> +       void __iomem *addr = pctrl->base + offset;
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (port_pin)
> +               addr += PORT_PIN_CFG_OFFSET;

I'm wondering if it would be better to handle this in the caller,
by passing an adjusted offset?
Same for rzg2l_rmw_pin_config().

> +
> +       /* handle _L/_H for 32-bit register read/write */
> +       if (bit >= 4) {
> +               bit -= 4;
> +               addr += 4;
> +       }
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       reg = readl(addr) & (mask << (bit * 8));

The masking is not needed here, as it is done below.

> +       spin_unlock_irqrestore(&pctrl->lock, flags);

I still think you don't need that spinlock here, as reading a MMIO
register is an atomic operation.

(/me fixes drivers/pinctrl/renesas/pinctrl.c you referred to before)

> +       reg = (reg >> (bit * 8)) & mask;
> +
> +       return reg;

return (reg >> (bit * 8)) & mask;

> +}

> @@ -432,10 +480,11 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>         enum pin_config_param param = pinconf_to_config_param(*config);
>         const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
>         unsigned int *pin_data = pin->drv_data;
> +       bool port_pin = false;

Do you really need this?

>         unsigned int arg = 0;
>         unsigned long flags;
>         void __iomem *addr;
> -       u32 port = 0, reg;
> +       u32 port = 0;
>         u32 cfg = 0;
>         u8 bit = 0;
>
> @@ -452,17 +501,8 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>         case PIN_CONFIG_INPUT_ENABLE:
>                 if (!(cfg & PIN_CFG_IEN))
>                         return -EINVAL;
> -               spin_lock_irqsave(&pctrl->lock, flags);
> -               /* handle _L/_H for 32-bit register read/write */
> -               addr = pctrl->base + IEN(port);
> -               if (bit >= 4) {
> -                       bit -= 4;
> -                       addr += 4;
> -               }
>
> -               reg = readl(addr) & (IEN_MASK << (bit * 8));
> -               arg = (reg >> (bit * 8)) & 0x1;
> -               spin_unlock_irqrestore(&pctrl->lock, flags);
> +               arg = rzg2l_read_pin_config(pctrl, port_pin, IEN(port), bit, IEN_MASK);

port_pin is always false here, as PIN_CFG_IEN is only ever set for
dedicated pins.

Same comments for rzg2l_pinctrl_pinconf_set().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
