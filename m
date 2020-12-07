Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4172D143B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 16:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgLGPAB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 10:00:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:53396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbgLGPAB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Dec 2020 10:00:01 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6563D23601;
        Mon,  7 Dec 2020 14:59:20 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kmHyw-00Gn4h-61; Mon, 07 Dec 2020 14:59:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 07 Dec 2020 14:59:18 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 1/4] gpiolib: cdev: Flag invalid GPIOs as used
In-Reply-To: <X845UohmzGM7+FPu@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <20201204164739.781812-2-maz@kernel.org> <X845UohmzGM7+FPu@localhost>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <4d00047a5727a8f26d3aa4c54892cc58@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: johan@kernel.org, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, gregkh@linuxfoundation.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-12-07 14:16, Johan Hovold wrote:
> On Fri, Dec 04, 2020 at 04:47:36PM +0000, Marc Zyngier wrote:
>> When reporting the state of a GPIO to userspace, we never check
>> for the actual validity of the line, meaning we report invalid
>> lines as being usable. A subsequent request will fail though,
>> which is an inconsistent behaviour from a userspace perspective.
>> 
>> Instead, let's check for the validity of the line and report it
>> as used if it is invalid. This allows a tool such as gpioinfo
>> to report something sensible:
>> 
>> gpiochip3 - 4 lines:
>> 	line   0:      unnamed       unused   input  active-high
>> 	line   1:      unnamed       kernel   input  active-high [used]
>> 	line   2:      unnamed       kernel   input  active-high [used]
>> 	line   3:      unnamed       unused   input  active-high
>> 
>> In this example, lines 1 and 2 are invalid, and cannot be used by
>> userspace.
>> 
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  drivers/gpio/gpiolib-cdev.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
>> index e9faeaf65d14..a0fcb4ccaa02 100644
>> --- a/drivers/gpio/gpiolib-cdev.c
>> +++ b/drivers/gpio/gpiolib-cdev.c
>> @@ -1910,6 +1910,7 @@ static void gpio_desc_to_lineinfo(struct 
>> gpio_desc *desc,
>>  	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
>>  	    test_bit(FLAG_EXPORT, &desc->flags) ||
>>  	    test_bit(FLAG_SYSFS, &desc->flags) ||
>> +	    !gpiochip_line_is_valid(gc, info->offset) ||
>>  	    !ok_for_pinctrl)
>>  		info->flags |= GPIO_V2_LINE_FLAG_USED;
> 
> So this is somewhat separate from the rest of the series in case it
> applies also to gpio chips with reserved ranges (e.g.
> "gpio-reserved-ranges" devicetree property). Are they currently 
> reported
> as available?

I don't have any HW that uses this, but gpiolib-of.c makes use of it to
expose the valid GPIO range. I expect these systems suffer from the same
issue.

> Looks like this will work well also for USB gpio controllers with 
> static
> muxing configured in EEPROM, especially as that is how we already 
> report
> pins reported as unavailable by pinctrl (i.e. ok_for_pinctrl).

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
