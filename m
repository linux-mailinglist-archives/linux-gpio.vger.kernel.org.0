Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6224DCECF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Mar 2022 20:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235205AbiCQTZZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Mar 2022 15:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbiCQTZY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2022 15:25:24 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7CE1B754C
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 12:24:07 -0700 (PDT)
Received: from [192.168.1.107] ([37.4.249.169]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MZCX1-1nZAz825Yn-00VBuG; Thu, 17 Mar 2022 20:23:43 +0100
Message-ID: <f498afb0-dec9-c6fa-8469-896897f77d3f@i2se.com>
Date:   Thu, 17 Mar 2022 20:23:42 +0100
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
 <98561f61-55c7-afe1-2393-362376251e43@i2se.com>
 <55b5cb38-41ea-2efa-321f-952259b12082@gmail.com>
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <55b5cb38-41ea-2efa-321f-952259b12082@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:13yTFphyyT+14cr+vl8SJAyudGw1hcT3Dv08ZOK5Vty38aS1qSD
 WnL34qAmegOhBM4Du/GWtjA/Tlf5eD8JvMiIfBh4XOUUppghI4mq1ePJ3s0iOAayTE1nspi
 8O2wcJ2mPiL/F7XYPrtB9qq3ZqoLRTNu3du8ioMuIWkxABxd1m0eGfJolt5jX5fqp27rM3Z
 mZW+7An/yfSGqvWZ1UWsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zOLcmc5ZdYI=:vYFWZ8+6CueA5Wcxefi6sP
 F4tM3M5odP7hWfxa0I5mzDX9ZC2ifG57kooaGUzKWJzhPULN6yl6/MXJa9GBV76XQfBstaHxq
 oWOeAiRdJQ+PX+VI7yHknXJE4xV7sgvIgniReM9GOEEJu8KwwSVwLMXi3T7G9s1rrIeqr7jWR
 LB6BOtdwPYKLLT7VRyM06Nj5a+QCMhFOHJ2DrEKV8aULuN62yLK2x/xBNtnSW4clo6+PrBM8N
 Vekrq6G/GyzvNz+ozj1DRtKGrMHU34K7ahxqIsA5PU93Lx53oD4DDA/xZ1IYvg6SyPQrzy7bq
 OBvDItaqu24C4cvrnYhK/o7j/trKAeqXeofq5+zvn1XguNFmlNcLW8fWb+7tMhfIBTmuLEg10
 WnTo/T7z68ytNN+CbvCWsPQXdfbB2lQWoZBC5yzoWYQO+jmDuz+67AflR5Ll7wzHKtlKdKyWs
 6eBAS7v7oNdiIf/mCSmdDvDHb58KzbGJqmxV65Cma175k+Gi2wFz0dsh0KChcoroNgcJthqbc
 X8JrUQ2astdWohD7PKT768ttwaBs7FPCeX6hewsSbvvFwcfAcyJQRqbRIv9BZ8HRk/oCkFNLE
 JzK47lvzUtn+S2q8KbBXoXaFmHe6613dVuVItu6FpZFe3Z5kEx0QhX1J+99u69BSxHa1D+xUt
 8+H8ZXvNMTsUti/1DRkGGZmtrxzc0Cveo87IpGKOmI87TaJo9kyuxQVZ/8NqEQ9wXfP+MSjaF
 L6XUjDoUHgG9b3tt
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 17.03.22 um 18:17 schrieb Florian Fainelli:
> On 3/17/22 4:48 AM, Stefan Wahren wrote:
>> Hi,
>>
>> Am 17.03.22 um 03:02 schrieb Florian Fainelli:
>>>
>>> On 3/16/2022 6:15 PM, Linus Walleij wrote:
>>>> On Wed, Mar 9, 2022 at 8:44 PM Stefan Wahren <stefan.wahren@i2se.com>
>>>> wrote:
>>>>
>>>>> This patch series tries to provide backward compatibility for DTB which
>>>>> lacks the gpio-ranges property.
>>>>>
>>>>> The commit ("pinctrl: msm: fix gpio-hog related boot issues") by
>>>>> Christian
>>>>> Lamparter already contains a fallback in case the gpio-ranges property
>>>>> is missing. But this approach doesn't work on BCM2835 with a gpio-hog
>>>>> defined for the SoC GPIOs.
>>>>>
>>>>> Based Christian's on explanation i conclude that the fallback must
>>>>> happen
>>>>> during the gpiochip_add() call and not afterwards. So the approach
>>>>> is to
>>>>> call an optional hook, which can be implemented in the platform driver.
>>>>>
>>>>> This series has been tested on Raspberry Pi 3 B Plus.
>>>>>
>>>>> Stefan Wahren (2):
>>>>>     gpiolib: of: Introduce hook for missing gpio-ranges
>>>>>     pinctrl: bcm2835: implement hook for missing gpio-ranges
>>>> Looks good to me, is this something I should apply to the pinctrl
>>>> tree or should I wait for a non-RFC version?
>>> I would be inclined to slap a couple of different Fixes tag to each
>>> commit because breaking older DTBs should IMHO be considered a
>>> regression. So for the first patch I would add:
>>>
>>> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
>>>
>>> and for the second patch:
>>>
>>> Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
>>>
>>> WDYT?
>> so you consider backporting this "feature"?
> Yes, I would consider your changes fixes actually. If I am the only one
> deeply concerned about backwards compatibility I suppose I could
> backport those into our tree.
i'm fine with backporting, but i thought these must be single 
independent patches.
