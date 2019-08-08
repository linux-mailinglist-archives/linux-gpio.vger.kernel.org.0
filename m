Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AABBD863C9
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 15:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733044AbfHHN7o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 09:59:44 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:28994 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbfHHN7o (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Aug 2019 09:59:44 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 3F9ACA1796;
        Thu,  8 Aug 2019 15:59:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id rWo_kb1V9r47; Thu,  8 Aug 2019 15:59:38 +0200 (CEST)
Subject: Re: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190808132543.26274-1-sr@denx.de>
 <20190808132543.26274-2-sr@denx.de>
 <20190808134859.GY30120@smile.fi.intel.com>
From:   Stefan Roese <sr@denx.de>
Message-ID: <c4d14b64-6c2f-7e87-ea45-aa780dca85b8@denx.de>
Date:   Thu, 8 Aug 2019 15:59:36 +0200
MIME-Version: 1.0
In-Reply-To: <20190808134859.GY30120@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On 08.08.19 15:48, Andy Shevchenko wrote:
> On Thu, Aug 08, 2019 at 03:25:43PM +0200, Stefan Roese wrote:
>> This patch fixes a backward compatibility issue, when boards use the
>> old style GPIO suffix "-gpio" instead of the new "-gpios". This
>> potential problem has been introduced by commit d99482673f95 ("serial:
>> mctrl_gpio: Check if GPIO property exisits before requesting it").
>>
>> This patch now fixes this issue by iterating over all supported GPIO
>> suffixes by using the newly introduced for_each_gpio_suffix() helper.
>>
>> Also, the string buffer is now allocated on the stack to avoid the
>> problem of allocation in a loop and its potential failure.
> 
>>   	for (i = 0; i < UART_GPIO_MAX; i++) {
>>   		enum gpiod_flags flags;
>> -		char *gpio_str;
>> +		const char *suffix;
>> +		char gpio_str[32];	/* 32 is max size of property name */
> 
> Hmm... don't we have some define for the maximum length of property?

I've come up with this assumption from this code (identical comment):

https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib-of.c#L293

(and other places in drivers/gpio/*)
  
> Or maybe we can still continue using kasprintf() approach?

Frankly, I was feeling a bit uncomfortable with this memory allocation
in a loop. And Pavel also commented on this:

https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2066286.html

So I would really prefer to move this buffer to the stack instead.
  
>>   		bool present;
>> +		int k;
>> +
>> +		/*
>> +		 * Check if GPIO property exists and continue if not. Iterate
>> +		 * over all supported GPIO suffixes (foo-gpios vs. foo-gpio).
>> +		 */
>> +		for_each_gpio_suffix(k, suffix) {
>> +			snprintf(gpio_str, sizeof(gpio_str), "%s-%s",
>> +				 mctrl_gpios_desc[i].name, suffix);
>> +
>> +			present = device_property_present(dev, gpio_str);
>> +			if (present)
>> +				break;
>> +		}
>>   
>> -		/* Check if GPIO property exists and continue if not */
>> -		gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
>> -				     mctrl_gpios_desc[i].name);
>> -		if (!gpio_str)
>> -			continue;
>> -
> 
>> -		present = device_property_present(dev, gpio_str);
> 
> Because there is no more explicit assignment of present outside of the loop,
> the compiler may warn about uninitialized variable in use...
> 
>> -		kfree(gpio_str);
> 
>>   		if (!present)
> 
> ...here.

My compiler does not warn (MIPS GCC 8.1) but I see your point. I'll add
an initialization in the next version.

Thanks,
Stefan
