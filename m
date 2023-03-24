Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009486C87C5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Mar 2023 22:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbjCXVzY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Mar 2023 17:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbjCXVzY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2023 17:55:24 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CDE18160;
        Fri, 24 Mar 2023 14:55:22 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id o25-20020a9d4119000000b006a11eb19f8eso425192ote.5;
        Fri, 24 Mar 2023 14:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679694922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg1iyMYEgtsbLeRCpRhPaB9K329aNM5LHp0JzHXTovw=;
        b=g/fx6hdC0vQe+dWc57qFuWdVYDA/E/z/s/Dt6lxAz8c6sAcBHwaUBqyPuVH54g/7E/
         lE9BFy9mHJKgnVwC1WTLk2jScU3omOCvu3IjQ7v34zwfgL0eoRqFR+Wg7DsNeS+bZc+P
         oJzFJrlNTiK8tGCbKNnMJK1QRUSiBwnKzAP+Qh4qYJeYED9DoLlIQCMg4GfRxKQ8blRk
         rMQn2w3sEI8VOKJ/Y8QncNzH2TZF5/86XXsyzc2YNNeeO7GIyXraiv9pRFpZEDmmwYsK
         cBv2Fb9XKVkYjpCRfvL7A7tGFFDELxuwYFOZGHFZ9ZHDwP+pNMfaQEYA1wAAvKUBr8EN
         lwDA==
X-Gm-Message-State: AO0yUKWL3kQGkoO5oSEB12mqCyrmjRbESlT7n2dxZ9KRNGBNOQkoSWu9
        XaQd/627ZUZHaGmQZoQB2A==
X-Google-Smtp-Source: AK7set9dYHYAM+jGb64LFJy7wftyFTrHGyla2bUb6XZxeJK54Y5Ubcj6Z23GeROLf7WDxg8xYzahkQ==
X-Received: by 2002:a05:6830:148d:b0:69f:93bc:26be with SMTP id s13-20020a056830148d00b0069f93bc26bemr2504070otq.21.1679694922173;
        Fri, 24 Mar 2023 14:55:22 -0700 (PDT)
Received: from robh_at_kernel.org ([2605:ef80:80f9:92f0:b372:78c0:69c1:66d6])
        by smtp.gmail.com with ESMTPSA id b12-20020a9d6b8c000000b0069fa7b738b3sm2800448otq.27.2023.03.24.14.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 14:55:21 -0700 (PDT)
Received: (nullmailer pid 49167 invoked by uid 1000);
        Fri, 24 Mar 2023 21:55:19 -0000
Date:   Fri, 24 Mar 2023 16:55:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Message-ID: <20230324215519.GA41513-robh@kernel.org>
References: <4fdb1416-b806-c9d3-dc1d-80875b01ac3a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fdb1416-b806-c9d3-dc1d-80875b01ac3a@gmail.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 18, 2023 at 12:10:59AM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson pin controller binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - consider that more than one compatible can be set
> - remove bus part from example
> v3:
> - remove minItem/maxItem properties for compatible
> v4:
> - split patch to be able to deal with the different reg/reg-names
> v5:
> - remove compatible definition from common yaml
> - move pincfg-node and pinmux-node definition to meson-gpio object definition
> v6:
> - add meson-pins definition
> - change usage of unevaluatedProperties
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 65 +++++++++++++
>  .../pinctrl/amlogic,meson-pinctrl-common.yaml | 57 +++++++++++
>  .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 66 +++++++++++++
>  .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 70 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 74 +++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 76 +++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
>  7 files changed, 408 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> new file mode 100644
> index 000000000..7dccf18c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-a1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson A1 pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: amlogic,meson-pinctrl-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-periphs-pinctrl
> +      - amlogic,meson-s4-periphs-pinctrl
> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^bank@[0-9a-z]+$":
> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio

       unevaluatedProperties: false

And other meson-gpio references. With that,

Reviewed-by: Rob Herring <robh@kernel.org>
