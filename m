Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7626039247B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 03:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbhE0Boa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 21:44:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43707 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231968AbhE0Bo3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 May 2021 21:44:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fr9Yn31VKz9sPf;
        Thu, 27 May 2021 11:42:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
        t=1622079775; bh=ZS8pKZC0rALk5FKsBmqSxc/EGGyl/NL76hCAbd4pK1I=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=K2if7ryyvkECFbijqrSBC1HorlX2a4EFf0OiYKXejMep2456kRglHWDhKjLGO/Lif
         C0D69pDAXcdaEt0W15tWFhEwohyj+q1QzB52Y1oJEfjBgH6Cw5JZR+vBB02zOpGmzs
         hLU1GqUgY2+JbAIU2iqMOyQop+8Pot5pt0NmeILVzqvBrYSlj4FmV91eRWogBk6hhp
         ZLiVlc3drZRE0T+tXtudEINgvV1HZZwIp2Rbg4G6Ovsr5n2xmswHFxs3w2WqO6e6PT
         i2DAK7+fbIQxKbk/XLTL2C+uRGHUzd/9UxyqjIwWs8iaE/sf6yvqDXNimkP2hBfHXj
         m1FpKhii4SJQA==
Message-ID: <f50dec3a8be8f8254321d22d784eba4f5a032887.camel@ozlabs.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
From:   Jeremy Kerr <jk@ozlabs.org>
To:     Steven Lee <steven_lee@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Hongweiz@ami.com, ryan_chen@aspeedtech.com,
        billy_tsai@aspeedtech.com
Date:   Thu, 27 May 2021 09:42:51 +0800
In-Reply-To: <20210526094609.14068-2-steven_lee@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
         <20210526094609.14068-2-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Steven,

> SGPIO bindings should be converted as yaml format.
> In addition to the file conversion, a new property max-ngpios is
> added in the yaml file as well.
> The new property is required by the enhanced sgpio driver for
> making the configuration of the max number of gpio pins more
> flexible.

There are a number of things going on here - you're doing the YAML
conversion, introducing the max-gpios property, and changing the
compatible value.

The first two make sense, but may be better split into separate
changes, so that the YAML conversion is a "linear" change.

I'm not clear on why you're changing the compatible value though,
particularly as you're dropping support for the existing compatible
value anyway. How about we keep the old one, and use the default of 128
for cases where max-ngpios is absent? That way, we retain support for
the existing device trees.

> +  max-ngpios:
> +    description:
> +      represents the number of actual hardware-supported GPIOs (ie,
> +      slots within the clocked serial GPIO data). Since each HW GPIO is both an
> +      input and an output, we provide max_ngpios * 2 lines on our gpiochip
> +      device. We also use it to define the split between the inputs and
> +      outputs; the inputs start at line 0, the outputs start at max_ngpios.

Most of this description is better suited to the ngpios property, which
controls the number of lines that the gpiochip will expose.

Also, minor nit: max_ngpios -> max-ngpios.

How about something like:

  ngpios:
    description:
      Number of GPIO lines to expose. Since each HW GPIO is an input and an
      output, we provide ngpios * 2 lines on our chip device. We also use it
      to define the split between the inputs and outputs; the inputs start at
      line 0, the outputs start at ngpios.

  max-ngpios:
    description:
      Represents the number of actual hardware-supported GPIOs (ie, slots within
      the clocked serial GPIO data), and therefore the maximum value for
      the ngpios property

> +    minimum: 0
> +    maximum: 128

Will this be the case for all (future) hardware? Can we leave this
unbound?

Cheers,


Jeremy

