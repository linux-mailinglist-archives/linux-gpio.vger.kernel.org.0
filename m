Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E01532E6BD
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 11:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhCEKvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 05:51:25 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:48803 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhCEKvG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 05:51:06 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4DsPfc5jNYz1qs3M;
        Fri,  5 Mar 2021 11:51:04 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4DsPfc4w4Tz1qql1;
        Fri,  5 Mar 2021 11:51:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id ZhBuX6p5iyyf; Fri,  5 Mar 2021 11:51:03 +0100 (CET)
X-Auth-Info: cCaArYZforOsdcLTkUFXjfGxI+gyqTdqduM4Y0kdsXs=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri,  5 Mar 2021 11:51:03 +0100 (CET)
Subject: Re: [PATCH] Revert "gpiolib: generalize devprop_gpiochip_set_names()
 for device properties"
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Roman Guskov <rguskov@dh-electronics.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20210304230956.154626-1-marex@denx.de>
 <YEILjTOApl2gMw4P@smile.fi.intel.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <07802215-0ab4-ac2d-f742-178fb04470fd@denx.de>
Date:   Fri, 5 Mar 2021 11:51:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEILjTOApl2gMw4P@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/5/21 11:44 AM, Andy Shevchenko wrote:
> On Fri, Mar 05, 2021 at 12:09:56AM +0100, Marek Vasut wrote:
>> This reverts 7cba1a4d5e162 ("gpiolib: generalize devprop_gpiochip_set_names()
>> for device properties") because this breaks OF "gpio-line-names" behavior on
>> STM32MP1 platform.
>>
>> On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000, see
>> arch/arm/boot/dts/stm32mp151.dtsi. The driver for pin-controller@50002000
>> is in drivers/pinctrl/stm32/pinctrl-stm32.c and iterates over all of its DT
>> subnodes when registering each GPIO bank gpiochip. Each gpiochip has:
>> - gpio_chip.parent = dev where dev is the device node of the pin controller
>> - gpio_chip.of_node = np which is the OF node of the GPIO bank
>> Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node) , i.e.
>> pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.
>>
>> The original code behaved correctly, as it extracted the "gpio-line-names"
>> from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
>> This patch reinstates the original correct behavior.
> 
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Reported-by: Roman Guskov <rguskov@dh-electronics.com>
> 
> Thanks for the report and a fix!
> However I think the revert is not an option. We may do much better.

The revert is pretty much also the minimal change to reinstate the 
original behavior. What better option do you have in mind, please do 
elaborate in detail. Thank you.
