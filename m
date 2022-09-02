Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4DA45AB9DA
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 23:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbiIBVKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 17:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiIBVKC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 17:10:02 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5024F50720
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 14:09:57 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oUDvE-0006Uo-0g; Fri, 02 Sep 2022 23:09:52 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v1 1/3] gpio: rockchip: make gpio work without cru module
Date:   Fri, 02 Sep 2022 23:09:51 +0200
Message-ID: <4679451.ZaRXLXkqSa@diego>
In-Reply-To: <CAMdYzYrJWnkYneEuJ+dA0EU1QiTkBOkGz1+zn=H5rA-qfS88+Q@mail.gmail.com>
References: <20220901012944.2634398-1-jay.xu@rock-chips.com> <20220901012944.2634398-3-jay.xu@rock-chips.com> <CAMdYzYrJWnkYneEuJ+dA0EU1QiTkBOkGz1+zn=H5rA-qfS88+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Freitag, 2. September 2022, 20:38:27 CEST schrieb Peter Geis:
> On Wed, Aug 31, 2022 at 9:30 PM Jianqun Xu <jay.xu@rock-chips.com> wrote:
> >
> > In some case the system may has no builtin cru module, the gpio driver
> > will fail to get periph clock and debounce clock.
> >
> > On rockchip SoCs, the pclk and dbg clk are default to be enabled and
> > ungated, the gpio possible to work without cru module.
> >
> > This patch makes gpio work fine without cru module.
> 
> What happens if the cru probes later and these clocks become available
> but aren't claimed so clk_disable_unused shuts them down?

Also the clock controller for the soc is such a basic component, who
in their right mind would build a kernel without it and expect anything
to work.

My guess is that is simply hacking around that Android thingy with their
common kernel but vendors being allowed to move all the "special" code
to modules. We had this untested cru-module in mainline for a while
before people found out that the module part seemingly never was
tested ;-) .

The gpio driver is of course dependent on its clock supply, so hacking
around that seems really like a very bad idea.


Heiko



> 
> >
> > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> > ---
> >  drivers/gpio/gpio-rockchip.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> > index a4c4e4584f5b..1da0324445cc 100644
> > --- a/drivers/gpio/gpio-rockchip.c
> > +++ b/drivers/gpio/gpio-rockchip.c
> > @@ -195,6 +195,9 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
> >         unsigned int cur_div_reg;
> >         u64 div;
> >
> > +       if (!bank->db_clk)
> > +               return -ENOENT;
> > +
> >         if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
> >                 div_debounce_support = true;
> >                 freq = clk_get_rate(bank->db_clk);
> > @@ -654,8 +657,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
> >                 return -EINVAL;
> >
> >         bank->clk = of_clk_get(bank->of_node, 0);
> > -       if (IS_ERR(bank->clk))
> > -               return PTR_ERR(bank->clk);
> > +       if (IS_ERR(bank->clk)) {
> > +               bank->clk = NULL;
> > +               dev_warn(bank->dev, "works without clk pm\n");
> > +       }
> >
> >         clk_prepare_enable(bank->clk);
> >         id = readl(bank->reg_base + gpio_regs_v2.version_id);
> > @@ -666,9 +671,8 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
> >                 bank->gpio_type = GPIO_TYPE_V2;
> >                 bank->db_clk = of_clk_get(bank->of_node, 1);
> >                 if (IS_ERR(bank->db_clk)) {
> > -                       dev_err(bank->dev, "cannot find debounce clk\n");
> > -                       clk_disable_unprepare(bank->clk);
> > -                       return -EINVAL;
> > +                       bank->db_clk = NULL;
> > +                       dev_warn(bank->dev, "works without debounce clk pm\n");
> >                 }
> >         } else {
> >                 bank->gpio_regs = &gpio_regs_v1;
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 




