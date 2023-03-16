Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BECCC6BDA7A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Mar 2023 21:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjCPU6F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Mar 2023 16:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjCPU6E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Mar 2023 16:58:04 -0400
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB26996621;
        Thu, 16 Mar 2023 13:58:02 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id bf15so1392971iob.7;
        Thu, 16 Mar 2023 13:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679000282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HIW6nQ4XWfdQUx5k0mQvCv0iyxvkQg+uxRbSjtQvbU=;
        b=582da5/m4p24VLKralHW7NZlOrJLqfftQw9hQd27vm14/c0rNkA/xkglOHYpZLM/Lb
         usHByRZeguE7ErcHcorf68qG+VcdR3IE3iNiuJjKgJHf/sol1rFxAVP2oJOx9ljI1eS+
         Mky+YrcUFqSIKluDAofHZ+tHaD5uggOoUCOk5n8z6T1jBV17FEsme9MnbKqs6xBSl9tJ
         rYGFbr3fTNCjduWLiUVS6mxYHGZtONpB3aV+hj+1E2OrOuT6T7KWrzsiDqmK00bxD+Gh
         y/WT1aZQ7/W3aVRiSW7O2reutxh/OZqrOurYsDtySc1rgq6CIb1KLOAVTrviE+l1epbP
         1OQQ==
X-Gm-Message-State: AO0yUKWfYdVtSCWcreURjo1rEQKJDYrYthuUbnjFLSXoaIchpXj81PF3
        2zn0WOcbsPKwcOihlrs/6Q==
X-Google-Smtp-Source: AK7set9UxV2kBMCVOZt9L1z0RGHb77a9pOW482C1HFL1oz1QCJnjQu80RimbxFWV+bLvXeoI90SWBQ==
X-Received: by 2002:a5d:9e51:0:b0:74e:3d27:f014 with SMTP id i17-20020a5d9e51000000b0074e3d27f014mr194738ioi.3.1679000281908;
        Thu, 16 Mar 2023 13:58:01 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id 20-20020a5ea514000000b0073462b45b76sm49703iog.52.2023.03.16.13.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 13:58:01 -0700 (PDT)
Received: (nullmailer pid 3866429 invoked by uid 1000);
        Thu, 16 Mar 2023 20:58:00 -0000
Date:   Thu, 16 Mar 2023 15:58:00 -0500
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
Subject: Re: [PATCH v5] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Message-ID: <20230316205800.GA3859968-robh@kernel.org>
References: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 15, 2023 at 10:23:57PM +0100, Heiner Kallweit wrote:
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
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 63 +++++++++++++
>  .../pinctrl/amlogic,meson-pinctrl-common.yaml | 52 ++++++++++
>  .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 64 +++++++++++++
>  .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 68 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 72 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 74 +++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
>  7 files changed, 393 insertions(+), 94 deletions(-)
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
> index 000000000..05074df12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -0,0 +1,63 @@
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
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^bank@[0-9a-z]+$":
> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio

       unevaluatedProperties: false

That will then make all the child nodes throw errors, so you'll need to 
add them.

Same elsewhere.

> +
> +    properties:
> +      reg:
> +        maxItems: 2
> +
> +      reg-names:
> +        items:
> +          - const: mux
> +          - const: gpio
