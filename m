Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9864EA982
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 10:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbiC2IpG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 04:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbiC2IpF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 04:45:05 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DFDE0A5
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 01:43:21 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b19so23675236wrh.11
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 01:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/fEPriuYNEg7n46506lVy7FYCPiqtShutw5kyka3LgI=;
        b=W36nqCdM3hY/hcir9zHk7UR4dyPXGpOftFcmzWfUPOF5wHeZLW0lGRAWIxqctzlifT
         XcIi6Y1I1LwTr/dl0LFjdzqxrithlrOIVpKzsDj58o4XfLkBAY/DiU0fjGGoimgndzqt
         pSMZQXTZj3dXJFhqUZzVz6S/Z7jIuA70/1keIH8dOEGAtt0Cl0JJuMaH+v2epZcM+9cj
         7Lc6sjtksuiCEjhXOMBZbwaOxo9OiWWxPwG9d4h63cVZ8oHRmb70CBLbhGAd4qboNJZ5
         xXIpaXYfnZEsfO7PSEDG25rJfMzTMjcWSsGp5td7+7j+3EVSK/ojDeuq1W01MWT7AJru
         DGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/fEPriuYNEg7n46506lVy7FYCPiqtShutw5kyka3LgI=;
        b=TFer/w9Sz40DRGLtdxgHZ2EeDSMxM/k7d9BWecIbbCVw5Y/2ZopqXij967TXbUynov
         Ri/p20imbkMoEHrscWiwOWltTcg2o0v8iTASUv3CpL1wW7FCYjFPME/p0G+vOIWFGPG4
         AC3Qo3hDFMEFhBijnHpMYgsHT8E0rVTz2PbOqg4gFtAGOg2IFXbjTeOgGvLsaypIZxAY
         QvR8rStQ9YT15zDi/spi91dauCk5YrTVpPcRWTacb+uD8mrTQNRIeZsy9cZDpMsYGF2D
         O+kh7ZegL04v9hnzbVsJMT91lpPNPmDFostBrFNUODgwfzsV0KbGFCBQWGo2DxXzHpFd
         Y/iw==
X-Gm-Message-State: AOAM533WXqxcTKC7PohhUNBHtvTyDeutBDd22AXCs9fQt31WqiacgVEG
        V5AabCVMLdn9UrhCqJE7w8H0mXS2P+Zw6w==
X-Google-Smtp-Source: ABdhPJzgUsiAxnG95d8q1QEkUJ2WUpFjwSH2OJT0mHbbUWHVFa4zJaw6T//mXJeuhZIM9/tNXaPX+w==
X-Received: by 2002:a5d:4310:0:b0:1ef:fb60:e1d8 with SMTP id h16-20020a5d4310000000b001effb60e1d8mr29404540wrq.92.1648543400032;
        Tue, 29 Mar 2022 01:43:20 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id 2-20020a1c1902000000b00380d3873d6asm1633197wmz.43.2022.03.29.01.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 01:43:19 -0700 (PDT)
Message-ID: <3d6f8156-fcf0-21cf-c9bc-6543d982e89a@gmail.com>
Date:   Tue, 29 Mar 2022 10:43:19 +0200
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
From:   Hans Kurscheidt <lve0200@gmail.com>
In-Reply-To: <20220329083823.GA94201@sol>
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


Am 29.03.2022 um 10:38 schrieb Kent Gibson:
> On Tue, Mar 29, 2022 at 10:07:57AM +0200, Hans Kurscheidt wrote:
>> Am 29.03.2022 um 05:38 schrieb Kent Gibson:
>>> On Mon, Mar 28, 2022 at 07:13:13PM +0200, Hans Kurscheidt wrote:
>>>> Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
>>>>> Hi,
>>>>>
>>>>> what would be the right mode for gpiomon call from
>>>>>
>>>>> a shellscript executed as root from systemd at system start
>>>>>
>>>>> waiting on a Pin w/ pullup for invoking shutdown upon rising* edge.
>>>>> *changed
>>>>>
>>>>>
>>>>> Lots of interupts, Signals and other GPIO ongoing from other user APPs &
>>>>> threads in multi-user state.
>>>> 2b more precise: I wired a GPIO Pin to GND.
>>>>
>>>> Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>
>>>>
>>>> the program exits immediately with 1 event, although there was never a
>>>> rising edge due to the fix wire to GND. Is this a feature or a bug, and is
>>>> it reproducible?
>>>>
>>> Not a feature and not reproducible for me on a Raspberry Pi4 with the
>>> setup you describe, so probably a bug specific to your hardware platform,
>>> whatever that may be.
>>>
>>> If it is 100% reproduceable for you, and assuming it is an initialisation
>>> issue so you only get the one spurious event, how about using -n2 as a
>>> workaround ;-)?
>>>
>>> Cheers,
>>> Kent.
>> It appears 2b reproduceable 100% on my OrangePi zero+ (Allwinner H5) and
>> using -n2 does the trick, but isn't gpiod not supposed to work on all
>> commercial HW platforms and related kernels, rather then only on RPI??
>>
> gpiod will work on any platform with a supporting kernel.
> How well depends on the underlying hardware and driver.
> The RPi4 was merely a counter-example demonstrating that your issue is
> not universal, using hardware I happen to have readily available.
>
> Cheers,
> Kent.

So if I understand you right, gpiod works on sort of a logical level, 
while the HW dependend part depends of the kernel driver implementation 
of the specific HW?


