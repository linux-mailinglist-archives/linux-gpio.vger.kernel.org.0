Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4868C468B93
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 16:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235185AbhLEPHF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Dec 2021 10:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235147AbhLEPHE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Dec 2021 10:07:04 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E66FC061714;
        Sun,  5 Dec 2021 07:03:37 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id tt35mK1ZngFRttt38mEhFg; Sun, 05 Dec 2021 16:03:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638716614; bh=clBunkdKYVGIhSbWO+oEz1tcmy/Dw0EtKSaTGFZ5x9I=;
        h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From:
         Subject;
        b=NwKCc44vPdjNnCvqeYs/FeZXianPzsxus/nBaufM44ak6KDneudMLQSgVKjhogx5e
         dufQOkej9XP212MUZrGbP3fG5cUJTeHrskXY1IBV8b2r9c2aaXVuSYtpo6EJZUM75G
         7V8ThX78OFSTdWopfQG1yJC9c5l/A9I6/BqbWWRMQTX/jPOKPkzCJf6VC/QAWZP+Nb
         CZDBT9jP3R5zdW/9kpUyvzQ8VYbLHwW1j+WNoYBpe2687GONjvzwIBNr6wwQW1IJUj
         7xTZRDo2nnwWknyNI6Ao/LoVScKdlGYpxmzDKqFDnCJrYRC1/uatxVCcTEVKzdBWDC
         6dxS7PQmNmAxQ==
Message-ID: <359becb7-9df1-5be5-a169-dac336b6f45e@xs4all.nl>
Date:   Sun, 5 Dec 2021 16:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: gpiod_set_value(): BUG: sleeping function called from invalid
 context
Content-Language: en-US
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
 <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
 <1ad23a2a-bd91-526c-ab75-25543c1f4dd5@xs4all.nl>
 <fabc35fb-f0ea-d4a5-e615-66a185e7b7c9@xs4all.nl>
 <YazReHfrWDZbm6z9@karbon.home.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <YazReHfrWDZbm6z9@karbon.home.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPMXPXJ2pr+AaVdOudpehkNNsBpQNfd5pCkQ+8Jj69/ThRFvHF7lOgyZAHmTl7YBSUqUoULJoKZ8oO8VGyTvSz7NEprDbyvb2vrj7Uwy4u6wNKWW8hqQ
 AociSIU4S7kLgsEQ6Idss2wu4wZXUv15b6mCnwS7GSZ35yWdcem48e3nQ9Hbk61YKgzjZb+1SfCoLFS1xEJpvdfdQ3giTNUU+ElCBwjj6tPskUh47PvAXoUo
 JAWmL4E9YRgWTDfnYT4tg7Q/alIBJL51lejvcqZN9oNTo43ICjNyiMYOG3u9Or5OT5dvdSImZF41HReXeFqTxw==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/12/2021 15:49, Petko Manolov wrote:
> On 21-12-05 12:59:46, Hans Verkuil wrote:
>>
> 
> <snip>
> 
>> I'm not sure if the pctldev->mutex can be replaced with rcu, I suspect not.
> 
> Not in this case. :)
> 
>> For something that's supposed to be atomic, there seem to be an awful lot of 
>> mutexes...
> 
> By looking at the generic gpiolib code, it seems that none of these are supposed 
> to be called from atomic context.
> 
>> In the case of the bcm2711 the bcm2835_gpio_direction_output() function calls
>> pinctrl_gpio_direction_output, which in turn (via pinctrl_gpio_direction()
>> and pinmux_gpio_direction()) calls bcm2835_pmx_gpio_set_direction().
> 
> Is the aforementioned code mainlined or is it in some other git tree?  I'd like 
> to take a quick look.

Mainline.

> 
>> It appears to me that bcm2835_gpio_direction_output() can call
>> bcm2835_pmx_gpio_set_direction() directly, thus avoiding all the mutexes.
>> That's exactly what samsung/pinctrl-samsung.c and qcom/pinctrl-msm.c do,
>> from what I can tell.
>>
>> Are pinctrl drivers supposed to call pinctrl_gpio_direction_output() from the 
>> direction_output() op? Isn't that perhaps the bug?
> 
> If direction_output() is supposed to be called from atomic context, then that's 
> where the bug is.  Again, i am not familiar with this particular subsystem, but 
> these are pretty basic kernel concepts people must pay attention to.  You should 
> perhaps focus on Broadcom's code rather than pinctrl's.

That's my suspicion as well, except that the same thing can be seen in several
other non-Broadcom pinctrl drivers as well. Probably copy-and-paste.

Linus, can you confirm that it is indeed the Broadcom pinctrl driver that's wrong?
And thus several others as well, 'git grep pinctrl_gpio_direction_output drivers'
reports a bunch of them.

Regards,

	Hans
