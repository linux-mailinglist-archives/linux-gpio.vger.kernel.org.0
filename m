Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B724C182D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 17:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242617AbiBWQJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 11:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242622AbiBWQJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 11:09:03 -0500
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791FCB7173;
        Wed, 23 Feb 2022 08:08:35 -0800 (PST)
Received: by mail-oo1-f54.google.com with SMTP id r15-20020a4ae5cf000000b002edba1d3349so22910776oov.3;
        Wed, 23 Feb 2022 08:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=D6TJA710dTkpMpQAgIRbYdjJreyXVwpZMn7+FiECLB8=;
        b=LJp6s8TohwSRrfhSVrIbsOKdQ+2UFZsh4FeOLVGA0udJi9MNHMAaMOnzrfIWMgLRSG
         lJqSg7G8OIVKUE0+BM+/rVvGYnaFNgSyqrOG8tE0W+M3hafHiZV9+ih3nhL67Lv8vjTv
         SVX8ljIJ1uQjAv5nwBDAL+i1O0HRGiZaVU9jwZuekGBghdiRzGMy2olCIhyq5BNXpvYj
         RdUbILMGeJtfZfP66cvW8IUx1A+ZNKtgapQTRTs9jd7DQAgKVZWD8PeC/g4BV6ktZk6v
         XcpOEA9YI68vITQOq7WBXL7e49uK8ILBtabNRELiCccpTI2comRyy4PY9IP4H2nvfCV8
         Nq3A==
X-Gm-Message-State: AOAM532eS+7gXLOB3YP7RP7tBKkLZW+mWuxJVX9b0uDh2xZm4Vy3ZQOv
        17ZcwxYBQ3lfrbZHtuKJ2g==
X-Google-Smtp-Source: ABdhPJw1Juy0FEBcM/u6wy9jYduAITMCZEvKeQnVSvN7BpVcLK7vZ6qhrhU9tFOXJh0Hn+0oaxEDBQ==
X-Received: by 2002:a05:6870:450d:b0:d3:973f:4189 with SMTP id e13-20020a056870450d00b000d3973f4189mr122409oao.95.1645632514806;
        Wed, 23 Feb 2022 08:08:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d1sm18326oos.10.2022.02.23.08.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 08:08:34 -0800 (PST)
Received: (nullmailer pid 1021551 invoked by uid 1000);
        Wed, 23 Feb 2022 16:08:31 -0000
From:   Rob Herring <robh@kernel.org>
To:     Aparna M <a-m1@ti.com>
Cc:     grygorii.strashko@ti.com, bgolaszewski@baylibre.com,
        a-govindraju@ti.com, praneeth@ti.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
In-Reply-To: <20220223072308.31868-1-a-m1@ti.com>
References: <20220223072308.31868-1-a-m1@ti.com>
Subject: Re: [PATCH v4] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller bindings to YAML
Date:   Wed, 23 Feb 2022 10:08:31 -0600
Message-Id: <1645632511.483635.1021550.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 23 Feb 2022 12:53:08 +0530, Aparna M wrote:
> Convert gpio-tpic2810 bindings to yaml format and remove outdated
> bindings in .txt format.
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
> 
> v3 -> v4: Add gpio-line-names property
> v2 -> v3: Remove redundant descriptions and make minor change in example
> v1 -> v2: Fix identation issues and update commit message
> 
>  .../bindings/gpio/gpio-tpic2810.txt           | 16 ------
>  .../bindings/gpio/gpio-tpic2810.yaml          | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml:30:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1596522

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

