Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0D63B382B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 22:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbhFXUxU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 16:53:20 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:43839 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhFXUxT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 16:53:19 -0400
Received: by mail-io1-f51.google.com with SMTP id k16so9893318ios.10;
        Thu, 24 Jun 2021 13:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dOWNK4szL7NJozN67ySYH7Tt83tGGtejwTxVm+0NPmc=;
        b=g8lrEhI+j6rwtJXCOq27Mda5XI4GjqUECZ9R5SWGR6dpVnZD9HrjxxlRQxUfSwgUTK
         gQ9uLSXH8Nyw1xKhoLl82IE5Yb+zE/b2vcMeB1QNbNQ2DAEkHY69YrgbVoCEE8kvxIIa
         Qe/zlADYKK2TnDBlRWsHeCLVDfkvi0GxVkDmsX2yBoWeZAgrKVaLWWFDC8vX8lnlTXpF
         Bqe4GG+S4LQLbaa/2W2Xot/+HFXsiFparbwc9FIu2oDTa8pdsQhO2x/aoCQBvvf807i4
         g+ngqRxgRJZgZjD3jrhprbiIuAAbGrr0+122TISXA7+wWazrvI92SiVGNmAm1LBOE/gl
         dM5Q==
X-Gm-Message-State: AOAM532oNf6s/81hrW9F88uSeKwXAecY4Vr8al91Rz5xbqxqExW8tq2L
        SBrz3vYdeavWkqPcUqs5kw==
X-Google-Smtp-Source: ABdhPJyL7tI21uYE9lqHmVju8GFW/S7ONODSK8eaTwYZA1hnVIvClUeev6JC0tvYK1VAupYNRwH3Jw==
X-Received: by 2002:a05:6638:13c3:: with SMTP id i3mr6369212jaj.140.1624567859160;
        Thu, 24 Jun 2021 13:50:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q19sm1949433ios.11.2021.06.24.13.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:50:58 -0700 (PDT)
Received: (nullmailer pid 1966245 invoked by uid 1000);
        Thu, 24 Jun 2021 20:50:55 -0000
Date:   Thu, 24 Jun 2021 14:50:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Piyush Mehta <piyush.mehta@xilinx.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        git@xilinx.com, sgoud@xilinx.com, michal.simek@xilinx.com
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add binding documentation for
 modepin
Message-ID: <20210624205055.GA1961487@robh.at.kernel.org>
References: <20210615080553.2021061-1-piyush.mehta@xilinx.com>
 <20210615080553.2021061-2-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615080553.2021061-2-piyush.mehta@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 15, 2021 at 01:35:52PM +0530, Piyush Mehta wrote:
> Add DT binding document for modepin GPIO controller.

Please give some indication in the subject this is for Xilinx.

> 
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> State: pending
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

And connected to other functions like GPIOs?

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

Drop unused labels.

> +        compatible = "xlnx,zynqmp-gpio-modepin";
> +        gpio-controller;
> +        #gpio-cells = <2>;

How does one access this h/w?

> +    };
> +
> +...
> -- 
> 2.7.4
> 
> 
