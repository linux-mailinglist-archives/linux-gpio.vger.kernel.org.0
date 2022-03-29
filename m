Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C064EAA01
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 11:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbiC2JEs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 05:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiC2JEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 05:04:47 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC304241A12
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 02:03:04 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j18so23760896wrd.6
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 02:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GcdJM2V/svapdpQ6dIf3sylO9+ETZa0HeWyNvOVMs30=;
        b=RO87GOqcHbjfCPjs1+UKjDVTt4CaImmkULZ4OPPAgYiRIRdYtkCzFYTz6zm7aGwSL1
         mktKT7YS/d3bCnu8Mo7AL9LUUKiEfiRtU12QZDhSfImJO/MTRTct6CdIwuioU3+dBtmb
         n7cVgX04VboKxTYEQRx5JZFtBOHxVbrZQWPCn5KaoIaDhXTOLq7dCw5zhypw5fLU8x+I
         UJD+uRCVHqvPqfRDmkHNH4apuQdduvqAYEopt/iEewhp53ubobqD+beQ+JfRZiSjrhfk
         zD2DogilaPj9Nz+t4piVumaBM/hswd9ItenSr1PtcHcKWetG+vOUt9ycLNQSCfMSl9Pg
         Dfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GcdJM2V/svapdpQ6dIf3sylO9+ETZa0HeWyNvOVMs30=;
        b=2VR3gOcZMT2Q1ra0lGqB+VJ5uE22Ab0ofkPAxnaWLpfTYBm8uMsVnNL6KMfqvhUz+c
         LKE8qinPZVTax/31omWzn1mWVGwvgMIKJn6T37ScnrBt3qE3TaYXvN3dROLzCwxA+oha
         HoFqZqhfcha6Tx1qcEXVwckZRijOwXcMTesWb5SoR9KJQWlMjHPcCvhGuHSMocvNmNRd
         Kswy4Z899B/TPe+5/pyCBAliRbz6URyrFUVx7z0mFnHhcQDkteAt0HfZh+4XvOdV034R
         KY8i/kUTXLVB7TcYZjPKUNTt4i5nLkndjhJ4umzi2LzMdqGnYO411OVwlo6rNY1XnmZR
         FQPg==
X-Gm-Message-State: AOAM530zyziGLgA4dR9exIFbUNdAqrBh/JWdOgiIDDyUSF/DBNM+tmle
        tMvy3cEJRb/pG17V9xMPmbU=
X-Google-Smtp-Source: ABdhPJyMRrjmlwu9q/7D7Jo39LGfURnTU7UNXKM+8nF8dat9KZBdEmZGnKqotRcipGYTzN4tu9HfOA==
X-Received: by 2002:a5d:4245:0:b0:203:dc49:2604 with SMTP id s5-20020a5d4245000000b00203dc492604mr31008343wrr.32.1648544583048;
        Tue, 29 Mar 2022 02:03:03 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id i5-20020adfaac5000000b00203fd04bf86sm14257558wrc.66.2022.03.29.02.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 02:03:02 -0700 (PDT)
Message-ID: <0fbe9368-ad2c-b3ea-0a2e-f7afbbd278ba@gmail.com>
Date:   Tue, 29 Mar 2022 11:03:03 +0200
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
Content-Transfer-Encoding: 7bit
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


OK, thank's. I'll raise a bug report for the OPI kernel guys in the 
ARMBIAN forum.

