Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9E9468AAB
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 12:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbhLEMDV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Dec 2021 07:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbhLEMDV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Dec 2021 07:03:21 -0500
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C868BC061751;
        Sun,  5 Dec 2021 03:59:53 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tqBGmfT8wQyExtqBKmyLDx; Sun, 05 Dec 2021 12:59:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638705590; bh=hrSJVZCRQvQH5VVFKTI1dI5FyMet8wVqaKBAPC5OfuQ=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type:From:
         Subject;
        b=e6ZVjmkZA9YvdkO5tLNoBI0QA2ygYi/hl/jMgJ68AUkpYMCu20h+h/3mtHdawqY04
         XV43KdqJ4kAK5CNSRUjbC3p/ednJ62YOgnu0BY4NTeO9wBl617SU1naLmHlHBd30Yt
         p4e5FSTfKKYATX8Fc3CvmZ4K3mr5JVhfgrdEUQZoJDPzor/FeSwcpj3A8k9Y/E0BGQ
         WoEcAQkc7/E5fMWrW6MrNlZgDhpOKl2iLJTwdafHp5ZhpG9INPAm9FgBjuoKxMcH5C
         O6Uc0sCO3FSxFGWMmDbhoFdtOhoHqZGK6GBwWw87ll3eSru3PK6Q10/zU3CparGQuN
         eGIRceGoeP7dQ==
Message-ID: <fabc35fb-f0ea-d4a5-e615-66a185e7b7c9@xs4all.nl>
Date:   Sun, 5 Dec 2021 12:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: gpiod_set_value(): BUG: sleeping function called from invalid
 context
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Petko Manolov <petko.manolov@konsulko.com>
References: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
 <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
 <1ad23a2a-bd91-526c-ab75-25543c1f4dd5@xs4all.nl>
In-Reply-To: <1ad23a2a-bd91-526c-ab75-25543c1f4dd5@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL+iB35qYwg4JmJuvLDtXvqTAKgCf4E4QQ0UreRSRrqT0wVLPGnEFyVm/TVpsPEBvTKkOyvLu71jAVeNpdKgNv9kOazUM4B+GE5n9PE2vft4BO8eXC+h
 WYN7Urde2XHteOmknq8BJpaJK3alZQ5OFBI1Rzom6iNZqR17idIHv/kdP5vCqghXiH+LAOQ6U89iO6EbczXA1Hk+HVG7e+DBptsfFFCFb43zkx1Dsi8Sb35z
 O0a1aYFHWmg91QgV2Tsy69uk7wbHXbMF5aMNk4Wm86eXLqDgjjHBIlwKa6jl2aeelP97SwdIdNPCq0rptrkG/Q==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/12/2021 11:45, Hans Verkuil wrote:
> On 05/12/2021 01:18, Linus Walleij wrote:
>> On Wed, Dec 1, 2021 at 10:40 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>>> [ 1674.787685]  ___might_sleep+0x148/0x180
>>> [ 1674.791572]  __might_sleep+0x54/0x90
>>> [ 1674.795195]  mutex_lock+0x28/0x80
>>> [ 1674.798556]  pinctrl_get_device_gpio_range+0x3c/0x110
>>
>> There is the error ^
>>
>>> gpiod_set_value() is supposed to be usable from an atomic context, so this
>>> appears to be a bug. It's probably been there for quite a long time. I suspect
>>> OPEN_DRAIN isn't very common, and I think this might be the first time I tested
>>> this driver with this kernel config option set.
>>
>> Nah has nothing to do with open drain :)
>>
>>> Any suggestions?
>>
>> pinctrl_get_device_gpio_range() needs to be modified to not take a mutex
>> because mutex:es can sleep.
>>
>> static int pinctrl_get_device_gpio_range(unsigned gpio,
>>                                          struct pinctrl_dev **outdev,
>>                                          struct pinctrl_gpio_range **outrange)
>> {
>>         struct pinctrl_dev *pctldev;
>>
>>         mutex_lock(&pinctrldev_list_mutex);
>>
>> BLAM!
>>
>> And this definitely needs to be called on this path so no way out
>> of that.
> 
> Any idea why this hasn't been seen/reported before? According to git blame
> that mutex_lock has been there since 2013. Does nobody test with
> CONFIG_DEBUG_ATOMIC_SLEEP? Am I really the first to encounter this?
> 
> Before spending time on this I'd like to be sure that, yes, I'm really the
> first in 8 years to see this, and this wasn't introduced by something else.
> 
>>
>> This mutex pinctrldev_list_mutex is there to protect from devices coming
>> and going as we look for devices with ranges on.
>>
>> One way to solve it would be to simply replace it with a spinlock, maybe
>> that works? (Check the code carefully so there are no things like calls
>> into drivers that may fire interrupts etc...)
>>
>> If it still need to be sleepable (mutex-ish) you need to convert it to
>> use RCU I think? (Which would be pretty cool anyway.)
> 
> RCU seems like a reasonable alternative, but I will have to read up on it
> since it's the first time I'll be using this. All those quizzes in the RCU
> docs (1) scare the hell out of me :-)

It's worse: pinctrl_get_device_gpio_range() takes pinctrldev_list_mutex, but
in the loop it calls pinctrl_match_gpio_range() which calls
mutex_lock(&pctldev->mutex). So it's two mutexes that this function takes from
what is supposed to be atomic context.

In addition, pinctrl_get_device_gpio_range() is called from pinctrl_gpio_direction(),
which also takes pctldev->mutex afterwards.

I'm not sure if the pctldev->mutex can be replaced with rcu, I suspect not.

For something that's supposed to be atomic, there seem to be an awful lot of mutexes...

In the case of the bcm2711 the bcm2835_gpio_direction_output() function calls
pinctrl_gpio_direction_output, which in turn (via pinctrl_gpio_direction()
and pinmux_gpio_direction()) calls bcm2835_pmx_gpio_set_direction().

It appears to me that bcm2835_gpio_direction_output() can call
bcm2835_pmx_gpio_set_direction() directly, thus avoiding all the mutexes.
That's exactly what samsung/pinctrl-samsung.c and qcom/pinctrl-msm.c do,
from what I can tell.

Are pinctrl drivers supposed to call pinctrl_gpio_direction_output() from
the direction_output() op? Isn't that perhaps the bug?

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
> (1) https://www.kernel.org/doc/html/latest/RCU/listRCU.html
> 
>>
>> Yours,
>> Linus Walleij
>>
> 

