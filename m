Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6718B39745F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 15:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhFANfA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 09:35:00 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:43841 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234215AbhFANe0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 09:34:26 -0400
Received: by mail-ot1-f46.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso14129536otu.10;
        Tue, 01 Jun 2021 06:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=vqp6CwXU0C1s6oo8r6W9FRHz8KpeFI4XqbW1usx1KFU=;
        b=gvNWrIRq1zVZTPvdQBufjnB488N3He3GvOg7huJNxiKcy4tEmgd879926iqzNp4Pt2
         JUWNP9Q6kj9Aw2ntSWSehconavLQ1cezWeL7+d3dJNN7GFsuhpLv3mEsIUeffj2gOVas
         eAy7zSx8+A4TPZC4Uxm54Top5gdKeCBm1/FoqFQ22L+ZqeHhYdd/w4+NONKwMU+DYt2y
         Cuy4NANEpzEQLZwFi50WKCPtxgNs7u0wswwMtdEqSpTbOuSca1pHpzsewOmBp0CYmH7e
         z3QUmc50HKngevi6mVIcsb3hhgTRoYz1n4XMh83DXTSysYqyNFaJHz2hOVrDsLKH86rx
         h4Sw==
X-Gm-Message-State: AOAM530kdZjqyzLGROLY8+NgpRxWZqnPb7j7yaX+GKrTxgcbU0OMfzvK
        Q++279jrEMIhE0TPkfBq1Q==
X-Google-Smtp-Source: ABdhPJzqPTAruED4XWpWwtTk6hR/6Y+64QMcCZDronDSGcBtkCinrCaGIgPonwnbJ81KXASKWZCR4A==
X-Received: by 2002:a9d:470e:: with SMTP id a14mr21953208otf.236.1622554362400;
        Tue, 01 Jun 2021 06:32:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v9sm3847822otn.44.2021.06.01.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:32:41 -0700 (PDT)
Received: (nullmailer pid 242359 invoked by uid 1000);
        Tue, 01 Jun 2021 13:32:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     linus.walleij@linaro.org, andy.shevchenko@gmail.com,
        sandberg@mailfence.com, linux-gpio@vger.kernel.org,
        geert+renesas@glider.be, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, drew@beagleboard.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20210530161333.3996-2-maukka@ext.kapsi.fi>
References: <20210325122832.119147-1-sandberg@mailfence.com> <20210530161333.3996-1-maukka@ext.kapsi.fi> <20210530161333.3996-2-maukka@ext.kapsi.fi>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio-mux-input: add documentation
Date:   Tue, 01 Jun 2021 08:32:10 -0500
Message-Id: <1622554330.022234.242358.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 30 May 2021 19:13:32 +0300, Mauri Sandberg wrote:
> Add documentation for a general GPIO multiplexer.
> 
> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> Tested-by: Drew Fustini <drew@beagleboard.org>
> Reviewed-by: Drew Fustini <drew@beagleboard.org>
> ---
> v3 -> v4:
>  - Changed author email
>  - Included Tested-by and Reviewed-by from Drew
> v2 -> v3: added a complete example on dual 4-way multiplexer
> v1 -> v2: added a little bit more text in the binding documenation
> ---
>  .../bindings/gpio/gpio-mux-input.yaml         | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/gpio/gpio-mux-input.example.dt.yaml:0:0: /example-0/mux-controller: failed to match any schema with compatible: ['gpio-mux']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-mux-input.example.dt.yaml: key-mux1: 'mux-controls' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-mux-input.example.dt.yaml: key-mux2: 'mux-controls' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml

See https://patchwork.ozlabs.org/patch/1485492

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

