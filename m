Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFDD3B9453
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 17:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbhGAP5V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 11:57:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:55580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233585AbhGAP5T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Jul 2021 11:57:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B78246141C;
        Thu,  1 Jul 2021 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625154888;
        bh=O06CAm7WJ4496cl30laeh/1AvJeU0pg7XZCQUJVmPNI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QlSj3zmd+DKrGqUvD72miBdMUZIXTb216PgVdkwcPqnvLsMr867mXlEqDq3QnwZ+o
         Wql2K9G2Vll5l1DyycbEqKM0DGtSU39lyIkdjUgiQgDgjG7FQgJzC8SDIFdEm9xhAx
         /cSZaF4kge8xK8zZ2YK4jmtvQdud1z14C+9V7SVHkdqJ1McdaF6qj72Rp6GcZfLLBd
         sgBNRCUF5z0/Q8NYKdTha1V0p6O8IuQSLUCrloWxfH4zSeDPEwQI7TKPj5KwfDfbfQ
         dxyauCjZ4GtC8vlAnNaRkDGazuU2kcCQJOtyPBRncRnGFg+fwanYeReKmO1kdnZrHC
         5WjElVD6y/z4A==
Received: by mail-ed1-f45.google.com with SMTP id t3so9078714edt.12;
        Thu, 01 Jul 2021 08:54:48 -0700 (PDT)
X-Gm-Message-State: AOAM530KU7gRY7sryMQqoLck0aZAab2Xcmng5anq5ETrgf/KI/b9Yu1H
        tvYMjP5cyamfkwlcVOjgU9mRs2KTb6ZufTTpkg==
X-Google-Smtp-Source: ABdhPJyDGAPIxTTNb6EWHJ2bVQwwFnuQfTQVDIiAx37Nf4MM2e0CE5x4dJwLmA9fI5C6HgKQd8YK6NB1MjuOVMKZnSU=
X-Received: by 2002:aa7:c54b:: with SMTP id s11mr627155edr.373.1625154887254;
 Thu, 01 Jul 2021 08:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-5-dipenp@nvidia.com>
In-Reply-To: <20210625235532.19575-5-dipenp@nvidia.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 1 Jul 2021 09:54:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLUc=_oyutBQ0rQP7uGhwh2dQeOng0ZEAfgOdqjGbiwOA@mail.gmail.com>
Message-ID: <CAL_JsqLUc=_oyutBQ0rQP7uGhwh2dQeOng0ZEAfgOdqjGbiwOA@mail.gmail.com>
Subject: Re: [RFC 04/11] dt-bindings: Add HTE bindings
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 5:48 PM Dipen Patel <dipenp@nvidia.com> wrote:
>
> Introduces HTE devicetree binding details for the HTE subsystem. It
> includes examples for the consumers, binding details for the providers
> and specific binding details for the Tegra194 based HTE providers.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  .../devicetree/bindings/hte/hte-consumer.yaml | 47 +++++++++++
>  .../devicetree/bindings/hte/hte.yaml          | 34 ++++++++
>  .../bindings/hte/nvidia,tegra194-hte.yaml     | 83 +++++++++++++++++++
>  3 files changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/hte.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
>
> diff --git a/Documentation/devicetree/bindings/hte/hte-consumer.yaml b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
> new file mode 100644
> index 000000000000..79ae1f7d5185
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
> @@ -0,0 +1,47 @@
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
> +  HTE properties should be named "htes". The exact meaning of each htes
> +  property must be documented in the device tree binding for each device.
> +  An optional property "hte-names" may contain a list of strings to label
> +  each of the HTE devices listed in the "htes" property.
> +
> +  The "hte-names" property if specified is used to map the name of the HTE
> +  device requested by the devm_of_hte_request_ts() or of_hte_request_ts
> +  call to an index into the list given by the "htes" property.
> +
> +properties:
> +  htes:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      The list of HTE provider phandle. The provider must document the number
> +      of cell that must be passed in this property along with phandle.
> +
> +  hte-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      An optional string property.
> +
> +required:
> +  - "htes"
> +
> +dependencies:
> +  hte-names: [ htes ]
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    hte_irq_consumer {
> +              htes = <&tegra_hte_lic 0x19>;
> +              hte-names = "hte-irq";
> +    };
> diff --git a/Documentation/devicetree/bindings/hte/hte.yaml b/Documentation/devicetree/bindings/hte/hte.yaml
> new file mode 100644
> index 000000000000..e285c38f1a05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hte/hte.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hte/hte.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HTE providers
> +
> +maintainers:
> +  - Dipen Patel <dipenp@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^hte(@.*|-[0-9a-f])*$"
> +
> +  "#hte-cells":
> +    description:
> +      Number of cells in a HTE specifier.
> +
> +required:
> +  - "#hte-cells"
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    tegra_hte_aon: hte@c1e0000 {
> +              compatible = "nvidia,tegra194-gte-aon";
> +              reg = <0xc1e0000 0x10000>;
> +              interrupts = <0 13 0x4>;
> +              int-threshold = <1>;
> +              slices = <3>;
> +              #hte-cells = <1>;
> +    };
> \ No newline at end of file
> diff --git a/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
> new file mode 100644
> index 000000000000..bb76cc1971f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hte/nvidia,tegra194-hte.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra194 on chip generic hardware timestamping engine (HTE)

I had to read until here to know what HTE is.

Is there another example of this type of h/w that this should be a
generic binding?

Rob
