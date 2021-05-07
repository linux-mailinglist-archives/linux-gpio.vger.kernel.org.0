Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDB5376B44
	for <lists+linux-gpio@lfdr.de>; Fri,  7 May 2021 22:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhEGUsq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 May 2021 16:48:46 -0400
Received: from mail-oo1-f42.google.com ([209.85.161.42]:39934 "EHLO
        mail-oo1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhEGUsq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 May 2021 16:48:46 -0400
Received: by mail-oo1-f42.google.com with SMTP id t17-20020a4a3e110000b02901fab2f46a48so2239734oot.6;
        Fri, 07 May 2021 13:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ItyeI4oA0lCjgmNOSmQd55OCetN3+iDGkX/UtCXQN2I=;
        b=jwy2xX5iWGI1XmWqUnpMG5ktTKx4QGaVdlF6US0vLUwq0EyUwA9k0F5rNeATjayMuM
         OE8r81fDebHxmPaG6M5tFf+VdRWy8461bKf20JcdiZ6VkvXyWMPY3qMNYmuDvbp5LkEH
         YivLkxL4Ez0W158yBuBW6xwj3w6OPGyh09MnH6DQd9I0i7lJML3UrgR3awpJsP2zYo5a
         su0bdpmgJkFgtUZJWttZyL8+7kpYNaw57r/7f+Dnpfz2OgEEGE6ztyJ3fAQXyLa6SD6Z
         NUI+pOUDojqWEGZ4MU4+we7ECyaenvZkmGWCbsLqiEuh8FR45LV/raO9zAeSUtOQxS21
         zNFg==
X-Gm-Message-State: AOAM532a4xMbPADI/HM9NGbMAHh9LVAeJVQap7S/BRAjfEn2KzzZOFcO
        3XVaGnTGx6h2qDtPBXO77Fbkc9ZA9Q==
X-Google-Smtp-Source: ABdhPJyV6f2KSOJGMZheEOrH5nN5E3Ns/i1wFHqioqk26FOeWj2dpLJ5bggrMZfKHAbI0UVzJsm+Ow==
X-Received: by 2002:a4a:ae47:: with SMTP id a7mr6712078oon.23.1620420464568;
        Fri, 07 May 2021 13:47:44 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h184sm1203084oia.1.2021.05.07.13.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 13:47:43 -0700 (PDT)
Received: (nullmailer pid 2855625 invoked by uid 1000);
        Fri, 07 May 2021 20:47:41 -0000
Date:   Fri, 7 May 2021 15:47:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: soc: rockchip: convert grf.txt to
 YAML
Message-ID: <20210507204741.GA2842589@robh.at.kernel.org>
References: <20210505134028.13431-1-jbx6244@gmail.com>
 <20210505134028.13431-3-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505134028.13431-3-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 05, 2021 at 03:40:26PM +0200, Johan Jonker wrote:
> Current dts files with 'grf' nodes are manually verified.
> In order to automate this process grf.txt has to be
> converted to YAML.
> 
> Most compatibility strings are in use with "simple-mfd" added.
> 
> Add description already in use:
> "rockchip,rv1108-pmugrf", "syscon"
> 
> Add new descriptions for:
> "rockchip,rk3568-grf", "syscon", "simple-mfd"
> "rockchip,rk3568-pmugrf", "syscon", "simple-mfd"
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> Changed V2:
>   add rockchip,rk3328-grf-gpio.yaml
>   rename grf-gpio nodename
> ---
>  .../devicetree/bindings/soc/rockchip/grf.txt       |  61 -----
>  .../devicetree/bindings/soc/rockchip/grf.yaml      | 280 +++++++++++++++++++++
>  2 files changed, 280 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml


> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> new file mode 100644
> index 000000000..c7916beb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -0,0 +1,280 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip General Register Files (GRF)
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - rockchip,px30-grf
> +          - rockchip,px30-pmugrf
> +          - rockchip,px30-usb2phy-grf
> +          - rockchip,rk3036-grf
> +          - rockchip,rk3066-grf
> +          - rockchip,rk3188-grf
> +          - rockchip,rk3228-grf
> +          - rockchip,rk3288-grf
> +          - rockchip,rk3288-sgrf
> +          - rockchip,rk3308-core-grf
> +          - rockchip,rk3308-detect-grf
> +          - rockchip,rk3308-grf
> +          - rockchip,rk3328-grf
> +          - rockchip,rk3328-usb2phy-grf
> +          - rockchip,rk3368-grf
> +          - rockchip,rk3368-pmugrf
> +          - rockchip,rk3399-grf
> +          - rockchip,rk3399-pmugrf
> +          - rockchip,rk3568-grf
> +          - rockchip,rk3568-pmugrf
> +          - rockchip,rv1108-grf
> +          - rockchip,rv1108-pmugrf
> +          - rockchip,rv1108-usbgrf
> +
> +  required:
> +    - compatible

You shouldn't need 'select' here. The tools handle not matching every 
syscon or simple-mfd.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - rockchip,rk3066-grf
> +              - rockchip,rk3188-grf
> +              - rockchip,rk3288-sgrf
> +              - rockchip,rv1108-pmugrf
> +              - rockchip,rv1108-usbgrf
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - rockchip,px30-grf
> +              - rockchip,px30-pmugrf
> +              - rockchip,px30-usb2phy-grf
> +              - rockchip,rk3036-grf
> +              - rockchip,rk3228-grf
> +              - rockchip,rk3288-grf
> +              - rockchip,rk3308-core-grf
> +              - rockchip,rk3308-detect-grf
> +              - rockchip,rk3308-grf
> +              - rockchip,rk3328-grf
> +              - rockchip,rk3328-usb2phy-grf
> +              - rockchip,rk3368-grf
> +              - rockchip,rk3368-pmugrf
> +              - rockchip,rk3399-grf
> +              - rockchip,rk3399-pmugrf
> +              - rockchip,rk3568-grf
> +              - rockchip,rk3568-pmugrf
> +              - rockchip,rv1108-grf
> +          - const: syscon
> +          - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true

Never correct for a schema defining a whole node (IOW, only correct for 
collections of shared properties).

unevaluatedProperties: false

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,px30-grf
> +
> +    then:
> +      properties:
> +        lvds:
> +          description:
> +            Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3288-grf
> +
> +    then:
> +      properties:
> +        edp-phy:
> +          description:
> +            Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
> +
> +        usbphy:
> +          description:
> +            Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3328-grf
> +
> +    then:
> +      properties:
> +        gpio:
> +          type: object
> +
> +          $ref: "/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"
> +
> +          unevaluatedProperties: false
> +
> +        power-controller:
> +          type: object
> +
> +          $ref: "/schemas/power/rockchip,power-controller.yaml#"
> +
> +          unevaluatedProperties: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3399-grf
> +
> +    then:
> +      properties:
> +        mipi-dphy-rx0:
> +          type: object
> +
> +          $ref: "/schemas/phy/rockchip-mipi-dphy-rx0.yaml#"
> +
> +          unevaluatedProperties: false
> +
> +        pcie-phy:
> +          description:
> +            Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> +
> +      patternProperties:
> +        "phy@[0-9a-f]+$":
> +          description:
> +            Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-pmugrf
> +              - rockchip,rk3036-grf
> +              - rockchip,rk3308-grf
> +              - rockchip,rk3368-pmugrf
> +
> +    then:
> +      properties:
> +        reboot-mode:
> +          type: object
> +
> +          $ref: "/schemas/power/reset/syscon-reboot-mode.yaml#"
> +
> +          unevaluatedProperties: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-usb2phy-grf
> +              - rockchip,rk3228-grf
> +              - rockchip,rk3328-usb2phy-grf
> +              - rockchip,rk3399-grf
> +              - rockchip,rv1108-grf
> +
> +    then:
> +      properties:
> +        "#address-cells":
> +          const: 1
> +
> +        "#size-cells":
> +          const: 1
> +
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +
> +      patternProperties:
> +        "usb2-phy@[0-9a-f]+$":
> +          type: object
> +
> +          $ref: "/schemas/phy/phy-rockchip-inno-usb2.yaml#"
> +
> +          unevaluatedProperties: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-pmugrf
> +              - rockchip,px30-grf
> +              - rockchip,rk3228-grf
> +              - rockchip,rk3288-grf
> +              - rockchip,rk3328-grf
> +              - rockchip,rk3368-pmugrf
> +              - rockchip,rk3368-grf
> +              - rockchip,rk3399-pmugrf
> +              - rockchip,rk3399-grf
> +
> +    then:
> +      properties:
> +        io-domains:
> +          description:
> +            Documentation/devicetree/bindings/power/rockchip-io-domain.txt
> +
> +          unevaluatedProperties: false

These 'if' sections are probably a sign that this should be separate 
schemas for each 'if' subset. But fine to leave as-is.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3399-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3399-power.h>
> +    grf: syscon@ff770000 {
> +      compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> +      reg = <0xff770000 0x10000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      mipi_dphy_rx0: mipi-dphy-rx0 {
> +        compatible = "rockchip,rk3399-mipi-dphy-rx0";
> +        clocks = <&cru SCLK_MIPIDPHY_REF>,
> +                 <&cru SCLK_DPHY_RX0_CFG>,
> +                 <&cru PCLK_VIO_GRF>;
> +        clock-names = "dphy-ref", "dphy-cfg", "grf";
> +        power-domains = <&power RK3399_PD_VIO>;
> +        #phy-cells = <0>;
> +      };
> +
> +      u2phy0: usb2-phy@e450 {
> +        compatible = "rockchip,rk3399-usb2phy";
> +        reg = <0xe450 0x10>;
> +        clocks = <&cru SCLK_USB2PHY0_REF>;
> +        clock-names = "phyclk";
> +        #clock-cells = <0>;
> +        clock-output-names = "clk_usbphy0_480m";
> +        #phy-cells = <0>;
> +
> +        u2phy0_host: host-port {
> +          #phy-cells = <0>;
> +          interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>;
> +          interrupt-names = "linestate";
> +         };
> +
> +        u2phy0_otg: otg-port {
> +          #phy-cells = <0>;
> +          interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH 0>;
> +          interrupt-names = "otg-bvalid", "otg-id",
> +                            "linestate";
> +        };
> +      };
> +    };
> -- 
> 2.11.0
> 
