Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF4962F61C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 14:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241625AbiKRNbY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 08:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241701AbiKRNbX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 08:31:23 -0500
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBFD67F6C;
        Fri, 18 Nov 2022 05:31:20 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1322d768ba7so5933039fac.5;
        Fri, 18 Nov 2022 05:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EfogeLm9YKn41KXzs/CGTbBvXGpNupwTv41nqDxYWRc=;
        b=Avk7dIxCFQk0G0gCJgSP8hQqIGuOs8CfWSGXLtonIRJdg7PzG5a1T4Dt1oRgulFQ1Z
         7CqSvotc4vrkbCOg0PyWbzFcoXCEYfIXcycfsVh6TUj4RmCrYGFhj3o6rMMIFKpD9nSE
         mLc/4mP4X2oi7A1PrpxxzvkFVgzHZ3hodNLPSIadUGGJdms8QW1Szg3EPeIlFsCm/BIt
         TYslSX4kYWGrlO+Kf6FZB89rvwuy+kURhhXi7GPIjUdsj1IpCdwUayJXc10TZ0RCm4Qk
         imPiXkoqw9kUo2cohavXXjiLnQ9z0G4D34bk1f/kjVsOAMN3z9rq+utjH7LVel9aC13s
         nJbw==
X-Gm-Message-State: ANoB5plihOkJxsUQwtE0lAEpIa1XZnhfh8VAp9wG/fVZyDRRXLOod0Ke
        r++WyX9zuP9cUT0XiVLfQg==
X-Google-Smtp-Source: AA0mqf7QRfsdsSbMWIOmsFpInlQ9vxFriR4ebriv3bGHGVpNO2xEQLPYKgVDxvgK/vJX4Yu7Z6iQ0g==
X-Received: by 2002:a05:6870:40ca:b0:141:e308:fab5 with SMTP id l10-20020a05687040ca00b00141e308fab5mr4049099oal.49.1668778278208;
        Fri, 18 Nov 2022 05:31:18 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id be41-20020a05680821a900b00339befdfad0sm1392635oib.50.2022.11.18.05.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 05:31:17 -0800 (PST)
Received: (nullmailer pid 1482189 invoked by uid 1000);
        Fri, 18 Nov 2022 13:31:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Matt Ranostay <mranostay@ti.com>
Cc:     brgl@bgdev.pl, devicetree@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, a.zummo@towertech.it,
        vigneshr@ti.com, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        lee@kernel.org, linus.walleij@linaro.org
In-Reply-To: <20221118092218.480147-2-mranostay@ti.com>
References: <20221118092218.480147-1-mranostay@ti.com>
 <20221118092218.480147-2-mranostay@ti.com>
Message-Id: <166877739931.1425860.1214658943409919491.robh@kernel.org>
Subject: Re: [PATCH v4 1/4] Documentation: ti,tps6594: Add DT bindings for the
 TPS6594x PMIC
Date:   Fri, 18 Nov 2022 07:31:19 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Fri, 18 Nov 2022 01:22:15 -0800, Matt Ranostay wrote:
> Add documentation for the TPS6594x PMIC including its RTC and GPIO
> functionalities.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti,tps6594.yaml   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mfd/ti,tps6594.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/ti,tps6594.example.dtb: pmic@48: gpio: Unevaluated properties are not allowed ('compatible' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/ti,tps6594.example.dtb: pmic@48: gpio:compatible:0: 'ti,tps6594x-gpio' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
Documentation/devicetree/bindings/mfd/ti,tps6594.example.dtb:0:0: /example-0/i2c0/pmic@48/gpio: failed to match any schema with compatible: ['ti,tps6594-gpio']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221118092218.480147-2-mranostay@ti.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

