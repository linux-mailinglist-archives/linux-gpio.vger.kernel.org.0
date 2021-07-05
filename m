Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127A43BBD7D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jul 2021 15:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhGENcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jul 2021 09:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhGENcR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jul 2021 09:32:17 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02C4C06175F;
        Mon,  5 Jul 2021 06:29:40 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 5364D2224A;
        Mon,  5 Jul 2021 15:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1625491776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ddqwepprvqFiaW8VYgzbLNgNvkfzv1fsbM9mR4tb2MU=;
        b=KlKc6cuymWilnEHSiZybjsBCb7lqFMoM0B0qntA5wAIa83ZClp/T+yO2jhPZO3P097HPyx
        I9LJ4cgHjYs5tbZ1GkoFxLOWaMPYXOA7xBLcq+czcgCMWb6barEtcJBGF1+1tR/jQQHk1w
        GDVJF5uW3DqrkflWRAWNDdHoOV/WFvs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 05 Jul 2021 15:29:35 +0200
From:   Michael Walle <michael@walle.cc>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
In-Reply-To: <20210702210622.GC1035183@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <CAHp75Vc7kFk_SC8MSmFE5mBt53=4yUnxpSpr=cxZ+7eA-t1r5g@mail.gmail.com>
 <20210702210622.GC1035183@x1>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <991dddfee40c5b358c07257b58a316f3@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

Am 2021-07-02 23:06, schrieb Drew Fustini:
> On Fri, Jul 02, 2021 at 07:03:19PM +0300, Andy Shevchenko wrote:
>> On Thu, Jul 1, 2021 at 3:23 AM Drew Fustini <drew@beagleboard.org> 
>> wrote:
>> >
>> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
>> > BeagleV Starlight JH7100 board [2].
>> >
>> > [1] https://github.com/starfive-tech/beaglev_doc/
>> > [2] https://github.com/beagleboard/beaglev-starlight
>> 
>> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
>> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
>> 
>> Seems some Co-developed-by are missing.
> 
> Thank you for suggesting this.  Huan Feng originally wrote the driver.
> Emil and I have made some changes to reorganize and clean it up for
> submission.
> 
> Do you think all three of us should list Co-developed-by: for our names
> in addition to the SOB?
> 
>> Brief look into the code brings the Q. Can't you utilize gpio-regmap
>> here? Why not?
> 
> Michael Walle asked about this yesterday and it was my first time
> looking at regmap and gpio-regmap.  I've been reading the code and it
> does look like I should try convert this driver over to using
> gpio-regmap.
> 
> The open question in my mind is how to handle the interrupt type (edge
> trigged on positive or negative, level triggered on high or low).
> Hopefully I can find some other examples that can help me think about
> how to do that correctly.

Have a look at include/linux/regmap.h, there is "struct 
regmap_irq_type".
If you're lucky, you can just supply the corresponding values that fits
your hardware. If it doesn't match your hardware at all, then you can
keep your own functions, or if its slightly different, then maybe you
can add support for your quirk in regmap-irq. You don't necessarily have
to use regmap-irq together with gpio-regmap. You can also just use
regmap-irq or gpio-regmap independently.

A quick grep for "type_rising_" lists drivers/mfd/max77650.c and
drivers/mfd/rohm-bd70528.c for example.

-michael
