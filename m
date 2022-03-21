Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125334E2FD2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Mar 2022 19:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352060AbiCUSWo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 14:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352065AbiCUSWn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 14:22:43 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B938C515A7
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 11:21:17 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id p5so10081773pfo.5
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Sm/juE8+xSUUK90U2RQ72ESjmLwKXME/MraZTkiKSI0=;
        b=IwUzAnusW9TCbhvFqNeTt22rSupF/YfqYZcFPOxktUsIoEiCBdKAfs6Jy4UkfD7x99
         1brRTLgByedLwtuGvW20xNosismdYVwQ5j6varCeg9dpKWN/681UKfGHZvdSpoTp2u8R
         ZMsBTm5NKE0dy9cVk91ufhl3R+bFGuskwk+/ukC9FAA+xSy6pjaBuysnPLST0ptVgXdF
         MoU11e6Ff/Xlgf0zAcL5p3M531ZX3474sLdCjsxAOnV+RW5ywJLU7smlQevW29jr2OHB
         xpkcVnNhoDWhpkh0NXkJBpBnecRxbcPSo+BM9G+QquEuv6srX5qa32QZqRPr3HsdXBal
         UnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Sm/juE8+xSUUK90U2RQ72ESjmLwKXME/MraZTkiKSI0=;
        b=et+5ce4bKLAIN3AL9U67JhRYK5KAAIWR7qxExNWOsIjqAJ0WUcu+kfwVObLLyjcoBR
         idlzMwAW+Fmdzv56TwhX0SYdScIdf7p5uPbeSB4jZgJ4D8zV8LItpjUglqA0sW9rkVv2
         CJ5Stj/UMCOSA8pftijMcCPMsRHsr3puDTqn5lLF0OfhLEk13tJw+2m+0tk9sqFHYwnc
         Zh2fz8VtfYCt8J0NF8TQzh6Qxvh7Fe7T1COPfREnDcHwA86iE4VwlcATHW+F2re5HU0U
         Rxc5o34J+NUskcEvN3s41OPHUKgrM5eVpJbUPpDgwkBpfvZChwHNCaxcSPZzf/6U5uPx
         AHnw==
X-Gm-Message-State: AOAM531HNq/qbWtOH08L6BdiBcZO9fi0RuHmKqVTaliS9tQe89C1N0r2
        QWozLGvB9/kc0f8dbpaALYc=
X-Google-Smtp-Source: ABdhPJyCOwksGYxZ8X4e2sWE5uLlGWudWVby/n8D6Mu1TFr1jxgS8Cxsp1hYTtgMhE3Xtm0PBx+92g==
X-Received: by 2002:a05:6a00:cd2:b0:4fa:abfe:e0eb with SMTP id b18-20020a056a000cd200b004faabfee0ebmr3261801pfv.66.1647886877119;
        Mon, 21 Mar 2022 11:21:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id o65-20020a17090a0a4700b001bef5cffea7sm439735pjo.0.2022.03.21.11.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 11:21:16 -0700 (PDT)
Message-ID: <78dc59cb-cf83-3649-f3d4-a03f3edcb9cf@gmail.com>
Date:   Mon, 21 Mar 2022 11:21:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 0/2] gpiolib: of: Introduce hook for missing
 gpio-ranges
Content-Language: en-US
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
 <CACRpkdYuxsYw99CZZK_GXp3V-mPiuL50CxgsE-=oRMApZf_bxA@mail.gmail.com>
 <15171d7e-f065-88b8-b3b3-dbeed75c5e6e@gmail.com>
 <98561f61-55c7-afe1-2393-362376251e43@i2se.com>
 <55b5cb38-41ea-2efa-321f-952259b12082@gmail.com>
 <f498afb0-dec9-c6fa-8469-896897f77d3f@i2se.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <f498afb0-dec9-c6fa-8469-896897f77d3f@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/17/22 12:23, Stefan Wahren wrote:
> Hi,
> 
> Am 17.03.22 um 18:17 schrieb Florian Fainelli:
>> On 3/17/22 4:48 AM, Stefan Wahren wrote:
>>> Hi,
>>>
>>> Am 17.03.22 um 03:02 schrieb Florian Fainelli:
>>>>
>>>> On 3/16/2022 6:15 PM, Linus Walleij wrote:
>>>>> On Wed, Mar 9, 2022 at 8:44 PM Stefan Wahren <stefan.wahren@i2se.com>
>>>>> wrote:
>>>>>
>>>>>> This patch series tries to provide backward compatibility for DTB 
>>>>>> which
>>>>>> lacks the gpio-ranges property.
>>>>>>
>>>>>> The commit ("pinctrl: msm: fix gpio-hog related boot issues") by
>>>>>> Christian
>>>>>> Lamparter already contains a fallback in case the gpio-ranges 
>>>>>> property
>>>>>> is missing. But this approach doesn't work on BCM2835 with a gpio-hog
>>>>>> defined for the SoC GPIOs.
>>>>>>
>>>>>> Based Christian's on explanation i conclude that the fallback must
>>>>>> happen
>>>>>> during the gpiochip_add() call and not afterwards. So the approach
>>>>>> is to
>>>>>> call an optional hook, which can be implemented in the platform 
>>>>>> driver.
>>>>>>
>>>>>> This series has been tested on Raspberry Pi 3 B Plus.
>>>>>>
>>>>>> Stefan Wahren (2):
>>>>>>     gpiolib: of: Introduce hook for missing gpio-ranges
>>>>>>     pinctrl: bcm2835: implement hook for missing gpio-ranges
>>>>> Looks good to me, is this something I should apply to the pinctrl
>>>>> tree or should I wait for a non-RFC version?
>>>> I would be inclined to slap a couple of different Fixes tag to each
>>>> commit because breaking older DTBs should IMHO be considered a
>>>> regression. So for the first patch I would add:
>>>>
>>>> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without 
>>>> pin-ranges")
>>>>
>>>> and for the second patch:
>>>>
>>>> Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio 
>>>> hogs")
>>>>
>>>> WDYT?
>>> so you consider backporting this "feature"?
>> Yes, I would consider your changes fixes actually. If I am the only one
>> deeply concerned about backwards compatibility I suppose I could
>> backport those into our tree.
> i'm fine with backporting, but i thought these must be single 
> independent patches.

Linus, how are we proceeding with these changes? Any hope to include 
them for 5.18?
-- 
Florian
