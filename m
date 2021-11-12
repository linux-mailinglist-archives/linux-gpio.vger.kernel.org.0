Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A158C44E471
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 11:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhKLKSz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 05:18:55 -0500
Received: from muru.com ([72.249.23.125]:55382 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234886AbhKLKSz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Nov 2021 05:18:55 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 01DDB80E2;
        Fri, 12 Nov 2021 10:16:39 +0000 (UTC)
Date:   Fri, 12 Nov 2021 12:16:01 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: support specifying pins
Message-ID: <YY4+4Wb/H2ogKnQg@atomide.com>
References: <20211110231436.8866-1-zajec5@gmail.com>
 <CACRpkdbAS0JiqTQUU0R0yRhVCwagubwsNYLxj1DLE1Ldc+H_JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbAS0JiqTQUU0R0yRhVCwagubwsNYLxj1DLE1Ldc+H_JQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [211111 15:32]:
> At the time (2011?) it was unclear what kind of data should go into
> e.g. header and data files in the kernel (modules) and what should
> go into the DT. So the approach to put pin information into the DT
> was allowed for pinctrl-single.
> 
> The way I have understood it, DT maintainers have since gotten
> a bit wary about (ab)using the DT as a container for "anything data"
> and prefer that drivers contain details and derive these from
> compatible strings.
> 
> As of today, IIUC the DT maintainers are against this scheme.

We have some newish tools now compared 2011 though with #pinctrl-cells.
And we now have also GENERIC_PINCTRL_GROUPS, GENERIC_PINMUX_FUNCTIONS
and GENERIC_PINCONF :)

The problem with the pinctrl-single binding is that it uses the hardware
specific mux values in addition to the mux register offsets. IMO the
values should use Linux generic pinctrl defines instead. Just like we
do for the gpio and interrupt bindings. And then the generic pinctrl
binding would be very similar to the interrupts-extended binding for
example.

And with a generic pinctrl binding pinctrl-single could be updated to
parse the generic binding naturally too in addition to the legacy
binding.

> That said, the topic is open in a way. Some people are also annoyed
> that some graphics drivers just ask Torvalds to pull 100.000+ lines
> of register defnes in some merge windows. The data has to go
> somewhere.

Yes and the amount of SoC specific LOC under drivers/pinctrl is pretty
staggering already.

With all that SoC specific data built into the kernel, it's like going
camping with all your pants stuffed into your car instead of just the
pants you need :)

We only need the SoC specific data for the booted SoC, so devicetree
and loadable modules makes more sense there compared to the current
built-in setup.

Regards,

Tony
