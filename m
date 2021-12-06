Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A0E46934A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 11:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbhLFKW7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 05:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhLFKW6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 05:22:58 -0500
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFA2C061746;
        Mon,  6 Dec 2021 02:19:29 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uB5fmns3XQyExuB5im1ebJ; Mon, 06 Dec 2021 11:19:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638785967; bh=N+X7liJkVwx8jnK2XHMOV24zAKS7m5sGmAerPhQBx9U=;
        h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From:
         Subject;
        b=QqUJCgpaJhHOQc/stEXwIz2/ZBK3zhAcxCw9V2A+2rkcq1vwqoyFcC2I1rLws3rbK
         PAK/MXXgDRQhAOInUN1K4fFSzLhsX711/LH5NuVI7B40sDvl3jppLNfGlcR02qFaoJ
         t9651XA8Fut075PjW+DxCp68+0T3JAvy+llJDY1ChBJoCRBzfbjdRcA/AHZKzqI+Zu
         KqDJU+YA0n0L1gLhhUWeHW1o6pGlKl4ObEPmVuJYxN14LPJQGJTeVa8VgSQKmKrjtn
         wwgxW6jrS3Vjes6kK+6Kbc9vgTmvQ/q7i2bcvec5rXmp9EPZv/z+hKhWB80CGKZtQr
         kfZsdG4XIds5A==
Message-ID: <bd255849-c5ef-4b7b-725b-f902734d897b@xs4all.nl>
Date:   Mon, 6 Dec 2021 11:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: gpiod_set_value(): BUG: sleeping function called from invalid
 context
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Petko Manolov <petko.manolov@konsulko.com>
References: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
 <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
 <1ad23a2a-bd91-526c-ab75-25543c1f4dd5@xs4all.nl>
 <fabc35fb-f0ea-d4a5-e615-66a185e7b7c9@xs4all.nl>
 <CACRpkda0iEpPOv+D9CeE_jjEubMYY6+toLhuYpZAS_6Jxq0ntg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CACRpkda0iEpPOv+D9CeE_jjEubMYY6+toLhuYpZAS_6Jxq0ntg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBZO7u+Oc3HWmDSLR5A5V2BoZkuOBDDcoRy7rRKi1UKQTAruq/mgoM8Oud8d+GD6XJGFDwgaJG9xZXFfHlTLDsaI2uUBLPOuRbV45q0Rm4Nf/hSCBA7e
 kHxCWzwsckARh0MxhAX9yEuF7XUNYAqGgbagAP2GdGmFTBvKt26G5G+/Be8YI2uHh2vOuFGYsxKAYA8rMJkiY5MLJNg65OkuLYz+SiLlFvoDmpPoSUEZbWts
 6bRODw5IdiBSc2htRtQszU4LDNepN1339baCen/g6yShYtq4CYDVjX2dhPzlC05HlKh60UwVZ3LMFa4xzutAcA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Thank you for your reply!

On 06/12/2021 01:32, Linus Walleij wrote:
> On Sun, Dec 5, 2021 at 12:59 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>> Are pinctrl drivers supposed to call pinctrl_gpio_direction_output() from
>> the direction_output() op? Isn't that perhaps the bug?
> 
> Yes they are. But they might not have to.
> 
> Here is how pinctrl_gpio_direction_input() and pinctrl_gpio_direction_output()
> work:
> 
> pinctrl_gpio_direction_output()
>    pinctrl_gpio_direction(OUTPUT)
>        pinctrl_get_device_gpio_range() <- find the range
>        gpio_to_pin() <- Look up corresponding pin on the pin controller
>        pinmux_gpio_direction() <- shortcut to set the pin into right direction
>             ops->gpio_set_direction() <- Call the pin mux driver
> 
> So GPIO drivers that are backed by pin controllers cross call to set
> up the pin controller properties of the pin into the right mode.
> So it becomes a GPIO line with the expected direction from the pin
> control side of things.
> 
> This is especially necessary if the GPIO driver and pin control (mux)
> driver are two different drivers that communicate with each other like
> this.
> 
> This happens for example with drivers/gpio/gpio-pl061.c that is
> used with a few different pin controllers, so we don't know which
> pin controller is providing the pin control back-end.

That's fair enough, but in that case I think the GPIO driver should set
can_sleep to true. Perhaps the pinctrl core can even check that can_sleep
is set to true if it attempts to call pinctrl_gpio_direction().

> 
> For combined GPIO and pin controllers (all of it in the same file)
> it is of course possible to shortcut this cumbersome path and just
> call whatever mux function we need instead of going in and
> out of the subsystems like this. That should be done dropping
> some comment but drivers are free to do what they like
> to optimize.

I believe that's the correct approach for such combined GPIO and pin
controllers. That whole loop through pinctrl_gpio_direction_output/input
just adds unnecessary complexity. Which is fine if you have no choice,
but wasteful otherwise.

> 
> You can maybe fix the BCM2835 like this, but that will not fix
> the problem for everyone else.
> 
> I'd prefer if everyone called pinctrl_gpio_direction_output() and
> we got this fixed... because many are affected.
> 
> Maybe we should just make these mutexes into spinlocks
> if no other solution is possible? It's not like this is
> called constantly other than by the CEC driver ;)

It's likely also useful for i2c-gpio.c. I see that that one uses
gpiod_set_value_cansleep(), so using mutexes is fine, but avoiding that loop
through pinctrl will help improve timings there as well, even without
lock contention.

I'll post some patches, that should help discussing this.

Regards,

	Hans

> 
> Yours,
> Linus Walleij
> 

