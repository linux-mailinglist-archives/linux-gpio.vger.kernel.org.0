Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6461449A6F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 18:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240433AbhKHRIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 12:08:50 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:37581 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240435AbhKHRIt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 12:08:49 -0500
Received: by mail-ot1-f43.google.com with SMTP id v40-20020a056830092800b0055591caa9c6so26571202ott.4;
        Mon, 08 Nov 2021 09:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+wQZvNgyyjn3+v8l34ysdaksISh5LnqUaxH3QVKQ1xw=;
        b=I8p2I/RHrX5ktMbVMimY3tdkhs9UkVsSUQIyDqOqzilLm9O0qfWSPiGpZ5W8AI2gcR
         wzoicZrt21ix8CijJUuTI0ZUZWK/Jm9CPRKYq7Hw5/3ha8ajLzT/UoA9xF1EaD5k7G9c
         7KO/uvGjLDMUmwtv+vHwfae65psYwlFMxksjvk5PrA7y3eZAb9QzA3tF9gNOGdGrcDpo
         u19ksL6XGRsKJxOxouF8KMryEblHfISZZ4YNfKhv9ENzK0VkLfKOcyqWQ1f2nU4QYgBT
         SPVJACgHTzBCz0YIhlzBNkD70Ah4Eo8jKNuVYvfAoPS2McZLH/YUMdGd9cTlhPHpZ8zn
         LyxQ==
X-Gm-Message-State: AOAM530XH9Siwd/CYc2xKrMCt/88HT5ZtOYopgMRXqiWqWuGO5K3kfEa
        Lnzm+8jkIE313EwZzIj3Eg==
X-Google-Smtp-Source: ABdhPJyE2m9Bd0mTaoOq+L1k+wveMzvoclq85f8PRR1u9eZbzhJbadk37zweFJPvLaJOuibGv4aDZw==
X-Received: by 2002:a9d:5c2:: with SMTP id 60mr457729otd.104.1636391164189;
        Mon, 08 Nov 2021 09:06:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q29sm5703534oof.38.2021.11.08.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 09:06:03 -0800 (PST)
Received: (nullmailer pid 3517392 invoked by uid 1000);
        Mon, 08 Nov 2021 17:06:01 -0000
Date:   Mon, 8 Nov 2021 11:06:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 05/13] dt-bindings: clock: imx: Add documentation for
 i.MXRT clock
Message-ID: <YYlY+S9iuTjRNFW+@robh.at.kernel.org>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225653.W9X4uTuBfjTBCe44PlQdYj5pRnczkEUmvmbnCVeKkeM@z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102225653.W9X4uTuBfjTBCe44PlQdYj5pRnczkEUmvmbnCVeKkeM@z>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 02, 2021 at 06:56:53PM -0400, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add DT binding documentation for i.MXRT clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> new file mode 100644
> index 000000000000..4e92f79cf707
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imxrt-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock bindings for Freescale i.MXRT
> +
> +maintainers:
> +  - Giulio Benetti <giulio.benetti@benettiengineering.com>
> +  - Jesse Taube <Mr.Bossman075@gmail.com>
> +
> +description: |
> +  The clock consumer should specify the desired clock by having the clock
> +  ID in its "clocks" phandle cell. See include/dt-bindings/clock/imxrt*-clock.h
> +  for the full list of i.MXRT clock IDs.

blank line

> +properties:
> +  compatible:
> +    oneOf:

Don't need oneOf for a single entry.

> +      - enum:
> +          - fsl,imxrt1050-ccm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +  clock-names:
> +    minItems: 1

You have to define the name.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    anatop: anatop@400d8000 {
> +      compatible = "fsl,imxrt-anatop";
> +      reg = <0x400d8000 0x4000>;
> +    };

Not relevant to the example.

> +
> +    ccm@400fc000 {
> +      compatible = "fsl,imxrt1050-ccm";
> +      reg = <0x400fc000 0x4000>;
> +      interrupts = <95>,<96>;
> +      clocks = <&osc>;
> +      clock-names = "osc";
> +      #clock-cells = <1>;
> +    };
> +
> +    gpt: timer@401ec000 {

Drop unused labels.

> +      compatible = "fsl,imx53-gpt", "fsl,imx31-gpt";

Probably should be: "fsl,imxrt1050-gpt", "fsl,imx31-gpt"

Unless there's same features/quirks as the MX53 version?

> +      reg = <0x401ec000 0x4000>;
> +      interrupts = <100>;
> +      clocks = <&clks 3>;
> +      clock-names = "per";
> +    };
> -- 
> 2.33.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
