Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74EF34EB04C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 17:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235993AbiC2P2b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 11:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233601AbiC2P2b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 11:28:31 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4E7DA6D3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 08:26:47 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id i4so6533616wrb.5
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9rnzttnh0eyZI0/9doT4DorkVWzGXl/0H5t199cz9CU=;
        b=K2GwhviJhrN0Oii4PCTIzygvOyHQEF//Vp3RcmcKUYEveamUgXnQzWFJllGq+GtUHk
         F8N+6LGxnH8HdKdf+6SgJhQQUnDXmCqZ3ge6JW78orJUFUQlF2n0q+zA8mPpKhjloCUi
         0M+1NUFLcs9rzyHfed4mQFh127pjA0nbfYBQEJFwvi1a+08n1Ti280mTLrhn5VV5ctmo
         pxut0L8SU0qBb6Coe+60g0oQgkv+FwdItVYlWBXTyBjSuyioYfi6oAUmw4ds+cjY4ZQy
         pkCF/OnzI/+uXLvL6baT7bgJU+BOKe2JQXZ0GACuhhEfc4EAuTtl9flXK3v1zlgy1FXj
         b3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9rnzttnh0eyZI0/9doT4DorkVWzGXl/0H5t199cz9CU=;
        b=a8X21G3zmRj6HfVRCSI/wwXLD+YQzbi5l40z1tCyqasHQUveRsuXegeuB/yEOjfEeg
         GeJ02D9ApYTqlUd6G29b0d+0h4a42OQwsgdpHCVZQMW1RR1vyACLPzqtWFTGOank/Bih
         n1tuwkUJlAIS2NZnGhq4Bwbt700LArHwoecxOlF+qP8LtI5LAAt21hhdkeEWqQYKuwnh
         Tn9Gw2KXd2iyYHsftSBzKveBz2635ipVm+s8t8KoRY05CLG/Dr5jR2oa9W/OIBRVzfWC
         vPGWnjcX0cg8iZV1ZXekSlGV0JuMy6HcIGc/xacfjiTSpKxJOkNApPbXJMoVVrA5pSbE
         v0rQ==
X-Gm-Message-State: AOAM533ej7N1P8XT21NhuhsaONnM/G3NQR4oD45XZL+v3VEaVAkIoiGQ
        CAMGshjas4HlpP77fkUuHo0=
X-Google-Smtp-Source: ABdhPJzBEgcUC7XltUgAHrla5K9T8JZOMbU05vbesQwkMv+nMNkHXFWE+e67wezNgpD3UOeojUuiyA==
X-Received: by 2002:a5d:5507:0:b0:203:e0a3:7016 with SMTP id b7-20020a5d5507000000b00203e0a37016mr30761124wrv.575.1648567606371;
        Tue, 29 Mar 2022 08:26:46 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id e8-20020a056000178800b00203da3bb4d2sm17275510wrg.41.2022.03.29.08.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 08:26:46 -0700 (PDT)
Message-ID: <29c34c53-9a26-c4dc-41ae-fc7cc1cff883@gmail.com>
Date:   Tue, 29 Mar 2022 17:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Edit/gpiomon: Question about mode
Content-Language: fr
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
References: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
 <c02dbd80-5971-7319-17ad-acba33c10da6@gmail.com> <20220329033840.GA14149@sol>
 <425f4895-81a9-719a-be74-4c67f9c35b92@gmail.com> <20220329083823.GA94201@sol>
 <3d6f8156-fcf0-21cf-c9bc-6543d982e89a@gmail.com>
 <20220329085108.GA114462@sol>
 <71eccedc-5bc1-e4f3-06c8-87b1127e1261@gmail.com>
 <28ae22ab-935e-5756-5caa-c8ed7274a123@gmail.com>
 <20220329152505.GA379693@sol>
