Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDEEC6DE838
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Apr 2023 01:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjDKXoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 19:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjDKXox (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 19:44:53 -0400
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429C4D8;
        Tue, 11 Apr 2023 16:44:52 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id l13-20020a0568302b0d00b006a416ec44ccso609247otv.2;
        Tue, 11 Apr 2023 16:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681256691; x=1683848691;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bhO8R9GioOCOagQ6Y9fLjNmhaghaaAAsdr3nkk8G91Q=;
        b=pffI9SjDBnzLY/ZEl7AYtbcNLcAGOeW2FqebwEUsP07kEREEoqEFU6EFTauSG8QyNH
         7v99HQ2Ma43QycLUixCTBTjxnxp5mju7zkArPkM/dNK3BZhJ7NicLJkaV3tZS5aHnIMD
         cTT0igm1i8Uw5lUULhz8lfmAOiseFq3fEenlBUjwzyMJQ7mGdtDG2lFu2Mn8KIqz28bW
         woMTVOTaLDgKw9WBpvX22H0p8wGrTp1IuNcndPX9oB35xv1NXeZ1ed0fh94Vy26No8f3
         P8th/jitUdKLaUM2pDYXj6+RRQPjByGrlD7MBMbSQW+bgWJAi6LqcwCP7kYAcSybtRhN
         zl4Q==
X-Gm-Message-State: AAQBX9fMzHVeMk1XfyAq/meKV/NIxINTJnT7qyP8iXbESC2YRM4MlFjW
        qj8X01o5gm8IJZL1398ExFS3FXj5fQ==
X-Google-Smtp-Source: AKy350Y4GC3JdkRk79jMyBG3SpXIy4yOATtALC36XtJb/GoPcjog7NeXxd7pXFccoDWD6Pn4a81+Jg==
X-Received: by 2002:a9d:7e98:0:b0:6a4:1980:2a93 with SMTP id m24-20020a9d7e98000000b006a419802a93mr294955otp.29.1681256691465;
        Tue, 11 Apr 2023 16:44:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m13-20020a0568301e6d00b0069faa14e99fsm5897068otr.10.2023.04.11.16.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 16:44:50 -0700 (PDT)
Received: (nullmailer pid 60808 invoked by uid 1000);
        Tue, 11 Apr 2023 23:44:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?utf-8?q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
In-Reply-To: <20230411184313.3679145-4-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
 <20230411184313.3679145-4-sean.anderson@seco.com>
Message-Id: <168125645190.55087.12770846806127473997.robh@kernel.org>
Subject: Re: [PATCH v13 03/15] dt-bindings: Convert gpio-mmio to yaml
Date:   Tue, 11 Apr 2023 18:44:49 -0500
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Tue, 11 Apr 2023 14:43:00 -0400, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, and some registers may be omitted. Because of this, reg-names
> is mandatory, and no order is specified.
> 
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.
> 
> Changes in v13:
> - Fix references to brcm,bcm63xx-gpio.yaml (neé brcm,bcm6345-gpio)
> 
> Changes in v12:
> - Put compatible first
> - Keep gpio-controller to one line
> - Add little-endian property
> - Alphabetize compatibles
> - Remove some comments
> - Remove some examples with insufficient novelty
> 
> Changes in v11:
> - Keep empty (or almost-empty) properties on a single line
> - Don't use | unnecessarily
> - Use gpio as the node name for examples
> - Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml
> 
> Changes in v10:
> - New
> 
>  ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  16 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 117 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 ------
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 ------
>  .../mfd/brcm,bcm6318-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm63268-gpio-sysctl.yaml        |   4 +-
>  .../mfd/brcm,bcm6328-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm6358-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm6362-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm6368-gpio-sysctl.yaml         |   4 +-
>  10 files changed, 130 insertions(+), 103 deletions(-)
>  rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpio/brcm,bcm63xx-gpio.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.example.dtb: syscon@10000080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6318-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 50]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.example.dtb: syscon@100000c0: gpio@0: False schema does not allow {'compatible': ['brcm,bcm63268-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 52]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.example.dtb: syscon@10000080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6362-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 48]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.example.dtb: syscon@10000080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6328-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 32]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.example.dtb: syscon@fffe0080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6358-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 40]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.example.dtb: syscon@10000080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6368-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 38]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230411184313.3679145-4-sean.anderson@seco.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

