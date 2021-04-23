Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B93369501
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 16:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhDWOom (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 10:44:42 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:38719 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbhDWOol (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 10:44:41 -0400
Received: by mail-ot1-f47.google.com with SMTP id e89-20020a9d01e20000b0290294134181aeso19685148ote.5;
        Fri, 23 Apr 2021 07:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=QGN8eRyPKuW4NSsPBFt8iKdg3BE6h033oZLxsd+8+jc=;
        b=GemvwcQIx4XakKQdZSwYpCkNGdZGUaovK7EFC4wmw95HtUMKxuk4l6GkqKs8QBHUoH
         M5ueSoE+oeXaKNpjyMKiJNQ6c3qaY3zMhjR7oPiUcUozWNQjJPV6bF9cTFhZ9yyHVB/R
         SzuHav2EPhRR2wBOitX89ljnhMQZ0j6LYez5GGFXZKFr46PBYJ0u6b7rjMcEMGXEO3x4
         oeeUdZfh2/Wx2sgl8pnIcl4d4UMqJwXR4PGXi60WRd8eJ7Nl/mIBwoTF8j1PlxzQEv7Q
         DgJtOywIFcPH8MTeUpge3cmboxGKJTpvrvZ5nksvXb2MkByTu2PVDnpRyXsiiU2EPIJn
         p2yQ==
X-Gm-Message-State: AOAM5306L8YgjUMrEy5LQRWHuBvBhVK0unsEJt+dMRbb+yGbnLOraO6T
        V3bW5OSNsdBb7ZIv6ogy0w==
X-Google-Smtp-Source: ABdhPJxbnDBw8Wvw1Y7xQ7ZUqhUSiGO4keswnUerNmksJcd6swu12AvbpTKWVkPa44qqtxg5JYMhKQ==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr3751327otj.351.1619189044820;
        Fri, 23 Apr 2021 07:44:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b21sm1207972oov.6.2021.04.23.07.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:44:03 -0700 (PDT)
Received: (nullmailer pid 1023562 invoked by uid 1000);
        Fri, 23 Apr 2021 14:44:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, heiko@sntech.de,
        linus.walleij@linaro.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210423014400.1433347-1-jay.xu@rock-chips.com>
References: <20210423014400.1433347-1-jay.xu@rock-chips.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: rockchip: Convert to json-schema
Date:   Fri, 23 Apr 2021 09:44:02 -0500
Message-Id: <1619189042.263419.1023561.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 23 Apr 2021 09:44:00 +0800, Jianqun Xu wrote:
> Convert the pinctrl/rockchip,pinctrl.txt binding document to
> json-schema.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: patternProperties:^gpio[0-9]@[0-9a-f]:properties:required: ['compatible', 'reg', 'interrupts', 'interrupt-controller', '#interrupt-cells', 'gpio-controller', '#gpio-cells', 'clocks'] is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: patternProperties:^gpio[0-9]@[0-9a-f]:properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'required'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: patternProperties:^gpio[0-9]@[0-9a-f]:properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'additionalProperties'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: properties:rockchip,pmu: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('maxItems' was unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: properties:rockchip,pmu: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: properties:rockchip,pmu: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: properties:rockchip,grf: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('maxItems' was unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: properties:rockchip,grf: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: properties:rockchip,grf: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
./Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml: ignoring, error in schema: patternProperties: ^gpio[0-9]@[0-9a-f]: properties: required
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
Error: Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.example.dts:22.9-10 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1469447

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

