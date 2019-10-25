Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0955CE5588
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 23:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfJYVAY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 17:00:24 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37971 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfJYVAY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 17:00:24 -0400
Received: by mail-ot1-f68.google.com with SMTP id e11so2981547otl.5;
        Fri, 25 Oct 2019 14:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PIdw2OR1Wc5vcgtc2S6a52CrxT11Bed11+whBzjKQXQ=;
        b=JgYIuBOPnehOXLyDB6KNXEAjJojTCaPYY9b94WVqaBg43jx9zR14NZYjXLObHMnEIx
         mcr7cY/3i/MAEPlCkUQmMpG5tGkV4iB8c0gWr8F9t1K4bnSx/kIl30WvEeXYEgYZ9Xbh
         nLWdJ50xFuYx5S0FP2UZBDGykcokMUfX+o+9kpudriWU9AHIS4pGboI4EjFsaj0VMowu
         /hKx3DBHCKp2nGzgiQ8wN5cYmNuCTXR9RJDEcNHQIfClr82RE9xJ9dHikZ0PhEOlGDjt
         SoRE48N5Owlx/sgF+sODCVeEOjTP8KZTc0/YuR1+80AxYYKkELrmi3ertWhhLRDKplBy
         zkSQ==
X-Gm-Message-State: APjAAAUOmFaVNDFycpdcW3v5cDM4u424C9ZwgOM6ytB1ayo3w32pVAes
        5K1WV5wacQSCdeAmXtpOzg==
X-Google-Smtp-Source: APXvYqwgx8LVN5ZVNBUTcYENC8p5D3he0cebxVqtC+8b/u08CP9bM4qBdYUNb5YGdUAkXXj3FWf51A==
X-Received: by 2002:a9d:5e12:: with SMTP id d18mr4451844oti.220.1572037223231;
        Fri, 25 Oct 2019 14:00:23 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l19sm863516oie.22.2019.10.25.14.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:00:22 -0700 (PDT)
Date:   Fri, 25 Oct 2019 16:00:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     broonie@kernel.org, linus.walleij@linaro.org, lee.jones@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/11] dt-bindings: pinctrl: qcom-wcd934x: Add
 bindings for gpio
Message-ID: <20191025210021.GA12751@bogus>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-9-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018001849.27205-9-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 18, 2019 at 01:18:46AM +0100, Srinivas Kandagatla wrote:
> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> gpio controller to control 5 gpios on the chip. This patch adds
> required device tree bindings for it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
> new file mode 100644
> index 000000000000..c8a36cbc4935
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,wcd934x-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WCD9340/WCD9341 GPIO Pin controller
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> +  gpio controller to control 5 gpios on the chip.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,wcd9340-pinctrl
> +      - qcom,wcd9341-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - gpio-ranges
> +  - "#gpio-cells"

additionalProperties: false

> +
> +
> +examples:
> +  - |
> +    wcdpinctrl: wcdpinctrl@42 {

pinctrl@42

> +        compatible = "qcom,wcd9340-pinctrl";
> +        reg = <0x042 0x2>;
> +        gpio-controller;
> +        gpio-ranges = <&wcdpinctrl 0 0 5>;
> +        #gpio-cells = <2>;
> +    };
> +
> +...
> -- 
> 2.21.0
> 
