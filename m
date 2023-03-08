Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE1C6B0A8B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 15:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjCHOIS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 09:08:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjCHOHw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 09:07:52 -0500
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172F35C9FB;
        Wed,  8 Mar 2023 06:06:31 -0800 (PST)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-176d93cd0daso9394872fac.4;
        Wed, 08 Mar 2023 06:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678284391;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8yIx/AU8JzW8uSjkdg01a/PYhxpFU04JXt4ilid73Fg=;
        b=05hqTsNe/GBJpIiI4Xr8N7xFUSXrqqy/szG2Tn16qnmpAFNWLo7lY2CgPxbCTIkjij
         TFbtw1VvlQmpg3FkGQZPyDLvx443M5IQu4wmIXf0c3DJSjMkzg3GbROxoWummC/afUI7
         vqvIvfiBnEHYuQ2IHYHOmC6mehBxiP5W9VPhPAkRWSGhFltYqoZy+W3eOz/XK+yaZ5JV
         YnTZ1SniAsWmqQQ0YUUIPoPozdBGU59L8j7xB/GbFA4xWoxcWh9P213/KTTu0nLMD+2L
         Mb9DbSs8NeEz+zbMTUeHA0FapqPnz9N27ky5+s5mOYDUJ+Lbs7Y3DeNmwojrq0n9CIxo
         HJxA==
X-Gm-Message-State: AO0yUKVXni7RgvZ1fCPnEnY+QFnJsMbQdPo2b8Ntpa0FBK6z4nsbWygm
        jiKGCVgbDXrwzv4fSdq8Mg==
X-Google-Smtp-Source: AK7set9TNvbhYkYF/07vHAjhIjW7nnPGoUTxEfCExr/KeTykPce7GTNhjs/xFb+8h0xD1/EUloG4jQ==
X-Received: by 2002:a05:6870:414e:b0:176:554d:235b with SMTP id r14-20020a056870414e00b00176554d235bmr690543oad.59.1678284391145;
        Wed, 08 Mar 2023 06:06:31 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v22-20020a4ac916000000b0052532296449sm6208690ooq.20.2023.03.08.06.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 06:06:30 -0800 (PST)
Received: (nullmailer pid 2666472 invoked by uid 1000);
        Wed, 08 Mar 2023 14:06:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        smangipudi@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20230308114432.27133-1-pshete@nvidia.com>
References: <20230308114432.27133-1-pshete@nvidia.com>
Message-Id: <167828360289.2613214.7109201794709064028.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: tegra234
Date:   Wed, 08 Mar 2023 08:06:21 -0600
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Wed, 08 Mar 2023 17:14:30 +0530, Prathamesh Shete wrote:
> Add DT binding doc for Tegra234 pinmux driver.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 232 ++++++++++++++++++
>  1 file changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.example.dtb: pinmux@2430000: 'pinmux-pex-rst-c5-out' does not match any of the regexes: '^pinmux(-[a-z0-9]+)?$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230308114432.27133-1-pshete@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

