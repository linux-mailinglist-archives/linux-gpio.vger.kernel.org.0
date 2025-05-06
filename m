Return-Path: <linux-gpio+bounces-19680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F3FAAC213
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 13:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F34C91C237F1
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA4D2798E9;
	Tue,  6 May 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHspKYof"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD09A1F55F8;
	Tue,  6 May 2025 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529609; cv=none; b=mR9gcOL+Vv0Qct5s4bg20qanyDR0bPa+R2HVaCktQvU2P+iLOpzJuYzjtVsz1NZvhGT629kcCnMOat4f0OLvR7FOhYYNeaCyFvpsS4XnflptXzzAXrmbT2DUG9SvEPpIRDNTaseotVYzhczCVR5enbIHwios870pUrTWiKES4KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529609; c=relaxed/simple;
	bh=IsJ4knD6xjH5ocv5Yne+kV9PRiqyTgJ8O5upyfZ3XeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/7U+OncLlRLCDxzw9RQ0qAa/s6QEvLyzx+w32ucaeQEsSok2bma6xmKZTfSLxr3M5q6fCgyYcsO8KDc4yvJspei8NOhhMVJgrqZK3FCxOAIPLnEgquqdYfyHZvjpkSGDy3yVVTB/91zFDOU/b8ehSC51earX9wdiN2LXGwQXU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHspKYof; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4103C4CEE4;
	Tue,  6 May 2025 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746529609;
	bh=IsJ4knD6xjH5ocv5Yne+kV9PRiqyTgJ8O5upyfZ3XeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VHspKYofF/Nbn6SlNqc2bfQfo93MlLP2GC3foMiOYd3Eiklnd7rPNpcz52HrTTAxA
	 RyOMCgF2bin4Y8P0OrTQIb5EQeEgkHW3+gQzPvDMY4AMlhLwZHRf3dzgiDVuKQtI9n
	 Xbvo2y8+aEPxn7KaGqIDiWQHWVwgGaUi7DKj6ygp32Gq4/ERY+0i+etHbnoRVXX2gM
	 t0LIY7mrqL7hfNKX7G7DVo6vTecO+n4f5Nr3XCkjDW29nYsmTunY0y+nhh9uvh1Dga
	 fTUu5paF0JAum7VGi/TnSR2miv1EvODG+xg2kAAWzlMhfOdeoKOtfYwyjPuUHemdFe
	 5TeIRD8PRCSRQ==
Message-ID: <9015e10e-effb-4dc8-b100-1906db731f57@kernel.org>
Date: Tue, 6 May 2025 13:06:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: eswin: Document for eic7700 SoC
To: luyulin <luyulin@eswincomputing.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kees@kernel.org, gustavoars@kernel.org,
 brgl@bgdev.pl, linux-hardening@vger.kernel.org
Cc: zhengyu@eswincomputing.com, ningyu@eswincomputing.com,
 huangyifeng@eswincomputing.com, linmin@eswincomputing.com,
 fenglin@eswincomputing.com, lianghujun@eswincomputing.com,
 Samuel Holland <samuel.holland@sifive.com>
References: <20250506090844.1516-1-luyulin@eswincomputing.com>
 <20250506091145.1953-1-luyulin@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250506091145.1953-1-luyulin@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 11:11, luyulin wrote:
> This commit adds Device Tree binding documentation for the

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


> ESWIN EIC7700 pinctrl controller module. The document describes
> the required properties, compatible strings, and usage examples
> in the device tree configuration when applying this module.

Do not explain what DT binding is. We all know. Explain the hardware.
See also other comits as examples.

> 
> Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: luyulin <luyulin@eswincomputing.com>


Looks like you used login name as full name. Use rather latin
transcription or your name in your native language.

> ---
>  .../pinctrl/eswin,eic7700-pinctrl.yaml        | 156 ++++++++++++++++++


This was already send and reviewed. Implement previous feedback

https://lore.kernel.org/all/20250326-owl-of-algebraic-wealth-61aeda@krzk-bin/

Then please version your patches correctly, e.g. use b4 or git
format-patch -vX, and add changelog in cover letter or under '---' of
individual patches describing changes from previous version.


>  1 file changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
> new file mode 100644
> index 000000000000..d8811a8e0a51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
> @@ -0,0 +1,156 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/eswin,eic7700-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Eswin Eic7700 Pinctrl
> +
> +maintainers:
> +  - LuYuLin <luyulin@eswincomputing.com>
> +
> +description: |
> +  Please refer to pinctrl-bindings.txt in this directory for details of the
> +  common pinctrl bindings used by client devices, including the meaning of the
> +  phrase "pin configuration node".

Drop this paragraph, redundant.

> +
> +  eic7700 pin configuration nodes act as a container for an arbitrary number of
> +  subnodes. Each of these subnodes represents some desired configuration for one or
> +  more pins. This configuration can include the mux function to select on those pin(s),
> +  and various pin configuration parameters, such as input-enable, pull-up, etc.
> +
> +properties:
> +  compatible:
> +    const: eswin,eic7700-pinctrl
> +
> +  reg:
> +    description: Specifies the base address and size of the SLCR space.

Drop description, redundant.

> +    maxItems: 1
> +
> +  "vrgmii-supply":

Open existing bindings. Do you see any property written like that? No,
therefore do not come with own syntax,

Drop quotes,

> +    description:
> +      Regulator supply for the RGMII interface IO power domain.
> +      This property should reference a regulator that provides either 1.8V or 3.3V,
> +      depending on the board-level voltage configuration required by the RGMII interface.
> +
> +patternProperties:
> +  '^(.*-)?(pins)$':

