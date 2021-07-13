Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C2E3C7910
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 23:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235797AbhGMVku (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 17:40:50 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:39768 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234947AbhGMVkt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 17:40:49 -0400
Received: by mail-il1-f174.google.com with SMTP id a7so5409805iln.6;
        Tue, 13 Jul 2021 14:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=XG4xRifa1Y/AuqQNHbBHo4FxHIDghL/k6L/P4dYHb4s=;
        b=fJ4+B/8EB84whatQgRu+Bh7UaFLgC+QfeFq+ATBpiCwE5GxKdTeQw+AKXtxuZWwAmR
         g6m1n2Tpb4dCAlBthOvjL+f21t+PAwxc5R+5cGS8nEbCZKjTZLLjZRaW2KnkhTWchm+/
         7zZsFy+2dshjQNDwuDPULKzy70MiPul3TtG9pRIBVCmVystqiiAhjZRkiOngHtR3e2iu
         Bbzod2huH8FYo5zdf2sJkqaI14Bvl1Rvof2axD21gVVGksSH1KZiPgTIYRXIjApZb4Ot
         xvrExPBLVXv1SdxjR0SNPzsA4x2SGRajIgGE7ObdmJEzPtT/HoKBxRoe5+6//fd8YuSZ
         3CiA==
X-Gm-Message-State: AOAM531IByBNu5OKATT1DJXa8e/Q6+QrBOwqMss0v7r3WnseuL+1pcVG
        A0kUp2EO1JTOzm5gq0SsJA==
X-Google-Smtp-Source: ABdhPJzwQ8achpdhJTPLQ7MBLIBm/5e6ZfshfMm2jmNNlXzIu+Aih5AMKlmxesIcV/77YUtvBSEUjQ==
X-Received: by 2002:a05:6e02:1527:: with SMTP id i7mr4276502ilu.134.1626212278680;
        Tue, 13 Jul 2021 14:37:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t15sm106235iln.36.2021.07.13.14.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 14:37:57 -0700 (PDT)
Received: (nullmailer pid 879321 invoked by uid 1000);
        Tue, 13 Jul 2021 21:37:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
In-Reply-To: <20210712194422.12405-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210712194422.12405-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT bindings for RZ/G2L pinctrl
Date:   Tue, 13 Jul 2021 15:37:53 -0600
Message-Id: <1626212273.288301.879320.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 12 Jul 2021 20:44:18 +0100, Lad Prabhakar wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/G2L pinctrl.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
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

See https://patchwork.ozlabs.org/patch/1504169

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

