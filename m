Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0ED5295B54
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 11:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507667AbgJVJFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 05:05:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28910 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726033AbgJVJFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 05:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603357506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OWcpez1UHdyxmyzRuVmAZSAF3PSXSFOSoXip5GfqpPw=;
        b=gjMZWWdh9SJmTAWn3/mLBbsp1uy6t+2a6MDtlk1XfPojTOyC0ZewAaVVdMZDAf4HxCPUQ9
        NPfELxNLFKJbxJ+m8HjrJ1+LMqTt2Jc4AlgzqIN5kcQFZ9G4ivuXLmk6UUjroKp54oYo2m
        awuZex9b103H0NN/Z2ukBGldFWvN464=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-YgGg1-hkOT2_XD5EJroyBA-1; Thu, 22 Oct 2020 05:05:04 -0400
X-MC-Unique: YgGg1-hkOT2_XD5EJroyBA-1
Received: by mail-ej1-f71.google.com with SMTP id i21so411776ejb.5
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 02:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OWcpez1UHdyxmyzRuVmAZSAF3PSXSFOSoXip5GfqpPw=;
        b=IOqQcKZrlGeE+CEJKW2PU2Y2kIhKsYZLs+nbTG0DCnpBoL1sBVXDqT3tgEz6XvQeo3
         zPzNiv1IBYgarCwf0W9Ys34LEvUGJ9yqU1rvJP+gWxAe2siF4AbeydRMrH177XqD4mwl
         sFHHQoo8rkcLTuc+RRzFH/sdInxEVaWlSQziJ61jOxneNZ6DqD4i2MldInstAX3iBup1
         BAxHn5EhOzQEaXpmv49Z2zovR/+5hpTysChq6F+A7EqcwOYbr9dPljVCZOd0e2AF88tO
         AQfKPps3CktG5t4qa38Q9FIcf4tTS6Lk1JcIWP2mMpOiFMJb1mlmg9LFOd+yT0i0Jcsl
         CK9g==
X-Gm-Message-State: AOAM531PBBhUhuAtiQ/pqAzvtuSMslr3WYSMPv5yR5cfVuP+YRPIZ0n4
        4e+8FIOc61StaWDgFhzKWOacmjLixNkUc5uwmm5WIBClYeP+JnbAGocq2OYSnMN1vlDBvjUGSE7
        roiviEIOA94JPVhQ2+kHjIg==
X-Received: by 2002:a17:906:1955:: with SMTP id b21mr1408946eje.42.1603357503542;
        Thu, 22 Oct 2020 02:05:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpNEU2sF/57rAcDCA082l5RSpoZ0WKtzq9mB/KqCK9DoPicKkAlWtKtPa/QZQxLi+izeVnOA==
X-Received: by 2002:a17:906:1955:: with SMTP id b21mr1408930eje.42.1603357503284;
        Thu, 22 Oct 2020 02:05:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id op24sm481073ejb.56.2020.10.22.02.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 02:05:02 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] gpiolib: acpi: Respect bias settings for GpioInt()
 resource
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Jamie McClymont <jamie@kwiius.com>
References: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
 <20201021095854.GV2495@lahna.fi.intel.com>
 <20201021163844.GX4077@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b747a80e-27e1-be81-58dc-7d95c2cc567a@redhat.com>
Date:   Thu, 22 Oct 2020 11:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201021163844.GX4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10/21/20 6:38 PM, Andy Shevchenko wrote:
> On Wed, Oct 21, 2020 at 12:58:54PM +0300, Mika Westerberg wrote:
>> On Wed, Oct 14, 2020 at 04:31:52PM +0300, Andy Shevchenko wrote:
>>> In some cases the GpioInt() resource is coming with bias settings
>>> which may affect system functioning. Respect bias settings for
>>> GpioInt() resource by calling acpi_gpio_update_gpiod_*flags() API
>>> in acpi_dev_gpio_irq_get().
>>>
>>> While at it, refactor to configure flags first and, only when succeeded,
>>> map the IRQ descriptor.
> 
> ...
> 
>>> -			irq = gpiod_to_irq(desc);
>>> -			if (irq < 0)
>>> -				return irq;
>>> +			acpi_gpio_update_gpiod_flags(&dflags, &info);
>>> +			acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
>>>  
>>>  			snprintf(label, sizeof(label), "GpioInt() %d", index);
>>> -			ret = gpiod_configure_flags(desc, label, lflags, info.flags);
>>> +			ret = gpiod_configure_flags(desc, label, lflags, dflags);
>>>  			if (ret < 0)
>>>  				return ret;
>>>  
>>> +			irq = gpiod_to_irq(desc);
>>> +			if (irq < 0)
>>> +				return irq;
>>
>> Should the above be undone if the conversion here fails?
> 
> But wouldn't it be not good if we changed direction, for example, and then
> change it back? (IRQ requires input, which is safer, right?)
> 
> This makes me think what gpiod_to_irq() may do for physical state of the pin.
> On the brief search it seems there is no side effect on the pin with that
> function, so, perhaps the original order has that in mind to not shuffle with
> line if mapping can't be established. But if setting flags fail, we may got
> into the state which is not equal to the initial one, right?
> 
> So, in either case I see no good way to roll back the physical pin state
> changes. But I can return ordering of the calls in next version.
> 
> What do you think?

I think it would be good to do a new version where you keep the original
ordering.

Also if you decide to keep the ordering change, that really should be
in a separate commit and not squashed into this one, so that e.g. a bisect
can determine the difference between the ordering change or the flags
changes causing any issues.

Regards,

Hans

