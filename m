Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEE141941B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 14:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbhI0MZA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 08:25:00 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:38909 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbhI0MY7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 08:24:59 -0400
Received: by mail-ot1-f47.google.com with SMTP id c6-20020a9d2786000000b005471981d559so24141917otb.5;
        Mon, 27 Sep 2021 05:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=M1JxjeIOmKat6HvCouZk2WyJoVDL3ELYlgAx1y+djF4=;
        b=7Dr0bB4vGoaJvaSBAUBkx9KtKsSxZfB/vn4GVTjzd3CfOSl5Iwqp/Hh5IuMRBL06d+
         uTcMftoEpr91DfDdp7SVYLnnLLM484w+tDj9V8zrObYSZwSIAsKw0IdSgq5/f0N3BX7l
         S0/O0Y5/luYHWHqCj8v/e5FNzpbY65175L0QUhY/C5JCjyUU5yFFadzqjtfHuryQahIm
         7/AcyukH2XgWHg6HqoUFRMjWGKv2st+fUmTng2WHuP2G2WogBgV/QzYqMcKs+orklLg7
         BuLlDGHtxxhlhnm0wzUxNExE9ymhzOboEXHr35l4Gy1tYNa4/iJzHoPV6ZcQROWKergD
         VHDQ==
X-Gm-Message-State: AOAM532DbWgQuNY4xsZ7Yz305Qgr2HmuLmISGFgBArR3tWazJEkdyZR8
        /88d6n4zDBKM8r/I0B/VXw==
X-Google-Smtp-Source: ABdhPJxPboMBJ7atlf4V2758iIymolXl+RlULWf5ZVJnB5v+aaNUyKh+KewyhDhEFZ50jt9f77a3wA==
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr17216398otb.283.1632745401264;
        Mon, 27 Sep 2021 05:23:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o126sm3844592oig.21.2021.09.27.05.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 05:23:20 -0700 (PDT)
Received: (nullmailer pid 3097152 invoked by uid 1000);
        Mon, 27 Sep 2021 12:23:19 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     herbert@gondor.apana.org.au, linux-serial@vger.kernel.org,
        linux-clk@vger.kernel.org, linux@roeck-us.net,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, hsinyi@chromium.org,
        mpm@selenic.com, seiya.wang@mediatek.com,
        enric.balletbo@collabora.com, fparent@baylibre.com,
        john@phrozen.org, sboyd@kernel.org, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, linux-watchdog@vger.kernel.org,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        wim@linux-watchdog.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, sean.wang@kernel.org,
        Ryder.Lee@mediatek.com
In-Reply-To: <20210927023419.17994-1-sam.shih@mediatek.com>
References: <1632491961.645727.1195978.nullmailer@robh.at.kernel.org> <20210927023419.17994-1-sam.shih@mediatek.com>
Subject: Re: [v5,5/9] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date:   Mon, 27 Sep 2021 07:23:19 -0500
Message-Id: <1632745399.256353.3097151.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 27 Sep 2021 10:34:19 +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to pin-65
> do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v5 : fixed yamllint warnings/errors
> v4 : used yaml format instead of txt format document
> v3 : make mt7986 pinctrl bindings as a separate file
> v2 : deleted the redundant description of mt7986a/mt7986b
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 353 ++++++++++++++++++
>  1 file changed, 353 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:25.13-32.43: Warning (reg_format): /example-0/soc/pinctrl@1001f000:reg: property has invalid length (128 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:23.33-58.13: Warning (avoid_default_addr_size): /example-0/soc/pinctrl@1001f000: Relying on default #address-cells value
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:23.33-58.13: Warning (avoid_default_addr_size): /example-0/soc/pinctrl@1001f000: Relying on default #size-cells value
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: pinctrl@1001f000: 'gpio-ranges' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1533169

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

