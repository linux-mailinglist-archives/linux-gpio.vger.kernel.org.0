Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFC71BA6F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbfEMPyG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:54:06 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52086 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728291AbfEMPyG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:54:06 -0400
Received: by mail-wm1-f67.google.com with SMTP id o189so14450040wmb.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=knYf5ljbgQL5enXfYGDlN5mKXtkacvgDrs5yCsw/KQE=;
        b=TT9BkWjJOTLVAIK5TdlbrepDGQ2Hq5gCSD/MCOPEGRla1l/Oa881IleuYvcf8fYXIi
         BCbAbKeOjOFEG9zdxeLMH3NhtdlObmwpRQb1GUt5Ln+n4zAxX6iheoerU0mEkp3BBXBI
         /NTq0BE8UYjtcAjSCtq+EuJ5g2KisgPoMCV9Mn+4nyqZRBm2+9IS0KxpeeU3m1HGpzlD
         CZ/Agcsc8YyalbSX3iTNeQzXNzWoTFpzK4wC7u6iMELw8jFL6AQ5RdXxY1njdNa8bT9A
         pX3zoBA7pKyeQCvJW6b8q4daDSTbeekQoPBkamcsbh3HaSyHN6X3YyQiZG1LjqKYwwHi
         k0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=knYf5ljbgQL5enXfYGDlN5mKXtkacvgDrs5yCsw/KQE=;
        b=qXmBV5jLmrfzFRX9q00PrT8A0hLuJoM/N5vZvb8qiG5jO/t99OAtxihEpRkwxJV36I
         i6xa/cBWu6ljit892EEpf9QdcrGdNWrZEUXAE47DvKBRYOl/8vpNk+W95xxjcjgtWeZK
         Jq6vw4m6CaN3t1db+enHqVIHZcJK8jFi90irpVVEHUzD+BTq4k+GFm+2H1zvSFNb5epT
         OLLiyUITv+OYFq0tn/Za5KMHkOIjConeoW5x3UOMbZws2t3BQjlfdPjvbL7u9PmclaHz
         YPM6029JjfNgL0GdVLrnJJGPvMGB1CZNL8tIJzBmpgyWUoPM1v4aiN6vj6sUUImhCJsX
         Hkxg==
X-Gm-Message-State: APjAAAUaiAR6TEkXEHS9yOPF3y2Zh4XW9HFu5UsYHZXkL8GJti7dYoB0
        CSdMic8RJTEWHDOteuIT74t4wBr45Ms=
X-Google-Smtp-Source: APXvYqxncYr4KowG8L4apylYq/enpbsCC3cUl4ue+HT6qm13/i/PhKZM+fnO0CCY6emCl9tukJ2/sw==
X-Received: by 2002:a1c:a711:: with SMTP id q17mr15388794wme.146.1557762843724;
        Mon, 13 May 2019 08:54:03 -0700 (PDT)
Received: from [192.168.200.229] ([141.105.200.141])
        by smtp.gmail.com with ESMTPSA id l18sm10665772wrv.38.2019.05.13.08.54.02
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 08:54:03 -0700 (PDT)
Subject: Re: [PATCH 2/2] (v2) Mark MCP23S08 as one that will not sleep.
To:     Alexander Stein <alexander.stein@systec-electronic.com>
Cc:     linux-gpio@vger.kernel.org
References: <20190513120024.17026-1-joe.burmeister@devtank.co.uk>
 <3181642.RMDZkMuPfY@ws-140106>
 <534ddec6-4161-10d7-8240-fb385e5ea9b9@devtank.co.uk>
 <3227167.XK1kVzz4uE@ws-140106>
From:   Joe Burmeister <joe.burmeister@devtank.co.uk>
Message-ID: <15a7b70d-b6c8-b747-c908-8a20f4777297@devtank.co.uk>
Date:   Mon, 13 May 2019 16:54:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3227167.XK1kVzz4uE@ws-140106>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Alexander,

On 13/05/2019 15:59, Alexander Stein wrote:
> Am Montag, 13. Mai 2019, 16:02:18 CEST schrieb Joe Burmeister:
>> Hi Alexander,
>>
>> You probably noticed there is a v3, but that just adds the missing signoff.
>>
>> On 13/05/2019 13:59, Alexander Stein wrote:
>>
>>> Am Montag, 13. Mai 2019, 14:00:24 CEST schrieb Joe Burmeister:
>>>> Though it has a 'standby' it doesn't appear to be an issue and
>>>> marking the chip with can_sleep means gpiolib.c won't allow its use
>>>> as a interrupt controller.
>>>> ---
>>>>    drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/
> pinctrl-mcp23s08.c
>>>> index 3fc63cb5b332..7334d8eb9135 100644
>>>> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
>>>> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
>>>> @@ -890,7 +890,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp,
> struct device *dev,
>>>>    		return PTR_ERR(mcp->regmap);
>>>>    
>>>>    	mcp->chip.base = base;
>>>> -	mcp->chip.can_sleep = true;
>>>> +	mcp->chip.can_sleep = false;
>>>>    	mcp->chip.parent = dev;
>>>>    	mcp->chip.owner = THIS_MODULE;
>>>>    
>>>>
>>> IMHO this is completly wrong, please refer to the documentation of this
> flag, e.g. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> tree/include/linux/gpio/driver.h#n217
>>> It essentially means you can't use this GPIOs from atomic context, as SPI
> or I2C transfers block/sleep, hence the name.
>>> In your case the IRQs are probably not requested as threaded, as stated in
> the link above.
>>
>> I should have seen that bit of docs, sorry.
>>
>> That opens a bit of a Pandora's box.
>>
>> Now I look again with a better idea of what that means, I see this isn't
>> the only driver that has a mutex, and sets can_sleep to true, uses
>> devm_request_threaded_irq, and called
>> gpiochip_set_nested_irqchip/gpiochip_set_chained_irqchip.
>>
>> Now I'm confused because I can't see how you can use them as nested
>> interrupt controllers.
>>
>> They will all cause "you cannot have chained interrupts on a chip that
>> may sleep" from gpiochip_set_cascaded_irqchip the moment you try.
>>
>> I'm still reading through what I do now, but any hints or tips would be
>> appreciated.
> Have a look at https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
> linux.git/tree/Documentation/driver-api/gpio/driver.rst#n309 which pretty much
> describes the types.

Was just reading 
https://www.kernel.org/doc/Documentation/gpio/driver.txt as this came 
through.

> I think you are confusing chained and nested IRQ controllers. Using
> gpiochip_set_nested_irqchip cannot result in that error.
> mcp23s08 driver is using gpiochip_set_nested_irqchip appropriately.

It was seeing the error was what I thought brought me to can_sleep.

I assumed about can_sleep and assumed completely wrong.

I've just removed this second patch and it all seams to still be working 
fine.

Ignore this second patch, it's clearly nonsense. Sorry I wasted your 
time, if it's any consolation, I wasted much more of mine.

Should I resubmit the series with just the first patch?


> I'm wondering what you are trying to resolve. Are you attaching another IRQ
> controller to MCP23Sxx inputs?

We are using a MCP23S017 in a Raspberry Pi Compute Module motherboard, 4 
interrupt lines go into it and 2 come out.

(Though it turns out might as well be 1 as they both go into the same 
GPIO bank on the Pi, so same interrupt regardless.)

> Best regards,
> Alexander

Regards,


Joe


