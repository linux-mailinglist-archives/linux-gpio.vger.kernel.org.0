Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B092C09AE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 14:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733261AbgKWNKf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 08:10:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58256 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732782AbgKWMrB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Nov 2020 07:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606135615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=evJ57IeWGORpeQJY5HEMAH5Lc0ZFA9EW90lm963OgUY=;
        b=SvVAx04Fw6BT7gIjdU10yj5hiqnkE3p0NoOfLJg1NpXafOg/cstjOLFiGWiQiwqR2rz+/S
        Dmh/iBscOvQMsBWPJPmwGC2kUCjXqADVzGDPybEUtwqVip2EESB82GzwNiGrTGEpR0Sbdi
        0CtRyohvlCT/i98PpPZ2+mgIj4FAUIw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-h05pgvTuNGCR6861BNljIg-1; Mon, 23 Nov 2020 07:46:53 -0500
X-MC-Unique: h05pgvTuNGCR6861BNljIg-1
Received: by mail-ed1-f71.google.com with SMTP id i1so485680edt.19
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 04:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=evJ57IeWGORpeQJY5HEMAH5Lc0ZFA9EW90lm963OgUY=;
        b=PYIEZCetmBs/9VaXT3z949fTeqOywmyTrunnquTC7EGhzZ+7MsUMKND/5P8PIeJzzj
         IJl+UMgRaRvtz3BVmNlUuK2wF3B9/d1SX8bkXyjnv93P4Cf73B17qkJqazLrSiobNi9i
         D3D4EWXb4XrRkvERtouiPsLxFjx8RFUOrb20ivOL0RvICYMelD8t6tlOTCe9Kf44Rp+x
         0/A8TvUwNbG+lo3gXfqFeoKZH1jpCdW/Yb+N5sPitFl+g/HBL8fKdE2oBSb9zNuNwxHN
         szDsQl+Ep2HqMMXXT39xwCo6myRiomzTOqotapjiqrPSWLW+NzyirVwqLECE4LqPmx1O
         dlFg==
X-Gm-Message-State: AOAM5310qL3PF69g7e/8VzNfPlpbq5wxahO10QlGGeN+aUOcgM6Lyuoa
        KpM9axSMbeMmoJfmF0D7i2Lwvvl60VqfXfxjZT9Ian+nXz8eoZUzhIEFTdrPQglivulUWo8SW4h
        ZDa3aSUro5GLuVwjlHt/csA==
X-Received: by 2002:a17:906:a458:: with SMTP id cb24mr15795812ejb.321.1606135612113;
        Mon, 23 Nov 2020 04:46:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh+3rNPb9WWpPngWZDk/0DfRV8Zc6jyCrePzz41XOpactTff8NpGKOGFXcG3/HAarwv6HSLQ==
X-Received: by 2002:a17:906:a458:: with SMTP id cb24mr15795799ejb.321.1606135611922;
        Mon, 23 Nov 2020 04:46:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id u13sm4897248ejz.74.2020.11.23.04.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 04:46:51 -0800 (PST)
Subject: Re: [PATCH 1/1] pinctrl: add IRQF_EARLY_RESUME flags with gpio irq
 for elan touchpad.
To:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        caizhaopeng@uniontech.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhangyueqian <zhangyueqian@uniontech.com>,
        Zhangshuang <zhangshuang@uniontech.com>,
        Hualet Wang <wangyaohua@uniontech.com>,
        Zhanglei <zhanglei@uniontech.com>
References: <20200424091201.568-1-caizhaopeng@uniontech.com>
 <20201112135221.GC4077@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1e67c040-2aff-65bd-188a-bacf9a7fd7c4@redhat.com>
Date:   Mon, 23 Nov 2020 13:46:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112135221.GC4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/12/20 2:52 PM, Andy Shevchenko wrote:
> 
> +Cc: Hans.
> 
> I can't speak for AMD, but I think it may be useful for Intel pin control.
> However, I didn't check what may be the side effects of this change and neither
> contributor answered to my comments...

AFAICT setting IRQF_EARLY_RESUME causes it to not be resumed during
normal IRQ resuming, but earlier during the syscore_resume() call.

There are 2 problems with this:

1. When using S3 suspend syscore_resume() runs before any device
suspend handlers, so any state restoring which the GPIO controller's
resume handler is doing has not been done yet. While esp. after
S3 suspend the restoring may be important (s2idle suspend should
not touch the GPIO registers contents).

2. When using S2idle suspend syscore_resume() *never* runs, and
IRQs marked with IRQF_EARLY_RESUME are skipped during the normal
IRQ resume phase, so these IRQs will never be resumed.

Also IRQF_EARLY_RESUME is used almost no where:

[hans@x1 linux]$ ack -l IRQF_EARLY_RESUME drivers
drivers/xen/events/events_base.c
drivers/rtc/rtc-sc27xx.c
drivers/mfd/twl4030-irq.c

Which is probably why we have not yet hit the s2idle issue with it.

So this all in all seems like a bad idea, and we need to better root
cause the issue with these Elan touchpads and fix the actual issue.

Regards,

Hans




> 
> So, just heads up.
> 
> On Fri, Apr 24, 2020 at 05:12:01PM +0800, caizhaopeng@uniontech.com wrote:
>> From: Caicai <caizhaopeng@uniontech.com>
>>
>> I had tested two Notebook machines, the Intel i5(or amd ryzen)
>> with elan touchpad, and there's a probability that the touchpad
>> won't work after going to the S3/S4 to wake up, that it would
>> appear no more than 15 times. I found that there's no interrupt
>> to check for /proc/interrupt. It was found that the gpio
>> interrupt of i2c was also not on top. By adding the gpio
>> interrupt flags with IRQF_EARLY_RESUME, now the touchpad tested
>> 200 + times works well.
>>
>> Signed-off-by: Caicai <caizhaopeng@uniontech.com>
>> ---
>>  drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
>>  drivers/pinctrl/pinctrl-amd.c         | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
>> index 8fb6c9668c37..a350dade6aa0 100644
>> --- a/drivers/pinctrl/intel/pinctrl-intel.c
>> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
>> @@ -1189,7 +1189,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
>>  	 * controllers share the same interrupt line.
>>  	 */
>>  	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
>> -			       IRQF_SHARED | IRQF_NO_THREAD,
>> +			       IRQF_SHARED | IRQF_NO_THREAD | IRQF_EARLY_RESUME,
>>  			       dev_name(pctrl->dev), pctrl);
>>  	if (ret) {
>>  		dev_err(pctrl->dev, "failed to request interrupt\n");
>> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>> index 977792654e01..70c37f4da2b1 100644
>> --- a/drivers/pinctrl/pinctrl-amd.c
>> +++ b/drivers/pinctrl/pinctrl-amd.c
>> @@ -937,7 +937,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	ret = devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler,
>> -			       IRQF_SHARED, KBUILD_MODNAME, gpio_dev);
>> +			       IRQF_SHARED | IRQF_EARLY_RESUME | IRQF_NO_THREAD, KBUILD_MODNAME, gpio_dev);
>>  	if (ret)
>>  		goto out2;
>>  
>> -- 
>> 2.20.1
>>
>>
>>
> 