Weirdly complicated pattern. Why not just "-pins$"? For which case do
you need "pins" name?


> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for pin muxes,
> +      which in turn use below standard properties.
> +
> +    properties:
> +      pins:
> +        description:
> +          For eic7700, specifies the name(s) of one or more pins to be configured by
> +          this node.
> +        items:
> +          enum: [ chip_mode, mode_set0, mode_set1, mode_set2, mode_set3, xin,
> +                  rst_out_n, key_reset_n, gpio0, por_sel, jtag0_tck, jtag0_tms,
> +                  jtag0_tdi, jtag0_tdo, gpio5, spi2_cs0_n, jtag1_tck, jtag1_tms,
> +                  jtag1_tdi, jtag1_tdo, gpio11, spi2_cs1_n, pcie_clkreq_n,
> +                  pcie_wake_n, pcie_perst_n, hdmi_scl, hdmi_sda, hdmi_cec,
> +                  jtag2_trst, rgmii0_clk_125, rgmii0_txen, rgmii0_txclk,
> +                  rgmii0_txd0, rgmii0_txd1, rgmii0_txd2, rgmii0_txd3, i2s0_bclk,
> +                  i2s0_wclk, i2s0_sdi, i2s0_sdo, i2s_mclk, rgmii0_rxclk,
> +                  rgmii0_rxdv, rgmii0_rxd0, rgmii0_rxd1, rgmii0_rxd2, rgmii0_rxd3,
> +                  i2s2_bclk, i2s2_wclk, i2s2_sdi, i2s2_sdo, gpio27, gpio28, gpio29,
> +                  rgmii0_mdc, rgmii0_mdio, rgmii0_intb, rgmii1_clk_125, rgmii1_txen,
> +                  rgmii1_txclk, rgmii1_txd0, rgmii1_txd1, rgmii1_txd2, rgmii1_txd3,
> +                  i2s1_bclk, i2s1_wclk, i2s1_sdi, i2s1_sdo, gpio34, rgmii1_rxclk,
> +                  rgmii1_rxdv, rgmii1_rxd0, rgmii1_rxd1, rgmii1_rxd2, rgmii1_rxd3,
> +                  spi1_cs0_n, spi1_clk, spi1_d0, spi1_d1, spi1_d2, spi1_d3, spi1_cs1_n,
> +                  rgmii1_mdc, rgmii1_mdio, rgmii1_intb, usb0_pwren, usb1_pwren,
> +                  i2c0_scl, i2c0_sda, i2c1_scl, i2c1_sda, i2c2_scl, i2c2_sda,
> +                  i2c3_scl, i2c3_sda, i2c4_scl, i2c4_sda, i2c5_scl, i2c5_sda,
> +                  uart0_tx, uart0_rx, uart1_tx, uart1_rx, uart1_cts, uart1_rts,
> +                  uart2_tx, uart2_rx, jtag2_tck, jtag2_tms, jtag2_tdi, jtag2_tdo,
> +                  fan_pwm, fan_tach, mipi_csi0_xvs, mipi_csi0_xhs, mipi_csi0_mclk,
> +                  mipi_csi1_xvs, mipi_csi1_xhs, mipi_csi1_mclk, mipi_csi2_xvs,
> +                  mipi_csi2_xhs, mipi_csi2_mclk, mipi_csi3_xvs, mipi_csi3_xhs,
> +                  mipi_csi3_mclk, mipi_csi4_xvs, mipi_csi4_xhs, mipi_csi4_mclk,
> +                  mipi_csi5_xvs, mipi_csi5_xhs, mipi_csi5_mclk, spi3_cs_n, spi3_clk,
> +                  spi3_di, spi3_do, gpio92, gpio93, s_mode, gpio95, spi0_cs_n,
> +                  spi0_clk, spi0_d0, spi0_d1, spi0_d2, spi0_d3, i2c10_scl,
> +                  i2c10_sda, i2c11_scl, i2c11_sda, gpio106, boot_sel0, boot_sel1,
> +                  boot_sel2, boot_sel3, gpio111, lpddr_ref_clk ]
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the
> +          given pins.
> +        enum: [ disabled, boot_sel, chip_mode, emmc, fan_tach,
> +                gpio, hdmi, i2c, i2s, jtag, ddr_ref_clk_sel,
> +                lpddr_ref_clk, mipi_csi, osc, pcie, pwm,
> +                rgmii, reset, sata, sdio, spi, s_mode, uart, usb ]
> +
> +      input-schmitt-enable: true
> +
> +      input-schmitt-disable: true
> +
> +      bias-disable: true
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      input-enable: true
> +
> +      input-disable: true
> +
> +      drive-strength-microamp: true
> +
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
> +
> +      - if:
> +          properties:
> +            pins:
> +              anyOf:
> +                - pattern: '^rgmii'
> +                - const: lpddr_ref_clk
> +        then:
> +          properties:
> +            drive-strength-microamp:
> +              enum: [3000, 6000, 9000, 12000, 15000, 18000, 21000, 24000]
> +        else:
> +          properties:
> +            drive-strength-microamp:
> +              enum: [6000, 9000, 12000, 15000, 18000, 21000, 24000, 27000]
> +
> +    required:
> +      - pins
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@51600080 {
> +      compatible = "eswin,eic7700-pinctrl";
> +      reg = <0x51600080 0x1fff80>;
> +      vrgmii-supply = <&vcc_1v8>;
> +      gpio10_pins: gpio10-pins {

Drop label.

> +          pins = "jtag1_tdo";
> +          function = "gpio";
> +          input-enable;
> +          bias-pull-up;
> +      };
> +    };
> +
> +    i2c2 {

Drop this node, not relevant.


Best regards,
Krzysztof

