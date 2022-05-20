Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71ED252F17A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 19:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237176AbiETRWI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 13:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345306AbiETRWH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 13:22:07 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BAE762135;
        Fri, 20 May 2022 10:22:06 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id q8so10653596oif.13;
        Fri, 20 May 2022 10:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=wHAiN9i9ZSX1pTumLQ9nH/ZihmBygWS3kQh2yk6VlzY=;
        b=kCQHvQ5LfMKLY88JBjaxxxrZPVl4Icso5Kxjz7Fx4RyhxOF2f1gRqd5b2PsKp+BSYf
         eP/VPxW7eqxJY1IDJRCBkcTdQFbacdkocfletHIrX79klb/70styPXWWruNDjAf5NU+z
         h445ru3ahObh3AN4ZExjLNVBxQdKXJGW1r1TH7ljhhKjbUplveHqLgc3SjP8C5UA9RlK
         m4AK7yt+w5cCLKIoEMZwP99IU60rE4qrdbkmV54U88LnFGsUP24pcT7HsMUfuCtwImt/
         ARDlEGr6t+RY+avlcljtONGS/XgsK75cecZcBGdjT11xsnLrSgq4XD4au3HIfTLK775E
         LXQw==
X-Gm-Message-State: AOAM533ViA4ANxbskPj5GHQNsbXyQWCg3lmBzCIPwrxUy+KtF93NKqDF
        3TEfHPGdIXZJr6QBVvAJLnp2l+O0iQ==
X-Google-Smtp-Source: ABdhPJxi7NP17DTt/0hvJT2/+9CPnZvqnnY2qr5s/IkVaF5XjOz+5oZYsts6/rxEmhHjqmwJMp/Tbg==
X-Received: by 2002:aca:4385:0:b0:326:bf61:67ee with SMTP id q127-20020aca4385000000b00326bf6167eemr6301503oia.55.1653067325770;
        Fri, 20 May 2022 10:22:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k23-20020a544717000000b00325cda1ff87sm1269136oik.6.2022.05.20.10.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 10:22:05 -0700 (PDT)
Received: (nullmailer pid 4085110 invoked by uid 1000);
        Fri, 20 May 2022 17:22:04 -0000
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org
In-Reply-To: <20220520154051.29088-2-phil.edworthy@renesas.com>
References: <20220520154051.29088-1-phil.edworthy@renesas.com> <20220520154051.29088-2-phil.edworthy@renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for RZ/V2M pinctrl
Date:   Fri, 20 May 2022 12:22:04 -0500
Message-Id: <1653067324.196006.4085109.nullmailer@robh.at.kernel.org>
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

On Fri, 20 May 2022 16:40:50 +0100, Phil Edworthy wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/V2M pinctrl.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../pinctrl/renesas,rzv2m-pinctrl.yaml        | 174 ++++++++++++++++++
>  include/dt-bindings/pinctrl/rzv2m-pinctrl.h   |  23 +++
>  2 files changed, 197 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/rzv2m-pinctrl.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.example.dts:22:18: fatal error: dt-bindings/clock/r9a09g011-cpg.h: No such file or directory
   22 |         #include <dt-bindings/clock/r9a09g011-cpg.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

