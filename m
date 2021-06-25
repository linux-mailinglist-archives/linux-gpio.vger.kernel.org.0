Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5845F3B42B0
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 13:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhFYLsm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 07:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbhFYLsl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 07:48:41 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BECC061766
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 04:46:20 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id h3so9401107ilc.9
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 04:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tgDi0FCKsZnwX7VsEbSy0smaMpEVsSOVOBoh4nlMGXs=;
        b=03M16gCQh193nryv5d4WNf74IV+IJgJIPDtE7SeiPN3RlDHUVdB1/BH6LBnMJVBe7a
         Xeu2k0EB3oFvuA3070Mzg0skVcFzdyY1b1QUUB/z3V1zKkUW+Ag3yL9XX4zCHMpbIkTX
         JDURYYR8waDrYDLa+Hh+uhkma8FJdQ+y022bFT5EGZ8ErRb59FQNcFmCCW8gXs/j7152
         NHkMeu9uzkq5AS3Jx50pGeW0hZAfUNxoU23dlmJK78xE+TTWJxM6NaILwXDCiZjzL9zt
         9wUAiLh/Zljpgmc2Wg9Lfnq69HYLY5S0w1t/bMR3dRWsykvSYYt4nH9cBfmhXDl4WupD
         1WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tgDi0FCKsZnwX7VsEbSy0smaMpEVsSOVOBoh4nlMGXs=;
        b=dPffcsnJgMTkQ6kDxNMU2kwhHW82TslvXuTvIdUbYzbXiEt3lxAhuD9yDbRdHjoFQ6
         VtDaF528YeSW/VV3yLwOnMzrMexJu/aP3isXCXnYT34Swi5Sg1PWIhz1eNeQaQlJwaXY
         aet7SQmliYQ8hvaPWJyH94HsmE08Dodsb+0Nh3JNOByUkaIWnGPC1g0+A0X1bdXhcmNH
         2XHDr1bnl1Lipq871l+nQqLhoY7dju6QCwUlAfK/zbakns3zQIpVCDGvkJdVG4p1GmT0
         1FBG6KylzGQdxeR9wAZOjgiTihZMuUgRbBIk+HG2QIOmpqR3jtunz4AFlznvUtIYQikg
         JyuQ==
X-Gm-Message-State: AOAM532aSipBy/ikJvAP4PkxePtjrxaFvWbBTAnzQSyTDWn9Ly4gvP7G
        n61syQ7bjf6BUTUy5dBENtg81ycLnxkAJ4vCFeeAZg==
X-Google-Smtp-Source: ABdhPJwfX8xjOUkxO91ZcEJg9NpMZfuHjfbio/a600BrQVKMg+GSP0qU27UWh2vlLA+FnNta6XP8f+nFJZyhFTktiBY=
X-Received: by 2002:a92:dcc4:: with SMTP id b4mr7083720ilr.183.1624621579349;
 Fri, 25 Jun 2021 04:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210607123317.3242031-1-robert.marko@sartura.hr> <20210607123317.3242031-5-robert.marko@sartura.hr>
In-Reply-To: <20210607123317.3242031-5-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 25 Jun 2021 13:46:08 +0200
Message-ID: <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 7, 2021 at 2:33 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Add binding documents for the Delta TN48M CPLD drivers.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v3:
> * Include bindings for reset driver
>
> Changes in v2:
> * Implement MFD as a simple I2C MFD
> * Add GPIO bindings as separate
>
>  .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 +++++++++
>  .../bindings/mfd/delta,tn48m-cpld.yaml        | 90 +++++++++++++++++++
>  .../bindings/reset/delta,tn48m-reset.yaml     | 35 ++++++++
>  3 files changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
>  create mode 100644 Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> new file mode 100644
> index 000000000000..aca646aecb12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/delta,tn48m-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Delta Networks TN48M CPLD GPIO controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |
> +  This module is part of the Delta TN48M multi-function device. For more
> +  details see ../mfd/delta,tn48m-cpld.yaml.
> +
> +  GPIO controller module provides GPIO-s for the SFP slots.
> +  It is split into 3 controllers, one output only for the SFP TX disable
> +  pins, one input only for the SFP present pins and one input only for
> +  the SFP LOS pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - delta,tn48m-gpio-sfp-tx-disable
> +      - delta,tn48m-gpio-sfp-present
> +      - delta,tn48m-gpio-sfp-los
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> new file mode 100644
> index 000000000000..2c6e2adf73ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/delta,tn48m-cpld.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Delta Networks TN48M CPLD controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |
> +  Lattice CPLD onboard the TN48M switches is used for system
> +  management.
> +
> +  It provides information about the hardware model, revision,
> +  PSU status etc.
> +
> +  It is also being used as a GPIO expander for the SFP slots and
> +  reset controller for the switch MAC-s and other peripherals.
> +
> +properties:
> +  compatible:
> +    const: delta,tn48m-cpld
> +
> +  reg:
> +    description:
> +      I2C device address.
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +patternProperties:
> +  "^gpio(@[0-9a-f]+)?$":
> +    $ref: ../gpio/delta,tn48m-gpio.yaml
> +
> +  "^reset-controller?$":
> +    $ref: ../reset/delta,tn48m-reset.yaml
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cpld@41 {
> +            compatible = "delta,tn48m-cpld";
> +            reg = <0x41>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            gpio@31 {
> +                compatible = "delta,tn48m-gpio-sfp-tx-disable";
> +                reg = <0x31>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            gpio@3a {
> +                compatible = "delta,tn48m-gpio-sfp-present";
> +                reg = <0x3a>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            gpio@40 {
> +                compatible = "delta,tn48m-gpio-sfp-los";
> +                reg = <0x40>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            reset-controller {
> +              compatible = "delta,tn48m-reset";
> +              #reset-cells = <1>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
> new file mode 100644
> index 000000000000..0e5ee8decc0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/delta,tn48m-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Delta Networks TN48M CPLD reset controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |
> +  This module is part of the Delta TN48M multi-function device. For more
> +  details see ../mfd/delta,tn48m-cpld.yaml.
> +
> +  Reset controller modules provides resets for the following:
> +  * 88F7040 SoC
> +  * 88F6820 SoC
> +  * 98DX3265 switch MAC-s
> +  * 88E1680 PHY-s
> +  * 88E1512 PHY
> +  * PoE PSE controller
> +
> +properties:
> +  compatible:
> +    const: delta,tn48m-reset
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - "#reset-cells"
> +
> +additionalProperties: false
> --
> 2.31.1
>

Are there any issues with the bindings?
The patch series is depending on this as the rest has been reviewed.

Regards,
Robert
-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
