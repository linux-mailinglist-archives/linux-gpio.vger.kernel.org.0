Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32613D542A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 09:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbhGZGlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 02:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhGZGlI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 02:41:08 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35CF2C061757;
        Mon, 26 Jul 2021 00:21:37 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 9BA582224A;
        Mon, 26 Jul 2021 09:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1627284092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=buAfjcLR7fPMvNNPaqEniqQuht6PIhq7VepmuEtbukM=;
        b=d4AnwWs/wVsXCvpOc1ES4tlK7A2t8P+dVfiyyRz2zkQMmAoJvVPnMeKmKXX0K5yKezneM3
        h8yG7/e3J+UcfEipB0TI6OUEE9rxPqZFgjCLsuY9bQk0Lx/ZNiBwCoA7pWjZLSUnUFln5/
        Hsux3av4yhkx7wlzcuYm6uSC0SMWUww=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 26 Jul 2021 09:21:31 +0200
From:   Michael Walle <michael@walle.cc>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
In-Reply-To: <20210726071124.GA9184@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
 <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
 <20210726071124.GA9184@x1>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <dad13b899b69436acc1804b7c3438639@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew, Hi Linus,

Am 2021-07-26 09:11, schrieb Drew Fustini:
> On Fri, Jul 23, 2021 at 11:04:41PM +0200, Linus Walleij wrote:
>> On Thu, Jul 1, 2021 at 8:39 AM Michael Walle <michael@walle.cc> wrote:
>> > Am 2021-07-01 02:20, schrieb Drew Fustini:
>> > > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
>> > > BeagleV Starlight JH7100 board [2].
>> > >
>> > > [1] https://github.com/starfive-tech/beaglev_doc/
>> > > [2] https://github.com/beagleboard/beaglev-starlight
>> > >
>> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
>> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
>> >
>> > Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
>> > drivers/gpio/gpio-sl28cpld.c for an example.
>> 
>> To me it looks just memory-mapped?
>> 
>> Good old gpio-mmio.c (select GPIO_GENERIC) should
>> suffice I think.

But that doesn't mean gpio-regmap can't be used, no? Or what are
the advantages of gpio-mmio?

>> Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
>> of GPIO_GENERIC calling bgpio_init() in probe().
> 
> Thank you for the suggestion. However, I am not sure that will work for
> this SoC.
> 
> The GPIO registers are described in section 12 of JH7100 datasheet [1]
> and I don't think they fit the expectation of gpio-mmio.c because there
> is a seperate register for each GPIO line for output data value and
> output enable.
> 
> There are 64 output data config registers which are 4 bytes wide. There
> are 64 output enable config registers which are 4 bytes wide too. 
> Output
> data and output enable registers for a given GPIO pad are contiguous.
> GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54 while GPIO1_DOUT_CFG
> is 0x58 and GPIO1_DOEN_CFG is 0x5C. The stride between GPIO pads is
> effectively 8, which yields the formula: GPIOn_DOUT_CFG is 0x50+8n.
> Similarly, GPIO0_DOEN_CFG is 0x54 and thus GPIOn_DOEN_CFG is 0x54+8n.
> 
> However, GPIO input data does use just one bit for each line. GPIODIN_0
> at 0x48 covers GPIO[31:0] and GPIODIN_1 at 0x4c covers GPIO[63:32].

I'd say, that should work with the .reg_mask_xlate of the gpio-regmap.

-michael

> Thus the input could work with gpio-mmio but I am not sure how to
> reconcile the register-per-gpio for the output value and output enable.
> 
> Is there way a way to adapt gpio-mmio for this situation?
> 
> Thanks,
> Drew
> 
> [1] https://github.com/starfive-tech/beaglev_doc
