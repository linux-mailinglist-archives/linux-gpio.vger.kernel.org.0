Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F274DC510
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Mar 2022 12:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233140AbiCQLzS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Mar 2022 07:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbiCQLzR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2022 07:55:17 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456A82628
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 04:54:01 -0700 (PDT)
Received: from [192.168.1.107] ([37.4.249.169]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N8nnU-1o99wN3H7O-015u9P; Thu, 17 Mar 2022 12:48:25 +0100
Message-ID: <98561f61-55c7-afe1-2393-362376251e43@i2se.com>
Date:   Thu, 17 Mar 2022 12:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 0/2] gpiolib: of: Introduce hook for missing
 gpio-ranges
Content-Language: en-US
To:     Florian Fainelli <f.fainelli@gmail.com>,
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
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <15171d7e-f065-88b8-b3b3-dbeed75c5e6e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6crirhUZkgId1pFdzwDw6P2j+0NhAIJpMOs4MNjRIZAMqTujGOa
 0wJbCPx/O/DR/Nam7kTP1NK9OvuusRFbOEUxGn6lNZDhSv+DDB7ZxS7WctNal/kdVrdOUK0
 7WMSCmLWQUOHe4fElE8ZUCWb3neVC+RnkEMSLjR/YYzyqRUFlP4w3xIzaDOrNDZfga+Qp0X
 jn8BXCaUnNFOR8e62YaFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9AkDhggv/Yw=:CEGKAd94sFFHqe0dnHo3dy
 hWl1ZDXmj35rFwgpCM5JjFaiAbZHiFcq+YSLZR1g2O+1rUHCZBBb2VGCrvSf3XKnYw+DTREaV
 cC30aF39YMb5Nxy2FgCgPvQ+WMa+JWvI9uFF8DTyC64v7C5sNi7ePPsAt3vN19BVPXUl+zp/5
 zgfKLh25dvAD0CTJVnQWoPEmXlryrtPdHrBZBHJua4v8TSL1GC6NHrbrGuYkHTQLeaTH7GUDL
 7uVGvEX+Qa/Y9F3NfQSL4PLH2ir5xEl6cPW3FsrZk+QpghXs9ZVYnLesEzKCMo8TbiePScREE
 /o2ssaU1mD9AIu14pGl1sEbirV0EBNJheQQKw/Efh+40b3QSbffRI48JDgqPTwkm49Y07QToO
 YPe0QUwYmI6EkYB0pTsgAN4cfJIufFQneuA2bhzOtBnUl5pXdRT3xWTWUVQs1OTKfZBlMVsr6
 yfHxtstge3zN1k8Rtna2xrnEs4S+xiq+TFI4XMz0ZqP0hQNeNm0ACcSqTaRPTww0JZPfWHalK
 1ffCwhZjSJuN/I2RQXGf2kGmdMwmQZoXFgsKx9tn7iTUy55oVPtdeVvOrahdMRYO8pz9gEvRp
 hhCzhIiyeu75nx2EqT+CcPSP3xPVkxYDfoMloCDTDhfS99ssiPGHI2+NdpBno7ne9nT3uFhn8
 Iu4qvfBfS/6F9iPhsqLMJ6R3EDPV8uB2c5GxDETyi2P2zwiREtjdN3yblHgOTwTdMLF6MLry0
 2nHksexmkweAojDI
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 17.03.22 um 03:02 schrieb Florian Fainelli:
>
>
> On 3/16/2022 6:15 PM, Linus Walleij wrote:
>> On Wed, Mar 9, 2022 at 8:44 PM Stefan Wahren <stefan.wahren@i2se.com> 
>> wrote:
>>
>>> This patch series tries to provide backward compatibility for DTB which
>>> lacks the gpio-ranges property.
>>>
>>> The commit ("pinctrl: msm: fix gpio-hog related boot issues") by 
>>> Christian
>>> Lamparter already contains a fallback in case the gpio-ranges property
>>> is missing. But this approach doesn't work on BCM2835 with a gpio-hog
>>> defined for the SoC GPIOs.
>>>
>>> Based Christian's on explanation i conclude that the fallback must 
>>> happen
>>> during the gpiochip_add() call and not afterwards. So the approach 
>>> is to
>>> call an optional hook, which can be implemented in the platform driver.
>>>
>>> This series has been tested on Raspberry Pi 3 B Plus.
>>>
>>> Stefan Wahren (2):
>>>    gpiolib: of: Introduce hook for missing gpio-ranges
>>>    pinctrl: bcm2835: implement hook for missing gpio-ranges
>>
>> Looks good to me, is this something I should apply to the pinctrl
>> tree or should I wait for a non-RFC version?
>
> I would be inclined to slap a couple of different Fixes tag to each 
> commit because breaking older DTBs should IMHO be considered a 
> regression. So for the first patch I would add:
>
> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
>
> and for the second patch:
>
> Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
>
> WDYT?
so you consider backporting this "feature"?
