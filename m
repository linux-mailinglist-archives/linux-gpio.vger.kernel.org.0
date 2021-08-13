Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880283EBC5A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 21:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233507AbhHMTCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 15:02:19 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:34671 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhHMTCT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 15:02:19 -0400
Received: by mail-oi1-f173.google.com with SMTP id t128so17332885oig.1;
        Fri, 13 Aug 2021 12:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/ySw+721xptSBlCazlk/6zNa0GE+snq5wJpF93aqJ5g=;
        b=Q0HpTuIZctK1aaboPd9Rfschq+17UCziLtn1orsVP8pDprcc8LKFNrm0Yy5bCDf8WC
         O1oMhdPi2EmRImytFFT2TNN1cJ6T7TueGDEh1S2kUN2DJUNn4UKhmKbcfWupCJl0v3LM
         XQXch6t036/ToI0CY4tv9lR/wUVOipBv6nsVw5zhOeWDgRvZ3oFRvhuvjhWS73hTEpMj
         4ZDcqZ8fMsewrmaCEkxAGQwKNtboZt6mxYO9EZoxe2bl56/30dFFhtPnajrj16drmlRH
         WjSRxgHuZJArzWYPHTKvRWGatycn2AURu+LCjk+eQPmZ+pzig3rXdtp/hE0SggbNxC40
         As/w==
X-Gm-Message-State: AOAM531e9bMqXHc83pOtX9LL/4VWZUS0+KlUzytGkXM453SxHIerF0Zl
        V+u6qAl+2YZdCMZwgug30w==
X-Google-Smtp-Source: ABdhPJzMquZMAGLvoPPiZgSVHu2dR64X69cj2UNvwhqjE3z95ZzkSfFPtCRl2icmGpVsRDfZxUiSyg==
X-Received: by 2002:aca:4488:: with SMTP id r130mr2307430oia.173.1628881311564;
        Fri, 13 Aug 2021 12:01:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o18sm518465oiw.27.2021.08.13.12.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 12:01:50 -0700 (PDT)
Received: (nullmailer pid 3870125 invoked by uid 1000);
        Fri, 13 Aug 2021 19:01:49 -0000
Date:   Fri, 13 Aug 2021 14:01:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Piyush Mehta <piyush.mehta@xilinx.com>
Cc:     arnd@arndb.de, zou_wei@huawei.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, michal.simek@xilinx.com,
        wendy.liang@xilinx.com, iwamatsu@nigauri.org,
        bgolaszewski@baylibre.com, rajan.vaja@xilinx.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        git@xilinx.com, sgoud@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/3] dt-bindings: gpio: zynqmp: Add binding
 documentation for modepin
Message-ID: <YRbBnRS0VosXcZWz@robh.at.kernel.org>
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
 <20210805174219.3000667-3-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805174219.3000667-3-piyush.mehta@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 05, 2021 at 11:12:18PM +0530, Piyush Mehta wrote:
> This patch adds DT binding document for zynqmp modepin GPIO controller.
> Modepin GPIO controller has four GPIO pins which can be configurable
> as input or output.
> 
> Modepin driver is a bridge between the peripheral driver and GPIO pins.
> It has set and get APIs for accessing GPIO pins, based on the device-tree
> entry of reset-gpio property in the peripheral driver, every pin can be
> configured as input/output and trigger GPIO pin.
> 
> For more information please refer zynqMp TRM link:
> Link: https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> Chapter 2: Signals, Interfaces, and Pins
> Table 2-2: Clock, Reset, and Configuration Pins - PS_MODE
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> ---
> Changes in v2:
> - Addressed review comments: Update commit message
> 
> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#mbd1fbda813e33b19397b350bde75747c92a0d7e1
> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#me82b1444ab3776162cdb0077dfc9256365c7e736
> ---
>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> new file mode 100644
> index 0000000..39d78f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpio/xlnx,zynqmp-gpio-modepin.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: ZynqMP Mode Pin GPIO controller
> +
> +description:
> +  PS_MODE is 4-bits boot mode pins sampled on POR deassertion. Mode Pin
> +  GPIO controller with configurable from numbers of pins (from 0 to 3 per
> +  PS_MODE). Every pin can be configured as input/output.
> +
> +maintainers:
> +  - Piyush Mehta <piyush.mehta@xilinx.com>
> +
> +properties:
> +  compatible:
> +    const: xlnx,zynqmp-gpio-modepin
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    modepin_gpio: gpio {
> +        compatible = "xlnx,zynqmp-gpio-modepin";
> +        gpio-controller;
> +        #gpio-cells = <2>;

No way to interact with this h/w?

As it is part of the firmware interface, it must be a child node in the 
firmware node schema.

> +    };
> +
> +...
> -- 
> 2.7.4
> 
> 
