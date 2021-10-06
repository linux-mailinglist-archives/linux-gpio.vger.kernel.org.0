Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF3D4248A9
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Oct 2021 23:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239644AbhJFVQq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Oct 2021 17:16:46 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:36810 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239646AbhJFVQp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Oct 2021 17:16:45 -0400
Received: by mail-ot1-f41.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so4867091otx.3;
        Wed, 06 Oct 2021 14:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lak8Kr6S28oWWnCbDixiphSYTCbXgMBHH9/qqV4Giyc=;
        b=1Mlm9+OC7ZdJp/6YYm78hcul4b2nMToWIb94JdwE1gCoGR1M8e+Aj+CZK/y9Fbft1j
         PYe9c/i02O0YOG9YLdp5yxNNGgj9LNwgH/3NlrVsJ/evU/vKkv6gvj7tUBz6zAHdZ7Vz
         OvPLsPhcls2xBGpqpT8hs/1mqE9Tm3ukN4OoIdIcgeGtYAGyuk8Eugzc3kjm3lPzdhu+
         JaPfjXtjM3dNK/XYZu6yk1KuiMSBzgTd8zsoU/kXF5GNV/0VPjL3SMBlcZ7O52WKg6pI
         8JPD/OWTPRVMr2wyXnQrTGbsVHicVvLDL5aNox1WqcjKT/uG1o07dzxdEhiv+t9WxsUV
         4MlA==
X-Gm-Message-State: AOAM53066FWbw6hNWH1xZ/4h62+XCtt/Jf2LLwl/iEyighvGCy06+Kcc
        z4Qgt3r+Sxl3l5TPInwPYdYx4bFl+Q==
X-Google-Smtp-Source: ABdhPJwjkpOHrD8M6tpuzasy4z7/puEHow6aB3HnOWHU8azVI5+r8jJyF/JJjo6sBcNSVtVIjY967g==
X-Received: by 2002:a9d:71d4:: with SMTP id z20mr432620otj.29.1633554892688;
        Wed, 06 Oct 2021 14:14:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s22sm1100539ois.32.2021.10.06.14.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 14:14:51 -0700 (PDT)
Received: (nullmailer pid 2887704 invoked by uid 1000);
        Wed, 06 Oct 2021 21:14:50 -0000
Date:   Wed, 6 Oct 2021 16:14:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: pincfg-node: Add "output-impedance"
 property
Message-ID: <YV4RypY6/n23Bl2T@robh.at.kernel.org>
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210930121630.17449-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930121630.17449-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 01:16:27PM +0100, Lad Prabhakar wrote:
> On RZ/G2L SoC for Group-B pins, output impedance can be configured.
> This patch documents "output-impedance" property in pincfg-node.yaml so
> that other platforms requiring such feature can make use of this property.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index 71ed0a9def84..cdcb23daeca2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -114,6 +114,10 @@ properties:
>      description: enable output on a pin without actively driving it
>        (such as enabling an output buffer)
>  
> +  output-impedance:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Use standard unit suffix and drop the type.

> +    description: set the pins output impedance at most X ohm
> +
>    output-low:
>      type: boolean
>      description: set the pin to output mode with low level
> -- 
> 2.17.1
> 
> 
