Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63AF487F88
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jan 2022 00:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbiAGXoQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jan 2022 18:44:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28115 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231482AbiAGXoQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jan 2022 18:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641599055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TQHscINZ47o8+vJPmU+WJQal0neuv6br3EXs2Lh1goo=;
        b=hs9eDrOwE4uh9JzucpKBcq8vizrcxKlhyVR7NO2TuMlRmtM4ORFhgDAy262vHtoM3o1nvv
        chI7r63D0sqjBWcS6aHeIasKkDUHyX5mI4SEjycjheTYJduaU7tM4SQLW1LmaDo4iZumD7
        iTa2btODLXNRXim7/veQx8gaPa7pyps=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-XQbCdcsaNz2AeeBy9GFgkg-1; Fri, 07 Jan 2022 18:44:14 -0500
X-MC-Unique: XQbCdcsaNz2AeeBy9GFgkg-1
Received: by mail-ed1-f70.google.com with SMTP id i5-20020a05640242c500b003f84839a8c3so5919394edc.6
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jan 2022 15:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TQHscINZ47o8+vJPmU+WJQal0neuv6br3EXs2Lh1goo=;
        b=EMUD1n4BP6IUd+P9TuZRjWnkzF8o8530VMkihnk5lt5RI+cq7JphEVudwuKwbmQjYA
         j0Dg0wcHctR4oaqlWPHLZByQb+lqxulTS0UtYn66JmjfURm9OCNIAoIlFYTaHJpIoV2H
         g55qUER/YOPFY8P1TFjB6HOXhh4wM81p3dXSJxSIWOe8pGlncSzNqt7sliNFC4whOmxM
         WzWnBcoBIO07T0gtlarLAwSf5MKUSa6FNW1xvuCjMPZ6HkjzNW5lwRwiQwLqGqC/oDYW
         JgLbrlD+JkZz6f5Bq/aewh8keA0IDNmXBAM2gfJjzxCVnGSZ1QXMNMDvg0ckm1tIkf9S
         xquw==
X-Gm-Message-State: AOAM530QUw533YQlXPEmi6J1OIn/vXXyyCJIzOmZwNRqmOGlDvE8QVGA
        p8vn1qJFVqImD4iM0j0oCXfhGhsS6zAJ4NvQTx4tEakz4B3A7+kpp+/mFeD550bMS1eMlfnt3gF
        Ai33o99U9kVVbb7rPjPuNiw==
X-Received: by 2002:aa7:dc41:: with SMTP id g1mr12075897edu.366.1641599053375;
        Fri, 07 Jan 2022 15:44:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdRFpfjTPYTy8PvlXm5iIWMNuH8uJRRJkc70U+OPtAPewQxD9xILU4coWA+HhPiAppLrwKAQ==
X-Received: by 2002:aa7:dc41:: with SMTP id g1mr12075888edu.366.1641599053188;
        Fri, 07 Jan 2022 15:44:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 16sm28138ejz.34.2022.01.07.15.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 15:44:12 -0800 (PST)
Message-ID: <2ca03a8f-5002-12cf-3d62-1ddaec9b26fe@redhat.com>
Date:   Sat, 8 Jan 2022 00:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <20220107142343.38560-1-hdegoede@redhat.com>
 <YdhtOrVjyx7k9nt4@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YdhtOrVjyx7k9nt4@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/7/22 17:41, Andy Shevchenko wrote:
> On Fri, Jan 07, 2022 at 03:23:43PM +0100, Hans de Goede wrote:
>> Some boards set the direct_irq_en flag in the conf0 register without
>> setting any of the trigger bits. The direct_irq_en flag just means that
>> the GPIO will send IRQs directly to the APIC instead of going through
>> the shared interrupt for the GPIO controller, in order for the pin to
>> be able to actually generate IRQs the trigger flags must still be set.
>>
>> So having the direct_irq_en flag set without any trigger flags is
>> non-sense, log a FW_BUG warning when encountering this and clear the flag
>> so that a driver can actually use the pin as IRQ through gpiod_to_irq().
>>
>> Specifically this allows the edt-ft5x06 touchscreen driver to use
>> INT33FC:02 pin 3 as touchscreen IRQ on the Nextbook Ares 8 tablet,
>> accompanied by the following new log message:
>>
>> byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger, clearing
>>
>> The new byt_direct_irq_sanity_check() function also checks that the
>> pin is actually appointed to one of the 16 direct-IRQs which the
>> GPIO controller support and on success prints debug msg like these:
> 
> supports ?

Ack, fixed for v3.

>> byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (APIC 67)
>> byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (APIC 69)
>>
>> This is useful to figure out the GPIO pin belonging to ACPI
>> resources like this one: "Interrupt () { 0x00000043 }" or
>> the other way around.
> 
> ...
> 
>> +static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 value)
>> +{
>> +	void __iomem *reg;
>> +	int i, j;
>> +
>> +	if (!(value & (BYT_TRIG_POS | BYT_TRIG_NEG))) {
>> +		dev_warn(vg->dev,
>> +			 FW_BUG "pin %i: direct_irq_en set without trigger, clearing\n", pin);
>> +		return false;
>> +	}
>> +
>> +	reg = vg->communities->pad_regs + BYT_DIRECT_IRQ_REG;
> 
>> +	for (i = 0; i < 16; i += 4) {
>> +		value = readl(reg + i);
>> +		for (j = 0; j < 4; j++) {
>> +			if (((value >> j * 8) & 0xff) == pin) {
> 
> Can it be like
> 
> 	u32 direct_irq[16];
> 	void __iomem *reg;
> 	void *match;
> 
> 
> 	memcpy_fromio(...);
> 	match = memchr(...);
> 	if (match)
> 		dev_dbg();
> 	else
> 		dev_warn();
> 
> 	return !!match;
> 
> ?

Yes that is a good idea, I've changed to this for v3.

> 
>> +				dev_dbg(vg->dev, "Pin %i: uses direct IRQ %d (APIC %d)\n",
>> +					pin, i + j, 0x43 + i + j);

> Why 0x43 is hard coded?
> 

I noticed that at least for the 'INT33FC:02' controller, which seems
to be the only one on which direct-IRQs get used, the direct-irq 0 slot
corresponds to ACPI resource which points to the APIC IRQ 0x43:
"Interrupt () { 0x00000043 }", and slot 1 points to 0x44, etc.

But I'm not sure what if any the APIC IRQ offset is for the other
GPIO islands, so I've just dropped the  (APIC %d) part of the log
msg for v3.

Regards,

Hans

