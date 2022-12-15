Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAFB64DBF5
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 14:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbiLONJu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 08:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiLONJt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 08:09:49 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9BC2BB20;
        Thu, 15 Dec 2022 05:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671109788; x=1702645788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HwnP+Muc+eIoUvUmE097y0xQxyfCkQ5Td5OQny8LSB0=;
  b=RHG8eWWG3nIkcUSc9xR9u8WLxrnF5hhZ1P9iC472rMNkYF2+Cs5hrPZr
   +ymxBE42nR2CJP95uEL3t6tucAHwSStwLYux2KMhkeZEwziEhBFnuVF0/
   vmSIXI1/fdkulD67vVFpQ+s8uGeh6co2zwUraLwt4lFTU4+KjbsddNusN
   9LQNalxDyfhLJzEJxUTt+5Qx2l7gfQkL5zyXHi2Z+nNMUZ7nCt0yV3vb3
   n33XlSe5r9XVmeW385wWJgOnn2lLiysg4nuprducewFCaSZ39zHzqL0xg
   J2Xl82IoHl0Vaq3CdZyzgaMBTvTEMvaBiSPCz3u1BEuEVkCT1xdAHyKJN
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,247,1665439200"; 
   d="scan'208";a="27975152"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Dec 2022 14:09:45 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 15 Dec 2022 14:09:45 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 15 Dec 2022 14:09:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671109785; x=1702645785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HwnP+Muc+eIoUvUmE097y0xQxyfCkQ5Td5OQny8LSB0=;
  b=ckvrdq8Lj9SW9QDyEM6bTqWSDZ8w4EZpPjRdryGUVq0sYn9A8WpLOv3U
   TaaQTo28HkZfSIZ74NWn8/0Kb59Pur4vTtrc0aYFlhqIX1PZsJPyg6nNq
   3itR2IJreQgndljVs8M0VsjzjZWN9z1XR3yQWg1mDWQBGnTcOg9+fDqAm
   RAQtwoKuGf7qBSbd5UNVCJNYkTwxlP0U2bj/eaIpzM49Hy/qcBdUmNnYr
   tPGFogEljTKsyGjb5gZqeibccXQQdOm4vWxgAIavlYYor+SiFkHhwQPmx
   7+eFnxgkunLMTDPJXTT7dx0YBXlZV5dkMV7opMtcfTJQ6zwfPR84h2cjc
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,247,1665439200"; 
   d="scan'208";a="27975151"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Dec 2022 14:09:45 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7CE05280071;
        Thu, 15 Dec 2022 14:09:45 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: gpio: Add gpio-delay binding document
Date:   Thu, 15 Dec 2022 14:09:41 +0100
Message-ID: <2176879.usQuhbGJ8B@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <d38655cb-d387-5bbd-c430-52a0b04ae3cc@linaro.org>
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com> <20221214095342.937303-2-alexander.stein@ew.tq-group.com> <d38655cb-d387-5bbd-c430-52a0b04ae3cc@linaro.org>
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

Hi Krzysztof,

Am Donnerstag, 15. Dezember 2022, 10:11:47 CET schrieb Krzysztof Kozlowski:
> On 14/12/2022 10:53, Alexander Stein wrote:
> > This adds bindings for a GPIO enable/disable delay driver.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >  .../devicetree/bindings/gpio/gpio-delay.yaml  | 75 +++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> > b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml new file mode
> > 100644
> > index 000000000000..20871356e9b5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/gpio-delay.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GPIO delay controller
> > +
> > +maintainers:
> > +  - Alexander Stein <linux@ew.tq-group.com>
> > +
> > +description: |
> > +  This binding describes an electrical setup where setting an GPIO output
> > +  is delayed by some external setup, e.g. RC curcuit.
> > +
> > +  +----------+                    +-----------+
> > +  |          |             VCC_B  |           |
> > +  |          |              |     |           |
> > +  |          | VCC_A        _     |           |
> > +  |  GPIO    |             | | R  |  Consumer |
> > +  |controller|        ___  |_|    |           |
> > +  |          |       |   |  |     |           |
> > +  |      [IOx|-------|   |--+-----|-----+     |
> > +  |          |       |___|  |     |   input   |
> > +  |          |              |     |           |
> > +  +----------+             --- C  +-----------+
> > +                           ---
> > +                            |
> > +                            -
> > +                           GND
> > +
> > +  If the input on the consumer is controlled by an open-drain signal
> 
> If IOx is open-drain, what is the VCC_A on the diagram? I think it
> wasn't present in original Laurent's diagram.

I have to admit my artistic skills are lacking :( I wanted to highlight that 
the actual GPIO output IOx is not (necessarily) the open-drain. This is 
somewhat important, because this can not be solved by just reconfiguring the 
GPIO to push-pull.

Instead there is a buffer (small box in the middle) which (in this case) 
converts from VCC_A on the left side connected to SoC to VCC_B on the right 
connected to consumer using an open-drain.
So this delay is induced passively by external circuits the SoC can not do 
anything about.

Best regards,
Alexander

> > +  attached to an RC curcuit the ramp-up delay is not under control
> > +  of the GPIO controller.
> > +
> > +properties:
> > +  compatible:
> > +    const: gpio-delay
> > +
> > +  "#gpio-cells":
> > +    description: |
> > +      Specifies the pin, ramp-up and ramp-down delays. The
> > +      delays are specified in microseconds.
> > +    const: 3
> > +
> > +  input-gpios:
> > +    description: Array of GPIOs which output signal change is delayed
> 
> maxItems: 32 or some other reasonable value

Okay. Apparently there is no limit within gpiolib, so I was not limiting the 
amount unnecessarily.

> > +
> > +  gpio-controller: true
> > +
> > +  gpio-line-names: true
> 
> and then the same maxItems.

Sure, will adjust as well.

> > +
> > +required:
> > +  - compatible
> > +  - "#gpio-cells"
> > +  - gpio-controller
> > +  - input-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    enable_delay: enable-delay {
> > +        compatible = "gpio-delay";
> 
> I am not sure whether the naming is the most accurate - it represents
> desired behavior (so the delay in rising signal), not actual hardware
> (RC filter), but maybe that's a bit more generic.
> 
> Anyway look fine for me.

IMHO delay fits pretty well, because it's the behaviour. I'm no hardware 
developer, but I assume that there are more possibilities than just RC filter 
which might require this delay.

Best regards,
Alexander

> > +        #gpio-cells = <3>;
> > +        gpio-controller;
> > +        input-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>,
> > +                      <&gpio3 1 GPIO_ACTIVE_HIGH>;
> > +    };
> > +
> > +    consumer {
> > +        enable-gpios = <&enable_delay 0 130000 30000>;
> > +    };
> 
> Best regards,
> Krzysztof




