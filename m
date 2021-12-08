Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C8446D00E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 10:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhLHJ35 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 04:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhLHJ35 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 04:29:57 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC86BC061746;
        Wed,  8 Dec 2021 01:26:25 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id utDPmfMJIgFRtutDSmL1js; Wed, 08 Dec 2021 10:26:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638955583; bh=jOAGs4cD/IqIy8UFMtQkqf/WjpulPYltsLVXfNTU9TA=;
        h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From:
         Subject;
        b=q6qvu57LNKRIuf/3hnPy96Rq1mkyfqxn1IFEmffr7ZdZswqTCnNTBE4CfeonjX+VV
         KyoQ2Ymy60xa0qdJUKaTB4c+aQn0COm+yJsMIVxXcNQyRGrPEX+c1dJQPwi9gpgIUL
         34eEcmexBCwcUtm2CDDXOGjm8YaKsrk1hc0AvTSEYxwdsTNdUSFIZVLwoOE3DbaVD2
         B0iD8+0XQatms1NywPjNLwFzdU9xG0iwzk51Bz9jw7qVeRuvcBjeQp72rNVfGRO2Sr
         3+ey3yApQurucpgzZIfRqanEAbx1r3dMnro83j5cybQ5BYzjCv0BXD7B2EPpAFxz3R
         FD1/YwjJEsSdg==
Message-ID: <d1ce87a0-decb-ac29-7906-1181c83c1067@xs4all.nl>
Date:   Wed, 8 Dec 2021 10:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [RFC PATCH 0/3] pinctrl: can_sleep and pinctrl_gpio_direction
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
 <CAHp75VcPhSvQvjA5WBO72Lb5idc6vkkodai_V=YmLWtsz-qg1A@mail.gmail.com>
 <CACRpkda2d9j7_HOM1Q1dEsK+U4-4KmbvjvTAEvx2AbxMQtOgFA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CACRpkda2d9j7_HOM1Q1dEsK+U4-4KmbvjvTAEvx2AbxMQtOgFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNMlzR0EKsWyI4ey8aSY25ZqiEC335EbESytkwSUvdHcDED74MYN9gDPTJhm3xvK9MrRUlI5RRoaF4B63aOrhNCmXGRmfZ7PxoIwfHGBQWCv2WFHGT9n
 Du3uih+xreqOOokeyLRElwvsCE2aw/By6EvJEyQYGi3iAEduOYoOGmxWaoRblWLr1jO7AUHCjwfxDAacxU71RoEfJtALZJGBFgo7c/IKKYgDc3CX6lPytL4l
 RtR4cpI1+2pUQzgebYR+PrrEWJ1w+FobL98cc02b3lHEdRh0d5tUgazHYRT2QCqY6eYkN+hwDqyO63oK59CH0KqGio46Phs3P9iSGoKmHbT07BeOrTrC/Aa4
 DrXIpginob18hpEg93UyA4NZrfhjKA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/12/2021 01:30, Linus Walleij wrote:
> On Tue, Dec 7, 2021 at 11:14 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Monday, December 6, 2021, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>
>>> Hi all,
>>>
>>> Based on this discussion:
>>>
>>> https://lore.kernel.org/linux-gpio/CACRpkdb3q4-9O3dHS6QDWnZZ5JJjXWXS9KPvwXVaowLMRhcejA@mail.gmail.com/T/#t
>>>
>>> I propose this RFC series.
>>
>>
>> When I first saw your report I was thinking about actually adding a new callback ->set_direction_atomic()
>> and then make pinctrl use it, otherwise like you do, I.e. issue a warning when it’s called in atomic context
> 
> The problem is inside of pinctrl core, not in any driver. It takes a
> mutex when going over
> the GPIO ranges.
> 
> I suggested maybe just replacing these mutexes with spinlocks, or RCU.

RCU or spinlock would most likely work as a replacement for pinctrldev_list_mutex, but
not for pctldev->mutex. I didn't see any obvious way of replacing it with something else.

I'm open to any suggestions, but for now this was the best I could come up with, given
my limited knowledge of the gpio/pinctrl subsystems. It at least warns you that something
is wrong.

Personally I think that for combined gpio/pinctrl drivers it doesn't make sense to take
this additional loop through the pinctrl core, regardless of whatever locking mechanism
is used. I actually think that it obfuscates those drivers a bit, but that might just be
me.

Regards,

	Hans

> 
> Yours,
> Linus Walleij
> 

