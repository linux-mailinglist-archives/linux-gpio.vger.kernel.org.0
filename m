Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5315741A49
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 04:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406579AbfFLCQE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 22:16:04 -0400
Received: from anchovy3.45ru.net.au ([203.30.46.155]:36314 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405661AbfFLCQE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 22:16:04 -0400
Received: (qmail 4883 invoked by uid 5089); 12 Jun 2019 02:16:01 -0000
Received: by simscan 1.2.0 ppid: 4779, pid: 4780, t: 0.0576s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 12 Jun 2019 02:16:00 -0000
Subject: Re: pinctrl: mcp23s08: detected irqchip that is shared with multiple
 gpiochips - real of false?
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>,
        Lars Poeschel <poeschel@lemonage.de>,
        Jason Kridner <jkridner@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <ba89e0fd-c9a9-4326-1fb3-a8b9dcb24601@electromag.com.au>
 <CACRpkdZ-2TUrNOZyiJxXfO8iJUyaJRrnQicQirR8+G3M=+an0g@mail.gmail.com>
 <20190611150921.o7pr5zujp7lg5tqq@pengutronix.de>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <4dd253c8-4ab1-6acf-cd7e-58c4f72b0474@electromag.com.au>
Date:   Wed, 12 Jun 2019 10:15:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611150921.o7pr5zujp7lg5tqq@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

G'day Marco,

On 11/06/2019 23:09, Marco Felsch wrote:
> Hi Linus,
> 
> On 19-06-09 12:58, Linus Walleij wrote:
>> Added Marco and a few other MCP23s08 people who may be more familiar
>> with this code. (The driver is a bit complex.)
>>
>> On Thu, Jun 6, 2019 at 10:59 AM Phil Reid <preid@electromag.com.au> wrote:
>>
>>> Using kernel 5.1 I'm getting the following message:
>>> "detected irqchip that is shared with multiple gpiochips: please fix the driver"
>>>
>>> Which I believe should be fixed by:
>>> 19ab5ca "pinctrl: mcp23s08: Allocate irq_chip dynamic"
>>>
>>> However mcp23s08_probe_one() ends up calling gpiochip_set_irq_hooks() twice.
>>
>> It looks strange when I look at the mcp23s08_probe_one() function
>> because it goes like:
>>
>> if (mcp->irq && mcp->irq_controller) {
>>      ret = mcp23s08_irqchip_setup(mcp);
>>      if (ret)
>>          goto fail;
>> }
>> (...)
>> if (mcp->irq)
>>      ret = mcp23s08_irq_setup(mcp);
>>
>> That seems wrong... but overall the code in this probe_one is pretty hard to
>> follow and probably needs some refactoring.
> 
> I don't think that this is wrong since I splitted only the irqchip setup
> and the hw irq line setup.
> 
>> This comes from f259f896f234 ("pinctrl: mcp23s08: fix irq and irqchip
>> setup order")
>> by Marco, Marco can you look into this and help us figure out why this happens?
> 
> I greped the code and found the possible failure:
> 
> 
> static int mcp23s08_probe_one()
> {
> 	...
> 
> 	if (mcp->irq && mcp->irq_controller) {
> 		ret = mcp23s08_irqchip_setup(mcp);
> 		if (ret)
> 			goto fail;
> 	}
> 
> 	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
> 	if (ret < 0)
> 		goto fail;
> 
> 	...
> }
> 
> The mcp23s08_irqchip_setup() call hierarchy:
> mcp23s08_irqchip_setup()
>    gpiochip_irqchip_add_nested()
>      gpiochip_irqchip_add_key()
>        gpiochip_set_irq_hooks()
> 
> The devm_gpiochip_add_data() call hierarchy:
> 
> devm_gpiochip_add_data()
>    gpiochip_add_data_with_key()
>      gpiochip_add_irqchip()
>        gpiochip_set_irq_hooks()
> 
> The gpiochip_add_irqchip() returns immediately if there isn't a irqchip
> but we added a irqchip due to the previous mcp23s08_irqchip_setup()
> call. So it calls gpiochip_set_irq_hooks() a second time. If I got this
> right the proper fix is:
> 
> static int mcp23s08_probe_one()
> {
> 	...
> 
> 	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
> 	if (ret < 0)
> 		goto fail;
> 
> 	if (mcp->irq && mcp->irq_controller) {
> 		ret = mcp23s08_irqchip_setup(mcp);
> 		if (ret)
> 			goto fail;
> 	}
> 
> 	...
> }
> 
> I checked other users of gpiochip_irqchip_add_nested() and they call
> (devm_)gpiochip_add_data always infront of the
> gpiochip_irqchip_add_nested() call.
> 
> I hope this helps you.
> 

Thanks, that fixed the error message and everything else seems to be working.
I've posted a patch with what I used.
Hopefully I've attributed everything appropriately.



-- 
Regards
Phil Reid
