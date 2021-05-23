Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D67C38DD55
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 23:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhEWVoF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 17:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbhEWVoE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 May 2021 17:44:04 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A88C061756
        for <linux-gpio@vger.kernel.org>; Sun, 23 May 2021 14:42:37 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa] (unknown [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id BAEF9202A12;
        Sun, 23 May 2021 23:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621806156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aDvbepKOHmQ4oKKtd37YsHrWXOB6koq5xikaO4ZN6I4=;
        b=sNlPe1gPCSXiH18mrpM4ZhE3daoJ3IEwkq+eGKBNHWvZnFYgKoGeSTlhAa33nWDEMRGqW7
        T7GwjiPkQEKlXtJKz32lF9fjtr5o2I4e5FbxZqREC0SXi/VUGu8wsvLUHW4brn1M/aRsb1
        99qpKWdDWL4c907AIEPw8ziF4cuLV8iJX/qE+cMGLTJUHllXwmED2ZnbJnNR0Bl6ScwxP/
        2F2U4aPp3b0bdjRp95emeR/NSq/IFSoSw3l3PlPgpNtyku6EI/YeAFW2LDNsHB7Pdlwi8P
        TtViKH74G8RPABeyzH1ei3TCY5uvJcBYN0D9z4AFxrOAjFuhB3kdy7j3lGh+bg==
Message-ID: <19144bf02d8678af521986e0e768193fb9084e6d.camel@svanheule.net>
Subject: Re: [PATCH v2 6/7] pinctrl: Add RTL8231 pin control and GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Sun, 23 May 2021 23:42:34 +0200
In-Reply-To: <CAHp75Vf0Qo-hBUAOwhxGiH6azFg0OPV8OkUSfTxWet__MBF9yA@mail.gmail.com>
References: <cover.1621279162.git.sander@svanheule.net>
         <041077d195f1cc81bf6363388cb4adfb06cff4ef.1621279162.git.sander@svanheule.net>
         <CAHp75Vf0Qo-hBUAOwhxGiH6azFg0OPV8OkUSfTxWet__MBF9yA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Tue, 2021-05-18 at 00:42 +0300, Andy Shevchenko wrote:
> On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
> > 
> > This driver implements the GPIO and pin muxing features provided by the
> > RTL8231. The device should be instantiated as an MFD child, where the
> > parent device has already configured the regmap used for register
> > access.
> > 
> > Although described in the bindings, pin debouncing and drive strength
> > selection are currently not implemented. Debouncing is only available
> > for the six highest GPIOs, and must be emulated when other pins are used
> > for (button) inputs anyway.
> 
> ...
> 
> > +struct rtl8231_pin_desc {
> > +       unsigned int number;
> > +       const char *name;
> > +       enum rtl8231_pin_function functions;
> > +       u8 reg;
> > +       u8 offset;
> > +       u8 gpio_function_value;
> > +};
> 
> I would see rather
> 
> sturct pinctrl_pin_desc desc;
> 
> Where drv_data describes the rest of the data for pin
> 

I've split up the definitions into two parts:
 * pinctrl_pin_desc with the standard info, which has drv_data pointing to...
 * a device-specific rtl8231_pin_desc, with the register field info and
   alternate function

So the pin descriptions are now entirely static, and only the pin functions are
assembled at runtime.

> 
> > +static int rtl8231_get_group_pins(struct pinctrl_dev *pctldev, unsigned int
> > selector,
> > +       const unsigned int **pins, unsigned int *num_pins)
> > +{
> 
> > +       if (selector < ARRAY_SIZE(rtl8231_pins)) {
> 
> Can we use traditional pattern, i.e.
> 
>   if (... >= ARRAY_SIZE(...))
>     return -EINVAL;
> 
>   ...
>   return 0;
> 
> ?

Sure. Will be implemented in v3.

> 
> > +               *pins = &rtl8231_pins[selector].number;
> > +               *num_pins = 1;
> > +               return 0;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> 
> ...
> 
> > +static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int
> > func_selector,
> > +       unsigned int group_selector)
> > +{
> 
> > +       int err = 0;
> 
> Redundant variable.
> 
> > +       switch (func_flag) {
> > +       case RTL8231_PIN_FUNCTION_LED:
> > +       case RTL8231_PIN_FUNCTION_PWM:
> > +               err = regmap_update_bits(ctrl->map, desc->reg,
> > function_mask, ~gpio_function);
> > +               break;
> > +       case RTL8231_PIN_FUNCTION_GPIO:
> > +               err = regmap_update_bits(ctrl->map, desc->reg,
> > function_mask, gpio_function);
> > +               break;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       return err;
> > +}
> 

I've reworked this whole section a bit. since a pin is either (only) GPIO, or
some alternative function, this could be done with a simpler if/else.

> 
> > +static const struct pinmux_ops rtl8231_pinmux_ops = {
> > +       .set_mux = rtl8231_set_mux,
> > +       .get_functions_count = rtl8231_get_functions_count,
> > +       .get_function_name = rtl8231_get_function_name,
> > +       .get_function_groups = rtl8231_get_function_groups,
> > +       .gpio_request_enable = rtl8231_gpio_request_enable,
> 
> > +       .strict = true
> 
> Leave comma for non-terminator entries.
> 
> > +};
> > +
> > +
> 
> One blank line is enough.
> 
> ...
> 
> > +static int rtl8231_pinctrl_init_functions(struct device *dev, struct
> > rtl8231_pin_ctrl *ctrl)
> > +{
> > +       struct rtl8231_function *function;
> > +       const char **group_name;
> > +       unsigned int f_idx;
> > +       unsigned int pin;
> > +
> > +       ctrl->nfunctions = ARRAY_SIZE(rtl8231_pin_function_names);
> > +       ctrl->functions = devm_kcalloc(dev, ctrl->nfunctions, sizeof(*ctrl-
> > >functions), GFP_KERNEL);
> > +       if (IS_ERR(ctrl->functions)) {
> 
> Wrong.

I was somehow thinking that this would either return an error value or a valid
point. Don't know where I got that, but should be fixed here and for the other
kallocs.

Best,
Sander


