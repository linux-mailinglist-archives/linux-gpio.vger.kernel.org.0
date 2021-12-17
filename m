Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F21479709
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 23:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhLQWZL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 17:25:11 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:37386 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbhLQWZK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 17:25:10 -0500
Received: by mail-ot1-f49.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so4608946otg.4;
        Fri, 17 Dec 2021 14:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=hWqaijK8egDuCBel5OyaSVRQqT1kaUshzj4OdLgdIlU=;
        b=mSFKdyllDZgsrBWdgeFkS1oKb7NuL5ehg8lx0GxGGrWYItQKaH2LiizPZeKniE/RPx
         GieQ2XYSa9cvaxLmOeklneRtgnF3g9yf2JqHr7JltjAPb9wFm8Mmo8ykKW0/+2edx/ij
         qNM0ze/utiqdDKoNK+pPYBErYHIG9dnY7sPFA9WhTSIStmf60trRQ1hAAf6dLNmribbr
         Rh88K3tpDlCu2CvF81orU0+ggcywCWiKgsHjg2JMxNqu62O/eA/AGVHRLJWvj4bv+IZc
         UsL/RSRd0IQMQSnzzroqcmWkmg20dyWnhi4DZrkrl4626GIOH+I96t7r+IOKRljSkPpO
         /R0A==
X-Gm-Message-State: AOAM530iYWtBtQ32Lkwf8AKm5YTeym+1uDUm/P7iIk1kBMFJsaBIrCDP
        bSZZFTBLHd1ZNTsqe+kILcG/l7TgFQ==
X-Google-Smtp-Source: ABdhPJyMEnYnVjmoCwzmRtWE52jz5UVqOqhLASd7/jfN0rJRGqu/7AOXRpa/PsKEeT3wb1EBpJVmNw==
X-Received: by 2002:a9d:1727:: with SMTP id i39mr3684643ota.48.1639779909968;
        Fri, 17 Dec 2021 14:25:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bn41sm1772947oib.18.2021.12.17.14.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 14:25:09 -0800 (PST)
Received: (nullmailer pid 3686971 invoked by uid 1000);
        Fri, 17 Dec 2021 22:25:06 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211217165342.2572021-1-thierry.reding@gmail.com>
References: <20211217165342.2572021-1-thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: tegra: Convert to json-schema
Date:   Fri, 17 Dec 2021 16:25:06 -0600
Message-Id: <1639779906.600898.3686970.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 17 Dec 2021 17:53:42 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra pinmux controller bindings from the free-form
> text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 --------
>  .../pinctrl/nvidia,tegra114-pinmux.yaml       | 264 ++++++++++++++++
>  .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 ----------
>  .../pinctrl/nvidia,tegra124-pinmux.yaml       | 287 ++++++++++++++++++
>  .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 -------
>  .../pinctrl/nvidia,tegra194-pinmux.yaml       | 175 +++++++++++
>  .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 ---------
>  .../pinctrl/nvidia,tegra20-pinmux.yaml        | 203 +++++++++++++
>  .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ----------
>  .../pinctrl/nvidia,tegra210-pinmux.yaml       | 232 ++++++++++++++
>  .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 ---------
>  .../pinctrl/nvidia,tegra30-pinmux.yaml        | 268 ++++++++++++++++
>  12 files changed, 1429 insertions(+), 844 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.example.dt.yaml:0:0: /example-0/mmc@700b0600: failed to match any schema with compatible: ['nvidia,tegra124-sdhci']
Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.example.dt.yaml:0:0: /example-0/mmc@c8000600: failed to match any schema with compatible: ['nvidia,tegra20-sdhci']

doc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt: Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt

See https://patchwork.ozlabs.org/patch/1570184

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

