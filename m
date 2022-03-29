Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C684EAE9E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 15:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbiC2NjM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 09:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235710AbiC2NjL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 09:39:11 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120C64D610
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 06:37:29 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l7-20020a05600c1d0700b0038c99618859so1265664wms.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 06:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9R2sJTBca2WJ6M3hbxU4RyuTCQr+7boEcxqfz7BtZPw=;
        b=DEzSeux6wlFao4Rx+Y8OIrFJC10nNtCwAwTkl4n+hbO5mUV9DO9PB+3JVvARj1J8h+
         wx2onfwTkggJSGKti2egPQtx9XMWkTlI2oTLAC9IllI8b5A/pHSVOlGbgqiiduTVxdZt
         oOuSjLgjRNAV1g8vXC3T4N2rXaxSH/MG4K2tnv9mjC4KNeZd1osP3kF85Ms6f7fhQpRz
         R1aa5xl1MnFk2GRmkTWm7jSh8hv/uhe8jQ0xOWBfTnF05PrJiMQ4Spt3/VjaAoLQgGI5
         iv1e5LWeH9Z5HxcXL7gJSFHpac6WeJObNSSlIRins9BpNpBksgGBst/Gzg8JRO6mCvqR
         79Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9R2sJTBca2WJ6M3hbxU4RyuTCQr+7boEcxqfz7BtZPw=;
        b=hXz/bI1sEhsTrbE8nL+glx1LIxJV6mRgC1Awq9orOvSLDTttUTAyn8v8vnhL9GGWyz
         3Tp9eT8+ONYe2vosWADdPK+A2P28+pyfiVtZcx97mAynZSY8B6127LENTGVffXhABusM
         A7mxGPZr/HBwhWF3DzNk2MOIkJCKBiXaDroHYKSZHwZBov8OMTFuQuXqHkqBz/INeSVg
         6pMcQTfjVxgr2Bdv4zhKA0Q3SO36Nz1IqH7AOECOwCYi+YDTkjXlg/B6IxmyTNgn1+g4
         dWbVwY+QNaokYq41EaLC2OjhPWIcvnKKGw4TfpT6n4ZZ/eyN9K2b5pX1P7Ip70Aqn0Z5
         SxXA==
X-Gm-Message-State: AOAM533TIsBAua+1AdoLDDioJnIiijqGNyxHAr3MBgfg0FVcZvVDM7Wi
        QPyaX+3oxbbaJeF219MgcoHXAOE8l/Jciw==
X-Google-Smtp-Source: ABdhPJz5DxKrkTVY/uBmc3LN0kAjq5kppbmgp8PAExzxaLHgHGq7ql35kjGgtOWquJm+sph3hKFRWQ==
X-Received: by 2002:a1c:f211:0:b0:381:6c60:742f with SMTP id s17-20020a1cf211000000b003816c60742fmr7171190wmc.130.1648561047436;
        Tue, 29 Mar 2022 06:37:27 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id e8-20020a05600c2dc800b0038d05f2b34dsm2990259wmh.2.2022.03.29.06.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 06:37:26 -0700 (PDT)
Message-ID: <71eccedc-5bc1-e4f3-06c8-87b1127e1261@gmail.com>
Date:   Tue, 29 Mar 2022 15:37:25 +0200
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
From:   Hans Kurscheidt <lve0200@gmail.com>
In-Reply-To: <20220329085108.GA114462@sol>
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


Am 29.03.2022 um 10:51 schrieb Kent Gibson:
> On Tue, Mar 29, 2022 at 10:43:19AM +0200, Hans Kurscheidt wrote:
>> Am 29.03.2022 um 10:38 schrieb Kent Gibson:
>>> On Tue, Mar 29, 2022 at 10:07:57AM +0200, Hans Kurscheidt wrote:
>>>> Am 29.03.2022 um 05:38 schrieb Kent Gibson:
>>>>> On Mon, Mar 28, 2022 at 07:13:13PM +0200, Hans Kurscheidt wrote:
>>>>>> Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
>>>>>>> Hi,
>>>>>>>
>>>>>>> what would be the right mode for gpiomon call from
>>>>>>>
>>>>>>> a shellscript executed as root from systemd at system start
>>>>>>>
>>>>>>> waiting on a Pin w/ pullup for invoking shutdown upon rising* edge.
>>>>>>> *changed
>>>>>>>
>>>>>>>
>>>>>>> Lots of interupts, Signals and other GPIO ongoing from other user APPs &
>>>>>>> threads in multi-user state.
>>>>>> 2b more precise: I wired a GPIO Pin to GND.
>>>>>>
>>>>>> Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>
>>>>>>
>>>>>> the program exits immediately with 1 event, although there was never a
>>>>>> rising edge due to the fix wire to GND. Is this a feature or a bug, and is
>>>>>> it reproducible?
>>>>>>
>>>>> Not a feature and not reproducible for me on a Raspberry Pi4 with the
>>>>> setup you describe, so probably a bug specific to your hardware platform,
>>>>> whatever that may be.
>>>>>
>>>>> If it is 100% reproduceable for you, and assuming it is an initialisation
>>>>> issue so you only get the one spurious event, how about using -n2 as a
>>>>> workaround ;-)?
>>>>>
>>>>> Cheers,
>>>>> Kent.
>>>> It appears 2b reproduceable 100% on my OrangePi zero+ (Allwinner H5) and
>>>> using -n2 does the trick, but isn't gpiod not supposed to work on all
>>>> commercial HW platforms and related kernels, rather then only on RPI??
>>>>
>>> gpiod will work on any platform with a supporting kernel.
>>> How well depends on the underlying hardware and driver.
>>> The RPi4 was merely a counter-example demonstrating that your issue is
>>> not universal, using hardware I happen to have readily available.
>>>
>>> Cheers,
>>> Kent.
>> So if I understand you right, gpiod works on sort of a logical level, while
>> the HW dependend part depends of the kernel driver implementation of the
>> specific HW?
>>
>>
> libgpiod is a userspace library and tools to access GPIO lines via the
> Linux GPIO character device.  The actual interfacing to the hardware is
> performed by the kernel and appropriate drivers for your hardware.
> As your problem does not exhibit on other hardware, the root cause
> of your problem probably lies in the driver for your hardware, not in
> libgpiod nor the gpiolib subsystem of the kernel.
>
> But you would need to debug it further to be sure.
>
> Cheers,
> Kent.

I raised a bug report at tha Armbian forum:

https://forum.armbian.com/topic/20166-opi-zero-h5-gpiodmon-generates-spurious-interrupts-upon-invocation/


I made some trial to understand if it is reproduceable, but I have 
difficulties defining, when it happens. After RESET there is no spurious 
event. The spurious event appears to happen, when the line was moved:

Could you please make another trial on your RPI w/ the following sequence:

RESET, gpiomon -r -n1 -Bpull-up <chip><line>  => No event,  -> pull line 
up /down, => event (as expected), gpiomon -r -n1 -Bpull-up <chip><line> 
=> false event

There might be an issue w/ pending interrupts, when the line is bouncing 
when pulled up/down. The 2nd gpiodmon cmd might catch one of the pending 
interrupts. (Just an idea). This would hint to an initialisation 
problem, that pending line states are not preempted, before the int is 
attached.


