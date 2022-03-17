Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E87E4DBCCD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Mar 2022 03:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiCQCET (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Mar 2022 22:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344180AbiCQCER (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2022 22:04:17 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9803E034
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 19:03:02 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id z16so5659830pfh.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 19:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Yn17ArgJ45+q/zN05im3qM5HHITBQzbTOtWfatGsFgQ=;
        b=Pfmrcfx7Z2QcclhynqzZBeA1v5cttdeZ65uHsVVBnBVOSDu0nJxikncKoGBjLWMDFL
         AzRQ/pGttsipE6sgRfUskzUJfJq855l61yjmf77MB4yBXYWCvoGCJ8Ak9RneaanjVfon
         DsrNpeWiisM7eDRLX4dqoV1slwLGIK+DI8sVjW4I+CI2c7kKVIq2xbX3xsV8AFjBzRHo
         ZUnANkkps5KBFZREhhqKDw5WyBhdzhyMUVO82SX0LmQIWYmIaNBtOSzWYZzr8Dyccs1s
         +u9M9AwGvy4MQUyZFRAGZPfAgcP/bkSD8bg29plJ28w5HSddBUY2emqoCN+tl4h1hKHs
         5hBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Yn17ArgJ45+q/zN05im3qM5HHITBQzbTOtWfatGsFgQ=;
        b=BdPOiWYtUCOs4a0oBCKcbyq/zayKb+FQpKvyB54m0H2AwWUKyhbzgd22a4Pcnuxsz0
         XNi0YOMCE/4ZexYEPRjuBtOMQC4pP6QDLLSTM1pVkORFvQMctNSLiUV1t7fD25u4as6a
         12j2ei+S/O+MsH8WXN+s2iZ3WearyuxKEO2Zc9uAhLUv2LtmZVcfMBptorY3mHPd4INT
         vX+WOVaOZDRvlMlxiuhlQWKUezk3eQiP4HqahhxedZuNcNDIikGlcxhKSgBSsO6Xg9F+
         kWEldIz2TgtYmp1C2RH/Aggeb7zaWAli1yNLYxyBfhxL2fI3av3nqL/sF2y3ilTjb8uq
         jnaQ==
X-Gm-Message-State: AOAM530G6jRO6qKSiLeLLPNH64Nir6A3bXsfuz7bYWDgy8Kh/LgRnzF1
        7Y+PYp/ga2DJZaQ6Qjhn0Mo=
X-Google-Smtp-Source: ABdhPJwvbwY4NQjwBTAAoo0U5aLNpS7MwRcJ527sddRBDL23IrJFHQdDwV9+xjTwhLt0Oh8cDSdzsQ==
X-Received: by 2002:a63:384e:0:b0:374:ae28:71fc with SMTP id h14-20020a63384e000000b00374ae2871fcmr1857720pgn.159.1647482582073;
        Wed, 16 Mar 2022 19:03:02 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id j11-20020a63230b000000b00372a08b584asm3650905pgj.47.2022.03.16.19.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 19:03:01 -0700 (PDT)
Message-ID: <15171d7e-f065-88b8-b3b3-dbeed75c5e6e@gmail.com>
Date:   Wed, 16 Mar 2022 19:02:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RFC 0/2] gpiolib: of: Introduce hook for missing
 gpio-ranges
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stefan Wahren <stefan.wahren@i2se.com>
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
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CACRpkdYuxsYw99CZZK_GXp3V-mPiuL50CxgsE-=oRMApZf_bxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/16/2022 6:15 PM, Linus Walleij wrote:
> On Wed, Mar 9, 2022 at 8:44 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:
> 
>> This patch series tries to provide backward compatibility for DTB which
>> lacks the gpio-ranges property.
>>
>> The commit ("pinctrl: msm: fix gpio-hog related boot issues") by Christian
>> Lamparter already contains a fallback in case the gpio-ranges property
>> is missing. But this approach doesn't work on BCM2835 with a gpio-hog
>> defined for the SoC GPIOs.
>>
>> Based Christian's on explanation i conclude that the fallback must happen
>> during the gpiochip_add() call and not afterwards. So the approach is to
>> call an optional hook, which can be implemented in the platform driver.
>>
>> This series has been tested on Raspberry Pi 3 B Plus.
>>
>> Stefan Wahren (2):
>>    gpiolib: of: Introduce hook for missing gpio-ranges
>>    pinctrl: bcm2835: implement hook for missing gpio-ranges
> 
> Looks good to me, is this something I should apply to the pinctrl
> tree or should I wait for a non-RFC version?

I would be inclined to slap a couple of different Fixes tag to each 
commit because breaking older DTBs should IMHO be considered a 
regression. So for the first patch I would add:

Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")

and for the second patch:

Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")

WDYT?
-- 
Florian
