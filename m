Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218AE3BA269
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 16:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhGBPC2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 11:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbhGBPC2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 11:02:28 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19283C061762;
        Fri,  2 Jul 2021 07:59:56 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 9A2A02224D;
        Fri,  2 Jul 2021 16:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1625237992;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OWy2yrkTk66WQxbgnmVpmHdWaJn/RapTlXrAofVrtKA=;
        b=fM22OssiTe4GCgmGyUJ7YDdMyNsIY/kmsOERyeYP4g4ELQkYfNOfWr0JFoVJ9aR293lgJT
        rfb47ACOX/2AevGjX5afzHIFaImldCqYHhEBny5bI8WtWGxmj45uLrrmmnZ6XV7FJPRlNm
        NdrL/SOe9I912AbrKuCnqNgw4a3Ea/g=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 02 Jul 2021 16:59:51 +0200
From:   Michael Walle <michael@walle.cc>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
In-Reply-To: <20210701203333.GA963857@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc> <20210701203333.GA963857@x1>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c915172ac456b3f7b7547c065c41750b@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

Am 2021-07-01 22:33, schrieb Drew Fustini:
> On Thu, Jul 01, 2021 at 08:39:40AM +0200, Michael Walle wrote:
>> Hi Drew,
>> 
>> Am 2021-07-01 02:20, schrieb Drew Fustini:
>> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
>> > BeagleV Starlight JH7100 board [2].
>> >
>> > [1] https://github.com/starfive-tech/beaglev_doc/
>> > [2] https://github.com/beagleboard/beaglev-starlight
>> >
>> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
>> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
>> 
>> Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
>> drivers/gpio/gpio-sl28cpld.c for an example.
>> 
>> -michael
> 
> Thank you for the suggestion.  I am not familiar with GPIO_REGMAP and
> REGMAP_IRQ so I will read about it.  Is the advantage is that is helps
> to reduce code duplication by using an abstraction?

Yes, I've looked briefly at your patch and it seemed that GPIO_REGMAP
might fit here which will reduce code.

> I did notice that the gpio-sifive.c driver used regmap_update_bits() 
> and
> regmap_write().
> 
> I suppose that is better than writel_relaxed() and iowrite32() which
> this RFC driver does?

Its just another abstraction layer in between. For MMIO it will also
end up using some variant of the above (see regmap-mmio.c). But if you
use regmap, you can also use REGMAP_IRQ which might also be a fit
for your GPIO controller and thus don't have to implement your own
versions for the irq_chip ops.

-michael
