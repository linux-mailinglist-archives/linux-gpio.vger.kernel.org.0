Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0D5BFEB3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 07:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfI0Fwu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 01:52:50 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:51374 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfI0Fwu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 01:52:50 -0400
Received: (qmail 13822 invoked by uid 5089); 27 Sep 2019 05:52:48 -0000
Received: by simscan 1.2.0 ppid: 13638, pid: 13641, t: 0.0842s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 27 Sep 2019 05:52:47 -0000
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Warren <swarren@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Enrico Weigelt <info@metux.net>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <c1418e82-ed98-14e5-9858-e5ebd12de3b7@electromag.com.au>
Date:   Fri, 27 Sep 2019 13:52:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26/09/2019 00:51, Eugeniu Rosca wrote:
> Hi All,
> 
> I've additionally Cc-ed Laurent and Stephen, since their fruitful
> discussion in [1] back in 2014 concluded with a useful documentation
> update [2] which is precisely related to the interpretation and usage
> of the polarity flag in GPIO specifiers.
> 
> I've also Cc-ed those people who have participated in reviewing the
> previous patch iterations (Geert, Phil, Enrico).
> 
> Before leaving this thread in limbo, I would like to attempt clarifying
> what it actually tried to accomplish, one more time.
> 
> First of all, it stems from the need to implement a specific customer
> requirement. Whether this requirement is sane or not, that's actually
> a very important question, but I haven't found much discussion around
> it the comments posted so far.
> 
> To paraphrase what Harish stated in [3], the customer has a list of GPIO
> pins which need to be controlled from userspace. Of course, the customer
> can set the polarity of those pins from userspace, as pointed out by
> Linus in [4] (thanks!). But, keeping track of GPIO polarity in userspace
> is seen like a burden. The customer thinks that the right place for this
> HW-specific detail is in device trees. Do you think this preference
> is ill-formed?
> 
> If we hog a GPIO pin in DTS (which allows specifying its polarity),
> userspace no longer has access to that pin. There isn't a way to define
> GPIO polarity by means of DTS without affecting userspace access
> (can anybody contradict this statement?).
> 
> Whether it is obvious or not, the main goal of this series is actually
> to provide the possibility of inverting the default ACTIVE_HIGH polarity
> for GPIO pin X _via DTS_ while still allowing to operate on that pin
> _from userspace_. My two questions are then:
>   - I hope it is something sane to desire?
>   - If it is sane, how can this be accomplished, if the functionality
>     implemented by Harish doesn't pass the community review?
> 
> [1] https://marc.info/?l=linux-gpio&m=139204273132477&w=4 ("Correct meaning of the GPIO active low flag")
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=51e8afc1c43c75 ("gpio: document polarity flag best practices")
> [3] https://marc.info/?l=linux-gpio&m=155721267517644&w=2 ("[PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines")
> [4] https://marc.info/?l=linux-gpio&m=155713157122847&w=2 ("[PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines")
> 

I still think the concept is very useful.

A related issue for example is that some drivers want to enforce the GPIO consumer to be open drain.
Eg see i2c-imx or i2c-davinci for examples

But suppose I've connected the gpio to the i2c bus via a FET (which is an inverter with open drain output).
We're basically saying I can't model that FET's existence in the dts.
So I can't accurately describe my hardware in the dts to ensure the software does the right thing without the inverter.
That is drive the GPIO output as push / pull.

It's probably good the drivers do enforce this kind of open drain thing to prevent dts error destroying hardware.
But it does prevent some hardware designs from working if we can't model the bits in between.


-- 
Regards
Phil Reid
