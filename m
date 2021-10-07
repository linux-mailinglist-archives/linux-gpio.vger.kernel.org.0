Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8B3425950
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 19:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241663AbhJGRZi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 13:25:38 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:43982 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235301AbhJGRZi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 13:25:38 -0400
Received: by mail-vs1-f49.google.com with SMTP id p2so7543326vst.10;
        Thu, 07 Oct 2021 10:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V+O/Tzkp10P1T+2/uoWEpVc+uysV2odcVKV4KvQ215U=;
        b=mUQyB0CmULvhRojj4nHZ+DkXDyV6mZVwVT+UxOlHCanmvS0wFj72FbNuB9C+86vzX6
         oLEnJZDmg7Eizykec56R5J7iWxhA1y8shCeAx1GrbpfxdESVVpcXDgRTEEmUljdJl1HQ
         iQ9al3xQCmloX2srfuB0WTs/ft7lrinHQwZf289W/W8VpY7WRJ5b96J8qzwcOCNDiiuO
         Zu68P/FtRBIXNZYreZAK2f6BjohwEZlV7eHhS2WGuAwxpS06eEe5cHVXsZa5htuJo3Wy
         g2VV0ohxotVqvdA0HHcq7y7qqV+EBXVXm/La7sgkh94/nN/v0dGF2llyuSH2N/JkWMZ9
         Eucg==
X-Gm-Message-State: AOAM530jm7n/LFWa4C+lCHeq2rNoJcdt1cB36hz4X77oemp3RjPAHiTn
        l18OCVME3I/CYjG3AGAr6lrzMfxTvcXnJX3ba5g=
X-Google-Smtp-Source: ABdhPJy4V/GXmg0AB22mdAwPWs3SRDpQ98AGJjXgLUnixh5p7JM+hRNLqYF8eYaypEWmH3xNHiXW9XwGfcfP15BVtaQ=
X-Received: by 2002:a67:d583:: with SMTP id m3mr5601152vsj.41.1633627423685;
 Thu, 07 Oct 2021 10:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210930121630.17449-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210930121630.17449-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Oct 2021 19:23:31 +0200
Message-ID: <CAMuHMdXHv7H3xxEYFLhfBf+Pun-w=F4k5S2RAYJY6qz75QpxhQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set drive-strength and output-impedance
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

On Thu, Sep 30, 2021 at 2:17 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support to get/set drive-strength and output-impedance of the pins.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -47,6 +47,7 @@
>  #define PIN_CFG_FILONOFF               BIT(9)
>  #define PIN_CFG_FILNUM                 BIT(10)
>  #define PIN_CFG_FILCLKSEL              BIT(11)
> +#define PIN_CFG_GROUP_B                        BIT(12)

Perhaps it would be easier to have separate PIN_CFG_IOLH_A and
PIN_CFG_IOLH_B flags, instead of a PIN_CFG_IOLH flag and a
PIN_CFG_GROUP_B modifier flag?

>
>  #define RZG2L_MPXED_PIN_FUNCS          (PIN_CFG_IOLH | \
>                                          PIN_CFG_SR | \

> @@ -484,6 +513,38 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>                 break;
>         }
>
> +       case PIN_CONFIG_OUTPUT_IMPEDANCE:
> +       case PIN_CONFIG_DRIVE_STRENGTH: {
> +               unsigned int mA[4] = { 2, 4, 8, 12 };
> +               unsigned int oi[4] = { 100, 66, 50, 33 };

static const

> +
> +               if (param == PIN_CONFIG_DRIVE_STRENGTH) {
> +                       if (!(cfg & PIN_CFG_IOLH) || groupb_pin)
> +                               return -EINVAL;
> +               } else {
> +                       if (!(cfg & PIN_CFG_IOLH) || !groupb_pin)
> +                               return -EINVAL;
> +               }
> +
> +               spin_lock_irqsave(&pctrl->lock, flags);
> +
> +               /* handle _L/_H for 32-bit register read/write */
> +               addr = pctrl->base + IOLH(port);
> +               if (bit >= 4) {
> +                       bit -= 4;
> +                       addr += 4;
> +               }
> +
> +               reg = readl(addr) & (IOLH_MASK << (bit * 8));
> +               reg = reg >> (bit * 8);
> +               if (param == PIN_CONFIG_DRIVE_STRENGTH)
> +                       arg = mA[reg];
> +               else
> +                       arg = oi[reg];
> +               spin_unlock_irqrestore(&pctrl->lock, flags);

I think you've reached the point where it starts to make sense to
have helper functions to read and modify these sub-register fields
that may be located into the current or next register.

And after that, you can split it in two smaller separate cases for
drive strength and output impedance.

> +               break;
> +       }
> +
>         default:
>                 return -ENOTSUPP;
>         }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
