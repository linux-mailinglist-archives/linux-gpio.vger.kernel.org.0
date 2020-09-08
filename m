Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DE0261CC5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 21:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731075AbgIHT0Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 15:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731032AbgIHQAg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 12:00:36 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65741C0612FC
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 08:25:00 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id g26so1000544ooa.9
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G6ViLODgIVrthYfKcZQ7FI0bgtyUL4tDP++rqJGkVeI=;
        b=iarUR/yb8+vhpB9MCNX6sNi5tVLKL2hEF2c1YCH4ZGlP4A40m00LY0Zan7YWLCbFRG
         iWHZSUVOrXv0/h/LB4Su9Vv8y7LSofbP/248L+GszV9UVPREAJfzDqoWiASfyTqkZGBL
         KtfIvLB+ozrc3BjhRT6aaqpOKhEpTc5jQbkB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G6ViLODgIVrthYfKcZQ7FI0bgtyUL4tDP++rqJGkVeI=;
        b=gMKNduCRdXJb0OAyQPg2/3EBxa7enH/3LbveuGBwDNZiovmH9/uj/U+cbN+5wzmQNX
         Ea2rkjj5UnzdK2HhJCn0bC9iUQb4hEEEkSJyEYDjZ0s5g25ZNZUlvaQ82zRlaCADfCsN
         3CjL4G3OXv3/Bc82x4hJ9+fFphyIIn5bB+56t9vBSE9yOh2/bFyeY2qwbiSlhdq+s6LH
         /KDiljQr2tLT9eS85JdAVt7dALWGnATL4YhpOeSF9YnDoFbKvr3AwE0GfaqJ8c+VOl/u
         zojwDWHu0CKoJrrfsm/ADMKOvP1GAMOej7q4FCbjMZcIMAmxvagUD2i4lgJRmoZSDHSu
         HIDA==
X-Gm-Message-State: AOAM531mKsPVYXL5tkji0zrgdhPPA1lhTj/UqViOeb3bx9b+Y7J4ZGe9
        E4HMQqPjxIqG1Uuz0UHXsjqiTLvr7D/F9g==
X-Google-Smtp-Source: ABdhPJz0UryFsak7mYC/o6Xu1t/X6pyxx8YadpYswTqzZPW/lHGfpm0d5irxqSu6eKaOpBwWpU7mpg==
X-Received: by 2002:a4a:81:: with SMTP id 123mr18910109ooh.80.1599578697111;
        Tue, 08 Sep 2020 08:24:57 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id q14sm162188ota.41.2020.09.08.08.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 08:24:56 -0700 (PDT)
Subject: Re: [PATCH v6 00/20] gpio: cdev: add uAPI v2
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <CAMpxmJUETJgmxzWzHumOVr+vWFQ27P71MtcdSdf_=jvtrSfRPg@mail.gmail.com>
 <20200903083750.GA17445@sol> <20200904125250.GA323947@sol>
 <CAMpxmJWVZ8Bf1gPibvbk=E5XNvQ_i76E430MMhUWwE1ACoPTQg@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9db62b42-9a1e-0264-e88c-e636004cb629@linuxfoundation.org>
Date:   Tue, 8 Sep 2020 09:24:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJWVZ8Bf1gPibvbk=E5XNvQ_i76E430MMhUWwE1ACoPTQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/4/20 7:02 AM, Bartosz Golaszewski wrote:
> On Fri, Sep 4, 2020 at 2:52 PM Kent Gibson <warthog618@gmail.com> wrote:
>>
>> On Thu, Sep 03, 2020 at 04:37:50PM +0800, Kent Gibson wrote:
>>> On Thu, Sep 03, 2020 at 10:02:04AM +0200, Bartosz Golaszewski wrote:
>>>> On Mon, Aug 31, 2020 at 5:21 AM Kent Gibson <warthog618@gmail.com> wrote:
>>>>>
>> [snip]
>>>>
>>>> To me it looks good, just a couple nits here and there and some questions.
>>>>
>>>> I think it's worth deciding whether we want to keep the selftests in
>>>> tools/testing/selftests/gpio/ and then maybe consider porting
>>>> gpio-mockup-chardev.c to V2 or simply outsource it entirely to
>>>> libgpiod.
>>>>
>>>
>>> Ooops - I wasn't even aware they existed - though it had crossed my mind
>>> that the kernel should have some selftests somewhere - I use the libgpiod
>>> tests, from my libgpiod port, and my own Go based test suite for my testing,
>>> as well as some smoke tests with the tools/gpio.
>>>
>>> The libgpiod tests only cover v1 equivalent functionality, while my Go
>>> tests cover the complete uAPI, and both v1 and v2.
>>>
>>> It would be good for the kernel to at least have some smoke tests to
>>> confirm basic functionality, even thorough testing is left to a
>>> userspace library.  So the existing tests should be ported to v2, though
>>> should also retain the v1 tests if v1 is still compiled in.
>>>
>>
>> I've got a v7 ready to submit that includes a couple of patches for the
>> gpio-mockup selftests (their primary purpose appears to be testing the
>> mockup module, rather than the GPIO ABI), but I now notice that the
>> selftests/gpio section of the tree has a different maintainer:
>>
>> scripts/get_maintainer.pl 0021-selftests-gpio-port-to-GPIO-uAPI-v2.patch
>> Bamvor Jian Zhang <bamv2005@gmail.com> (maintainer:GPIO MOCKUP DRIVER)
>> Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
>> linux-gpio@vger.kernel.org (open list:GPIO MOCKUP DRIVER)
>> linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
>> linux-kernel@vger.kernel.org (open list)
> 
> Bamvor, Shuah: do you still have interest in maintaining these, or can
> we update MAINTAINERS?
> 

I maintain kselftests and gpio selftest falls under that. Please send
selftest patches to me so I can review them.

As for the gpio mock driver and test itself, you will have to wait for
Bamvor to respond.

>>
>> The v7 patch up to that point restores the functions that the selftests
>> are using so that they build and run again.

This test has been problematic because of its dependency on tools/gpio.

>> So I should hold off on the selftest patches and submit them separately
>> after the GPIO changes are in?
>>

Please send me the selftest patches. Also see the comments in
selftests/Makefile about excluding the gpio test from default run.

thanks,
-- Shuah


