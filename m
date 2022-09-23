Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3BF5E78AE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 12:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbiIWKus (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 06:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbiIWKuW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 06:50:22 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9069B5AC6E
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 03:50:16 -0700 (PDT)
Received: from p508fdb48.dip0.t-ipconnect.de ([80.143.219.72] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1obgG2-00062d-Uv; Fri, 23 Sep 2022 12:50:11 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     "linus. walleij" <linus.walleij@linaro.org>,
        "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
Cc:     Johan Jonker <jbx6244@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v2 RESEND 0/2] rockchip pinctrl for acpi
Date:   Fri, 23 Sep 2022 12:50:10 +0200
Message-ID: <2678726.jE0xQCEvom@phil>
In-Reply-To: <202209231835365953827@rock-chips.com>
References: <20220917060929.657778-1-jay.xu@rock-chips.com> <2419940.Icojqenx9y@phil> <202209231835365953827@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SPF_HELO_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jay,

Am Freitag, 23. September 2022, 12:35:36 CEST schrieb jay.xu@rock-chips.com:
> Hi heiko
> 
> --------------
> jay.xu@rock-chips.com
> >Am Dienstag, 20. September 2022, 11:26:26 CEST schrieb Linus Walleij:
> >> On Sat, Sep 17, 2022 at 8:09 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
> >>
> >> > These patch fixes to support acpi by:
> >> > 1. populate gpio platform before pinctrl to probe
> >> > 2. get gpiochip by finding from gpiochip list
> >> > 3. get match data by device api
> >> >
> >> > Jianqun Xu (2):
> >> >   pinctrl: rockchip: find gpiochip by name from gpio module
> >> >   pinctrl: rockchip: get match data by device_get_match_data
> >>
> >> These look OK to me but I would feel better if Heiko or Andy ACK:ed
> >> them so I give them a few more days to comment.
> >
> >Right now I'm actually quite confused as I seem to have a bunch
> >of pinctrl/gpio-acpi patchsets of varying lengths in my inbox.
> >
> >There is a "v2", a "v8", a 20-patchset without version.
> >It's all quite confusing.
> > 
> From v2 to v8, I summit fixes in one patch, and them sugguested by Andy, I try to separate them
> into small patches 20-patchset.
> 
> The heart change is 
> 
> current
> 1. pinctrl register first
> 2. gpiochip register and find pinctrl device to add pin range
> 
> this patch fix to
> 1. gpiochip register itself
> 2. pinctrl register and find all gpiochips and add pin range
> 
> Please help to review directly to 20-patchset, I will add some suggested-by and acked-by later

ok, I'll drop all the other acpi/pinctrl/gpio sets and move to the 20-patch-series.

Thanks for the clarification
Heiko


