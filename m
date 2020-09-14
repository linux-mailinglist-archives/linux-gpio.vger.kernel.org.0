Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2763268659
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 09:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgINHpJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 03:45:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47349 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725968AbgINHpI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Sep 2020 03:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600069506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vx80H7te5gIB49yR3z5p+8Lj/f1I2wyUY1AR+ocRP2k=;
        b=BBfkm362uwySPCVDCeFIDUH0UAImvvfvhQl+694dTgdNyEUJ5Nohix+B28/su1MpUj1zmF
        lGzeobLlV/GMHM9p12/vo8KtjD838+pDLbVYXdvUOa3wkhO+2XlIuUjIl4od6sP5n2qlgI
        Q5g7XzOOfHKUTMve4y14fgtYYm0R9Mg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-aKaTaEKGNEK7F5FBss6XNg-1; Mon, 14 Sep 2020 03:45:05 -0400
X-MC-Unique: aKaTaEKGNEK7F5FBss6XNg-1
Received: by mail-ej1-f70.google.com with SMTP id j2so7667227ejm.18
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 00:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vx80H7te5gIB49yR3z5p+8Lj/f1I2wyUY1AR+ocRP2k=;
        b=E4TtJZ38q10S5ML8/Gvfa3mT1eysDXpj+pGS/6hdBYGJEq2nhTjOcb84h7TZ/kQ4Ep
         jMCBMA5jbszN9zPjYXFroUEPqBFeyQvDrsoptroWAS8yGSUnpwRBaE74zl/6Yfvy4AjK
         0sgGqJ7ixpUbYbUZJBr8pr/PL4ENI28A3CtV0tbrKC2ooCm5he8hwrOWJJlFopDCiIX3
         5yrcyb21w/jySj25QG0Rm7Ake4wQ2Cau8nu4xb6t6/eSbH6BB7xv7EcAhrjrMCyE0Iue
         m6sQnC1B65z+Wa+gb2cZgq7PEVAHsikWoPdZ9tUkZxWtmjBLhCqoyC0yIUh8jVvathTm
         G42g==
X-Gm-Message-State: AOAM5304c+Ozf61oMkhOBFbWFH7ZAaHPzFIcJOVJjKIvMRMrxgTR5pXs
        /QGA6ZeyDuGIGaI1eMnfsgLcnGDBnjIyut6Vc1ygYwIQHw/PxNJ3G/+zDOAI/C4glrCO/Xg6tWK
        5Y2nK1vbWOYzAwfgrA9yUfQ==
X-Received: by 2002:a17:906:5611:: with SMTP id f17mr14139616ejq.427.1600069503981;
        Mon, 14 Sep 2020 00:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGKcq8+llfZMODL92knPx6qXu/rkmoC6YLK9WMi9CO8WaTj5e/GBzZiGpN6aZ/Fw7oKeVmPw==
X-Received: by 2002:a17:906:5611:: with SMTP id f17mr14139602ejq.427.1600069503811;
        Mon, 14 Sep 2020 00:45:03 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id w10sm7128920ejv.44.2020.09.14.00.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 00:45:03 -0700 (PDT)
Subject: Re: [PATCH 0/1] Input: soc_button_array - Work around DSDTs which
 modify the irqflags
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
References: <20200906122016.4628-1-hdegoede@redhat.com>
 <20200914061246.GO1665100@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <61dfb476-2d55-116c-21d6-bf5972929cd3@redhat.com>
Date:   Mon, 14 Sep 2020 09:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914061246.GO1665100@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 9/14/20 8:12 AM, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Sun, Sep 06, 2020 at 02:20:15PM +0200, Hans de Goede wrote:
>> Hi Dmitry,
>>
>> This patch is a bit of a kludge, but the problem it fixes has been
>> encountered on 2 different models now, so it seems that we really
>> need a workaround for this.
>>
>> This patch applies on top of these 2 patches:
>>
>> "Input: soc_button_array - Add active_low setting to soc_button_info"
>> "Input: soc_button_array - Add support for INT33D3 tablet-mode switch devices"
>>
>> Which I have posted multiple times upstream already (they are from May!),
>> but these have not been getting any attention.
> 
> Sorry about that, I merged them just now.

No problem, and thank you.

>> The soc_button_array code really is x86 specific glue code to translate
>> various incarnations of gpio-keys in ACPI tables to gpio_keys_platform_data.
>> As such I wonder if it would not be better to move this driver to
>> drivers/platform/x86?
>>
>> I seem to be doing most if not all of the recent work on soc_button_array,
>> and soon I will be a co-maintainer of drivers/platform/x86. So having it
>> there and adding me in MAINTAINERS as maintaining it seems to be best?
>>
>> If you want I can do a patch moving soc_button_array to drivers/platform/x86
>> and then add the other 3 patches on top and then we can merge all of this
>> through drivers/platform/x86?
> 
> Sorry, misread this first time through, so already merged the 3 patches,
> but I to not mind at all moving the driver to platform tree. If you send
> me such a patch I will apply it.

Ok.

Andy are you ok with moving the driver to the pdx86 tree too?

Regards,

Hans

