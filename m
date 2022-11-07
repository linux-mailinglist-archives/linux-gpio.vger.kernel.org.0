Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9180561FFC1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 21:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbiKGUsu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 15:48:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbiKGUsn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 15:48:43 -0500
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0121D339;
        Mon,  7 Nov 2022 12:48:41 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13be3ef361dso14037116fac.12;
        Mon, 07 Nov 2022 12:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP9uqgjVo6enR7hOZ597rbGfwfyI/yQnJGV/FYA5+1I=;
        b=AjLxfb+CN1NtzNbgS9qKzLFxbJbk/Wn3/iYr19Vr878yaqjEyzCqN5QVpIIZNHP8eA
         dPpI8463lBlfrPCIP2RH6zgWfFTFGJX01dQD/8urUVJ8P5pMjvgUHu795ZL3rLWlvl/p
         mhjs/PWRGW8aq2wd31Y1KEGAHgi80Kclc80RR8NtnZQMDmtipgJbmb9JEM43maWIJrad
         /3LuoT8VeazTCnZgToxRYRpHUU6+RYUjnITXpvCqY0jBxKU/CD62t9zxiaIl+c9Qzugf
         l5hLbYpezB8DblYFHJx9cQnuQ1WgWdznHze+mx0qQ5zdcGhA7wi0vuQaKttnJQNSRXrc
         DFbw==
X-Gm-Message-State: ACrzQf0PtAF5bnpq5g7plgh8C38av5HIZ+LSxlgsj3BOZpU+IJFwFciH
        fzfgC76fFlQudFfPD2gU+g==
X-Google-Smtp-Source: AMsMyM5jNbS++rcRXHa+o4FntULPIyIZnDRzbRYVtPrUY0F5/ADZJS9RyB7D56J4jQQZTr3PXSIIqQ==
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id r3-20020a056870580300b0012cc3e099dcmr38722896oap.19.1667854120939;
        Mon, 07 Nov 2022 12:48:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z10-20020a9d248a000000b00660e833baddsm3365246ota.29.2022.11.07.12.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 12:48:40 -0800 (PST)
Received: (nullmailer pid 1607977 invoked by uid 1000);
        Mon, 07 Nov 2022 20:48:42 -0000
Date:   Mon, 7 Nov 2022 14:48:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Prathamesh Shete <pshete@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: tegra: Convert to
 json-schema
Message-ID: <166785411929.1607862.9138980578446400859.robh@kernel.org>
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
 <20221104142345.1562750-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104142345.1562750-2-thierry.reding@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Fri, 04 Nov 2022 15:23:42 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra pinmux controller bindings from the free-form
> text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - add missing "type: object" to patternProperties definitions
> - restructure common bindings according to Rob's comments
> 
> Changes in v2:
> - wrap lines at 80 characters instead of the standard 100 characters in Linux
> - use GPL-2.0-only instead of GPL-2.0+ license for DT bindings
> - reorder additionalProperties for better readability
> - move common definitions into a shared schema
> - remove consumer snippets from examples
> 
>  .../bindings/clock/nvidia,tegra124-dfll.yaml  |   2 +-
>  .../pinctrl/nvidia,tegra-pinmux-common.yaml   | 178 ++++++++++++++++++
>  .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 -------------
>  .../pinctrl/nvidia,tegra114-pinmux.yaml       | 155 +++++++++++++++
>  .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 ---------------
>  .../pinctrl/nvidia,tegra124-pinmux.yaml       | 176 +++++++++++++++++
>  .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 -----------
>  .../pinctrl/nvidia,tegra194-pinmux.yaml       |  89 +++++++++
>  .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 --------------
>  .../pinctrl/nvidia,tegra20-pinmux.yaml        | 112 +++++++++++
>  .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ----------------
>  .../pinctrl/nvidia,tegra210-pinmux.yaml       | 142 ++++++++++++++
>  .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 --------------
>  .../pinctrl/nvidia,tegra30-pinmux.yaml        | 176 +++++++++++++++++
>  14 files changed, 1029 insertions(+), 845 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
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

Reviewed-by: Rob Herring <robh@kernel.org>
