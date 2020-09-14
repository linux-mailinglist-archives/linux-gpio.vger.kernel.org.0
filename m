Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B464268C99
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 15:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgINNxo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 09:53:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28260 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726792AbgINNwW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 09:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600091529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7Um8tCX9YwmvI/46vYWXlvrLavmk2Mm7vU3FQ5RmK4k=;
        b=S+2ej9R+emKFoGC+wfBcdU7LcfOsfk9m3E7ri6tGl+zocyB7o6aOGE4nzy1MGqLllwk8Xt
        D/Awaii3ovwosI5dVcMP+moSLkTSyXwGcaMi9Zhf/sPLGt9+8kLFc6j76hU9rnxSi9icj/
        ow+CH+4pLORvUhPqCNTk5RuHeqUIkHo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-7rCSQDpwOZOsaYqE-NWIWg-1; Mon, 14 Sep 2020 09:52:07 -0400
X-MC-Unique: 7rCSQDpwOZOsaYqE-NWIWg-1
Received: by mail-wm1-f72.google.com with SMTP id c200so22893wmd.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 06:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Um8tCX9YwmvI/46vYWXlvrLavmk2Mm7vU3FQ5RmK4k=;
        b=kNU73w5bmdV3Nq3ueFcjBuxIJ8yjFWlGb1182LHTBPNvAbL6NIsJ6GwPc7PAFT9apR
         nqiB6nxdJbZEmDBi65jrJaoqWKi3ve+siVeHPlsvTnjW9Tdiq9wpEuSG+myoVwK8OYiU
         n+tFm4ybsNvbA1G1Df1yrxn+pGCQbfhZWEe57d98hlrKb2EuhzwO1wPbReNmS1tJwS7Y
         lS4kMGRRLj27ckXwQ/11Bt9zzWo9bPRUKrcNh1PyNQVdQdPBmD51OudTDvJ3SypcIL2D
         lRVuBnPetU88aa4K/fk92DgJgiEms49UGlSjxG2VHISU7gI4jxO1DNmw2si051Mfu33U
         i7Mw==
X-Gm-Message-State: AOAM532z98ZtyAhI0ifhUeHv4sXNzK1HahbmPKmt+s6mXW8kktM8ywzf
        TyGKoxqs+wdG+nT1RtIAtWUaUcaOBjj+Ju5U4cPN8QGwAc1Pm4D03mYv5/rCoMgHnA1jI3jS6FX
        CkQTS+d+j9yq74RdQmxZbfw==
X-Received: by 2002:a1c:2543:: with SMTP id l64mr14427397wml.96.1600091526413;
        Mon, 14 Sep 2020 06:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt2FETo366O9EcczySLGiVdopF7Gk02mT+yreGZEBLgG14oYmnYiTX/HRz15WrDVmKYPNwWg==
X-Received: by 2002:a1c:2543:: with SMTP id l64mr14427382wml.96.1600091526173;
        Mon, 14 Sep 2020 06:52:06 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id m10sm18956882wmi.9.2020.09.14.06.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 06:52:05 -0700 (PDT)
Subject: Re: [PATCH 0/1] Input: soc_button_array - Work around DSDTs which
 modify the irqflags
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20200906122016.4628-1-hdegoede@redhat.com>
 <20200914061246.GO1665100@dtor-ws>
 <61dfb476-2d55-116c-21d6-bf5972929cd3@redhat.com>
 <CAHp75VemDbswE9+yXMut1vbYvWwcTAd+b_Ry05_0QWbfnCSv9g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <897df830-4806-0118-6a27-0025268da1f5@redhat.com>
Date:   Mon, 14 Sep 2020 15:52:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VemDbswE9+yXMut1vbYvWwcTAd+b_Ry05_0QWbfnCSv9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 9/14/20 10:00 AM, Andy Shevchenko wrote:
> On Mon, Sep 14, 2020 at 10:45 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 9/14/20 8:12 AM, Dmitry Torokhov wrote:
>>> On Sun, Sep 06, 2020 at 02:20:15PM +0200, Hans de Goede wrote:
> 
> ...
> 
>>>> The soc_button_array code really is x86 specific glue code to translate
>>>> various incarnations of gpio-keys in ACPI tables to gpio_keys_platform_data.
>>>> As such I wonder if it would not be better to move this driver to
>>>> drivers/platform/x86?
> 
> AFAIU the above is a justification why PDx86 suits better to host it.

Correct.

>>>> I seem to be doing most if not all of the recent work on soc_button_array,
>>>> and soon I will be a co-maintainer of drivers/platform/x86. So having it
>>>> there and adding me in MAINTAINERS as maintaining it seems to be best?
>>>>
>>>> If you want I can do a patch moving soc_button_array to drivers/platform/x86
>>>> and then add the other 3 patches on top and then we can merge all of this
>>>> through drivers/platform/x86?
>>>
>>> Sorry, misread this first time through, so already merged the 3 patches,
>>> but I to not mind at all moving the driver to platform tree. If you send
>>> me such a patch I will apply it.
>>
>> Ok.
>>
>> Andy are you ok with moving the driver to the pdx86 tree too?
> 
> Taking into consideration the above, if I read it correctly, I agree.
> Feel free to add my Ack.

Ok, since Dmitry's tree currently has some changes to soc_button_array.c,
the plan is to merge the patch through Dmitry's tree.

I will prepare a patch with your Acked-by and submit it.

Regards,

Hans

