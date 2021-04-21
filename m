Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E536366EE1
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 17:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240539AbhDUPO1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 11:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234469AbhDUPO0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 11:14:26 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8608C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 08:13:52 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id p3so26958093ybk.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bXPVXy/1jXKrltuMJNC38xdPZ2uBC+6lqk1pZ76QL1U=;
        b=BW3+XWMr5mN2mKApFiwj7vayhL5WXOHJvcgip9ht9GaAcZdgUv/6PY5VNfWU+sop5B
         O6kvK+Yy7L4hTiyo++b3bkXmTltJVKq7NFOCzUPHL2iYebSazwLh6GNh1+g/1T+cc41i
         Yj5f1a3+egNr3reEx6rS2ujUvgVOBCx+YhCtcGep6hTK4fFgjWVOq76bVE+rvPGlPMvn
         xYS1x+sMMWsUOTZzV9tB83Cl3zMJXsVl+K+Cwb1i115/Mga08utgzW7uUS42k5I9FjwB
         +KWDXoXV+PS0KJBNXunt2Ll3Epd6yioqTrWMU88+2tV9wwuCLhYvussofDhhsheZPPXu
         S0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXPVXy/1jXKrltuMJNC38xdPZ2uBC+6lqk1pZ76QL1U=;
        b=k+s0dy9llz+iYFYWGZPI7hBsrSU5Er5nlO4ArdV7ZWKoXKt0SJm2FGKGpda+2ncsbu
         yGuEi02gAJeFjuvbdSQw6w+PPJmT5HYhXlQqKEbxBDHQlwkjIUaEx0ahy0Kk0Lx5DnzI
         KxwK6kYDR8vjyCWH3nljeAHEOQoPttyxQC1SX3K9KzHLf7VJgEDgnfoWzqfgkDK2pYTh
         Y3mgdQJK6P2GqX1ylsFaSpnkixv1SVSKJGOlk7uw7CDu11JFI5NpoxrsdKlDJoapTmE7
         A8kjuGsl0uy2I1a2t6mpTmwV0WQMn/FXEjFjfsQDMySkt6TQLCN4/PyTAaonbB0h+jEB
         PiAw==
X-Gm-Message-State: AOAM531M4/T3YXt5ApqnjkXj0EX255eqSqmdmSPpgeqIxwEaTd35JTvb
        CcrFF/VH4NpmgstaRjfEYHHGCMED8Ex4lBGJvy/jxtekzHU8oQ==
X-Google-Smtp-Source: ABdhPJyTdWO6d+q9fhd07IL8nMwHUj2gsRujzQ7X0vesq+RzLMGAAF5jMlqXYtBOrbLZuoSHBig0sSqGcEuhxpz0/H4=
X-Received: by 2002:a25:1905:: with SMTP id 5mr32679392ybz.302.1619018032125;
 Wed, 21 Apr 2021 08:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210412223617.8634-1-jbx6244@gmail.com>
In-Reply-To: <20210412223617.8634-1-jbx6244@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 21 Apr 2021 17:13:41 +0200
Message-ID: <CAMpxmJX7=A++ubOr3xQ3_Taau2G1-k0q5Xj3k8Hd14tH_762Fg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: add YAML description for rockchip,gpio-bank
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 13, 2021 at 12:36 AM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Current dts files with "rockchip,gpio-bank" subnodes
> are manually verified. In order to automate this process
> the text that describes the compatible in rockchip,pinctrl.txt
> is removed and converted to YAML in rockchip,gpio-bank.yaml.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> Changed V2:
>   changed example gpio nodename
> ---
>  .../bindings/gpio/rockchip,gpio-bank.yaml          | 82 ++++++++++++++++++++++
>  .../bindings/pinctrl/rockchip,pinctrl.txt          | 58 +--------------
>  2 files changed, 83 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> new file mode 100644
> index 000000000..d993e002c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/rockchip,gpio-bank.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip GPIO bank
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,gpio-bank
> +      - rockchip,rk3188-gpio-bank0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pinctrl: pinctrl {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      gpio0: gpio@2000a000 {
> +        compatible = "rockchip,rk3188-gpio-bank0";
> +        reg = <0x2000a000 0x100>;
> +        interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk_gates8 9>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +      };
> +
> +      gpio1: gpio@2003c000 {
> +        compatible = "rockchip,gpio-bank";
> +        reg = <0x2003c000 0x100>;
> +        interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk_gates8 10>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> index d3eae61a3..4719a6a07 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> @@ -50,23 +50,7 @@ Deprecated properties for iomux controller:
>          Use rockchip,grf and rockchip,pmu described above instead.
>
>  Required properties for gpio sub nodes:
> -  - compatible: "rockchip,gpio-bank"
> -  - reg: register of the gpio bank (different than the iomux registerset)
> -  - interrupts: base interrupt of the gpio bank in the interrupt controller
> -  - clocks: clock that drives this bank
> -  - gpio-controller: identifies the node as a gpio controller and pin bank.
> -  - #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
> -    binding is used, the amount of cells must be specified as 2. See generic
> -    GPIO binding documentation for description of particular cells.
> -  - interrupt-controller: identifies the controller node as interrupt-parent.
> -  - #interrupt-cells: the value of this property should be 2 and the interrupt
> -    cells should use the standard two-cell scheme described in
> -    bindings/interrupt-controller/interrupts.txt
> -
> -Deprecated properties for gpio sub nodes:
> -  - compatible: "rockchip,rk3188-gpio-bank0"
> -  - reg: second element: separate pull register for rk3188 bank0, use
> -        rockchip,pmu described above instead
> +See rockchip,gpio-bank.yaml
>
>  Required properties for pin configuration node:
>    - rockchip,pins: 3 integers array, represents a group of pins mux and config
> @@ -127,43 +111,3 @@ uart2: serial@20064000 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&uart2_xfer>;
>  };
> -
> -Example for rk3188:
> -
> -       pinctrl@20008000 {
> -               compatible = "rockchip,rk3188-pinctrl";
> -               rockchip,grf = <&grf>;
> -               rockchip,pmu = <&pmu>;
> -               #address-cells = <1>;
> -               #size-cells = <1>;
> -               ranges;
> -
> -               gpio0: gpio0@2000a000 {
> -                       compatible = "rockchip,rk3188-gpio-bank0";
> -                       reg = <0x2000a000 0x100>;
> -                       interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&clk_gates8 9>;
> -
> -                       gpio-controller;
> -                       #gpio-cells = <2>;
> -
> -                       interrupt-controller;
> -                       #interrupt-cells = <2>;
> -               };
> -
> -               gpio1: gpio1@2003c000 {
> -                       compatible = "rockchip,gpio-bank";
> -                       reg = <0x2003c000 0x100>;
> -                       interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&clk_gates8 10>;
> -
> -                       gpio-controller;
> -                       #gpio-cells = <2>;
> -
> -                       interrupt-controller;
> -                       #interrupt-cells = <2>;
> -               };
> -
> -               ...
> -
> -       };
> --
> 2.11.0
>

Applied, thanks!

Bartosz
