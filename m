Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC63E4DCC2F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Mar 2022 18:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236817AbiCQRSj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Mar 2022 13:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiCQRSj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2022 13:18:39 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF576211ECE
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 10:17:22 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id mr5-20020a17090b238500b001c67366ae93so3689363pjb.4
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xsf25C+Wyzfzk6MzhxgrLO+wdmLRbZ+A62/r9hKvqEk=;
        b=f2UA1mm/v5YDYp5ozuE0SylsE4XivkYL44mRjlK0NZt8zXgqJRsfMwVc5hm1TcLB4C
         lIXZn4fgOjiTeR5t6UgXRsq2BEg91tA5L1aDGAOm5nCJ8SoXGuxYYWDE50rtLUoro8/B
         VTSjyLEda7q0/cedmGGvk0e2pPCt5HGIKltF8tXcar1nHe0YaOxPK7tnNU/ZCdzgQ0oO
         8kkwKnlE8kOPyFHpXQWHmFovYoSExhYTsNgdb8rgMoSH1ozW+jqcACjKqaqF4WUf6DW/
         m9dDnwT4j6uDQCP+zYfABob05rc/YBRU+szYR7tFwg3RxLCSmHCRt3hf1vEFsStt4YDI
         M18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xsf25C+Wyzfzk6MzhxgrLO+wdmLRbZ+A62/r9hKvqEk=;
        b=PuAlfR4s+1YH+fzGP7qRtdcbkfGQZLgjoUqEr531LlN6U1GHweMqD4Envwj60pm6eR
         Ecf+CNjVqNO/A0SumRanbJPm7g/wR8nNKHpvi+SdDcazMpzxdD0O8SPj3dlM198n9AeU
         HXGcVs16Nw7GzoqJe0txCs9+tD2QyWG5noI61FIA/J7/VY6+QZG+NwR+E9G/hnQktUgz
         NhhMlLFqZpBB9rQwRQhIRqEErEXIksH5RAAngAZW2eLW44ZanCJeHtu7RNDMyW/9dhwL
         Gl6EcSsMosSBV2006cDfHWjUjncx5LnjXIKM97vMvuxG7NEgTkUz/TfmPB4tywBplfHn
         63Ig==
X-Gm-Message-State: AOAM533PNpJBiu9/SJhAmjUTnprIOopvBSLnWBVMogCyGssdL3EIBcj1
        9XMORCfcBijlN/RMZfD2NQ3Ltvpfylk=
X-Google-Smtp-Source: ABdhPJxrWqK2ovnMAokzcKprQ6QQbyJ62NbH40i0EFjqt07EGym3LjSEyH6U91C4BAOcCQ6k3qz0cA==
X-Received: by 2002:a17:90a:9f89:b0:1bf:7ff7:4f62 with SMTP id o9-20020a17090a9f8900b001bf7ff74f62mr17147348pjp.207.1647537441704;
        Thu, 17 Mar 2022 10:17:21 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id j16-20020a63e750000000b00373598b8cbfsm5603176pgk.74.2022.03.17.10.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 10:17:21 -0700 (PDT)
Subject: Re: [PATCH RFC 0/2] gpiolib: of: Introduce hook for missing
 gpio-ranges
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
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <55b5cb38-41ea-2efa-321f-952259b12082@gmail.com>
Date:   Thu, 17 Mar 2022 10:17:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <98561f61-55c7-afe1-2393-362376251e43@i2se.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 3/17/22 4:48 AM, Stefan Wahren wrote:
> Hi,
> 
> Am 17.03.22 um 03:02 schrieb Florian Fainelli:
>>
>>
>> On 3/16/2022 6:15 PM, Linus Walleij wrote:
>>> On Wed, Mar 9, 2022 at 8:44 PM Stefan Wahren <stefan.wahren@i2se.com>
>>> wrote:
>>>
>>>> This patch series tries to provide backward compatibility for DTB which
>>>> lacks the gpio-ranges property.
>>>>
>>>> The commit ("pinctrl: msm: fix gpio-hog related boot issues") by
>>>> Christian
>>>> Lamparter already contains a fallback in case the gpio-ranges property
>>>> is missing. But this approach doesn't work on BCM2835 with a gpio-hog
>>>> defined for the SoC GPIOs.
>>>>
>>>> Based Christian's on explanation i conclude that the fallback must
>>>> happen
>>>> during the gpiochip_add() call and not afterwards. So the approach
>>>> is to
>>>> call an optional hook, which can be implemented in the platform driver.
>>>>
>>>> This series has been tested on Raspberry Pi 3 B Plus.
>>>>
>>>> Stefan Wahren (2):
>>>>    gpiolib: of: Introduce hook for missing gpio-ranges
>>>>    pinctrl: bcm2835: implement hook for missing gpio-ranges
>>>
>>> Looks good to me, is this something I should apply to the pinctrl
>>> tree or should I wait for a non-RFC version?
>>
>> I would be inclined to slap a couple of different Fixes tag to each
>> commit because breaking older DTBs should IMHO be considered a
>> regression. So for the first patch I would add:
>>
>> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
>>
>> and for the second patch:
>>
>> Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
>>
>> WDYT?
> so you consider backporting this "feature"?

Yes, I would consider your changes fixes actually. If I am the only one
deeply concerned about backwards compatibility I suppose I could
backport those into our tree.
-- 
Florian
