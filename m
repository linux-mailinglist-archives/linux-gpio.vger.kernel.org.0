Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630521B7A8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 16:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbfEMOCX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 10:02:23 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54655 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727272AbfEMOCX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 10:02:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id i3so8190954wml.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WQmRLtDnm39qtjx7/6AdbSlvBdW4w3QVA0my0Me0qRg=;
        b=YEhVoJ65lTZaH1xvnQoBFUQJVoPKxQ2SlvaO79N6SXAZIR3FAr4ObEruT1LFEm2obj
         A2BBsNi4+XjAJmyJBmo3ABLDIvJQDQFmMY2AqNWyDaTVhlydDMgMjFt8gvgsZDzN5svu
         BLDB+129DCd7GUPGEPpsYZtnPkUTIuV/b41AKA7Mu5TbGGs5hwrHo5vSQvkQ3fbp4HYj
         uzwKcX3Gkob2YRQDz/foYdqB0hM6yw54cOI42A9L4NSh+89Z+TuY4bB/cWJp/v6UF9t9
         tLzFnAqjc4LDQ10HOCmkmCE3YwgxXr8ZM0nHHsmTXdsS2A0Q8hNXMY8yaW3wdEI+adoh
         a1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WQmRLtDnm39qtjx7/6AdbSlvBdW4w3QVA0my0Me0qRg=;
        b=kgmmTMhedf3g4Lkifk9bvmOK50oEZhSOQcqiUeCbAVB7mmV4/Y97zI6XB8jyS1z5Wy
         ennLNIYqVwCjiqxRkCcSNeuClhki46DZriTn5lzCaZwCDkD5OYE3+inybvoBDLfAfsnL
         N8SKWkSlMotkKv7C2WSg9d977D+O/2kVDxhaZVZcM6PEM0nve7eD0NUfKbAMdziGW+44
         R1UFntfA/Cdjqg2DkdvMeEqVVHvd9u4HoIvk3jCxGvrWaik2N3OrlYIBEf418TA75CDu
         PVJbic12SXU3GmvOH1UZyGOOMu/uHzj+IBsUfCdJ6ciGR3gPesEhPOY9E49jOooVT2E4
         OmJg==
X-Gm-Message-State: APjAAAX4Rt8b9/1+rWoDu6/Lp1gPK1GeNixwv3Ucpl/D8mscav+rYMLG
        hPJGif+hryuOhJ/kLekm06eMQWcD5SQ=
X-Google-Smtp-Source: APXvYqyp9Jg0yEH+JBnebueGZnwRjo4e86MF6Ll9LET8nZvztxdTbqzgB7DA5bCh0hnC4xLdIxG29w==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr2035254wmi.15.1557756141076;
        Mon, 13 May 2019 07:02:21 -0700 (PDT)
Received: from [192.168.200.229] ([141.105.200.141])
        by smtp.gmail.com with ESMTPSA id o4sm12860898wmc.38.2019.05.13.07.02.19
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 07:02:20 -0700 (PDT)
Subject: Re: [PATCH 2/2] (v2) Mark MCP23S08 as one that will not sleep.
To:     Alexander Stein <alexander.stein@systec-electronic.com>
Cc:     linux-gpio@vger.kernel.org
References: <20190513120024.17026-1-joe.burmeister@devtank.co.uk>
 <20190513120024.17026-2-joe.burmeister@devtank.co.uk>
 <3181642.RMDZkMuPfY@ws-140106>
From:   Joe Burmeister <joe.burmeister@devtank.co.uk>
Message-ID: <534ddec6-4161-10d7-8240-fb385e5ea9b9@devtank.co.uk>
Date:   Mon, 13 May 2019 15:02:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3181642.RMDZkMuPfY@ws-140106>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Alexander,

You probably noticed there is a v3, but that just adds the missing signoff.

On 13/05/2019 13:59, Alexander Stein wrote:

> Am Montag, 13. Mai 2019, 14:00:24 CEST schrieb Joe Burmeister:
>> Though it has a 'standby' it doesn't appear to be an issue and
>> marking the chip with can_sleep means gpiolib.c won't allow its use
>> as a interrupt controller.
>> ---
>>   drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
>> index 3fc63cb5b332..7334d8eb9135 100644
>> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
>> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
>> @@ -890,7 +890,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>   		return PTR_ERR(mcp->regmap);
>>   
>>   	mcp->chip.base = base;
>> -	mcp->chip.can_sleep = true;
>> +	mcp->chip.can_sleep = false;
>>   	mcp->chip.parent = dev;
>>   	mcp->chip.owner = THIS_MODULE;
>>   
>>
> IMHO this is completly wrong, please refer to the documentation of this flag, e.g. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/gpio/driver.h#n217
> It essentially means you can't use this GPIOs from atomic context, as SPI or I2C transfers block/sleep, hence the name.
> In your case the IRQs are probably not requested as threaded, as stated in the link above.


I should have seen that bit of docs, sorry.

That opens a bit of a Pandora's box.

Now I look again with a better idea of what that means, I see this isn't 
the only driver that has a mutex, and sets can_sleep to true, uses 
devm_request_threaded_irq, and called 
gpiochip_set_nested_irqchip/gpiochip_set_chained_irqchip.

Now I'm confused because I can't see how you can use them as nested 
interrupt controllers.

They will all cause "you cannot have chained interrupts on a chip that 
may sleep" from gpiochip_set_cascaded_irqchip the moment you try.

I'm still reading through what I do now, but any hints or tips would be 
appreciated.


> Best regards,
> Alexander

Regards,

Joe

