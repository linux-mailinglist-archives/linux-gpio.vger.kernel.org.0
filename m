Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B857D13551D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 10:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgAIJFx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 04:05:53 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34481 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728448AbgAIJFw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 04:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578560751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zK88IxRXfREKS0/JDDDnXj7A7N2ld8TZBzTGvXLaSoM=;
        b=Q67GEXrSi3L9YQBtunQyGNwW8YA2stHhXROxKr90nRfoKGUQV/MROZ19dNibJinzr8LFOl
        rotS2zymYQPxztlcSRFjjkRgMcWXcuQPPJRPqKPR8AUJOcLAheJxeltjlNyZLqKjgTZITE
        brxUQigGgnrucdZUMrEvijfeEZi3Q24=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-f4-EMR8nNAaQS6OnYqxrtQ-1; Thu, 09 Jan 2020 04:05:50 -0500
X-MC-Unique: f4-EMR8nNAaQS6OnYqxrtQ-1
Received: by mail-wr1-f71.google.com with SMTP id z14so2651034wrs.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 01:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zK88IxRXfREKS0/JDDDnXj7A7N2ld8TZBzTGvXLaSoM=;
        b=TA8zT5uTvTwywKVOJdq+9SLjDqTGtFDvm+75pNsFulqPVW+lidnlh8dBCJjj7ytJmS
         VL7/T5hNnnLmw7mphYiLr1TqDdJhLR3cRN8nkC7/CVFxTkqvdKWuZYMesf0u3VJVgvmk
         tCEOmoY3Sf6pG4+NF0foR1LNbi5GLGNmoDpvPIoNNSIV/V1Yydj2hNc7xylRW3+5gOX9
         SZjxa167EduwCnB2zGwlimP+ZydJqKBxh7LElN1uERevFMLSpBRhK2OCyEi9QQCGeyqI
         U8u5PpolBbMIrNLbzL59RYyWX10E7GjCaGGZMdavB9VIhNERn7Fy2zRGJSlLW8WA4+Ch
         NG6w==
X-Gm-Message-State: APjAAAUks2geyfQwYwzFDwF4OHQyc4HmMCmsrby4LFEIX/SgvDWZMsAf
        uRmulrK1CTp6dLD21S1MN0ui8ZJUrM+oQvU9oZI/P4KjzDmiUs+XE1TEepQWzKwpLSJ8vjTwk5v
        eGln3tMRnrwH5rC5/U2MeMg==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr10043145wrq.348.1578560749174;
        Thu, 09 Jan 2020 01:05:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHjnkDwlOEyKu3IpoDulLUpT2xCVWE3SFlHplIHWtVIOOW6FziBpeXpvYKJscTbSQUFR+8Hw==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr10043116wrq.348.1578560748958;
        Thu, 09 Jan 2020 01:05:48 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id n16sm7900227wro.88.2020.01.09.01.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 01:05:48 -0800 (PST)
Subject: Re: [PATCH v3] pinctrl: baytrail: Replace WARN with dev_info_once
 when setting direct-irq pin to output
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Mastykin <mastichi@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20200101145243.15912-1-hdegoede@redhat.com>
 <20200108174745.GG32742@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f1ace666-1c57-0688-9737-d3ab2f5a1073@redhat.com>
Date:   Thu, 9 Jan 2020 10:05:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200108174745.GG32742@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 08-01-2020 18:47, Andy Shevchenko wrote:
> On Wed, Jan 01, 2020 at 03:52:43PM +0100, Hans de Goede wrote:
>> Suspending Goodix touchscreens requires changing the interrupt pin to
>> output before sending them a power-down command. Followed by wiggling
>> the interrupt pin to wake the device up, after which it is put back
>> in input mode.
>>
>> On Cherry Trail device the interrupt pin is listed as a GpioInt ACPI
>> resource so we can do this without problems as long as we release the
>> irq before changing the pin to output mode.
>>
>> On Bay Trail devices with a Goodix touchscreen direct-irq mode is used
>> in combination with listing the pin as a normal GpioIo resource. This
>> works fine, but this triggers the WARN in byt_gpio_set_direction-s output
>> path because direct-irq support is enabled on the pin.
>>
>> This commit replaces the WARN call with a dev_info_once call, fixing a
>> bunch of WARN splats in dmesg on each suspend/resume cycle.
> 
> Hmm...
> 
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - Replace WARN with a dev_info_once call, instead of dropping it
>>
>> Changes in v2:
>> - Drop now unused conf_ref local variable
>> ---
>>   drivers/pinctrl/intel/pinctrl-baytrail.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
>> index c6f53ed626c9..17e6740a36c5 100644
>> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
>> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
>> @@ -811,15 +811,15 @@ static int byt_gpio_set_direction(struct pinctrl_dev *pctl_dev,
>>   	value &= ~BYT_DIR_MASK;
>>   	if (input)
>>   		value |= BYT_OUTPUT_EN;
>> -	else
>> +	else if (readl(conf_reg) & BYT_DIRECT_IRQ_EN)
>>   		/*
>>   		 * Before making any direction modifications, do a check if gpio
>>   		 * is set for direct IRQ.  On baytrail, setting GPIO to output
>>   		 * does not make sense, so let's at least warn the caller before
> 
> ...if it's a warning, perhaps do a warning instead of info?
> Otherwise, we probably need to change a comment here.

I went with info on purpose since this will trigger on all BYT devices with
a Goodix touchscreens of which we have quite a few, so my vote goes to maybe
the comment. Note that although the log level is info (because it is somewhat
expected to happen), the content of the log msg is still warning-ish.

I guess we could replace "let's at least warn the caller before" with
"let's at least let the caller know before"

Regards,

Hans



> 
>>   		 * they shoot themselves in the foot.
>>   		 */
>> -		WARN(readl(conf_reg) & BYT_DIRECT_IRQ_EN,
>> -		     "Potential Error: Setting GPIO with direct_irq_en to output");
>> +		dev_info_once(vg->dev, "Potential Error: Setting GPIO with direct_irq_en to output");
>> +
>>   	writel(value, val_reg);
>>   
>>   	raw_spin_unlock_irqrestore(&byt_lock, flags);
> 
> P.S. I have applied it for bots to play with, but will wait for answer to the
> above.
> 
>> -- 
>> 2.24.1
>>
> 

