Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CF1468A63
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 11:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbhLEKtW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Dec 2021 05:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbhLEKtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Dec 2021 05:49:22 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDB7C061714;
        Sun,  5 Dec 2021 02:45:54 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id tp1gmvClWlcdAtp1jmhAPi; Sun, 05 Dec 2021 11:45:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638701151; bh=AqmxLEyhmx+95wPTZhy7agB/c1wD+x7IRu5awbIcUQ8=;
        h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From:
         Subject;
        b=WwGl0aRDYvs0lJ3MzGaOLgeTpwGP16XdAIvswQsVDESGg1PldfVUsMo+btqwqpLYg
         jjJ8dajdDvUWgLg7SM4ICb/+mZRBD+YPoUiZTr+WJL4dLzXLwyS+7gVYMblAP0iops
         amUpndzDY5B/6EZMc2ebDbZ4Q9bNcCDiOxuNlhEbaG4VX7rPA9N8Mz/iIB9fbIuuz5
         D38TIk8Ro5FFPN3i4O+/QNilCiIKV5Jw6usq5+plO4grqeNtV2yQZIpzk0hLDZXRLC
         TmCa8sRgiFrULmYKoAnLeBN26UsCQdKoF2cqviqrf3u+o9/GVrJ8BSlRLniMV5VEoO
         fg7Az6MXNXSkA==
Message-ID: <1ad23a2a-bd91-526c-ab75-25543c1f4dd5@xs4all.nl>
Date:   Sun, 5 Dec 2021 11:45:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: gpiod_set_value(): BUG: sleeping function called from invalid
 context
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
 <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGzy6DRSSoYS75bhcMgcExD5YMLrhIjffs+Fmcm2EIL7H6Qj/tmt/harLJimxkyzXshfMduGFnGCIGpEnXhK8B8ZdghHnD84zRK9eDL+ICc2Mdv8FxgK
 AMfki2SsunbrS7RKZvvO9HmBxHeP/NRCXf48o2QMRWyZlQRsPLtVjU13T9C/AKPevgoX9Vvwnph09VkpVFUyb+lmJ11ryDBNBBxS3hRjCSei/ydOSPm9WK+k
 0RP1zEu6FoMMH3Z7itskvLlLQPIGMkSPsJa70w3WfNU=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/12/2021 01:18, Linus Walleij wrote:
> On Wed, Dec 1, 2021 at 10:40 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>> [ 1674.787685]  ___might_sleep+0x148/0x180
>> [ 1674.791572]  __might_sleep+0x54/0x90
>> [ 1674.795195]  mutex_lock+0x28/0x80
>> [ 1674.798556]  pinctrl_get_device_gpio_range+0x3c/0x110
> 
> There is the error ^
> 
>> gpiod_set_value() is supposed to be usable from an atomic context, so this
>> appears to be a bug. It's probably been there for quite a long time. I suspect
>> OPEN_DRAIN isn't very common, and I think this might be the first time I tested
>> this driver with this kernel config option set.
> 
> Nah has nothing to do with open drain :)
> 
>> Any suggestions?
> 
> pinctrl_get_device_gpio_range() needs to be modified to not take a mutex
> because mutex:es can sleep.
> 
> static int pinctrl_get_device_gpio_range(unsigned gpio,
>                                          struct pinctrl_dev **outdev,
>                                          struct pinctrl_gpio_range **outrange)
> {
>         struct pinctrl_dev *pctldev;
> 
>         mutex_lock(&pinctrldev_list_mutex);
> 
> BLAM!
> 
> And this definitely needs to be called on this path so no way out
> of that.

Any idea why this hasn't been seen/reported before? According to git blame
that mutex_lock has been there since 2013. Does nobody test with
CONFIG_DEBUG_ATOMIC_SLEEP? Am I really the first to encounter this?

Before spending time on this I'd like to be sure that, yes, I'm really the
first in 8 years to see this, and this wasn't introduced by something else.

> 
> This mutex pinctrldev_list_mutex is there to protect from devices coming
> and going as we look for devices with ranges on.
> 
> One way to solve it would be to simply replace it with a spinlock, maybe
> that works? (Check the code carefully so there are no things like calls
> into drivers that may fire interrupts etc...)
> 
> If it still need to be sleepable (mutex-ish) you need to convert it to
> use RCU I think? (Which would be pretty cool anyway.)

RCU seems like a reasonable alternative, but I will have to read up on it
since it's the first time I'll be using this. All those quizzes in the RCU
docs (1) scare the hell out of me :-)

Regards,

	Hans

(1) https://www.kernel.org/doc/html/latest/RCU/listRCU.html

> 
> Yours,
> Linus Walleij
> 

