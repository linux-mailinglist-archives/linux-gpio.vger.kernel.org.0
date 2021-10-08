Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9CB1427375
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Oct 2021 00:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243573AbhJHWN2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 18:13:28 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:46782 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243563AbhJHWN0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 18:13:26 -0400
Received: by mail-oi1-f174.google.com with SMTP id o204so7364624oih.13;
        Fri, 08 Oct 2021 15:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d6BsMDMQTAtwuQOjR1Y00yw1JHyPYzJywrXEXvPOQvA=;
        b=1b5SYFCWR9r2rGiHixzUmWsQEcxs4h42B0hpGl8q5rdj67hoqwYkBsJ9YlK2HG436i
         0lLHJTmX5M6XiYvC5tileTO63sZh3csrn38Xfru+vdF5rsJ6wilKNigMCrBuZg2UMoE0
         6eQxHqt5RZmWak7UHjdilwSoZJ2AVK0onUZytO1vCP48u7Zbb44EzK+3shagtX9vivDj
         GntMwnahtWZ+qaJhZr7SPqwMHLdqgR5j8/2kjF5uY2dXtg3iTgb2qcnQTcfgBVe+ZqKo
         emOcQFLlgM4p3YC4OJeasLUwBACGoIfwDOVh6qWy9Bef2CNxPMn6LgOg0UUiNmukq0EQ
         88gg==
X-Gm-Message-State: AOAM532d7fQsdd/Hgd5NWrJIAr69O/yneNoqiYwsT/M/V7liWJrf133d
        Vfku6thU//VduGHcLxbp2wxBa82OHQ==
X-Google-Smtp-Source: ABdhPJxjNWPKMwCnB1Pb/gbrjWGF++/KQD5XMV7P8tAq7lCIoW/WM5muuAKgrFcqqtYvPzM5tOIaTA==
X-Received: by 2002:aca:1101:: with SMTP id 1mr18234970oir.85.1633731090390;
        Fri, 08 Oct 2021 15:11:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e28sm143182oth.40.2021.10.08.15.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 15:11:29 -0700 (PDT)
Received: (nullmailer pid 3407634 invoked by uid 1000);
        Fri, 08 Oct 2021 22:11:28 -0000
Date:   Fri, 8 Oct 2021 17:11:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, warthog618@gmail.com,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC v2 04/11] dt-bindings: Add HTE bindings
Message-ID: <YWDCEOuHu8vsRSPH@robh.at.kernel.org>
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-5-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930232617.6396-5-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 04:26:10PM -0700, Dipen Patel wrote:
> Introduces HTE devicetree binding details for the HTE subsystem. It
> includes examples for the consumers, binding details for the providers
> and specific binding details for the Tegra194 based HTE providers.
> 

This pattern of binding isn't easily checked completely by schema. You 
need a dtc check added too. Should be a 2 line change. (And dtc changes 
go upstream first).

> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> Changes in v2:
> - Replace hte with hardware-timestamp for property names
> - Renamed file
> - Removed example from the common dt binding file.
> 
>  .../hte/hardware-timestamps-common.yaml       | 29 +++++++
>  .../devicetree/bindings/hte/hte-consumer.yaml | 48 +++++++++++
>  .../bindings/hte/nvidia,tegra194-hte.yaml     | 79 +++++++++++++++++++
>  3 files changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml b/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
> new file mode 100644
> index 000000000000..8b8db3bc4dcf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hte/hardware-timestamps-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hardware timestamp providers
> +
> +maintainers:
> +  - Dipen Patel <dipenp@nvidia.com>
> +
> +description: |
> +  Some devices/SoCs have hardware time stamping engines which can use hardware
> +  means to timestamp entity in realtime. The entity could be anything from
> +  GPIOs, IRQs, Bus and so on. The hardware timestamp engine (HTE) present
> +  itself as a provider with the bindings described in this document.
> +
> +properties:
> +  $nodename:
> +    pattern: "^hardware-timestamps(@.*|-[0-9a-f])*$"

"^hardware-timestamp(@.*|-[0-9a-f])?$"

