Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF68CE7B2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 17:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbfJGPgN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 11:36:13 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:35114 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbfJGPgN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 11:36:13 -0400
Received: from [10.20.204.51] (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 9BECB1C00F3;
        Mon,  7 Oct 2019 09:36:11 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Warren <swarren@nvidia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Phil Reid <preid@electromag.com.au>,
        Enrico Weigelt <info@metux.net>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
 <06a1acab-fcc4-7b3a-697b-4d253c354513@wwwdotorg.org>
 <20191005175024.GA25394@x230>
From:   Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <f4359c04-bb1d-6c4c-6725-90e661c1aab3@wwwdotorg.org>
Date:   Mon, 7 Oct 2019 09:36:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191005175024.GA25394@x230>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/5/19 11:50 AM, Eugeniu Rosca wrote:
> Hi Stephen,
> 
> On Fri, Oct 04, 2019 at 01:07:23PM -0600, Stephen Warren wrote:
> 
> [..]
> 
>> I think the DT should represent the device that's attached to the GPIOs.
>> That way, there's already a clear way to represent the GPIO polarity, as
>> described in the document linked by Eugenui in [2] below.
>>
>> If for some reason that's not possible, then I think keeping track of the
>> GPIO polarity in user-space is entirely reasonable, and is the correct
>> approach. To claim that tracking GPIO polarity in user-space is too much
>> burden, yet to also allow user-space to control GPIOs at all, and hence to
>> know exactly which GPIOs must be controlled, is an inconsistent assertion.
>>
>> Put another way: If a piece of user-space SW controls GPIOs, it must know
>> which GPIO number to use for each logical purpose. This information
>> presumably varies on different platforms, so the SW must have a list of GPIO
>> numbers and GPIO controller IDs per platform. Additionally storing a
>> polarity bit along with that information seems entirely trivial to me.
>>
>> Is there some other issue that I'm overlooking?
> 
> Based on the discussions so far, the user who requested this feature
> intends to (in fact already does) "mark" the userspace-relevant gpio
> lines via the "gpio-line-names" [5] DT property, implemented by Linus
> in v4.7 commit [6]. By keeping track of "gpio line name" both in DT and
> in user-space, apparently the user is able to accurately map the
> "line name" (visible in userspace) to the corresponding gpio chip/name
> and gpio line offset in a "platform/board-independent" way.
> 
> Do you think this is unorthodox?

No, that sounds reasonable.

Given that, it might be plausible to extend that DT scheme to represent 
more information, but it's still better to represent the actual end 
device (that's connected to the GPIO) in DT, since that also represents 
the semantics.

> [6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd9c55315db9
