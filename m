Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5644E4E3AD4
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 09:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbiCVIlX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 04:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbiCVIlV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 04:41:21 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448B125D8
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 01:39:54 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u3so738857wrg.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 01:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=nR/9rfrUEHr0BxBV8rWHiOnIqvdDlhAk8W8Oj0Qc3ZE=;
        b=DZRfwMbEeAK7AP8co37P+oAsRE1rzABETejN3rcw1tVQadYKLYHLx22odOlit8MR/e
         GFCjjPehOkkj81ZLoEHiiELfeF/fBLPSqSsYtpWJfsyDqxO8+Iur8HFAoauA1GIWLJf9
         1KBLNkKQ/A0SVD+suYWRxpj30sRMmrsNScx0JpJaiDnUJUO4LFwD0DrKkC1bRBI8lkiK
         KUkoVwknS3vhMb6L/Br+018tYwoJxgqn9bh0NZvtdJNp1JQqg/BgyQ6RlnNAf0chAYl/
         PRuPBuvrbhnFm6UilwLTYtzYWFRB2qGty5SaRjW+cspIa8giKnoNOA6u8/478AM14TdD
         vdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=nR/9rfrUEHr0BxBV8rWHiOnIqvdDlhAk8W8Oj0Qc3ZE=;
        b=lvT05Q9lsg8dpziwqdGB6ufKW7wNeKqaL1R4C02WaIshLsGQ6tYpXCa5TxH1UDVI4N
         3ur20QuYEIx0BhVztIalQQibSxM+X9d0Mqn61aman4VPdbkJpdXfpWYRLloWSiKN3/VF
         aJe+ZbMRnBRgrp8bVRgN7Zram/kucDnnZotGU7CC6hZ4U5IoDvCGbskJPRVwTvyGIF2N
         2k+alMlt43Oy2lEBQ7OFrl0oIQC6ZveQK1EY8fXfTi0VBl2H/ZCdw2EyDRn45pjD6GVl
         cpS2obOYFgC+hEkYBZzUnjJ7q/w60RottL+k5DtPlkZkANk4mSz7/wZKEIJKs76LmoYk
         4khw==
X-Gm-Message-State: AOAM5304sFRi8rCNUWRb022YzwGiTf/VtRNSIJmot9y/lMaqJO6jrz2L
        3ya+059M3mtg+4CoLZMX/i8=
X-Google-Smtp-Source: ABdhPJwRpDg5mQ6kJ0zXmduL0hyiBkxpszcNIm2SPqiYNB/FVRPJ8iavLeF3KSVEfc/zy7yXJsa7MA==
X-Received: by 2002:a5d:5849:0:b0:1ef:f98a:5406 with SMTP id i9-20020a5d5849000000b001eff98a5406mr22120627wrf.8.1647938392693;
        Tue, 22 Mar 2022 01:39:52 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id m24-20020a05600c3b1800b0038cb67abbdbsm1259806wms.0.2022.03.22.01.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 01:39:52 -0700 (PDT)
Message-ID: <154df196-d9d2-63dc-b5e4-b314933db4b2@gmail.com>
Date:   Tue, 22 Mar 2022 09:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: gpiod: Set pullup for Input Line
Content-Language: fr
From:   Hans Kurscheidt <lve0200@gmail.com>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
 <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
 <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
 <20220322005911.GA6650@sol> <1a7fd31a-221e-7b23-b95f-d71e440b3ff0@gmail.com>
In-Reply-To: <1a7fd31a-221e-7b23-b95f-d71e440b3ff0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SCC_BODY_URI_ONLY,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Am 22.03.2022 um 09:36 schrieb Hans Kurscheidt:
>
>
> Am 22.03.2022 um 01:59 schrieb Kent Gibson:
>> On Mon, Mar 21, 2022 at 07:33:28PM +0200, Andy Shevchenko wrote:
>>> On Mon, Mar 21, 2022 at 7:27 PM Hans Kurscheidt<lve0200@gmail.com>  wrote:
>>>> Hi thanks, that makes hope.
>>> First of all, please do not top-post.
>>>
>>>> Unfortunately apt-get gpiod on my OrangePi Armbian board gives me
>>>> version 1.2, while the dev is already at 1.6. I probably have to build
>>>> it from source.
>>>>
>>>> Keeping fingers crossed .
>>> I don't remember the details of old versions of libgpiod (Bart? Kent?)
>>> I think it was available even there.
>>>
>> Bias support was added in libgpiod v1.5.
>> It wasn't even exposed in the uAPI prior to that - it wasn't added until
>> kernel v5.5.
>>
>> In this case building the latest stable, 1.6.3, is the way to go.
>>
>> Cheers,
>> Kent.
>>
>>>> Am 21.03.2022 um 17:26 schrieb Andy Shevchenko:
>>>>> On Mon, Mar 21, 2022 at 1:30 PM Hans Kurscheidt<lve0200@gmail.com>  wrote:
>>>>>> Despite deep searching, I cannot find any information, if gpiod allow
>>>>>> specifying pull-ups to input lines and how to do/handle it.
>>>>> Have you followed this code from libgpiod?
>>>>> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpioset.c#n44
>>> -- 
>>> With Best Regards,
>>> Andy Shevchenko
>
> Thank-you Kent!
>
> Still 1 more question. I understand the sense of a Pull-up in Input 
> mode, but reading the code, I see that the Bias option exists as well 
> for gpioset (Output). What is the sense of this, and what does it do?
>
> WRT. building it, it wasn't that straight forward, as in the 
> description. On the Armbian/Debian buster Kernel 5.10.60-sunxi64 
> #21.08.1 I had to create an M4 dir, install GNU-archives and install 
> libtools in addition to succeed building it. Then doxygen and help2man 
> were still missing.
>
> All the best and thank you again, for solving my problem!
>
> Hans
>
