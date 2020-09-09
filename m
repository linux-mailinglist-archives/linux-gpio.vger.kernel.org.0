Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C979262467
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 03:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgIIBP1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 21:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgIIBP1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 21:15:27 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8079EC061755
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 18:15:25 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id z13so1415728iom.8
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 18:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MIYTcp/Op5a10KklY/9ieZKoD7aXDcPKvRlgBCiIESA=;
        b=EF5YLArF/ZZbYoNcsVGDMKeApLvzBwIidiprPDtO4wMqS4GKYVy9dr3Cuv3OEuMvge
         1VLfjlj6S9pZZ48ioAhUxcdnt74utdncO/zYjUhAOt7v8mLUgzewYMGZa/V9YJ/rJEZp
         TdWKayXHXEokzzVc3d9T/07lJxfWKs/8MlzUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MIYTcp/Op5a10KklY/9ieZKoD7aXDcPKvRlgBCiIESA=;
        b=YWPNwkFF9LXRNJ53O4di2f5kla0th9px9Pf6h/cN4hU6KrWoO+C5R/AMpmSHOBtj08
         i1mCPFyY3033pzzIEZL4CsmcRedeMYqvlITKaVIuXHg1/+1RcsX/xEqJp67LNqaF5vGu
         JR4gyOj6eyzCoGCrQBKtScvpySS+WGn8X/Bkpy8BYxJNlF6aWGiYp66w+8SqZ7/RrJKK
         7UDUln6hhANZ8P/v332favJ3giibq9Ta+0OrIA2BwVg54EAsJWKBy40xBSPJnN4A5woz
         z6PLBPpiIxQtyWxTDVcLrHVrBAZxl0Fh1wrjOj76gD1fv7aq6kNbqJJwuKLRUhYIm5wl
         aCeg==
X-Gm-Message-State: AOAM531VRbvh0laTkOUbvFTDfoqI4fO9zxXqW/vaJolgMrH7k472E3KH
        r192unSojN1lcPA4Y2BQyhqKcQ==
X-Google-Smtp-Source: ABdhPJzETaQNxPwlIydTejqSxt3WugkEgQ/tyv6cfpBtiz2lS9sBnVWygePdpPQKtmfM7lkIrgmNEg==
X-Received: by 2002:a05:6602:2c07:: with SMTP id w7mr1509605iov.53.1599614124651;
        Tue, 08 Sep 2020 18:15:24 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id i1sm460613ilk.39.2020.09.08.18.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 18:15:24 -0700 (PDT)
Subject: Re: [PATCH v6 00/20] gpio: cdev: add uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <CAMpxmJUETJgmxzWzHumOVr+vWFQ27P71MtcdSdf_=jvtrSfRPg@mail.gmail.com>
 <20200903083750.GA17445@sol> <20200904125250.GA323947@sol>
 <CAMpxmJWVZ8Bf1gPibvbk=E5XNvQ_i76E430MMhUWwE1ACoPTQg@mail.gmail.com>
 <9db62b42-9a1e-0264-e88c-e636004cb629@linuxfoundation.org>
 <CAMpxmJVbujnp+Z0b3utDsGmhUgCbhydorOo-9e-=gVctT55NAg@mail.gmail.com>
 <af4036b7-72b7-16f3-92de-4976b49d857e@linuxfoundation.org>
 <20200909010900.GA8496@sol>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a73a6956-d3c7-c54a-9f26-19cb33c9ad8d@linuxfoundation.org>
