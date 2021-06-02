Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266D33986E3
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 12:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhFBKuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 06:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbhFBKtK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 06:49:10 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2F3C061574
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 03:47:23 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id g17so1772777wrs.13
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UfjIM+LI/qydiCGlRftPibFreQGOXtbFtxYa4Sx2Hfg=;
        b=xnevntkI/dNZ2dwhnG2Jzo8x5HDNuXJ00GF90aCoRQp5Q3NmcUNyPvXmsrVXZ0b8q7
         EfpIosGirJyjNr9HLTMcLJR6fvmmCHTTE3xwymcHNRciBWPZru8sAnZEeIW65qmdIvqQ
         fqQ83mtm0koBI29lngVErjZFDcePOeB4LFV1au84a5pVstqYpiKptHtUdSfdTmRP6eMv
         WPOX9vs60nFjV6gz4D1462lLnqLmHTjaG44+aVsngHjOgYi/4Qo8qs2HDxczkDVWeCHX
         0U57h9qBKiZnbGiZlo0ITGsjFPaxY1cGZnHmdz96/s9GrdrkvsNoRLX6CY8t8mocom+/
         XTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UfjIM+LI/qydiCGlRftPibFreQGOXtbFtxYa4Sx2Hfg=;
        b=PfCctB3jrDaVHPKhHUlaihjDgnBAipjnKJXsXnh0aBEowa9YsS35hUXUeOLybJo934
         fPzuRhCocRs7cg3yg7j7ra0HxDp994X3iXj6kkGME8T0HUJ8/GbHj9lAm6VR5DCECuj7
         MUuVNeowp+dD07nuMvSo5HZEVjG5Mll/Tt1TU4kAu/cbfLDKa8O5Zh52eB5hy1T6vdW0
         T7Ipazoj5eMHZi7Kw0HfgLT9VI6uDnuJ12uSPgcsxeJg4X8h+3mVUBFagYRZMs2bOBIy
         KX81F1VussxKdD28nkM8Iq9KbuWUmbGx/l1Ej9Rgyo05lS07UQMzMCaRGlVcvh8R4Tj4
         bW5w==
X-Gm-Message-State: AOAM530dTH0PISJsofNde7YMWSB4f0bzl4dYXMJdrYG+/ghbkr+YTHZz
        qO8LoE8JTjNzKn6Y0hQpLQvABQ==
X-Google-Smtp-Source: ABdhPJyfaHxb7cFtFnnTd/H6CkWsGTGR4AZAdxMIa76jXZC2diKeRoEjb7sA6U3fvRWhMPn9LDDLXA==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr33014640wrr.218.1622630842042;
        Wed, 02 Jun 2021 03:47:22 -0700 (PDT)
Received: from dell ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id 31sm7015444wrc.96.2021.06.02.03.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:47:21 -0700 (PDT)
Date:   Wed, 2 Jun 2021 11:47:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, luka.perkov@sartura.hr,
        jmp@epiphyte.org, pmenzel@molgen.mpg.de, buczek@molgen.mpg.de
Subject: Re: [PATCH v3 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <20210602104719.GI2173308@dell>
References: <20210531125143.257622-1-robert.marko@sartura.hr>
 <20210531125143.257622-5-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210531125143.257622-5-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 31 May 2021, Robert Marko wrote:

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

How is the Reset component addressed?

> +        };
> +    };

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
