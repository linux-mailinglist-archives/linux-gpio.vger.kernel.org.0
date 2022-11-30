Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0737063E247
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 21:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiK3Umk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 15:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiK3Umi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 15:42:38 -0500
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0912CF45;
        Wed, 30 Nov 2022 12:42:36 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1322d768ba7so22489100fac.5;
        Wed, 30 Nov 2022 12:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aW4jE10bX9vLP2Ujep7LXrzT0zS8x0AH266cZuINKdo=;
        b=Qibh5i+NoD7fYyNFDdxEZ8iEuarsckLYyS+PIqqfIj2P9DlLaDDHH/cCdxu5h7A9vw
         JRu5DU9SlYzZdAk7CazTW/EpnKk8UKmO2lDnetOOuYOcTy/BqF9eZ0Iid5NLdjKhQTtw
         PdWtGt6xjNd/mSI0Ilo+LY2WV5nv5Giiqb5VgsSB5JMZy+fGhNZxnWtn60EIiigQkITj
         6c4XSPTZ7gygpf6NjfaKFlGULsUppwIh11SgNLjHDPQqUh6w9oTBi79KrGAVVnS/fhpb
         BjWgkmB52vbyKXipZr1D2fHS/3LRPr2eOUylcmi2cE+J8augO48/7HY72oYN5bgJe+Mk
         qXSw==
X-Gm-Message-State: ANoB5pmhD7PnFAeMVww/Le3TyCVUFX1XVfb+/9+wP118wtKYBt+fCZha
        3Skv+tgzFBSTGjaqseEZsQ==
X-Google-Smtp-Source: AA0mqf6yrnJ1ZKt+9YRFNFFmGrY2esG6zANb9VB249O1ygtEP6Vh36HNPW6Wav4gwm3M7X7kGfYBBw==
X-Received: by 2002:a05:6870:b527:b0:143:7736:806b with SMTP id v39-20020a056870b52700b001437736806bmr15596857oap.222.1669840955914;
        Wed, 30 Nov 2022 12:42:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m22-20020a056870059600b0013c8ae74a14sm1684710oap.42.2022.11.30.12.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:42:35 -0800 (PST)
Received: (nullmailer pid 2891149 invoked by uid 1000);
        Wed, 30 Nov 2022 20:42:34 -0000
Date:   Wed, 30 Nov 2022 14:42:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matt Ranostay <mranostay@ti.com>
Cc:     michael@walle.cc, vigneshr@ti.com, krzysztof.kozlowski@linaro.org,
        a.zummo@towertech.it, linus.walleij@linaro.org, lee@kernel.org,
        brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: ti,tps6594: add TPS6594 PMIC
 support
Message-ID: <20221130204234.GA2875170-robh@kernel.org>
References: <20221123053512.1195309-1-mranostay@ti.com>
 <20221123053512.1195309-2-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123053512.1195309-2-mranostay@ti.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 09:35:09PM -0800, Matt Ranostay wrote:
> Add documentation for the TPS6594 PMIC including its RTC and GPIO
> functionalities.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti,tps6594.yaml   | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> new file mode 100644
> index 000000000000..0de0db87dbf7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TPS6594 Power Management Integrated Circuit (PMIC)
> +
> +description: |
> +  TPS6594 Power Management Integrated Circuit (PMIC)
> +  https://www.ti.com/lit/ds/symlink/tps6594-q1.pdf

Normally a PMIC has some regulators...

> +
> +maintainers:
> +  - Keerthy <j-keerthy@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tps6594
> +
> +  reg:
> +    const: 0x48
> +
> +  ti,system-power-controller:
> +    type: boolean
> +    description: PMIC is controlling the system power.
> +
> +  rtc:
> +    type: object
> +    $ref: /schemas/rtc/rtc.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: ti,tps6594-rtc
> +
> +  gpio:
> +    type: object
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: ti,tps6594-gpio

GPIO, but not using the GPIO binding?

As Krzysztof pointed out, none of this needs child nodes. You have them 
just for convenience of instantiating Linux drivers.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic: pmic@48 {
> +            compatible = "ti,tps6594";
> +            reg = <0x48>;
> +
> +            rtc {
> +                compatible = "ti,tps6594-rtc";
> +            };
> +
> +            gpio {
> +                compatible = "ti,tps6594-gpio";
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.38.GIT
> 
> 
