Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6921E38E592
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 13:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhEXLlW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 07:41:22 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:58916 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbhEXLlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 07:41:22 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id E0261202EDD;
        Mon, 24 May 2021 13:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621856393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7+B8GdQAs4oyqK1MAbIGvZk1NbXijw4wcunSSd+48H8=;
        b=AQ9sAduqgUSi6D8fBVH4qndrAYsffZ9x+fCMEtYWJ57LILb9alVK7gKxvc+4PLrm3m/2A5
        MFxJA7NcEAQphnTYLCchsjbPwxkNTor3LWc8cvfjD1Y21Cj/no4QuEcS9KmhwHjq/Gn5hT
        4v5DaN1iBn0t+gRHStAN7cOSuc5F6uAHY8sH+GGVpS7PYn4OPd2X47oS6uPk5zprJ12Mix
        m0Tbd+rD2pdhzg7t0XXLsxIVbxnwCsup69M4rmhko9nTavpCProaGribdM8jfQ52xnPn/C
        HZ8s10bRi9ToaWUttViczit8MNomZ7IhR61miRJyq8sPkBGiyLAMIKwSo8eZDQ==
Message-ID: <eb443daba3d04d761c00a631cdd0ee6d6b05b271.camel@svanheule.net>
Subject: Re: [PATCH v3 5/6] pinctrl: Add RTL8231 pin control and GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org
Date:   Mon, 24 May 2021 13:39:51 +0200
In-Reply-To: <CAHp75VceQ_Wiaf8zFN+f4uk6nv=ZmhE_rGgbEcB1hYh2Kz5VyA@mail.gmail.com>
References: <cover.1621809029.git.sander@svanheule.net>
         <185e8c61893502575c542750c8f27b09029e3078.1621809029.git.sander@svanheule.net>
         <CAHp75VfCCFd9SQwqv-JhdHMudYWdaa1tcVp4ZNescioWTaoXFQ@mail.gmail.com>
         <CAHp75VceQ_Wiaf8zFN+f4uk6nv=ZmhE_rGgbEcB1hYh2Kz5VyA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-05-24 at 14:32 +0300, Andy Shevchenko wrote:
> Oops, I had sent this privately, Cc'ing to ML.

I'll repeat my replies here then.

> 
> On Mon, May 24, 2021 at 12:08 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > 
> > On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net> wrote:
> > > 
> > > This driver implements the GPIO and pin muxing features provided by the
> > > RTL8231. The device should be instantiated as an MFD child, where the
> > > parent device has already configured the regmap used for register
> > > access.
> > > 
> > > Although described in the bindings, pin debouncing and drive strength
> > > selection are currently not implemented. Debouncing is only available
> > > for the six highest GPIOs, and must be emulated when other pins are used
> > > for (button) inputs anyway.
> > 
> > ...
> > 
> > > +struct rtl8231_function {
> > > +       const char *name;
> > > +       unsigned int ngroups;
> > > +       const char **groups;
> > 
> > const char * const * groups?
> > (Double check this, because I don't know if it's really const in your case)
> > 

I had to rework rtl8231_pinctrl_init_functions a bit, but outside of that
function this string array is indeed constant.


> > > +};
> > 
> > ...
> > 
> > > +       const struct rtl8231_pin_desc *desc =
> > > +               (struct rtl8231_pin_desc *)
> > > &rtl8231_pins[group_selector].drv_data;
> > 
> > Casting from/to void * is redundant in C.
> > 
> > ...
> > 
> > > +       struct rtl8231_pin_desc *desc =
> > > +               (struct rtl8231_pin_desc *) &rtl8231_pins[offset].drv_data;
> > 
> > Ditto.

Ok, changed.


> > 
> > ...
> > 
> > > +       ctrl->nfunctions = ARRAY_SIZE(rtl8231_pin_function_names);
> > > +       ctrl->functions = devm_kcalloc(dev, ctrl->nfunctions, sizeof(*ctrl-
> > > >functions), GFP_KERNEL);
> > > +       if (!ctrl->functions) {
> > 
> > > +               dev_err(dev, "failed to allocate pin function
> > > descriptors\n");
> > 
> > Dtop this noisy message, user space will print the similar one.
> > 
> > > +               return -ENOMEM;
> > > +       }
> > 
> > ...
> > 
> > > +       ctrl->map = dev_get_regmap(dev->parent, NULL);
> > > +       if (!ctrl->map)
> > > +               return -ENODEV;
> > > +
> > > +       if (IS_ERR(ctrl->map))
> > > +               return PTR_ERR(ctrl->map);
> > 
> > Hmm... Is it really the case that you have to check for different values?
> > What does NULL mean? Optional?
> > 

Checked the documentation again, and this actually doesn't return error values.
Only valid pointers or NULL. Will change accordingly here, and also in the LED
driver.


> > ...
> > 
> > > +       gr = devm_gpio_regmap_register(dev, &gpio_cfg);
> > > +       if (IS_ERR(gr)) {
> > 
> > > +               dev_err(dev, "failed to register gpio controller\n");
> > > +               return PTR_ERR(gr);
> > 
> > Is it possible to get a deferred probe here? If so, use dev_err_probe()
> > 

gpiochip_add_data_with_key can indeed return EPROBE_DEFER (when gpiolib isn't
loaded yet, if I understand correctly). I'll replace dev_err by dev_err_probe.


Best,
Sander


