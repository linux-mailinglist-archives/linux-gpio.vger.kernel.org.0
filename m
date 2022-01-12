Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D5148CD36
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 21:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357718AbiALUpr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 15:45:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41978 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242076AbiALUpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jan 2022 15:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642020337;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ki8bcMcRlTC8NsArym34SdxTw0cgWC3NrRYbYvxH/As=;
        b=QeUl2vBFHHBo4eqitIo6oXAT260MfI2tnGx8uWTxEdN30RZYOGJv4/qs0cTMM9rwkAtSf5
        85qpT6j+OLLI1MjRDFofmADG9j9B22/PM5SUf8lv8ppzvL0tlvq5YC6sqVUE9RqPkQp2Qs
        dICM37/dYdtJaC0venVlnmQV27+iHyc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-ii4pDQFbNUS2XQ8JtiKNWg-1; Wed, 12 Jan 2022 15:45:35 -0500
X-MC-Unique: ii4pDQFbNUS2XQ8JtiKNWg-1
Received: by mail-ed1-f70.google.com with SMTP id y18-20020a056402271200b003fa16a5debcso3314648edd.14
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 12:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ki8bcMcRlTC8NsArym34SdxTw0cgWC3NrRYbYvxH/As=;
        b=YOKs6XgTqmcGshWIjeqeQnocNTleESaHf3WC1W+WeYONWL0Re7YRi1OoFUMKkcDO/u
         6mhYWQBs9PbNuITWdS+C2Au0JjWyRNIwFkPcY5klxklQBolS0z64WH5c2kB5v8Nxq1FB
         5rZkANdrXS7aC8c6QwjS3f2s4AQT7jG76S3202L6euKcyrWkFbkXtZqKs4icaqKl09Cn
         5lK116rsIeb38lD5Xdzi/9oDeXzrpev9CjZljrVc+aWGZhYJi4NttpLu6LRaNY3wxTMC
         EKsCepabhLlhfv5mqp6aqBdwFrpxWeAvuzUG73ykAI1Qlw5tfBp6Dcn8LEPSzlZIBHgN
         i/2g==
X-Gm-Message-State: AOAM530VzCLecODQ09RJEuJnMOo7d5fsp9tDcR7rtmfWy7raVOjlCt6n
        wmq7NKDpd7neWLhqk54Ua1WJqyWAeIWJCtEqLjy//Tex6tNhzpfwOxgkm99s18yo5cYSwzYXfJD
        7lTXWoPKf366jgP+wb+i/+w==
X-Received: by 2002:aa7:de86:: with SMTP id j6mr1260399edv.1.1642020334614;
        Wed, 12 Jan 2022 12:45:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYHBUD+xL4tea64HGJeYCOppQudAOfbEN1v3VSfpQ45uYfExajJJGDCfRTmTDsRWiNqc+YUg==
X-Received: by 2002:aa7:de86:: with SMTP id j6mr1260386edv.1.1642020334425;
        Wed, 12 Jan 2022 12:45:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 2sm238712ejv.109.2022.01.12.12.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 12:45:34 -0800 (PST)
Message-ID: <c8e6152b-a045-4d0d-feed-05e9a32bdf53@redhat.com>
Date:   Wed, 12 Jan 2022 21:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <CAHp75Vfgpm7sROw_Ay8+tK0bhu-kCbS=O_kwax+i_vaH7H4wXA@mail.gmail.com>
 <ba1e407a-76e4-5a81-1cf2-45766be35b2a@redhat.com>
 <7cda97fe-4af3-694d-7e16-a523a205ad9f@redhat.com>
 <Yd89KCUIz9m4QBOt@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yd89KCUIz9m4QBOt@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/12/22 21:42, Andy Shevchenko wrote:
> On Wed, Jan 12, 2022 at 09:20:25PM +0100, Hans de Goede wrote:
>> On 1/8/22 10:59, Hans de Goede wrote:
>>> On 1/8/22 01:04, Andy Shevchenko wrote:
>>>> On Saturday, January 8, 2022, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
> ...
> 
>>>>     byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (APIC 67)
>>>>     byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (APIC 69)
>>>>
>>>>
>>>> Should be these updated?
>>>
>>> Yes the " (APIC 6x)" part is gone now. I will fix this for v4.
>>>
>>>>     This is useful to figure out the GPIO pin belonging to ACPI
>>>>     resources like this one: "Interrupt () { 0x00000043 }" or
>>>>     the other way around.
>>>>
>>>>     Suggested-by: Andy Shevchenko <andy@kernel.org <mailto:andy@kernel.org>>
>>>>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>>>>     ---
>>>>     Changes in v3:
>>>>     - Rework code to check if the pin is assigned one of the 16 direct IRQs
>>>>       (new code suggested-by Andy)
>>>>     - Drop dev_dbg of the (likely?) APIC IRQ, only log the direct IRQ index
>>>>
>>>>
>>>> Thinking about direct IRQ mappings I will look into the Datasheet next week.
>>>
>>> Ok, I will wait for you to get back to me then before posting a v4.
>>
>> Note I've found the direct IRQ to IO-APIC pin mappings now, they are
>> described in: atom-e3800-family-datasheet.pdf, so I've re-added
>> the APIC IRQ to the printed log msg for v4.
> 
> You mean below?
> 
> The 16 GPSCORE direct IRQs are mapped to IOAPIC_IRQ [66:51].
> The 16 GPSSUS direct IRQs are mapped to IOAPIC_IRQ [82:67].

Yes.

Regards,

Hans

