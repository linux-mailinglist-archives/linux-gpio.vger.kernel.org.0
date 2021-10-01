Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847D641F7FE
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 01:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhJAXEl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 19:04:41 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:44613 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbhJAXEk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 19:04:40 -0400
Received: by mail-ot1-f52.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso13358556otb.11;
        Fri, 01 Oct 2021 16:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=HPFMWdir494w9bNz8iSKAzV+hQY9c8iMUt7pI1HvHoo=;
        b=6iht+VdEMHIfBZOF21C899npkRfHgYd+HeRvau4ySnyNszWt70kMT3Z68rTxJUWdo0
         QxBitmVDQIE4FQpP6WNkA2efFzf1OQudIWh9r+/ILnsG3lOo0fDkR3BO/A5xEI2fUeRU
         itGKtnjbAScIJVmb9LwPpZq3wgNIoMrd5wH1oSmEdE95es8Hfrn54B0t9NwDtqGzJ811
         wZa3IQkAHGZ0QxJwwE03cAYNxuzqUGx6nI3bA70MY48/SjxPKEJPHIz0ZNAcgZomKWPe
         Hy2qwyjIEnZfB8DrIZ3Iddw9XU+LshGkJYI16dOLH2yg0tSruSFNJ1gzI2Hu8DxkNlOq
         yEbg==
X-Gm-Message-State: AOAM5313F+d94PvzCFc56XXcdWtnN2l2xhhorUhnqKaCyG41ecsWCLsE
        5jUz9nqoQ+axB1DypTTtyJ9Jfi4MJA==
X-Google-Smtp-Source: ABdhPJxpa+7Ej4eouceWGgFrwO/nYeU7pNn5WsBgQFboYmeiIB/Hmza7bZiATYT4yudG/5NIb6c62Q==
X-Received: by 2002:a05:6830:4095:: with SMTP id x21mr374135ott.352.1633129375505;
        Fri, 01 Oct 2021 16:02:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m26sm1425258otr.27.2021.10.01.16.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 16:02:54 -0700 (PDT)
Received: (nullmailer pid 255461 invoked by uid 1000);
        Fri, 01 Oct 2021 23:02:54 -0000
From:   Rob Herring <robh@kernel.org>
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     Hector Martin <marcan@marcan.st>, nd@arm.com,
        Marc Zyngier <maz@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
In-Reply-To: <20211001191209.29988-3-joey.gouly@arm.com>
References: <20211001191209.29988-1-joey.gouly@arm.com> <20211001191209.29988-3-joey.gouly@arm.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
Date:   Fri, 01 Oct 2021 18:02:54 -0500
Message-Id: <1633129374.007240.255460.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 01 Oct 2021 20:12:08 +0100, Joey Gouly wrote:
> This property is used to describe the total number of pins on this
> particular pinctrl hardware block.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml: properties:apple,npins: 'description' is a required property
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml: properties:apple,npins: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml: properties:apple,npins: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml: properties:apple,npins: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml: ignoring, error in schema: properties: apple,npins
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
Documentation/devicetree/bindings/pinctrl/apple,pinctrl.example.dt.yaml:0:0: /example-0/soc/pinctrl@23c100000: failed to match any schema with compatible: ['apple,t8103-pinctrl', 'apple,pinctrl']
Documentation/devicetree/bindings/pinctrl/apple,pinctrl.example.dt.yaml:0:0: /example-0/soc/pinctrl@23c100000: failed to match any schema with compatible: ['apple,t8103-pinctrl', 'apple,pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1535492

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

