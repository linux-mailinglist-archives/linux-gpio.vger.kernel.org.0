Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74CF5E783D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 12:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbiIWK0e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 06:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiIWK0T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 06:26:19 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF13B128883
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 03:26:16 -0700 (PDT)
Received: from p508fdb48.dip0.t-ipconnect.de ([80.143.219.72] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1obfsp-0005pO-T2; Fri, 23 Sep 2022 12:26:11 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     jbx6244@gmail.com, andriy.shevchenko@linux.intel.com,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 RESEND 0/2] rockchip pinctrl for acpi
Date:   Fri, 23 Sep 2022 12:26:06 +0200
Message-ID: <2419940.Icojqenx9y@phil>
In-Reply-To: <CACRpkdanniba+TUAeqei93dmkBT82HY5D95KxTsc8aE7jV+5VQ@mail.gmail.com>
References: <20220917060929.657778-1-jay.xu@rock-chips.com> <CACRpkdanniba+TUAeqei93dmkBT82HY5D95KxTsc8aE7jV+5VQ@mail.gmail.com>
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

Am Dienstag, 20. September 2022, 11:26:26 CEST schrieb Linus Walleij:
> On Sat, Sep 17, 2022 at 8:09 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
> 
> > These patch fixes to support acpi by:
> > 1. populate gpio platform before pinctrl to probe
> > 2. get gpiochip by finding from gpiochip list
> > 3. get match data by device api
> >
> > Jianqun Xu (2):
> >   pinctrl: rockchip: find gpiochip by name from gpio module
> >   pinctrl: rockchip: get match data by device_get_match_data
> 
> These look OK to me but I would feel better if Heiko or Andy ACK:ed
> them so I give them a few more days to comment.

Right now I'm actually quite confused as I seem to have a bunch
of pinctrl/gpio-acpi patchsets of varying lengths in my inbox.

There is a "v2", a "v8", a 20-patchset without version.
It's all quite confusing.


Heiko


