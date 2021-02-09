Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5AFF31479C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 05:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhBIEiQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 23:38:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:54138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230313AbhBIEhg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Feb 2021 23:37:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F170D64E79;
        Tue,  9 Feb 2021 04:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612845411;
        bh=u0ye5YH5GSVrpfq2eSE4lbtfcs73OeYDRhL0jVI/YYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SCGNjBLFMR4MDcO0MfgqZtNmQD/IrHH64k9r1OTvvzg/NQJ9/b6QHJvJsrmG6K/Yq
         0LZNbnC/hkYc5tkZbtaEN012e3Zj7r7/3fRAsw+Ta/TbjsDDLSKnXHpx+kvWlEohtU
         EjoniMhVUZrCpXVzjlLlL9HMHZA4OhecRK/Id6J64CZB/UOf4hqGwx5mhb245K5A8T
         SzeYXYfaTJTEYnWiWfnH1/itq585ML0zdmaTYvUfour9p00b+Tx++pf6FzxainY+IL
         jgLfz2yMyyga52DPKwJxLW2+TwlXhLX1C49m9S/uPy6KjVph/kBJA7KpfxcWU+svDe
         sVNiWK4XF+2EA==
Date:   Tue, 9 Feb 2021 10:06:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Define common TLMM
 binding
Message-ID: <20210209043647.GA2774@vkoul-mobl.Dlink>
References: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25-01-21, 20:26, Bjorn Andersson wrote:
> Several properties are shared between all TLMM bindings. By providing a
> common binding to define these properties each platform's binding can be
> reduced to just listing which of these properties should be checked for
> - or further specified.

Rob, Linus are we okay with this common binding, if so can we please get
this one in for the next merge window?

> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Dropped "phandle", as Rob pushed this to the dt-schema instead
> - Expanded the "TLMM" abbreviation
> 
>  .../bindings/pinctrl/qcom,tlmm-common.yaml    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> new file mode 100644
> index 000000000000..3b37cf102d41
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,tlmm-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Top Level Mode Multiplexer (TLMM) definitions
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This defines the common properties used to describe all Qualcomm Top Level
> +  Mode Multiplexer bindings and pinconf/pinmux states for these.
> +
> +properties:
> +  interrupts:
> +    description:
> +      Specifies the TLMM summary IRQ
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description:
> +      Specifies the PIN numbers and Flags, as defined in defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Specifying the pin number and flags, as defined in
> +      include/dt-bindings/gpio/gpio.h
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  wakeup-parent:
> +    description:
> +      Specifying the interrupt-controller used to wake up the system when the
> +      TLMM block has been powered down.
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    description:
> +      Pins can be reserved for trusted applications and thereby unaccessible
> +      from the OS.  This property can be used to mark the pins which resources
> +      should not be accessed by the OS. Please see the ../gpio/gpio.txt for more
> +      information.
> +
> +required:
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: true
> +
> +$defs:
> +  qcom-tlmm-state:
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
> +
> +    properties:
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.
> +
> +      bias-pull-down: true
> +      bias-pull-up: true
> +      bias-disable: true
> +      input-enable: true
> +      output-high: true
> +      output-low: true
> +
> +    additionalProperties: true
> +...
> -- 
> 2.29.2

-- 
~Vinod
