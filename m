Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27936BD176
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Mar 2023 14:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjCPNxm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Mar 2023 09:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjCPNxi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Mar 2023 09:53:38 -0400
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C071968C;
        Thu, 16 Mar 2023 06:53:36 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id s7so1005383ilv.12;
        Thu, 16 Mar 2023 06:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974816;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2YWliqp5lNeWu2afRd3ESu/UMsrFmX/tSRvg7IvURw=;
        b=Gv/VYHm07FjHFR/tABOWCAFQUfwWhJoU0l9mcKOLLg0TH5Ix3qv5DUdL9zfzddzvR+
         rr1Fnc7GvTop8ffc8yaGMtlv1ImROHhL7CYR8L2dPlLXcouQWrKlBMg3FJ8a+/ZetfpO
         WkBailZRMUIkmWrMbh3L4tKD916zRvB7AsocUQDkAxYjU2WFfJWV6thCQetWLpDi10pM
         YJYWvmcELCu3y2myIZrQRQ6ln+QS5y/ZFIffjt3oMDLWLjPVn3/PBEqTU+AgDTOtVCzB
         mECuc6e94j/AO3yypdZSyw3JG0NLNizbOYYkxMzJsC5ffAYijebonHllTcgw2tJTJX3u
         7pgQ==
X-Gm-Message-State: AO0yUKXyVrwaZkuK+1VwLZ39kLkWtoe7wnmRT2A/W4He5UN7h6quFFTF
        X++kImoj8hUOh2AZQDlI7A==
X-Google-Smtp-Source: AK7set9+ROvBZ84DStyZ/uJRXWEQwE8vC++tqt8GomgY6VU/ZPg3glzuUD1UFHjHk1y+Mx6YW2MsHA==
X-Received: by 2002:a05:6e02:1a2f:b0:316:6c68:73df with SMTP id g15-20020a056e021a2f00b003166c6873dfmr9633016ile.31.1678974815995;
        Thu, 16 Mar 2023 06:53:35 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id k26-20020a02c77a000000b003eb1eee43a7sm2515373jao.112.2023.03.16.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:53:35 -0700 (PDT)
Received: (nullmailer pid 2744941 invoked by uid 1000);
        Thu, 16 Mar 2023 13:53:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
References: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
Message-Id: <167897435071.2729635.1810239851912837866.robh@kernel.org>
Subject: Re: [PATCH v5] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Date:   Thu, 16 Mar 2023 08:53:34 -0500
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Wed, 15 Mar 2023 22:23:57 +0100, Heiner Kallweit wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml: 'unevaluedProperties' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