> +
> +  "#hardware-timestamps-cells":

Double plural:

#hardware-timestamp-cells

Arguably, the same string everywhere would have been an easier design, 
but let's keep consistency with (most) other flavors of this pattern.

> +    description:
> +      Number of cells in a HTE specifier.
> +
> +required:
> +  - "#hardware-timestamps-cells"
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/hte/hte-consumer.yaml b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
> new file mode 100644
> index 000000000000..cf65d1d44a18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hte/hte-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HTE Consumer Device Tree Bindings
> +
> +maintainers:
> +  - Dipen Patel <dipenp@nvidia.com>
> +
> +description: |
> +  HTE properties should be named "hardware-timestamps". The exact meaning of
> +  each hardware-timestamps property must be documented in the device tree
> +  binding for each device. An optional property "hardware-timestamps-names" may
> +  contain a list of strings to label each of the HTE devices listed in the
> +  "hardware-timestamps" property.
> +
> +  The "hardware-timestamps-names" property if specified is used to map the name
> +  of the HTE device requested by the devm_of_hte_request_ts() or of_hte_request_ts
> +  call to an index into the list given by the "hardware-timestamps" property.
> +
> +properties:
> +  hardware-timestamps:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      The list of HTE provider phandle. The provider must document the number
> +      of cell that must be passed in this property along with phandle.
> +
> +  hardware-timestamps-names:

hardware-timestamp-names


> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      An optional string property.
> +
> +required:
> +  - "hardware-timestamps"

Don't need quotes.

> +
> +dependencies:
> +  hardware-timestamps-names: [ hardware-timestamps ]
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    hte_irq_consumer {
> +              hardware-timestamps = <&tegra_hte_lic 0x19>;
> +              hardware-timestamps-names = "hte-irq";
> +    };
> diff --git a/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
> new file mode 100644
> index 000000000000..529926118f35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hte/nvidia,tegra194-hte.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra194 on chip generic hardware timestamping engine (HTE)
> +
> +maintainers:
> +  - Dipen Patel <dipenp@nvidia.com>
> +
> +description: |
> +  Tegra194 SoC has multiple generic hardware timestamping engines which can
> +  monitor subset of GPIO and on chip IRQ lines for the state change, upon
> +  detection it will record timestamp (taken from system counter) in its
> +  internal hardware FIFO. It has bitmap array arranged in 32bit slices where

has a bitmap

> +  each bit represent signal/line to enable or disable for the hardware
> +  timestamping.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra194-gte-aon
> +      - nvidia,tegra194-gte-lic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  int-threshold:

nvidia,int-threshold unless this is common for all hw timestamps?

> +    description:
> +      HTE device generates its interrupt based on this u32 FIFO threshold
> +      value. The recommended value is 1.
> +    minimum: 1
> +    maximum: 256
> +
> +  slices:

nvidia,slices

Needs a type.

> +    description:
> +      HTE lines are arranged in 32 bit slice where each bit represents different
> +      line/signal that it can enable/configure for the timestamp. It is u32
> +      property and depends on the HTE instance in the chip.
> +    enum: [3, 11]
> +
> +  '#hardware-timestamps-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - slices
> +  - "#hardware-timestamps-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tegra_hte_aon: hardware-timestamps@c1e0000 {
> +              compatible = "nvidia,tegra194-gte-aon";
> +              reg = <0xc1e0000 0x10000>;
> +              interrupts = <0 13 0x4>;
> +              int-threshold = <1>;
> +              slices = <3>;
> +              #hardware-timestamps-cells = <1>;
> +    };
> +
> +  - |
> +    tegra_hte_lic: hardware-timestamps@3aa0000 {
> +              compatible = "nvidia,tegra194-gte-lic";
> +              reg = <0x3aa0000 0x10000>;
> +              interrupts = <0 11 0x4>;
> +              int-threshold = <1>;
> +              slices = <11>;
> +              #hardware-timestamps-cells = <1>;
> +    };
> +
> +...
> -- 
> 2.17.1
> 
> 
