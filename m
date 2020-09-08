Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E788261C46
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 21:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731440AbgIHTQt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 15:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731169AbgIHQE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 12:04:26 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08472C061798
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 09:04:09 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id q34so1696363ooi.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 09:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BZuX6Zr0Ruzj2IpP6siPkinTPpHdzjgZJEkArUG6Cps=;
        b=Dwl/bLzhFroBhODvJaJewz5RbJ8YaafGEwoRzzlmDdYEO1waAVgM4CoFUpE4JzK6eZ
         5kMpsTnbBLKPNbUhbRmN6ww0GkRIYiUhE/l5UohvZ6ujarpUdiKVNBnTOSZLTqRTKD3p
         yj6s/nzEz+iIEEhz/1q/fj9QrE/vd9SQNNIUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BZuX6Zr0Ruzj2IpP6siPkinTPpHdzjgZJEkArUG6Cps=;
        b=RzLJlhAJ5+SxXmYYpbn3ALaw/2Q1+nStl/JRBUmJv0Eae++3I4BueGGsw81WgIQbsI
         MNRAOUt3osknmB9CdT6uXIloTuDAEl4BJFYjQTSddFiS1XmKfiEfA0M/QpL79NLepHTM
         Ph+iQQ68iI2sMUwimJ9m2QMpsyGdbKlcponqjwXq89Coo2zzRTKRuVMfA0VEHLzfs0pc
         TUirVoCdgKrUoier8SP84KhvCXk2WhaU9DRVN/QIhiK+mtCkMG8/qMmum6W2ECw6H/ZZ
         b18FUOml0PZE84avCa6gc5f6aQj++fSITcHwg61BtDph1qJp55Z5wgPzP3q6eWMKHV/V
         9jgA==
X-Gm-Message-State: AOAM5338kX7PA9LYeOep1n/uZOgG5dog59tV+r7RDsM8BfYrmDQDQ/V0
        qaLz8xcTLegVEnf2fMz6iVvwZA==
X-Google-Smtp-Source: ABdhPJyIgHFZMBHFDcZphH1OayicbYYSRhwgBJATp49Ys9y0t0uwRCtQ0UYHSB3NKnDjzdK2JcwS9g==
X-Received: by 2002:a4a:a385:: with SMTP id s5mr19119405ool.8.1599581047972;
        Tue, 08 Sep 2020 09:04:07 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id w1sm3558618oop.16.2020.09.08.09.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 09:04:06 -0700 (PDT)
Subject: Re: [PATCH v6 00/20] gpio: cdev: add uAPI v2
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <CAMpxmJUETJgmxzWzHumOVr+vWFQ27P71MtcdSdf_=jvtrSfRPg@mail.gmail.com>
 <20200903083750.GA17445@sol> <20200904125250.GA323947@sol>
 <CAMpxmJWVZ8Bf1gPibvbk=E5XNvQ_i76E430MMhUWwE1ACoPTQg@mail.gmail.com>
 <9db62b42-9a1e-0264-e88c-e636004cb629@linuxfoundation.org>
 <CAMpxmJVbujnp+Z0b3utDsGmhUgCbhydorOo-9e-=gVctT55NAg@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <af4036b7-72b7-16f3-92de-4976b49d857e@linuxfoundation.org>
Date:   Tue, 8 Sep 2020 10:04:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJVbujnp+Z0b3utDsGmhUgCbhydorOo-9e-=gVctT55NAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/8/20 9:54 AM, Bartosz Golaszewski wrote:
> On Tue, Sep 8, 2020 at 5:24 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 9/4/20 7:02 AM, Bartosz Golaszewski wrote:
>>> On Fri, Sep 4, 2020 at 2:52 PM Kent Gibson <warthog618@gmail.com> wrote:
>>>>
>>>> On Thu, Sep 03, 2020 at 04:37:50PM +0800, Kent Gibson wrote:
>>>>> On Thu, Sep 03, 2020 at 10:02:04AM +0200, Bartosz Golaszewski wrote:
>>>>>> On Mon, Aug 31, 2020 at 5:21 AM Kent Gibson <warthog618@gmail.com> wrote:
>>>>>>>
>>>> [snip]
>>>>>>
>>>>>> To me it looks good, just a couple nits here and there and some questions.
>>>>>>
>>>>>> I think it's worth deciding whether we want to keep the selftests in
>>>>>> tools/testing/selftests/gpio/ and then maybe consider porting
>>>>>> gpio-mockup-chardev.c to V2 or simply outsource it entirely to
>>>>>> libgpiod.
>>>>>>
>>>>>
>>>>> Ooops - I wasn't even aware they existed - though it had crossed my mind
>>>>> that the kernel should have some selftests somewhere - I use the libgpiod
>>>>> tests, from my libgpiod port, and my own Go based test suite for my testing,
>>>>> as well as some smoke tests with the tools/gpio.
>>>>>
>>>>> The libgpiod tests only cover v1 equivalent functionality, while my Go
>>>>> tests cover the complete uAPI, and both v1 and v2.
>>>>>
>>>>> It would be good for the kernel to at least have some smoke tests to
>>>>> confirm basic functionality, even thorough testing is left to a
>>>>> userspace library.  So the existing tests should be ported to v2, though
>>>>> should also retain the v1 tests if v1 is still compiled in.
>>>>>
>>>>
>>>> I've got a v7 ready to submit that includes a couple of patches for the
>>>> gpio-mockup selftests (their primary purpose appears to be testing the
>>>> mockup module, rather than the GPIO ABI), but I now notice that the
>>>> selftests/gpio section of the tree has a different maintainer:
>>>>
>>>> scripts/get_maintainer.pl 0021-selftests-gpio-port-to-GPIO-uAPI-v2.patch
>>>> Bamvor Jian Zhang <bamv2005@gmail.com> (maintainer:GPIO MOCKUP DRIVER)
>>>> Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
>>>> linux-gpio@vger.kernel.org (open list:GPIO MOCKUP DRIVER)
>>>> linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
>>>> linux-kernel@vger.kernel.org (open list)
>>>
>>> Bamvor, Shuah: do you still have interest in maintaining these, or can
>>> we update MAINTAINERS?
>>>
>>
>> I maintain kselftests and gpio selftest falls under that. Please send
>> selftest patches to me so I can review them.
>>
>> As for the gpio mock driver and test itself, you will have to wait for
>> Bamvor to respond.
>>
> 
> Hi Shuah,
> 
> I've been de facto maintaining gpio-mockup for a couple years now.
> Bamvor has been quite inactive as far as gpio testing goes. I think
> it's fine if you ack the selftests changes.
> 

That is fine. I can do quick review and Ack so you can take them
through gpio tree.

> In fact: I don't want selftests to block getting V2 uAPI upstream so
> if that'll look like it's going to take more time then I'm for merging
> V2 without any changes to selftests - in the end we have tests in
> user-space already.
> 

Tests and features go through subsystem trees to avoid delays. Please
make sure the test doesn't break the default kselftest build/run.

In the future it would help if you include all the maintainers on the
patch series, so I can review the tests from the framework angle to
see if they build/run correctly.

thanks,
-- Shuah
