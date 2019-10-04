Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69ADCC379
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 21:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbfJDTRL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 15:17:11 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:54188 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfJDTRK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 15:17:10 -0400
X-Greylist: delayed 584 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Oct 2019 15:17:10 EDT
Received: from [10.20.204.51] (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id CDE061C0728;
        Fri,  4 Oct 2019 13:07:24 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Phil Reid <preid@electromag.com.au>,
        Enrico Weigelt <info@metux.net>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
From:   Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <06a1acab-fcc4-7b3a-697b-4d253c354513@wwwdotorg.org>
Date:   Fri, 4 Oct 2019 13:07:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/25/19 10:51 AM, Eugeniu Rosca wrote:
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

I think the DT should represent the device that's attached to the GPIOs. 
That way, there's already a clear way to represent the GPIO polarity, as 
described in the document linked by Eugenui in [2] below.

If for some reason that's not possible, then I think keeping track of 
the GPIO polarity in user-space is entirely reasonable, and is the 
correct approach. To claim that tracking GPIO polarity in user-space is 
too much burden, yet to also allow user-space to control GPIOs at all, 
and hence to know exactly which GPIOs must be controlled, is an 
inconsistent assertion.

Put another way: If a piece of user-space SW controls GPIOs, it must 
know which GPIO number to use for each logical purpose. This information 
presumably varies on different platforms, so the SW must have a list of 
GPIO numbers and GPIO controller IDs per platform. Additionally storing 
a polarity bit along with that information seems entirely trivial to me.

Is there some other issue that I'm overlooking?

If the list of GPIO IDs is retrieved from DT by the user-space SW, I 
could see an argument for storing the polarity information in DT along 
with that list of GPIO IDs. However, I don't believe there's any 
standard way of representing "a list of GPIO IDs for user space use" in DT.

> If we hog a GPIO pin in DTS (which allows specifying its polarity),
> userspace no longer has access to that pin. There isn't a way to define
> GPIO polarity by means of DTS without affecting userspace access
> (can anybody contradict this statement?).

GPIO hog doesn't seem like the right approach; its intent is to actively 
configure the GPIO in a fixed state, which is logically incompatible 
with user-space control of the GPIO.

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

