Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8003943DC84
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 09:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhJ1H7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 03:59:02 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:40606 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1H7B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 03:59:01 -0400
Received: by mail-ua1-f42.google.com with SMTP id e2so9887569uax.7;
        Thu, 28 Oct 2021 00:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A0/s1eOk1wef1JTYqbKcsjnrUvxYbUzwinErC1kCUnk=;
        b=Tuy+KcpIQ2Le/y+aooLSh8nVcFUFa93bBJDUFrxx/5JxeSBwSmQqtcwxuLIfx5vgO2
         0Z3UQHTU/o+Vbit/oSTUV9/ZX6b0EPJn/z7JfTrHq/V9e8J/1NENeXKe1tYNW+1mZGnT
         QeULPWPGhmrD8b7T/UDl9SNuFaqEQJWmvD0KphAsjBHxuU14nYgAvkekFL6o/ch3Dq17
         qShG4ODJXmQ5oFMsZQYakAP3jKyqKw43LqozbDuEb5CZacVOFof4TlBMCjidJg9V2kzk
         ok/0QgfEd1W8jwsSFXxBlg5KOu3s7WAK9Pgx9iQht/Jr0rNFGbTMgM/ouZC8pjHwnool
         aSPA==
X-Gm-Message-State: AOAM533djQIHQD06iRUI2Rv6wY7iexYkJhRoYCBXlnmYySRoHdhTM/sr
        /xMcXV8pL9mOAYt+ls4gTwx0LS1Wwh6vZg==
X-Google-Smtp-Source: ABdhPJwOICbnfcaVbrLKMKi7dFAxsRrNEJp8XStRmzYEIUsl5oLp0WxUm9urGj1es28BJJC5AAEUPQ==
X-Received: by 2002:a67:b202:: with SMTP id b2mr2691833vsf.33.1635407794074;
        Thu, 28 Oct 2021 00:56:34 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id d22sm355058uan.15.2021.10.28.00.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 00:56:33 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id f4so9924036uad.4;
        Thu, 28 Oct 2021 00:56:33 -0700 (PDT)
X-Received: by 2002:a9f:2584:: with SMTP id 4mr2722380uaf.114.1635407793316;
 Thu, 28 Oct 2021 00:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211027134509.5036-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211027134509.5036-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Oct 2021 09:56:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX81X+1AHp4Dsp70kG1TaYj=x3T8j3xidfLuskjd1Vc6g@mail.gmail.com>
Message-ID: <CAMuHMdX81X+1AHp4Dsp70kG1TaYj=x3T8j3xidfLuskjd1Vc6g@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set drive-strength and output-impedance-ohms
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Wed, Oct 27, 2021 at 3:45 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support to get/set drive-strength and output-impedance-ohms
> for the supported pins.
>
> While at it also renamed the below macros to match the HW manual,
> PIN_CFG_IOLH_SD0 -> PIN_CFG_IO_VMC_SD0
> PIN_CFG_IOLH_SD1 -> PIN_CFG_IO_VMC_SD1
> PIN_CFG_IOLH_QSPI -> PIN_CFG_IO_VMC_QSPI
> PIN_CFG_IOLH_ETH0 -> PIN_CFG_IO_VMC_ETH0
> PIN_CFG_IOLH_ETH1 -> PIN_CFG_IO_VMC_ETH1
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for the update!

> ---
> RFC->v1
>  * Renamed macros to match HW manual

You may want to split that off into a separate patch, as not all lines
changed are touched for other reasons.
BTW, where do I find these "VMC" names in the HW manual?

>  * Added PIN_CFG_IOLH_A/B macros to differentiate Group A/B
>  * Added helper function to read/rmw pin config
>  * Included RB tags

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> +static u32 rzg2l_read_pin_config(void __iomem *addr,
> +                                u8 bit, u32 mask)

The above fits on a single line.

> +{
> +       void __iomem *addr_adjust = addr;
> +       u8 bit_adjust = bit;

No need for these, just operate on addr and bit directly.

> +       u32 reg;
> +
> +       if (bit >= 4) {
> +               bit_adjust -= 4;
> +               addr_adjust += 4;
> +       }
> +
> +       reg = readl(addr_adjust) & (mask << (bit_adjust * 8));
> +       return (reg >> (bit_adjust * 8));
> +}
> +
> +static void rzg2l_rmw_pin_config(void __iomem *addr,
> +                                u8 bit, u32 mask, u32 val)
> +{

The above fits on a single line.

> +       void __iomem *addr_adjust = addr;
> +       u8 bit_adjust = bit;

No need for these, just operate on addr and bit directly.

> +       u32 reg;
> +
> +       if (bit >= 4) {
> +               bit_adjust -= 4;
> +               addr_adjust += 4;
> +       }
> +
> +       reg = readl(addr_adjust) & ~(mask << (bit_adjust * 8));
> +
> +       writel(reg | val, addr_adjust);

I think you should handle "val << (bit * 8)" here, instead of in
all callers.

> +}

