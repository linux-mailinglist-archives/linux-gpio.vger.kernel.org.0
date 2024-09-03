Return-Path: <linux-gpio+bounces-9664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECEB96A226
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B15E91C20CB9
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7DC188A22;
	Tue,  3 Sep 2024 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hajlWzrF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7496222EE5;
	Tue,  3 Sep 2024 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725376727; cv=none; b=esZh9x063Ei8eGzH9ndD2QuWrnVYiH04mfjot3JEfyw1SRKaivUK9EehH1vXyBuq3n79/hsoRRxorzBcTTLBg48LuepKG3WnvgMO4a7+kJMFn2Et142vO45O6rh0Bf4Y/5PF5DNXucvi3KbJjGko0llqnqwagf5Q5mn+XFXM/X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725376727; c=relaxed/simple;
	bh=KjfS86PFrrzBccvKSo00f6geSxiz6DpoalzH4tV6qKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VI1yI5yigIWVhvInKazXeTQSmn1gKxCI0WRzHHCg7iXPP7++nbM/GscP8Gc4GKcRoMCJRO/Ei2A9IDZkQrbTAQO+nYtymK/BSDrEYad9PySfqcL5bqYYwHq9cb0BF8t8H5zycDCk1TONh+f+el96W2bcjdLjQtUOG6q+xg9mSkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hajlWzrF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C554BC4CEC4;
	Tue,  3 Sep 2024 15:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725376726;
	bh=KjfS86PFrrzBccvKSo00f6geSxiz6DpoalzH4tV6qKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hajlWzrFyqkD1wZavYtTAVS4BjsI3w9FwZHtfEv3D2QoL3Xi6XwUpSp6sExiEEZgd
	 6Rod9J5ADvmLEaZWXNVyLDsOWuMpI39BkLhXqwZayoAZ+0+P9p/tR8LwrPAYBgnKBx
	 SUzYW1XngjdNwWMLYowYjc2o3MumtkzQ7cqIrqr+Pf5eyTmYTeTP4a+iuh27wStmDk
	 Su6tGMKneFMVrHkQveXWmWmnad4OPiaRgP/RpswNBmbriLraixlvcdMz/0l7kfJKw5
	 z0JKn3m5PzsWnr2mzl61sZNSbw7KlNP1oYx7A08ws3SPBjxoIJP6u38tnC8zuivxEw
	 go/HxekI3Gqqg==
Date: Tue, 3 Sep 2024 10:18:45 -0500
From: Rob Herring <robh@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl
 bindings
Message-ID: <20240903151845.GA1031888-robh@kernel.org>
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
 <20240902-th1520-pinctrl-v1-1-639bf83ef50a@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-th1520-pinctrl-v1-1-639bf83ef50a@tenstorrent.com>

On Mon, Sep 02, 2024 at 09:06:54PM -0700, Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> 
> Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [dfustini: use a single compatible for all pin controller instances]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../bindings/pinctrl/thead,th1520-pinctrl.yaml     | 165 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 166 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> new file mode 100644
> index 000000000000..429cc0bc1100
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-Head TH1520 SoC pin controller
> +
> +maintainers:
> +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> +
> +description: |
> +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> +
> +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> +  Confusingly the memory ranges are named
> +    PADCTRL_AOSYS  -> PAD Group 1
> +    PADCTRL1_APSYS -> PAD Group 2
> +    PADCTRL0_APSYS -> PAD Group 3
> +
> +  Each pad can be muxed individually to up to 6 different functions. For most
> +  pads only a few of those 6 configurations are valid though, and a few pads in
> +  group 1 does not support muxing at all.
> +
> +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> +  be configured or has some special functions. The rest have configurable drive
> +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> +  addition to a special strong pull up.
> +
> +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> +  are then meant to be used by the audio co-processor. Each such pad can then
> +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> +  also configured in different registers. All of this is done from a different
> +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - thead,th1520-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-[0-9]+$':
> +    type: object
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        additionalProperties: false
> +
> +        description:
> +          A pinctrl node should contain at least one subnode describing one
> +          or more pads and their associated pinmux and pinconf settings.
> +
> +        properties:
> +          pins:
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pins

No, we generally don't reference individual properties across schemas. 
Add a reference to pinmux-node.yaml for the node.

> +            description: List of pads that properties in the node apply to.
> +
> +          function:
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/function
> +            enum: [ gpio, pwm, uart, ir, i2c, spi, qspi, sdio, audio, i2s,
> +                    gmac0, gmac1, dpu0, dpu1, isp, hdmi, bootsel, debug,
> +                    clock, jtag, iso7816, efuse, reset ]
> +            description: The mux function to select for the given pins.
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +                description: Enable the regular 48kOhm pull-up
> +              - enum: [ 2100, 48000 ]
> +                description: Enable the strong 2.1kOhm pull-up or regular 48kOhm pull-up
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - const: 44000
> +            description: Enable the regular 44kOhm pull-down
> +
> +          drive-strength:
> +            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23, 25 ]
> +            description: Drive strength in mA
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          slew-rate:
> +            maximum: 1
> +
> +        required:
> +          - pins
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +
> +examples:
> +  - |
> +    padctrl0_apsys: pinctrl@ec007000 {
> +        compatible = "thead,th1520-pinctrl";
> +        reg = <0xec007000 0x1000>;
> +        clocks = <&apb_clk>;
> +
> +        uart0_pins: uart0-0 {
> +            tx-pins {
> +                pins = "UART0_TXD";
> +                function = "uart";
> +                bias-disable;
> +                drive-strength = <3>;
> +                input-disable;
> +                input-schmitt-disable;
> +                slew-rate = <0>;
> +            };
> +
> +            rx-pins {
> +                pins = "UART0_RXD";
> +                function = "uart";
> +                bias-disable;
> +                drive-strength = <1>;
> +                input-enable;
> +                input-schmitt-enable;
> +                slew-rate = <0>;
> +            };
> +        };
> +    };
> +
> +    padctrl1_apsys: pinctrl@e7f3c000 {
> +        compatible = "thead,th1520-pinctrl";
> +        reg = <0xe7f3c000 0x1000>;
> +        clocks = <&apb_clk>;
> +
> +        i2c5_pins: i2c5-0 {
> +            i2c-pins {
> +                pins = "QSPI1_CSN0",    /* I2C5_SCL */
> +                       "QSPI1_D0_MOSI"; /* I2C5_SDA */
> +                function = "i2c";
> +                bias-pull-up = <2100>;
> +                drive-strength = <7>;
> +                input-enable;
> +                input-schmitt-enable;
> +                slew-rate = <0>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 878dcd23b331..a73953c0f080 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19700,6 +19700,7 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/pdp7/linux.git
>  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> +F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
> 
> -- 
> 2.34.1
> 

