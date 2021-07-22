Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 016D93D25E2
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 16:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhGVN4m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 09:56:42 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:43785 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhGVN4m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jul 2021 09:56:42 -0400
Received: by mail-io1-f54.google.com with SMTP id k16so6568574ios.10;
        Thu, 22 Jul 2021 07:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=S9oqNdeEmjzMYqfxKnMhuJAig6YozFawShXYrQNAVqU=;
        b=X1hUm9xqwI8NrHwal/4X82uyONyH7SmwaiYih7A/hO06kBBU6OHw9zbjqaXfV7apzm
         zwqjfchs80zkTBtfROpaL8WL+WYqM9w9Cuc80+qfduVZYxBDPYBZW3csqGas/MgprH7H
         0Uy747xKsmGaAa+ErPdFNc8FcwjIAWbT1YHnMGUwAMZIpskdAtpzofA45Ze6dFMvhAXK
         tXSP42jPf8WtzVxodZCVvRASyDcpyZQPzQCxpc10Ru4ylyFVGJGtGht8RD7wn8ItsXtu
         zfdKVQsSqo3/XPHBqOPHbBIGKoT1g4k5MR5i2a4zk7KGx1KX8FhHlc5W/wo5NU85mOte
         fTmw==
X-Gm-Message-State: AOAM533lJUaWNb6bWH0Y/Tqr7TOMmi+kpWkHnkDP+QQqCiuEQpDO/Udk
        /uKpgllRmPOiruVfY3haGA==
X-Google-Smtp-Source: ABdhPJzNL5asZ1slIsXmHQueoDE6m957UCPdvi3vzleu5OadU6dIPbq9iYTm6K3LzeoCsL6DjZtBxA==
X-Received: by 2002:a05:6602:584:: with SMTP id v4mr45750iox.181.1626964635747;
        Thu, 22 Jul 2021 07:37:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p9sm14626199ilj.65.2021.07.22.07.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 07:37:15 -0700 (PDT)
Received: (nullmailer pid 4183864 invoked by uid 1000);
        Thu, 22 Jul 2021 14:37:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20210721191558.22484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210721191558.22484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT bindings for RZ/G2L pinctrl
Date:   Thu, 22 Jul 2021 08:37:12 -0600
Message-Id: <1626964632.914515.4183863.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 21 Jul 2021 20:15:55 +0100, Lad Prabhakar wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/G2L pinctrl.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 155 ++++++++++++++++++
>  include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  23 +++
>  2 files changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dts:29.34-35 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1508385

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

