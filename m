Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E395330A2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 20:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240427AbiEXSrZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 14:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240423AbiEXSrX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 14:47:23 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA360167C3;
        Tue, 24 May 2022 11:47:22 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-f1d5464c48so23370261fac.6;
        Tue, 24 May 2022 11:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a/gu+zlEuZDbUAmPz1zaMTbVOGJ5w5VzobNVyWlD/qk=;
        b=Ut/yActsQo/0CiowkpYQ0lB9K3eFBMugR2VVaIAgpvMvNPZsl7B0T49PJEwNp0Ekdp
         /cSdzolzIzeyrXpH9SON1lJ1ItU39ZqC/7UPfOy8nbsza2YXvMWwHOE/euzR1GrzzF7X
         FjuYzRmj0OqcNt4f6SA2hHgRJIDNqPl4efkNlaahEtiESJLji3dQEyQTPLr101e3ddHe
         F2TFk20iOr/pqe2gOGsrcr1SUjzF7sjBsPwUwxNQ4gE3lgSYZWxyim8BnQ6GEe3ID9Tv
         2CDnWKpwnry+D7P+Ku6p7ebcHHnujIOkVzrK6FrS32w4urjNHeN07iTO/n4XFs3t5/3o
         oAtQ==
X-Gm-Message-State: AOAM530UNlufC52FpXRFPP2vGPpYNOK2HUMQ0t547/Fmwj/cymCi/eFz
        0rNzTW2W+KYQylJWOE31JP4CNybmEA==
X-Google-Smtp-Source: ABdhPJyFm9QhMQk/4jRkh9zVAn4n0H2Xxx3MjpCVd/IeVWl2WsgosNqFBnMVaJc3tjPjXTLu8nqozw==
X-Received: by 2002:a05:6870:ea93:b0:ee:1763:6ed2 with SMTP id s19-20020a056870ea9300b000ee17636ed2mr3491311oap.28.1653418042065;
        Tue, 24 May 2022 11:47:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n10-20020a0568301e8a00b0060b1e040014sm1570001otr.51.2022.05.24.11.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 11:47:21 -0700 (PDT)
Received: (nullmailer pid 4157335 invoked by uid 1000);
        Tue, 24 May 2022 18:47:20 -0000
Date:   Tue, 24 May 2022 13:47:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for
 RZ/V2M pinctrl
Message-ID: <20220524184720.GA4138401-robh@kernel.org>
References: <20220520154051.29088-1-phil.edworthy@renesas.com>
 <20220520154051.29088-2-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520154051.29088-2-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 20, 2022 at 04:40:50PM +0100, Phil Edworthy wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/V2M pinctrl.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../pinctrl/renesas,rzv2m-pinctrl.yaml        | 174 ++++++++++++++++++
>  include/dt-bindings/pinctrl/rzv2m-pinctrl.h   |  23 +++
>  2 files changed, 197 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/rzv2m-pinctrl.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> new file mode 100644
> index 000000000000..305e836cf0a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/renesas,rzv2m-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2M combined Pin and GPIO controller
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Phil Edworthy <phil.edworthy@renesas.com>
> +
> +description:
> +  The Renesas RZ/V2M SoC features a combined Pin and GPIO controller.
> +  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> +  Each port features up to 16 pins, each of them configurable for GPIO function
> +  (port mode) or in alternate function mode.
> +  Up to 8 different alternate function modes exist for each single pin.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: renesas,r9a09g011-pinctrl # RZ/V2M

With only 1, you can drop 'oneOf' and 'items'.

> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +    description:
> +      The first cell contains the global GPIO port index, constructed using the
> +      RZV2M_GPIO() helper macro in <dt-bindings/pinctrl/rzv2m-pinctrl.h> and the
> +      second cell represents consumer flag as mentioned in ../gpio/gpio.txt
> +      E.g. "RZV2M_GPIO(8, 1)" for P8_1.
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 39

Needs some description as to what all these are. If it is not all the 
same kind of interrupt, then each one has to be listed.

Rob
