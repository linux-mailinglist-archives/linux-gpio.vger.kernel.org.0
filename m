Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AECC5AB863
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 20:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiIBSio (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 14:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiIBSin (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 14:38:43 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC6AC4836
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 11:38:40 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id ay12so1720070wmb.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 11:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KRBpWIIOAMoQv9wtE6dulvyX3AYtHX5SB44uGSNhJyI=;
        b=Px7jAILUCAFlfGuvs+hykUNWhfQLqfQSUuOdzD7e+bG+6NdMsVnUUGC+bpXDi4zUR6
         /ruHz+ECkBoOkZLWE0OkV6vhABX15JzKlivqXKsjk4BQgAkfc5lqPAOIIBeKUnrbbDn9
         rBlT53UdDv0gsGf369G1oPYwFAdyypi53SeD0dB50CVHA7xbQlYzDhU/IPHcbHeetKNB
         VmsL4aI2MSxg8LV+3V98dKA/dWbmU7H8hjO8Q3Pmpc21fQ+TcrCZQYTeo7XzRmYKrOzn
         ed01x8iMxcxiNJ+vkzPX813B6m7RgeKzGRQDpyk9aR8DGtmBgUN+vlnfLLjmlmYCH7Ki
         x/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KRBpWIIOAMoQv9wtE6dulvyX3AYtHX5SB44uGSNhJyI=;
        b=PSwjEEhMVR/U8B4VU7LffzCFaDH8AbpDCc3u57oH4S1RYcc5+mzRTRiiXxRFjxnRTT
         5SBLFr6TB44m0YndNdg+arkrB1vD4uVhchxdk0dCkIz0vX5/u5VI4hOu4/fTkQYmaijv
         mgMke9kGzAUqTclUKGvSB7mbtZeIdcDN/ffIgx1mHF6WtKJ0ZS9mC5IP8Zbhah6Yohwe
         soKkLh0k6PYOrXZDR0MndZ13T3yKXrgGZNdvPVDRY/FUanR3FX8IfAGZoOCSn7iAYyxk
         9cTsxkEV+muw3/sVJ2sZ/daXgvfa84oNnOFx9TfDg75SaPOrxyNuni3hRu0xl8UPbDWf
         2QWg==
X-Gm-Message-State: ACgBeo0avvjxyqf2fxQOTL80eJRd0hXaSXU8Oh20byJnPQ+o9yTngk/v
        EGl4WNdMfSnnWeCyCvE4a5hzUuHcyRw7wCVx6jlBPRPckD6Bjw==
X-Google-Smtp-Source: AA6agR5ibS0Npyh4KJH1Y192QaepP43nEKu0nHfQZ7E5Gxxc4EZESN2CfSoGKIHcfXf5k5ctWD/qpukL26mROVqx188=
X-Received: by 2002:a05:600c:5114:b0:3a5:cb1f:6bf3 with SMTP id
 o20-20020a05600c511400b003a5cb1f6bf3mr3824753wms.65.1662143918730; Fri, 02
 Sep 2022 11:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220901012944.2634398-1-jay.xu@rock-chips.com> <20220901012944.2634398-3-jay.xu@rock-chips.com>
In-Reply-To: <20220901012944.2634398-3-jay.xu@rock-chips.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Fri, 2 Sep 2022 14:38:27 -0400
Message-ID: <CAMdYzYrJWnkYneEuJ+dA0EU1QiTkBOkGz1+zn=H5rA-qfS88+Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: rockchip: make gpio work without cru module
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 31, 2022 at 9:30 PM Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> In some case the system may has no builtin cru module, the gpio driver
> will fail to get periph clock and debounce clock.
>
> On rockchip SoCs, the pclk and dbg clk are default to be enabled and
> ungated, the gpio possible to work without cru module.
>
> This patch makes gpio work fine without cru module.

What happens if the cru probes later and these clocks become available
but aren't claimed so clk_disable_unused shuts them down?

>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  drivers/gpio/gpio-rockchip.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index a4c4e4584f5b..1da0324445cc 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -195,6 +195,9 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
>         unsigned int cur_div_reg;
>         u64 div;
>
> +       if (!bank->db_clk)
> +               return -ENOENT;
> +
>         if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
>                 div_debounce_support = true;
>                 freq = clk_get_rate(bank->db_clk);
> @@ -654,8 +657,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>                 return -EINVAL;
>
>         bank->clk = of_clk_get(bank->of_node, 0);
> -       if (IS_ERR(bank->clk))
> -               return PTR_ERR(bank->clk);
> +       if (IS_ERR(bank->clk)) {
> +               bank->clk = NULL;
> +               dev_warn(bank->dev, "works without clk pm\n");
> +       }
>
>         clk_prepare_enable(bank->clk);
>         id = readl(bank->reg_base + gpio_regs_v2.version_id);
> @@ -666,9 +671,8 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>                 bank->gpio_type = GPIO_TYPE_V2;
>                 bank->db_clk = of_clk_get(bank->of_node, 1);
>                 if (IS_ERR(bank->db_clk)) {
> -                       dev_err(bank->dev, "cannot find debounce clk\n");
> -                       clk_disable_unprepare(bank->clk);
> -                       return -EINVAL;
> +                       bank->db_clk = NULL;
> +                       dev_warn(bank->dev, "works without debounce clk pm\n");
>                 }
>         } else {
>                 bank->gpio_regs = &gpio_regs_v1;
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