Please split the introduction of these helpers (and add conversion
of the existing PIN_CONFIG_INPUT_ENABLE handling) off into a separate
patch.

> @@ -484,6 +544,34 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>                 break;
>         }
>
> +       case PIN_CONFIG_DRIVE_STRENGTH: {
> +               static const unsigned int mA[4] = { 2, 4, 8, 12 };
> +
> +               if (!(cfg & PIN_CFG_IOLH_A))
> +                       return -EINVAL;
> +
> +               spin_lock_irqsave(&pctrl->lock, flags);
> +               addr = pctrl->base + IOLH(port);
> +               reg = rzg2l_read_pin_config(addr, bit, IOLH_MASK);
> +               arg = mA[reg];
> +               spin_unlock_irqrestore(&pctrl->lock, flags);

Do you need the spinlock for reading?

> +               break;
> +       }
> +
> +       case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
> +               static const unsigned int oi[4] = { 100, 66, 50, 33 };
> +
> +               if (!(cfg & PIN_CFG_IOLH_B))
> +                       return -EINVAL;
> +
> +               spin_lock_irqsave(&pctrl->lock, flags);
> +               addr = pctrl->base + IOLH(port);
> +               reg = rzg2l_read_pin_config(addr, bit, IOLH_MASK);
> +               arg = oi[reg];
> +               spin_unlock_irqrestore(&pctrl->lock, flags);

Likewise.

> +               break;
> +       }
> +
>         default:
>                 return -ENOTSUPP;
>         }

> @@ -564,6 +659,49 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>                         spin_unlock_irqrestore(&pctrl->lock, flags);
>                         break;
>                 }
> +
> +               case PIN_CONFIG_DRIVE_STRENGTH: {
> +                       unsigned int arg = pinconf_to_config_argument(_configs[i]);
> +                       static const unsigned int mA[4] = { 2, 4, 8, 12 };

Duplicate, move to file scope?

> +
> +                       if (!(cfg & PIN_CFG_IOLH_A))
> +                               return -EINVAL;
> +
> +                       for (i = 0; i < ARRAY_SIZE(mA); i++) {
> +                               if (arg == mA[i])
> +                                       break;
> +                       }
> +                       if (i >= ARRAY_SIZE(mA))
> +                               return -EINVAL;
> +
> +                       spin_lock_irqsave(&pctrl->lock, flags);
> +                       addr = pctrl->base + IOLH(port);
> +                       rzg2l_rmw_pin_config(addr, bit, IOLH_MASK, (i << (bit * 8)));

Pass pctrl and offset instead of addr (also for rzg2l_read_pin_config,
for symmetry), and move locking into rzg2l_rmw_pin_config()?
Taking all of the above into account, that would become:

    rzg2l_rmw_pin_config(pctrl, IOLH(port), bit, IOLH_MASK, i);

> +                       spin_unlock_irqrestore(&pctrl->lock, flags);
> +                       break;
> +               }
> +
> +               case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
> +                       unsigned int arg = pinconf_to_config_argument(_configs[i]);
> +                       static const unsigned int oi[4] = { 100, 66, 50, 33 };

Duplicate, move to file scope?

> +
> +                       if (!(cfg & PIN_CFG_IOLH_B))
> +                               return -EINVAL;
> +
> +                       for (i = 0; i < ARRAY_SIZE(oi); i++) {
> +                               if (arg == oi[i])
> +                                       break;
> +                       }
> +                       if (i >= ARRAY_SIZE(oi))
> +                               return -EINVAL;
> +
> +                       spin_lock_irqsave(&pctrl->lock, flags);
> +                       addr = pctrl->base + IOLH(port);
> +                       rzg2l_rmw_pin_config(addr, bit, IOLH_MASK, (i << (bit * 8)));

Likewise.

> +                       spin_unlock_irqrestore(&pctrl->lock, flags);
> +                       break;
> +               }
> +
>                 default:
>                         return -EOPNOTSUPP;
>                 }

The rest looks good to me!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
