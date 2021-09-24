Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843E9417667
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 15:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346097AbhIXOBT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 10:01:19 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:34728 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346576AbhIXOA6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 10:00:58 -0400
Received: by mail-ot1-f43.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so7550139otb.1;
        Fri, 24 Sep 2021 06:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WcWh55mrnHlrmpS4bF3C6RTmMv+GgWp8tjxqVJlKmm8=;
        b=h2myBCc2FwFUN06kisWSp/YQ0aVRvz+hEb5xr9ECMZuoxMh92+MKS5mJP3gDL66i3l
         Bs8LQR/BrxNedoDcR/ztIG49Zw564F1W7vfgO7HEl/J7W1VIDZtQn//0FGsPLljrTAzY
         doITC9ItLvksSN64wEl7A5Vvs4Ei5U7BN4lvoxGQVXVGDNKh+UedE6+lmgt8KL7e8TXB
         EAQnSIhA54GDUAm5jNqY4O4SR4S7NqPHVO7AGf8WuuTMEBig8T8sK12JSr3rsaoWUtgT
         rMyw3T0c5sg6w+WvYBK2dKtW1lWkXZun2rYn047Y6OqNR+0DLL8sWGL4GSfXd8HkVwFY
         iPkw==
X-Gm-Message-State: AOAM532ZChB0NhmEBJYrXQ8JZkdkyRgvaOovQ7y7o6we6eVXHZ8u9fC3
        IXYbvcFqfopwKGdR8sn++g==
X-Google-Smtp-Source: ABdhPJwu5vf62gkghKqrJp812TiqZCJ5L14q4YY1lFn4pkmkXKCEkfSFSlIERBrP2Win5Yi3GNO6Sw==
X-Received: by 2002:a9d:4a83:: with SMTP id i3mr4246791otf.385.1632491964290;
        Fri, 24 Sep 2021 06:59:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d26sm2075540oij.49.2021.09.24.06.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:59:23 -0700 (PDT)
Received: (nullmailer pid 1195979 invoked by uid 1000);
        Fri, 24 Sep 2021 13:59:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-clk@vger.kernel.org,
        Ryder.Lee@mediatek.com, fparent@baylibre.com,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        seiya.wang@mediatek.com, sean.wang@kernel.org, robh+dt@kernel.org,
        enric.balletbo@collabora.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, wim@linux-watchdog.org,
        linux-mediatek@lists.infradead.org, herbert@gondor.apana.org.au,
        mturquette@baylibre.com, linux-watchdog@vger.kernel.org,
        linux-serial@vger.kernel.org, mpm@selenic.com, linux@roeck-us.net,
        john@phrozen.org, sboyd@kernel.org, hsinyi@chromium.org,
        linus.walleij@linaro.org
In-Reply-To: <20210924114459.28664-1-sam.shih@mediatek.com>
References: <9aa66a93-4d0c-176e-ea35-b5aa33751d51@gmail.com> <20210924114459.28664-1-sam.shih@mediatek.com>
Subject: Re: [v4,5/9] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date:   Fri, 24 Sep 2021 08:59:21 -0500
Message-Id: <1632491961.645727.1195978.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 24 Sep 2021 19:44:59 +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to pin-65
> do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v4 : used yaml format instead of txt format document
> v3 : make mt7986 pinctrl bindings as a separate file
> v2 : deleted the redundant description of mt7986a/mt7986b
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 350 ++++++++++++++++++
>  1 file changed, 350 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: 'pin_group_table' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-up-adv: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-up-adv: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-up-adv: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-down-adv: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-down-adv: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-down-adv: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
Error: Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:37.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1532240

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

