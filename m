Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD9E46DBBF
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 20:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239525AbhLHTEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 14:04:38 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:35335 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232745AbhLHTEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 14:04:37 -0500
Received: by mail-ot1-f46.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso3731343otr.2;
        Wed, 08 Dec 2021 11:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6kC87cnwW/hQ1rM2PGkOjQbi/sjNvA/gYVdwH1zKNtI=;
        b=KGniMpf0jC6SPtZ7uJAZYN3o62M/ZW+Yiq0cR/t1SJxR/JHx1MO0+RdJ+yG0zqCV7z
         h4y+85Nl/Nes2J9BN6JzyyRgPU56gm07/BijPk+e0nqeKNpW2iwjY2ioFZaIquNZMemb
         y5L4mqrSQ+N68ivMTozTP5Eql/8RtcCE+jn/yTLlZj3iZ1QUzaHuqZ/Z89tv10+B0NHe
         6E0CeZ3cBbL6r9zvmhG7zjSPdCuM9Vwh822KGq/jjlVWof6N3asdym+FzHd3mOqd+PMH
         2Xgh+KxNkmqah8HInSle3UW0qNZ7Kz+5IRZ6beAuCRYb4Cf867pvwjxfl7n+aAxG5bi3
         Rfqg==
X-Gm-Message-State: AOAM532hj/Pu2oyxX/dOrtgnsxBaOuLPSf6X5gVEgi42/pJeJ8FdXfWG
        lh7LlG56II8MS8nj6Hh2aA==
X-Google-Smtp-Source: ABdhPJx5+MwfbbH+ymbij3wXAMlfL3aHvFALeug5SuPWYWjjzI2kA9vPbVgmhfiHMenf3wvTXvD1dA==
X-Received: by 2002:a9d:77ce:: with SMTP id w14mr1214631otl.252.1638990064442;
        Wed, 08 Dec 2021 11:01:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n23sm768827oic.26.2021.12.08.11.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 11:01:03 -0800 (PST)
Received: (nullmailer pid 151777 invoked by uid 1000);
        Wed, 08 Dec 2021 19:01:02 -0000
Date:   Wed, 8 Dec 2021 13:01:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: gpio: tegra: Convert to json-schema
Message-ID: <YbEA7phUwMFc18/Q@robh.at.kernel.org>
References: <20211208173047.558108-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208173047.558108-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 08, 2021 at 06:30:42PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra GPIO controller device tree bindings from
> free-form text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - replace unevaluatedProperties with additionalProperties
> 
> Changes in v2:
> - move GPIO hog definitions into unevaluatedProperties subschema
> - remove redundant description of standard properties
> 
>  .../bindings/gpio/nvidia,tegra20-gpio.txt     |  40 -------
>  .../bindings/gpio/nvidia,tegra20-gpio.yaml    | 111 ++++++++++++++++++
>  2 files changed, 111 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
> deleted file mode 100644
> index 023c9526e5f8..000000000000
> --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -NVIDIA Tegra GPIO controller
> -
> -Required properties:
> -- compatible : "nvidia,tegra<chip>-gpio"
> -- reg : Physical base address and length of the controller's registers.
> -- interrupts : The interrupt outputs from the controller. For Tegra20,
> -  there should be 7 interrupts specified, and for Tegra30, there should
> -  be 8 interrupts specified.
> -- #gpio-cells : Should be two. The first cell is the pin number and the
> -  second cell is used to specify optional parameters:
> -  - bit 0 specifies polarity (0 for normal, 1 for inverted)
> -- gpio-controller : Marks the device node as a GPIO controller.
> -- #interrupt-cells : Should be 2.
> -  The first cell is the GPIO number.
> -  The second cell is used to specify flags:
> -    bits[3:0] trigger type and level flags:
> -      1 = low-to-high edge triggered.
> -      2 = high-to-low edge triggered.
> -      4 = active high level-sensitive.
> -      8 = active low level-sensitive.
> -      Valid combinations are 1, 2, 3, 4, 8.
> -- interrupt-controller : Marks the device node as an interrupt controller.
> -
> -Example:
> -
> -gpio: gpio@6000d000 {
> -	compatible = "nvidia,tegra20-gpio";
> -	reg = < 0x6000d000 0x1000 >;
> -	interrupts = < 0 32 0x04
> -		       0 33 0x04
> -		       0 34 0x04
> -		       0 35 0x04
> -		       0 55 0x04
> -		       0 87 0x04
> -		       0 89 0x04 >;
> -	#gpio-cells = <2>;
> -	gpio-controller;
> -	#interrupt-cells = <2>;
> -	interrupt-controller;
> -};
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
> new file mode 100644
> index 000000000000..dd5d29add699
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nvidia,tegra20-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra GPIO Controller (Tegra20 - Tegra210)
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra20-gpio
> +          - nvidia,tegra30-gpio
> +
> +      - items:
> +          - enum:
> +              - nvidia,tegra114-gpio
> +              - nvidia,tegra124-gpio
> +              - nvidia,tegra210-gpio
> +          - const: nvidia,tegra30-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: The interrupt outputs from the controller. For Tegra20,
> +      there should be 7 interrupts specified, and for Tegra30, there should
> +      be 8 interrupts specified.
> +
> +  "#gpio-cells":
> +    description: The first cell is the pin number and the second cell is used
> +      to specify the GPIO polarity (0 = active high, 1 = active low).
> +    $ref: "/schemas/types.yaml#/definitions/uint32"

Don't need a type here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
