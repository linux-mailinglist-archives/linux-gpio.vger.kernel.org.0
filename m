Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5C95A9FA9
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 21:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbiIATPE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 15:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233750AbiIATPA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 15:15:00 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBF5DF18;
        Thu,  1 Sep 2022 12:14:57 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-11ee4649dfcso27546041fac.1;
        Thu, 01 Sep 2022 12:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fHpuoKiaP8gaOWB+xshWeNLH14khrnSZpoqLnYd2/sQ=;
        b=2owWF9hLgbz3a4zEcRZL3fz/PRy/9WpFZ68bam1NmmJ5dzbrsMk/4okwZvmSXCa5rl
         Wr800DcjuDH685JmByDiFX4+wcV6dCtaJ0xD+394Tnf/lPUyzkYCMw8nv6CFpqYs8wtj
         nvsAE10sbA741metH7BVmwdD6vZRxXbALyAvArB58zDEb32+kcnRZb2af0ok140rVyo0
         AmDePWWb8AKjCDDnRnKAfgNNcO4hc4bDz8EtEKX643tFdf0j8i3diIb12dJ0Chernws7
         FSv5aqFFHAD/+6R8pueJGU4ZgX7oVHnpouP1WpL38DbIuwQPGoY9ZY/VW9NZ45olRHgt
         HaqA==
X-Gm-Message-State: ACgBeo15A8nmHdwk4gs/sics37vP0tdVGohV75anIO8qdScXYcxYO9JC
        IOl7rbuMs/LtkcoQKP7SMw==
X-Google-Smtp-Source: AA6agR5/5uzJNbiT4/9e04PK9Ypn0jZez6KHfkZ2dBJaXWmDx+E+aszkmLnMPoBglY+Uw6hAmCBZug==
X-Received: by 2002:a05:6808:1294:b0:344:a101:39f6 with SMTP id a20-20020a056808129400b00344a10139f6mr297182oiw.119.1662059696344;
        Thu, 01 Sep 2022 12:14:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z17-20020a05687041d100b0011b98fa9ab5sm16155oac.50.2022.09.01.12.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 12:14:55 -0700 (PDT)
Received: (nullmailer pid 2226881 invoked by uid 1000);
        Thu, 01 Sep 2022 19:14:55 -0000
From:   Rob Herring <robh@kernel.org>
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc:     linux-arm-kernel@lists.infradead.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, asahi@lists.linux.dev,
        devicetree@vger.kernel.org, Sven Peter <sven@svenpeter.dev>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System Management Controller
Date:   Thu, 01 Sep 2022 14:14:55 -0500
Message-Id: <1662059695.085972.2226880.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 01 Sep 2022 14:54:25 +0100, Russell King (Oracle) wrote:
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml    | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/apple,smc.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