From:   Hans Kurscheidt <lve0200@gmail.com>
In-Reply-To: <20220329152505.GA379693@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Am 29.03.2022 um 17:25 schrieb Kent Gibson:
> On Tue, Mar 29, 2022 at 03:56:36PM +0200, Hans Kurscheidt wrote:
>> Am 29.03.2022 um 15:37 schrieb Hans Kurscheidt:
>>> Am 29.03.2022 um 10:51 schrieb Kent Gibson:
>>>> On Tue, Mar 29, 2022 at 10:43:19AM +0200, Hans Kurscheidt wrote:
>>>>> Am 29.03.2022 um 10:38 schrieb Kent Gibson:
>>>>>> On Tue, Mar 29, 2022 at 10:07:57AM +0200, Hans Kurscheidt wrote:
>>>>>>> Am 29.03.2022 um 05:38 schrieb Kent Gibson:
>>>>>>>> On Mon, Mar 28, 2022 at 07:13:13PM +0200, Hans Kurscheidt wrote:
>>>>>>>>> Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> what would be the right mode for gpiomon call from
>>>>>>>>>>
>>>>>>>>>> a shellscript executed as root from systemd at system start
>>>>>>>>>>
>>>>>>>>>> waiting on a Pin w/ pullup for invoking
>>>>>>>>>> shutdown upon rising* edge.
>>>>>>>>>> *changed
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Lots of interupts, Signals and other GPIO
>>>>>>>>>> ongoing from other user APPs &
>>>>>>>>>> threads in multi-user state.
>>>>>>>>> 2b more precise: I wired a GPIO Pin to GND.
>>>>>>>>>
>>>>>>>>> Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>
>>>>>>>>>
>>>>>>>>> the program exits immediately with 1 event,
>>>>>>>>> although there was never a
>>>>>>>>> rising edge due to the fix wire to GND. Is this
>>>>>>>>> a feature or a bug, and is
>>>>>>>>> it reproducible?
>>>>>>>>>
>>>>>>>> Not a feature and not reproducible for me on a
>>>>>>>> Raspberry Pi4 with the
>>>>>>>> setup you describe, so probably a bug specific to
>>>>>>>> your hardware platform,
>>>>>>>> whatever that may be.
>>>>>>>>
>>>>>>>> If it is 100% reproduceable for you, and assuming it
>>>>>>>> is an initialisation
>>>>>>>> issue so you only get the one spurious event, how
>>>>>>>> about using -n2 as a
>>>>>>>> workaround ;-)?
>>>>>>>>
>>>>>>>> Cheers,
>>>>>>>> Kent.
>>>>>>> It appears 2b reproduceable 100% on my OrangePi zero+
>>>>>>> (Allwinner H5) and
>>>>>>> using -n2 does the trick, but isn't gpiod not supposed to work on all
>>>>>>> commercial HW platforms and related kernels, rather then
>>>>>>> only on RPI??
>>>>>>>
>>>>>> gpiod will work on any platform with a supporting kernel.
>>>>>> How well depends on the underlying hardware and driver.
>>>>>> The RPi4 was merely a counter-example demonstrating that your issue is
>>>>>> not universal, using hardware I happen to have readily available.
>>>>>>
>>>>>> Cheers,
>>>>>> Kent.
>>>>> So if I understand you right, gpiod works on sort of a logical
>>>>> level, while
>>>>> the HW dependend part depends of the kernel driver
>>>>> implementation of the
>>>>> specific HW?
>>>>>
>>>>>
>>>> libgpiod is a userspace library and tools to access GPIO lines via the
>>>> Linux GPIO character device.  The actual interfacing to the hardware is
>>>> performed by the kernel and appropriate drivers for your hardware.
>>>> As your problem does not exhibit on other hardware, the root cause
>>>> of your problem probably lies in the driver for your hardware, not in
>>>> libgpiod nor the gpiolib subsystem of the kernel.
>>>>
>>>> But you would need to debug it further to be sure.
>>>>
>>>> Cheers,
>>>> Kent.
>>> I raised a bug report at tha Armbian forum:
>>>
>>> https://forum.armbian.com/topic/20166-opi-zero-h5-gpiodmon-generates-spurious-interrupts-upon-invocation/
>>>
>>>
>>>
>>> I made some trial to understand if it is reproduceable, but I have
>>> difficulties defining, when it happens. After RESET there is no spurious
>>> event. The spurious event appears to happen, when the line was moved:
>>>
>>> Could you please make another trial on your RPI w/ the following
>>> sequence:
>>>
>>> RESET, gpiomon -r -n1 -Bpull-up <chip><line>  => No event,  -> pull line
>>> up /down, => event (as expected), gpiomon -r -n1 -Bpull-up <chip><line>
>>> => false event
>>>
>>> There might be an issue w/ pending interrupts, when the line is bouncing
>>> when pulled up/down. The 2nd gpiodmon cmd might catch one of the pending
>>> interrupts. (Just an idea). This would hint to an initialisation
>>> problem, that pending line states are not preempted, before the int is
>>> attached.
>>>
>> sorry, 1 more thing,f I just let the line go up (by pull-up) and leave it
>> "1", I get continuous false events on every gpiomon... cmd, just like "level
>> interrupts"
>>
>>
> And one more thing - your external pull-down has to be stronger
> than the internal pull-up, else the two will will contend and leave your
> line in a logical no man's land.  In my testing I pulled the line
> directly to ground as I'm not sure how strong the internal pull-ups are
> on the RPi and didn't want to expend time hunting for an appropriately
> sized resistor anyway.
>
> Cheers,
> Kent.
That's what i did, I used a patch wire directly from the GPIO pin to  
the GND Pin
>
