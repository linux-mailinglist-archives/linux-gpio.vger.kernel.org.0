Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE4E7C719B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 17:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379429AbjJLPfX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 12 Oct 2023 11:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379172AbjJLPfW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 11:35:22 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988E7C0;
        Thu, 12 Oct 2023 08:35:19 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a7af45084eso14565337b3.0;
        Thu, 12 Oct 2023 08:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697124918; x=1697729718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+TSP/T7PVvWNpk3dtQZ3W2TkgdI1cDdG+n1KxG2WZw=;
        b=O3GXFaEIlO26lJarpADH4vJqcUZIwUA5hK3P86ZeEaixNF5+0qUHBBMh6/5fwPxC7x
         NUgetMG6W7v93rFLz2MmeH0x3CfBuYtTsSuFhl8yxXhP2ZT9oHd7jvlyTItKkBpJoAEW
         wO5TpJPcFVOGf/SgwAyWFsQS4yjgZ9qgRUzTZj/apoaoiaYbpGUc04X2bbAAcYiVE0Sz
         n+AtZLYBAvs9VGqB94ydFvkc71ggEZFY/Nb9/HPvC2wDfSGsgRAhtDjDO089Qt0PZoHN
         MsgVk3XpDuyP/BA3FtbI/j3XmkUZvQ1aVcXZiWTiS1/6Fbu3c5Wehuc/KJbIqYZ6MFNj
         wSfQ==
X-Gm-Message-State: AOJu0YyxUi0ret7cnIhEm0EtLLbwRazRR2MoA41zM284L6tBS6vbSGVF
        Y2dm2DrFgVWM2rM28NFuE4Pjsjmcsho8Vg==
X-Google-Smtp-Source: AGHT+IHK/b4EcU1mjmSzRQR2kbQconHkqz4UxK3+/jFAJ5yji6TSRbaJYUxHJ11rSi9ORBgQZ3vKaA==
X-Received: by 2002:a0d:d78f:0:b0:5a7:b8e6:6441 with SMTP id z137-20020a0dd78f000000b005a7b8e66441mr9306177ywd.16.1697124918491;
        Thu, 12 Oct 2023 08:35:18 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id z189-20020a8165c6000000b00583e52232f1sm31112ywb.112.2023.10.12.08.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 08:35:18 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a7be61fe74so14187067b3.2;
        Thu, 12 Oct 2023 08:35:17 -0700 (PDT)
X-Received: by 2002:a0d:c143:0:b0:59b:2458:f60c with SMTP id
 c64-20020a0dc143000000b0059b2458f60cmr22636855ywd.28.1697124916585; Thu, 12
 Oct 2023 08:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231006121823.229193-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231006121823.229193-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Oct 2023 17:35:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHkhonVmbjVCfc-s1iiUSOBNg9djWxaURNLHoAEaS3+w@mail.gmail.com>
Message-ID: <CAMuHMdWHkhonVmbjVCfc-s1iiUSOBNg9djWxaURNLHoAEaS3+w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Configure interrupt input mode
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Fri, Oct 6, 2023 at 2:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Configure GPIO interrupt as input mode. Also if the bootloader sets
> gpio interrupt pin as function, override it as gpio.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1580,6 +1580,26 @@ static const struct irq_chip rzg2l_gpio_irqchip = {
>         GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>
> +static int rzg2l_gpio_interrupt_input_mode(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
> +       const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
> +       u32 *pin_data = pin_desc->drv_data;
> +       u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
> +       u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
> +       u8 reg8;
> +       int ret;
> +
> +       reg8 = readb(pctrl->base + PMC(off));
> +       if (reg8 & BIT(bit)) {
> +               ret = rzg2l_gpio_request(chip, offset);

Who is taking care of calling pinctrl_gpio_free() when the interrupt
has been freed?

> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return rzg2l_gpio_direction_input(chip, offset);
> +}
> +
>  static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>                                             unsigned int child,
>                                             unsigned int child_type,
> @@ -1589,11 +1609,16 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>         struct rzg2l_pinctrl *pctrl = gpiochip_get_data(gc);
>         unsigned long flags;
>         int gpioint, irq;
> +       int ret;
>
>         gpioint = rzg2l_gpio_get_gpioint(child, pctrl->data);
>         if (gpioint < 0)
>                 return gpioint;
>
> +       ret = rzg2l_gpio_interrupt_input_mode(gc, child);
> +       if (ret)
> +               return ret;
> +
>         spin_lock_irqsave(&pctrl->bitmap_lock, flags);
>         irq = bitmap_find_free_region(pctrl->tint_slot, RZG2L_TINT_MAX_INTERRUPT, get_order(1));
>         spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);

TBH, it's not very clear to me how this is used...
I assume this is called as girq->child_to_parent_hwirq() from
gpiochip_hierarchy_irq_domain_alloc()?
Is that done from request_irq(), or at interrupt controller
initialization time?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
