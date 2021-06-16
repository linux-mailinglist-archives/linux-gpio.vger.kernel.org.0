Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8405F3AA0BF
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 18:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbhFPQFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 12:05:31 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:45734 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhFPQF2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 12:05:28 -0400
Received: by mail-il1-f169.google.com with SMTP id b5so2760517ilc.12;
        Wed, 16 Jun 2021 09:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=GgCzoaHFOYAyVslQBS4dBQ8uJssoPQuTkyaaJARNtbc=;
        b=dNLMe70SeQ4TxE+090zFQjyggArJ27gfw6/0YIdJNojfWXEmI7jEeQJEWz2pAdrez4
         GrtAyVcWmPIldRX14oL8rwBD8cw47BYlfH2e0bspOpSu0NSa7NjQCU05gtLUiWtNVrkd
         am+WANKuHf4zNzSOJiIUtBpjYNwRGCudSttXtY0F8Lm710vpVOASdvzFhEy8Elp2vDAg
         J4/luyrNfLOaRJh5bYItDYyWuPMh2gJemhPJWHwLDx7/PGf4dhVewa53Xb0VLcxpJ5VI
         kaXXaoYPS7u4uwyx+idS4pOvP1Dv3kx0kMhkCWbqDQjkfh+BkYGCGV37Gsuf6fikocUB
         nLJw==
X-Gm-Message-State: AOAM5311C+z7tqJD03LJlw45O9z3i+qhuNZDRYTAmx2AwuTQuFnHt9vL
        +Kxb0/YcGPRFmBOO7OG2AA==
X-Google-Smtp-Source: ABdhPJx8UMEZU6dAOrHiF1TT0CKqmYo2m7y/g9MmQCga6fMN4JKzVRaR2nHahtnzrZFCpkQcU87hcw==
X-Received: by 2002:a05:6e02:1e0d:: with SMTP id g13mr285947ila.178.1623859400739;
        Wed, 16 Jun 2021 09:03:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e13sm1305123ilr.68.2021.06.16.09.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 09:03:20 -0700 (PDT)
Received: (nullmailer pid 3471592 invoked by uid 1000);
        Wed, 16 Jun 2021 16:03:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20210616132641.29087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210616132641.29087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT bindings for RZ/G2L pinctrl
Date:   Wed, 16 Jun 2021 10:03:05 -0600
Message-Id: <1623859385.212203.3471591.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 16 Jun 2021 14:26:39 +0100, Lad Prabhakar wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/G2L pinctrl.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 121 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-rzg2l.h   |  16 +++
>  2 files changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-rzg2l.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dts:20:18: fatal error: dt-bindings/clock/r9a07g044-cpg.h: No such file or directory
   20 |         #include <dt-bindings/clock/r9a07g044-cpg.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1492923

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

