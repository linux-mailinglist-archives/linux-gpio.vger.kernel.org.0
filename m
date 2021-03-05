Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44A432E869
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 13:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbhCEM0v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 07:26:51 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:40624 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhCEM0t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 07:26:49 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4DsRn34C3Cz1qsZs;
        Fri,  5 Mar 2021 13:26:47 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4DsRn33TjWz1t6p6;
        Fri,  5 Mar 2021 13:26:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id oKW_NzhLEexk; Fri,  5 Mar 2021 13:26:46 +0100 (CET)
X-Auth-Info: 7sNqH9INcwCoYmH9P1rkueSRV97XCQQxSO/sSqCJ1pc=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri,  5 Mar 2021 13:26:46 +0100 (CET)
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware
 node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Roman Guskov <rguskov@dh-electronics.com>
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <506c1e48-c648-69d4-8e4f-b42fe02156f7@denx.de>
 <YEIjGcPF9yNnKdSp@smile.fi.intel.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <2f567d44-4aaa-02f7-a60f-d6ad5404373a@denx.de>
Date:   Fri, 5 Mar 2021 13:26:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEIjGcPF9yNnKdSp@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/5/21 1:24 PM, Andy Shevchenko wrote:
> On Fri, Mar 05, 2021 at 01:11:39PM +0100, Marek Vasut wrote:
>> On 3/5/21 1:02 PM, Andy Shevchenko wrote:
>>> On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000,
>>> see arch/arm/boot/dts/stm32mp151.dtsi. The driver for
>>> pin-controller@50002000 is in drivers/pinctrl/stm32/pinctrl-stm32.c
>>> and iterates over all of its DT subnodes when registering each GPIO
>>> bank gpiochip. Each gpiochip has:
>>>
>>>     - gpio_chip.parent = dev,
>>>       where dev is the device node of the pin controller
>>>     - gpio_chip.of_node = np,
>>>       which is the OF node of the GPIO bank
>>>
>>> Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node),
>>> i.e. pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.
>>>
>>> The original code behaved correctly, as it extracted the "gpio-line-names"
>>> from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
>>>
>>> To achieve the same behaviour, read property from the firmware node.
>>>
>>> Fixes: 7cba1a4d5e162 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
>>> Reported-by: Marek Vasut <marex@denx.de>
>>> Reported-by: Roman Guskov <rguskov@dh-electronics.com>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> Tested-by: Marek Vasut <marex@denx.de>
>> Reviewed-by: Marek Vasut <marex@denx.de>
> 
> Thanks!
> 
>> Thanks
>>
>>>    static int devprop_gpiochip_set_names(struct gpio_chip *chip)
>>>    {
>>>    	struct gpio_device *gdev = chip->gpiodev;
>>> -	struct device *dev = chip->parent;
>>> +	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
>>
>> You could make the order here a reverse xmas tree, but that's a nitpick.
> 
> They are dependent, can't be reordered.

Doh, you're right.