Date:   Tue, 8 Sep 2020 19:15:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909010900.GA8496@sol>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/8/20 7:09 PM, Kent Gibson wrote:
> On Tue, Sep 08, 2020 at 10:04:05AM -0600, Shuah Khan wrote:
>> On 9/8/20 9:54 AM, Bartosz Golaszewski wrote:
>>> On Tue, Sep 8, 2020 at 5:24 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>
>>>> On 9/4/20 7:02 AM, Bartosz Golaszewski wrote:
>>>>> On Fri, Sep 4, 2020 at 2:52 PM Kent Gibson <warthog618@gmail.com> wrote:
>>>>>>
>>>>>> On Thu, Sep 03, 2020 at 04:37:50PM +0800, Kent Gibson wrote:
>>>>>>> On Thu, Sep 03, 2020 at 10:02:04AM +0200, Bartosz Golaszewski wrote:
>>>>>>>> On Mon, Aug 31, 2020 at 5:21 AM Kent Gibson <warthog618@gmail.com> wrote:
>>>>>>>>>
>>>>>> [snip]
>>>>>>>>
>>>>>>>> To me it looks good, just a couple nits here and there and some questions.
>>>>>>>>
>>>>>>>> I think it's worth deciding whether we want to keep the selftests in
>>>>>>>> tools/testing/selftests/gpio/ and then maybe consider porting
>>>>>>>> gpio-mockup-chardev.c to V2 or simply outsource it entirely to
>>>>>>>> libgpiod.
>>>>>>>>
>>>>>>>
>>>>>>> Ooops - I wasn't even aware they existed - though it had crossed my mind
>>>>>>> that the kernel should have some selftests somewhere - I use the libgpiod
>>>>>>> tests, from my libgpiod port, and my own Go based test suite for my testing,
>>>>>>> as well as some smoke tests with the tools/gpio.
>>>>>>>
>>>>>>> The libgpiod tests only cover v1 equivalent functionality, while my Go
>>>>>>> tests cover the complete uAPI, and both v1 and v2.
>>>>>>>
>>>>>>> It would be good for the kernel to at least have some smoke tests to
>>>>>>> confirm basic functionality, even thorough testing is left to a
>>>>>>> userspace library.  So the existing tests should be ported to v2, though
>>>>>>> should also retain the v1 tests if v1 is still compiled in.
>>>>>>>
>>>>>>
>>>>>> I've got a v7 ready to submit that includes a couple of patches for the
>>>>>> gpio-mockup selftests (their primary purpose appears to be testing the
>>>>>> mockup module, rather than the GPIO ABI), but I now notice that the
>>>>>> selftests/gpio section of the tree has a different maintainer:
>>>>>>
>>>>>> scripts/get_maintainer.pl 0021-selftests-gpio-port-to-GPIO-uAPI-v2.patch
>>>>>> Bamvor Jian Zhang <bamv2005@gmail.com> (maintainer:GPIO MOCKUP DRIVER)
>>>>>> Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
>>>>>> linux-gpio@vger.kernel.org (open list:GPIO MOCKUP DRIVER)
>>>>>> linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
>>>>>> linux-kernel@vger.kernel.org (open list)
>>>>>
>>>>> Bamvor, Shuah: do you still have interest in maintaining these, or can
>>>>> we update MAINTAINERS?
>>>>>
>>>>
>>>> I maintain kselftests and gpio selftest falls under that. Please send
>>>> selftest patches to me so I can review them.
>>>>
>>>> As for the gpio mock driver and test itself, you will have to wait for
>>>> Bamvor to respond.
>>>>
>>>
>>> Hi Shuah,
>>>
>>> I've been de facto maintaining gpio-mockup for a couple years now.
>>> Bamvor has been quite inactive as far as gpio testing goes. I think
>>> it's fine if you ack the selftests changes.
>>>
>>
>> That is fine. I can do quick review and Ack so you can take them
>> through gpio tree.
>>
>>> In fact: I don't want selftests to block getting V2 uAPI upstream so
>>> if that'll look like it's going to take more time then I'm for merging
>>> V2 without any changes to selftests - in the end we have tests in
>>> user-space already.
>>>
>>
>> Tests and features go through subsystem trees to avoid delays. Please
>> make sure the test doesn't break the default kselftest build/run.
>>
>> In the future it would help if you include all the maintainers on the
>> patch series, so I can review the tests from the framework angle to
>> see if they build/run correctly.
>>
> 
> To clarify, the patches have been submitted to the correct maintainers.
> While this v6, and those before, inadvertently broke the gpio selftests
> by removing code they depend on, there have been no code changes in the
> selftest tree, and so nothing for you to review.  The v7 of this series
> restored the functions that the selftests use so that they again build
> and run - still nothing for you to review.
> 

> While I had patches for the selftests available for v7, I pulled them
> from the patch series as I didn't want to bother you or Bamvor with the
> other patches that you wouldn't be interested in.  Further, the gpio
> selftests are intended to test the gpio-mockup, as evidenced by Bamvor
> being their maintainer and the code itself.  There have been no changes
> to the mockup here, and the existing selftests remain valid without being
> ported to the latest GPIO uAPI.  Porting them to the latest uAPI, and then
> removing the resulting dead code from tools/gpio, is a nice to have that
> can wait and shouldn't block getting the uAPI changes in tree.
> 

Thanks for the clarification.

-- Shuah

