Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CFE625614
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 10:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbiKKJCy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 04:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbiKKJCb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 04:02:31 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4AD7878E;
        Fri, 11 Nov 2022 00:59:15 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AB8wk4g130327;
        Fri, 11 Nov 2022 02:58:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1668157126;
        bh=MzK939t1bZHhF1XE9KfYy0hyr4NI9NAbtTrJALGKJDc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=XKoVv8/0jagy2y4ztuHR9d7Mdq95BiFUEsp5OvI+hbXBFiNPgJE0CBo/J+u2Cwnj6
         HqSSjOTRIhqEQETPrvJjDWXP0I/f2xSM/2b07edh7+txQ/jvWS7uIAL53lk7FoKmVQ
         WrKUajDG1Hc4ycifOILf8jpGzNPc93eSCsmTZWS8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AB8wkUv028572
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Nov 2022 02:58:46 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 11
 Nov 2022 02:58:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 11 Nov 2022 02:58:45 -0600
Received: from ubuntu (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with SMTP id 2AB8wXWR105891;
        Fri, 11 Nov 2022 02:58:35 -0600
Date:   Fri, 11 Nov 2022 00:58:32 -0800
From:   Matt Ranostay <mranostay@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Michael Walle <michael@walle.cc>, <brgl@bgdev.pl>,
        <lee@kernel.org>, <kristo@kernel.org>,
        <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh@kernel.org>,
        <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v3 4/7] gpio: tps6594x: add GPIO support for TPS6594x PMIC
Message-ID: <Y24OuHmXCV/5HuEY@ubuntu>
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-5-mranostay@ti.com>
 <CACRpkdaTV6unVsfNj+M39jLn5FLTnhryjuzF4EB6Ytds9R1nEQ@mail.gmail.com>
 <Y2zOhf8lqVLyLn+A@ubuntu>
 <CACRpkdZOR4Hcyv=bO7=rJERJK7JbCoS0_dvWj0K=YZC6Nsozdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACRpkdZOR4Hcyv=bO7=rJERJK7JbCoS0_dvWj0K=YZC6Nsozdw@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 11:15:22AM +0100, Linus Walleij wrote:
> On Thu, Nov 10, 2022 at 11:12 AM Matt Ranostay <mranostay@ti.com> wrote:
> > On Wed, Nov 09, 2022 at 10:59:08AM +0100, Linus Walleij wrote:
> > > On Wed, Nov 9, 2022 at 7:56 AM Matt Ranostay <mranostay@ti.com> wrote:
> > >
> > > > Add support for TPS6594X PMICs GPIO interface that has 11 that can be
> > > > configured as input or outputs.
> > > >
> > > > Tested-by: Keerthy <j-keerthy@ti.com>
> > > > Signed-off-by: Matt Ranostay <mranostay@ti.com>
> > >
> > > (...)
> > > > +config GPIO_TPS6594X
> > > > +       tristate "TI TPS6594X GPIO driver"
> > > > +       depends on MFD_TPS6594X
> > > > +       help
> > > > +         Select this option to enable GPIO driver for the TPS6954X
> > > > +         PMIC chip family. There are 11 GPIOs that can be configured.
> > >
> > > select GPIO_REGMAP
> > >
> > > This driver is an archetypical example of a driver that can make great
> > > use of GPIO_REGMAP helpers, so rewrite it to use them.
> > > Look in drivers/gpio/gpio-sl28cpld.c for an example.
> >
> > Linus,
> >
> > Those helpers look great for this usecase on the surface but however I think there could be some issues.
> > For GPIO direction it isn't configured by a bitmap on a register(s) but by a bit on a range of
> > registers (with a register for each GPIOx).
> >
> > For set/get values the gpio helper would work though.
> 
> Isn't is possible to just use parts of the GPIO_REGMAP
> helpers? I thought it's designed like such.
> 
> Michael Walle will know what to do with your usecase, and
> whether to use it or not, let's page him!
>

So after looking around a bit and digging into the helper code I found this
drivers/pinctrl/bcm/pinctrl-bcm63xx.c which has a example on how to override
the reg_mask_xlate function which could be used for changing the stride, and mask
based on the base address.

Currently have coded up using the gpio regmap helper. Will run through some testing
first and then submit for review.

- Matt

> Yours,
> Linus Walleij
