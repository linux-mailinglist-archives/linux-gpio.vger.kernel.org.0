Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4256D45B25A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 03:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240714AbhKXDCh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 22:02:37 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:41942 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240073AbhKXDCh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 22:02:37 -0500
Received: by mail-io1-f50.google.com with SMTP id y16so1308683ioc.8;
        Tue, 23 Nov 2021 18:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=X5nPMoox8dr33dKVv5jBLnAfhwzYs/fxVGeAdFP9yOI=;
        b=5XmQ/o7+YMTWZXKzfKqJMozZ6kAJkLFjYjBipT+Z2ZSeAkDuzat5oUhumT39qMrwdp
         Gcgyr1AxwdXmOrkxrNYtkegr39Yl1z/EMMg4M59fRB0DVXoTomMx7IILy9RD3l4MI6v6
         q66o1P+pyWTzbHOpgFh/ptkSTEayOfgkNxqxLFiShJ37D67OeCpioIT2bBhgz6fTkYxx
         qatVLU4JGq1tsf/mvGX8+BWNT2Rq+dVy7TAyePSYYyN+fsTjEcGkOEPiA1Dh4xYX5ygs
         8isKWQMMgRHDZmshPEmcPj5CxOrJbSFjSFCuwN0CFLwvwt4O/o4HutgCbwoSimdLtlrK
         Yc9w==
X-Gm-Message-State: AOAM531Ghcmz4MuVf+Sj+bgnfFnikzksSfG+DYE7ht/wN8lWmZq481j0
        ujVnU6y1Tut60renIax9qUs/dn3DuA==
X-Google-Smtp-Source: ABdhPJwE2HXnaR9dFn/GlzP0BHlfzb/nn9RLpSxUfhFyHZGFQ+wMSzAKV3MWABhY8xNs8kY7yzRJ7A==
X-Received: by 2002:a05:6602:2d07:: with SMTP id c7mr11117707iow.46.1637722767660;
        Tue, 23 Nov 2021 18:59:27 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n39sm9615024ioz.7.2021.11.23.18.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 18:59:27 -0800 (PST)
Received: (nullmailer pid 888174 invoked by uid 1000);
        Wed, 24 Nov 2021 02:59:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        warthog618@gmail.com, jonathanh@nvidia.com,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org
In-Reply-To: <20211123193039.25154-5-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com> <20211123193039.25154-5-dipenp@nvidia.com>
Subject: Re: [RFC v3 04/12] dt-bindings: Add HTE bindings
Date:   Tue, 23 Nov 2021 19:59:21 -0700
Message-Id: <1637722761.026321.888173.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 23 Nov 2021 11:30:31 -0800, Dipen Patel wrote:
> Introduces HTE devicetree binding details for the HTE subsystem. It
> includes examples for the consumers, binding details for the providers
> and specific binding details for the Tegra194 based HTE providers.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v2:
> - Replace hte with hardware-timestamp for property names
> - Renamed file
> - Removed example from the common dt binding file.
> 
> Changes in v3:
> - Addressed grammatical errors.
> - Removed double plural from the respective properties.
> - Added dual license.
> - Prefixed "nvidia" in nvidia specific properties.
> 
>  .../hte/hardware-timestamps-common.yaml       | 29 +++++++
>  .../devicetree/bindings/hte/hte-consumer.yaml | 48 +++++++++++
>  .../bindings/hte/nvidia,tegra194-hte.yaml     | 80 +++++++++++++++++++
>  3 files changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml: properties:nvidia,slices:type: 'anyOf' conditional failed, one must be fixed:
	'int' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'int' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml: properties:nvidia,slices:type: 'int' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml: properties:nvidia,slices: 'oneOf' conditional failed, one must be fixed:
	Additional properties are not allowed ('enum' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('type' was unexpected)
		hint: A vendor string property with exact values has an implicit type
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml: properties:nvidia,slices: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	3 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	11 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	'boolean' was expected
		hint: A vendor boolean property can use "type: boolean"
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml: properties:nvidia,int-threshold: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('minimum', 'maximum' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml: properties:nvidia,int-threshold: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml: properties:nvidia,int-threshold: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml: ignoring, error in schema: properties: nvidia,slices: type
warning: no schema found in file: ./Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.example.dt.yaml:0:0: /example-0/hardware-timestamp@c1e0000: failed to match any schema with compatible: ['nvidia,tegra194-gte-aon']
Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.example.dt.yaml:0:0: /example-1/hardware-timestamp@3aa0000: failed to match any schema with compatible: ['nvidia,tegra194-gte-lic']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1558766

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

