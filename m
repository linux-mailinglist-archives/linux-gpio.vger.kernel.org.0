Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388873A8CCA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 01:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhFOXpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 19:45:30 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:42681 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhFOXpa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 19:45:30 -0400
Received: by mail-il1-f171.google.com with SMTP id h3so681550ilc.9;
        Tue, 15 Jun 2021 16:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YPT8InEABYmuq0XIJqXJvHe3RyahNA55MTZJfxlQgHA=;
        b=iEI4GO6DPE8/Se5XZ/gCmGlCYAypgQ4x/OjDXCupjYTfyhQQ5gM3SdIybMA8XMQQNb
         gKJIxbIZQcGGQnIYNOp7V7aqyCgs3u3cpIzRl2Xrf4kd7ARJuLxaqlfdGdovvpanQOEA
         xJlijuA4/CyCmskAHHGpSfkvzpvskyFu1lKpyknSAmmJxMKNsYzrrD9Y53yoBAZi15Jn
         nA3gsYxzv+LoC+TcjgAaQTwcNuVjI2d0HUdNP6hyvK76hdS9dpup+wAHaElG6dZslVl7
         EVHojAKJpw4v+11A56G/t6FKNTE8N1PlFGwgbzvbLgWSQk5jSv85cjiztoRvZjO7Bked
         jV+w==
X-Gm-Message-State: AOAM531hmbPTOcdRZ0pP+fVcGNimtjFA7zofJEo6E3gx+YytnX1P6wR4
        WUIyNX5kXVxKUoQxms4wjg==
X-Google-Smtp-Source: ABdhPJyVsj22o5nkeyBWGx+IAIJTqcaLmaFT2QEWslSrTplD/gIxQNsHSGBW8ljZEnNIUpa9G1LsWA==
X-Received: by 2002:a92:750c:: with SMTP id q12mr1343089ilc.303.1623800603852;
        Tue, 15 Jun 2021 16:43:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o10sm285848ilc.75.2021.06.15.16.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 16:43:23 -0700 (PDT)
Received: (nullmailer pid 1684451 invoked by uid 1000);
        Tue, 15 Jun 2021 23:43:21 -0000
Date:   Tue, 15 Jun 2021 17:43:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>
Subject: Re: [PATCH 1/8] dt-bindings: arm/npcm: Add binding for global
 control registers (GCR)
Message-ID: <20210615234321.GA1681813@robh.at.kernel.org>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602120329.2444672-2-j.neuschaefer@gmx.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 02, 2021 at 02:03:22PM +0200, Jonathan Neuschäfer wrote:
> A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
> be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
> WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
> version information.
> 
> This patch adds a binding to describe this node.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  .../bindings/arm/npcm/nuvoton,gcr.yaml        | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> new file mode 100644
> index 0000000000000..3174279f7713a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/npcm/nuvoton,gcr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Global Control Registers block in Nuvoton SoCs
> +
> +maintainers:
> +  - Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> +
> +description: |
> +  The Global Control Registers (GCR) are a block of registers in Nuvoton SoCs
> +  that expose misc functionality such as chip model and version information or
> +  pinmux settings.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nuvoton,wpcm450-gcr
> +          - nuvoton,npcm750-gcr
> +      - const: syscon
> +      - const: simple-mfd

How is this a simple-mfd? There are no child nodes.

> +  reg: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gcr: gcr@800000 {
> +      compatible = "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
> +      reg = <0x800000 0x1000>;
> +    };
> --
> 2.30.2
