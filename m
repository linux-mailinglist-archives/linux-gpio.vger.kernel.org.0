Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8B3E64B098
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 08:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbiLMHtS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 02:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234668AbiLMHtN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 02:49:13 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7631B15FFD;
        Mon, 12 Dec 2022 23:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670917751; x=1702453751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XTskNey0ICfEsdlFG1bHhWZHL9GN2juLmrKEYQsHdks=;
  b=pRNW69n1nBFh8X9gpbcQ4nu0QXi2OCDzZQzsV3MEjiub2EGKY2vK/LdM
   oHF5Hg/L4HZcdBy4H1CI4fg26vqKnoYn9ihpcfRsh8K6Xodp3zBRK3EI+
   fEhWHKxil+tBPKBe631hxBgpW1HuvrwDOM6GMx3NTmEaeH3bdZdtYPvuf
   cqAIzR8b+shkEj06A69bBGLLW6+8cTN5byQfLoN5tJ4yGrtF9AUth/6V6
   9QHAUenSRJ0KnOEOM0ElZMOA+eN2T2nsOhPQiYuYM1MCr0R4RMsj10vRX
   Kyl2ZtF4zmfk8B9bTgIWM6CXCpFqOai6Ot3uqm0xMx4sn8IEUPEY2b/AS
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,240,1665439200"; 
   d="scan'208";a="27911315"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Dec 2022 08:49:09 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 13 Dec 2022 08:49:09 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 13 Dec 2022 08:49:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670917749; x=1702453749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XTskNey0ICfEsdlFG1bHhWZHL9GN2juLmrKEYQsHdks=;
  b=lTWWP36qauRc/D1cSvbFXVqKu06dMOWnvsSpRUChaNwpkCGH2StI7Q/C
   ZwUsxY7o/hY/CZwkn6or76uj0VDFbj8CasF/UkWVMSp0WRGNYpxYYTOc1
   wjyhITkPcjQXHrh2ZJkDpbtW3oaRuQ4h7wyQGDY6tqar5DjsUuZrqLoxT
   6WZeJkfJCFqjJFT3fW8pcU5JIqGX7pe/4D7uN4QV0yA+Mu8itJq6CR1y7
   TkTTFp8gVA06S50zhhxMaeQnOeNisvRT9xonO9vKX798GQUaJOP/xN3qF
   LRYmOQjiw8VKWoV0c6KNCQsWoFdE5csdM31d3A/6rQvvUy90LKhhDj/63
   g==;
X-IronPort-AV: E=Sophos;i="5.96,240,1665439200"; 
   d="scan'208";a="27911314"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Dec 2022 08:49:09 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E5C17280071;
        Tue, 13 Dec 2022 08:49:08 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH 0/3] gpiolib: ramp-up delay support
Date:   Tue, 13 Dec 2022 08:49:06 +0100
Message-ID: <2506013.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Y5chUvK+SLMpm9XY@pendragon.ideasonboard.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com> <Y5chUvK+SLMpm9XY@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Laurent,

thanks for your fast comments.

Am Montag, 12. Dezember 2022, 13:40:50 CET schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Mon, Dec 12, 2022 at 11:35:22AM +0100, Alexander Stein wrote:
> > Hi all,
> > 
> > this series is an RFC for a general approach to solve the issue at [1].
> > While
> I'm impressed by how fast you came up with a solution :-)
> 
> > a device specific property works as well, a more generic approach is
> > preferred. In short: When enabling a GPIO the actual ramp-up time might
> > be (much) bigger than what software usually assume, in my case >100ms.
> > Adding a delay to each driver is cumbersome.
> > Instead the (optional) ramp-up delay is added to each gpio_desc. The
> > delays can be specified per gpio-controller, similar to
> > 'gpio-line-names'. Actually the parsing code is almost a 1:1 copy of
> > devprop_gpiochip_set_names().
> While I like consistency, I wonder if it wouldn't be better in this case
> to use a list of <gpio-number delay> cells in gpio-ramp-up-delays-us. In
> typical use cases, very few GPIOs will need a delay, and a GPIO
> controller could support a very large number of GPIOs, which would make
> your current proposal cumbersome.

That's a good idea. I would even go a step further to specify both ramp-up and 
ramp-down in one cell, e.g. <gpio-number ramp-up ramp-down>. This way a second 
property is not needed.

> > Due to
> > (temporary) memory allocation, I opted for a separate function, there is
> > code duplication, but handling both properties in a single function
> > seemed too tedious, let alone the to be added ramp-down delays.
> > 
> > This feature could also be added as a callback in gpio_chip, but the
> > callbacks have to be added to each driver then. I would prefer a single
> > one-fits-all implementation and another indirection in the GPIO call
> > chain.
> 
> Agreed.
> 
> > Laurent suggest to add a GPIO delay node in DT. IMHO this increased the DT
> > complexity unnecessarily. But comments are welcome.
> 
> It's an alternative approach that could be considered if this one is
> rejected, but I have a preference for your solution.
> 
> > The following 3 patches are a proof-of-concept on my platform, consisting
> > of: Patch 1 is the proposed bindings and straight forward.
> > Patch 2 is the current implementation
> > Patch 3 is an actual usage example for specifying the delays
> > 
> > TODO:
> > 1. Adding ramp-down delays (Just the inverse copy of ramp-up delay)
> > 2. Should these delays take active low flags into account?
> 
> How so ?

Given the name ramp-up (& ramp-down) I would assume they affect the voltage 
low -> high change (resp. high -> low), not just gpiod_set_value(..., 1).

> > 3. How to deal with setting multiple GPIOs at once?
> > 
> > I skipped 1. for now, because this is just a copy with ramp-up being
> > replaced with ramp-down.
> > 
> > I'm not that well versed in gpiolib code, so I'm not sure if I got all
> > placed where GPIOs are set. So patch 2 might be incomplete.
> > 
> > For now I skipped setting multiple GPIOs at once completely, so to get
> > some
> > feedback on this approach. A possible solution is to check for the bigest
> > delay in the set and use that for all afterwards. But I'm not sure about
> > the overhead in this case.
> 
> I assume you're talking about the gpiod_set_array_value() API. That
> sounds OK as an initial implementation, a caller of that function needs
> to be prepared for the GPIOs being set in a random order due to hardware
> delays, so it shouldn't break the API contract. I would however state
> this explicitly in the function documentation.

Okay, that seems sensible. Will do it.

Best regards,
Alexander

> > I hope there is some feedback. While thinking about this issue appears to
> > be more widespread than I expected.
> > 
> > Best regards,
> > Alexander
> > 
> > [1]
> > https://lore.kernel.org/all/20221209083339.3780776-1-alexander.stein@ew.t
> > q-group.com/> 
> > Alexander Stein (3):
> >   dt-bindings: gpio: Add optional ramp-up delay property
> >   gpiolib: Add support for optional ramp-up delays
> >   arm64: dts: mba8mx: Add GPIO ramp-up delays
> >  
> >  .../devicetree/bindings/gpio/gpio.txt         | 22 +++++
> >  arch/arm64/boot/dts/freescale/mba8mx.dtsi     |  5 ++
> >  drivers/gpio/gpiolib.c                        | 80 +++++++++++++++++++
> >  drivers/gpio/gpiolib.h                        |  3 +
> >  4 files changed, 110 insertions(+)




