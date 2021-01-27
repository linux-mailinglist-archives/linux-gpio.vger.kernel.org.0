Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C91B3064B0
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 21:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhA0UB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 15:01:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20454 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232550AbhA0UAl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Jan 2021 15:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611777551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h/UsaQpy9owGSAnCeo3VsEu5JuZEkF1vXo3NykuqkpE=;
        b=jBfqrtFFCRBvQYRSW3aqtsSGZ0XyO5lHAFTQXaBzhieGM8EFJmVeQm3hLcsa4EraLjm6Mz
        pBFFeeVnISU9Mpt5ciRNMFQzYh1qe2KvPhM5nR+NA3KncTcT0SuM8kJXx7X3+hBdpfPfvs
        o1VIv/8SQGtQAXYGmG0pLqP8nblnpzs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-ZLU4z28qPtKEmHrht4ff1w-1; Wed, 27 Jan 2021 14:59:09 -0500
X-MC-Unique: ZLU4z28qPtKEmHrht4ff1w-1
Received: by mail-ej1-f70.google.com with SMTP id ar27so11339ejc.22
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 11:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h/UsaQpy9owGSAnCeo3VsEu5JuZEkF1vXo3NykuqkpE=;
        b=rcMHwlOONDl60EcZV+8hRz3gHcl18mJxsXueJcNqQGemaWp+mOukthUedRJaJVy8VF
         cXASsBCOffEH6qBlmNolgdyRdErNMhOpuSPJu0f4qTv9ccSXgytMQ+CC8YBcabzyx6Hb
         yv+frq69/zAL8jbWloGX2RgFhzhihP+IDY9uusSa7Z7Kbcj2LK4jBH8rCXE6QI7IqJlF
         YqITlk6qQSvjnTbT5tUMi9IkcU1gCpwXNDW6QTtdRtkg9E+IplHg0aNVGuu6Ph+zoeQC
         AsrIyumBKzTyvQNVHV2sDhxd9MGUYGh67gZkqCkz+lUKnVskOU2OKT2RkUc3rzG5+vds
         MyAQ==
X-Gm-Message-State: AOAM533kom9uopTFMkyNaa9iADMKBrZK8+atEkBhU5O6k6ILL1dVKJup
        0rhKGz/s4+W2LShUwUz+T3kv1AQfeY4UBc7LOKlViaWwFrY5ZLGmIOBEe85LwMLHOQBoS/m+MOX
        xLXlqE+Z4eOvIqHMjlB4tKw==
X-Received: by 2002:a17:906:708f:: with SMTP id b15mr8139584ejk.267.1611777548266;
        Wed, 27 Jan 2021 11:59:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlaO5BzU++0K+fbZ4fszfnZHOzoIQSWZSqrmuYdsQcWzs897KjBJMn22JCj/RJRaVwvpFeVw==
X-Received: by 2002:a17:906:708f:: with SMTP id b15mr8139580ejk.267.1611777548103;
        Wed, 27 Jan 2021 11:59:08 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id v9sm1275522ejd.92.2021.01.27.11.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 11:59:07 -0800 (PST)
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
 <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
 <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
 <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com>
 <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1c860f9a-f007-e7c6-6142-dbeed10c40ba@redhat.com>
Date:   Wed, 27 Jan 2021 20:59:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/26/21 9:54 PM, Andy Shevchenko wrote:
> On Tue, Jan 26, 2021 at 8:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/26/21 6:14 PM, Andy Shevchenko wrote:
>>> On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
>>> <patrik.r.jakobsson@gmail.com> wrote:
>>>> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
>>>> <andy.shevchenko@gmail.com> wrote:
>>>>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
>>>>> <patrik.r.jakobsson@gmail.com> wrote:
>>>>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
>>>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>>>
>>>>>>> Hi guys,
>>>>>>>
>>>>>>> This is first part of Intel MID outdated platforms removal. It's collected into
>>>>>>> immutable branch with a given tag, please pull to yours subsystems.
>>>>>>
>>>>>> Hi Andy,
>>>>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
>>>>>> then I should probably start looking at removing the corresponding
>>>>>> parts in GMA500.
>>>>>
>>>>> Nope. It is related to only Medfield / Clovertrail platforms.
>>>>>
>>>>> There are other (MID) platforms that may / might utilize this driver
>>>>> in the future.
>>>>
>>>> Right, there's still Oaktrail / Moorestown with hardware in the wild.
>>>
>>> Actually Moorestown had to be removed a few years ago (kernel won't
>>> boot on them anyway from that date when Alan removed support under
>>> arch/x86 for it).
>>>
>>> I'm talking about Merrifield and Moorefield that can utilize it and
>>> also some other platforms that are not SFI based (Cedar something...
>>> IIRC).
>>
>> Yes at least there are some 64 bit capable SoCs with GMA500 which were
>> used in NAS like devices. These NAS-es actually have a VGA output
>> (and maybe also DVI?) which is attached to the GMA500.
> 
> Since you are talking about 64-bit, definitely they are *not*
> Moorestown, Medfield, Clovertrail since the mentioned never were
> 64-bit. But it would be nice to see the CPU model number to be sure.

My info on this comes from this bugreport:
https://bugzilla.redhat.com/show_bug.cgi?id=1665766

And the machine that bugreport is about is a "Thecus N5550 NAS box (Intel Atom D2550/Cedarview platform)"

Regards,

Hans

