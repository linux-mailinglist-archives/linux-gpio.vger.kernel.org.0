Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349D962B3ED
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 08:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbiKPHcE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 02:32:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbiKPHcC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 02:32:02 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2895EB1F6;
        Tue, 15 Nov 2022 23:32:02 -0800 (PST)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id D39B714C1;
        Wed, 16 Nov 2022 08:31:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1668583917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=piDfn64ODAtoaZKFwAql8Y2/q2UocH9lkh4rRnP9hco=;
        b=vEv6i7pNqUD1YJqyKPKHL6S+GfFWxCp3JCNxh2zDhn2j6jzSrGYH8tbOfYbS+hHzey3J8j
        yerF9dZ+i4nEFBNDjigRrxfsERL+u/WVqM8NfzMH0aYYF7ZVFCvMLufQnOKtgEguC2+TUn
        GWgx8pWeyW7ikqXdhnX2M20WspRrcmsj1WtI/uBPMzVLxQVeWuKg6qQw2S1hsob6Dku26R
        VQBW+Iwbc2uAZbn2Xmdu9sXeWORAELzkbh9lwu/gxp5PlE/M00rgJAU8KnQSZtVUxD+Hv8
        7yZTefX9Oq+i0JlyYjBvrXviM9fAwyJCXn3wIClMG/IEPQ5CHKJ26AI3zlaBTQ==
MIME-Version: 1.0
Date:   Wed, 16 Nov 2022 08:31:57 +0100
From:   Michael Walle <michael@walle.cc>
To:     Matt Ranostay <mranostay@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, brgl@bgdev.pl,
        lee@kernel.org, kristo@kernel.org, alexandre.belloni@bootlin.com,
        a.zummo@towertech.it, krzysztof.kozlowski+dt@linaro.org,
        robh@kernel.org, vigneshr@ti.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v3 4/7] gpio: tps6594x: add GPIO support for TPS6594x PMIC
In-Reply-To: <Y24OuHmXCV/5HuEY@ubuntu>
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-5-mranostay@ti.com>
 <CACRpkdaTV6unVsfNj+M39jLn5FLTnhryjuzF4EB6Ytds9R1nEQ@mail.gmail.com>
 <Y2zOhf8lqVLyLn+A@ubuntu>
 <CACRpkdZOR4Hcyv=bO7=rJERJK7JbCoS0_dvWj0K=YZC6Nsozdw@mail.gmail.com>
 <Y24OuHmXCV/5HuEY@ubuntu>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <91b51ffaadaa4c3d5ca46dc252d641c6@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 2022-11-11 09:58, schrieb Matt Ranostay:
> On Thu, Nov 10, 2022 at 11:15:22AM +0100, Linus Walleij wrote:
>> On Thu, Nov 10, 2022 at 11:12 AM Matt Ranostay <mranostay@ti.com> 
>> wrote:
>> > On Wed, Nov 09, 2022 at 10:59:08AM +0100, Linus Walleij wrote:
>> > > On Wed, Nov 9, 2022 at 7:56 AM Matt Ranostay <mranostay@ti.com> wrote:
>> > >
>> > > > Add support for TPS6594X PMICs GPIO interface that has 11 that can be
>> > > > configured as input or outputs.
>> > > >
>> > > > Tested-by: Keerthy <j-keerthy@ti.com>
>> > > > Signed-off-by: Matt Ranostay <mranostay@ti.com>
>> > >
>> > > (...)
>> > > > +config GPIO_TPS6594X
>> > > > +       tristate "TI TPS6594X GPIO driver"
>> > > > +       depends on MFD_TPS6594X
>> > > > +       help
>> > > > +         Select this option to enable GPIO driver for the TPS6954X
>> > > > +         PMIC chip family. There are 11 GPIOs that can be configured.
>> > >
>> > > select GPIO_REGMAP
>> > >
>> > > This driver is an archetypical example of a driver that can make great
>> > > use of GPIO_REGMAP helpers, so rewrite it to use them.
>> > > Look in drivers/gpio/gpio-sl28cpld.c for an example.
>> >
>> > Linus,
>> >
>> > Those helpers look great for this usecase on the surface but however I think there could be some issues.
>> > For GPIO direction it isn't configured by a bitmap on a register(s) but by a bit on a range of
>> > registers (with a register for each GPIOx).

As long as there is only one register to be changed per pin/action,
.reg_mask_xlate should work, as you've already found out.

>> > For set/get values the gpio helper would work though.
>> 
>> Isn't is possible to just use parts of the GPIO_REGMAP
>> helpers? I thought it's designed like such.

No, you can't use them as they are kept private, along with
the needed struct gpio_regmap. Which was intentional back then
as it should be easier to change the implementation or add features
without its use being spread all over the gpio drivers.

We could change that though - or just add the needed feature to
gpio-regmap if it looks generic enough.

>> 
>> Michael Walle will know what to do with your usecase, and
>> whether to use it or not, let's page him!
>> 
> 
> So after looking around a bit and digging into the helper code I found 
> this
> drivers/pinctrl/bcm/pinctrl-bcm63xx.c which has a example on how to 
> override
> the reg_mask_xlate function which could be used for changing the
> stride, and mask
> based on the base address.
> 
> Currently have coded up using the gpio regmap helper. Will run through
> some testing
> first and then submit for review.

Sounds promising.

-michael
