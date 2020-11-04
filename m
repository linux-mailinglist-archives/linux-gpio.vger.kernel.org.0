Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B470F2A6D3A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 19:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731724AbgKDSyu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 13:54:50 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:43028 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgKDSyu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 13:54:50 -0500
Received: by mail-oo1-f67.google.com with SMTP id z14so5317382oom.10;
        Wed, 04 Nov 2020 10:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mHHq8sD2+JI52RyeEt4QoVswwQozOAw3HR0XdcqO4HQ=;
        b=UjSLEBJH55/dZb1F/PgQLsB+0z+obxffycEkuyCUURj/sJ5fsRuDs5IHxoErPXX5B6
         XCepqgNN2Bjvs7l/4oCT1ggpta5Y5p0YlBXngZVli+J6xzpUeAI/0L1oKu2ZsiohMkR6
         AIewM5tcNcMxTT5vqoJgOd9kohb5rrS4V8TG1f5Rs1s18j8eR9sm1JFqdX9A0BywO7dd
         HFxV9zc9JDnFiFJpTUFil0UMM3tg1WUO2It4SJmDPezXxIq56q9w8DxY5Bq575Vo2K+3
         riGy8esqKlB/DkbrkUYFczjWruk7J62ixcT0L+mRG4BkNg8iOW/IUqGfFfpeLG5vTCuu
         95WQ==
X-Gm-Message-State: AOAM531AhHmbUGxATTkra29BmzBTD7koVP/r8szHjz+xxl+xI608OpLD
        fdteikur1mtN6koxTO3Pp7/GTe8b+Q==
X-Google-Smtp-Source: ABdhPJw3h1mbBqY2QhQq1HFG7O4JQHM0RdQPqFrraM6G19yb9NF9uitr9UmzzM6rN8uAYxnrnTQwBg==
X-Received: by 2002:a4a:be92:: with SMTP id o18mr19864620oop.22.1604516089278;
        Wed, 04 Nov 2020 10:54:49 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l11sm734703oon.35.2020.11.04.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 10:54:48 -0800 (PST)
Received: (nullmailer pid 3944170 invoked by uid 1000);
        Wed, 04 Nov 2020 18:54:47 -0000
Date:   Wed, 4 Nov 2020 12:54:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SDX55 pinctrl
 bindings
Message-ID: <20201104185447.GA3943573@bogus>
References: <20201103055801.472736-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103055801.472736-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 03 Nov 2020 11:28:00 +0530, Vinod Koul wrote:
> Add device tree binding Documentation details for Qualcomm SDX55
> pinctrl driver.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties:required: ['pins', 'function'] is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties:function: Additional properties are not allowed ('bias-pull-down', 'output-low', 'output-high', 'bias-disable', 'drive-strength', 'bias-pull-up' were unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties:function: 'drive-strength' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties:function: 'bias-pull-down' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties:function: 'bias-pull-up' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties:function: 'bias-disable' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties:function: 'output-high' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties:function: 'output-low' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'required'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: patternProperties:-pins$:properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'additionalProperties'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml: ignoring, error in schema: patternProperties: -pins$: properties: required
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml


See https://patchwork.ozlabs.org/patch/1392657

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

