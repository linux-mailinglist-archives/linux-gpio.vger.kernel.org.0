Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7795CC0DDD
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2019 00:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfI0WPy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 18:15:54 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42151 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfI0WPy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 18:15:54 -0400
Received: by mail-ot1-f68.google.com with SMTP id c10so3577966otd.9;
        Fri, 27 Sep 2019 15:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=42kJGNhCusDQNjkVnOKLdMbZYX560Wifg8dSCAiA4cc=;
        b=MaTHFVvSjGQewcLfEKv3lZqLFzzv1t0RBBz70gGFlKJEMIFDTtXHrPRK4VBQ3q5cAJ
         uhf68TfNq7c6IPfVjF9JkGhkNqat8ixPOTsOcxXvgcpKuR0aMdP/9xwwoyD73yHTsvl6
         hjv2p+aleWR3a4fMkNVgTS/jpuz97LDdQSfKuuFggcIQeZN0W4HinPYQGZ1hKFJZI/Ii
         zVsfesp58p54llLCZKf2+Dfb+b7KccEIBl7t+vN1vHMyJAV+nIXTJXcb7M8oOWsq7ewP
         wsR4BYZeTeK2FEysXkx6B4k7wnoJX8lf1Vwq8Unxi5pSVyDVNn2JYO4kN9AU+79t9wEJ
         +g4A==
X-Gm-Message-State: APjAAAXnmpwueYA/XqRZ3vmMViqb+qaYFndNNK7RtmBp6TVKkkswUW5g
        z35SI9fI0wDXLsA4u9FX4g==
X-Google-Smtp-Source: APXvYqxHRXceYpuvkMidUXb4bFxc1IAdjKxxMEefxLhDPOGzWSs4+1XW+3Bdbq9EdqO2Jw6obeKSuA==
X-Received: by 2002:a9d:1425:: with SMTP id h34mr3237861oth.122.1569622552123;
        Fri, 27 Sep 2019 15:15:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t207sm2087066oif.11.2019.09.27.15.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 15:15:51 -0700 (PDT)
Date:   Fri, 27 Sep 2019 17:15:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Document the Xylon LogiCVC
 multi-function device
Message-ID: <20190927221550.GA28831@bogus>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190927100407.1863293-3-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 27, 2019 at 12:04:04PM +0200, Paul Kocialkowski wrote:
> The LogiCVC is a display engine which also exposes GPIO functionality.
> For this reason, it is described as a multi-function device that is expected
> to provide register access to its children nodes for gpio and display.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/mfd/xylon,logicvc.yaml           | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> new file mode 100644
> index 000000000000..abc9937506e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Bootlin
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mfd/xylon,logicvc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Xylon LogiCVC multi-function device
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +description: |
> +  The LogiCVC is a display controller that also contains a GPIO controller.
> +  As a result, a multi-function device is exposed as parent of the display
> +  and GPIO blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - xylon,logicvc-3.02.a
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - xylon,logicvc-3.02.a

I've seen a couple of these with 'syscon' today, so I fixed the schema 
tool to just exclude 'syscon' and 'simple-mfd' from the generated 
'select'. So you can drop select now.

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +  required:
> +    - compatible
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    logicvc: logicvc@43c00000 {
> +      compatible = "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
> +      reg = <0x43c00000 0x6000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +    };
> -- 
> 2.23.0
> 
