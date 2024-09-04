Return-Path: <linux-gpio+bounces-9668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 554FD96A2D6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 799681C2366E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3750316F8EF;
	Tue,  3 Sep 2024 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YybHKF1E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23642AE68;
	Tue,  3 Sep 2024 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725377694; cv=none; b=UtifwziBF18TSoKgaH67e6CuRDzTjDgrpLbXMoGjFn1aewdRaN30otZCenPKj/Y5U48kI1panZvN+zwpFVBxL25TK7vVgA70T3YRckKyfH7niyJtBN9P7JePLVF6KgDazv5bbzqyn6sfymt3XPbOCH6xHfxQF00MaLzXO1qjPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725377694; c=relaxed/simple;
	bh=kqcnx46fPVCnHyYO9lP9tSUUrEpSVOPOi9ige20J/0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrNGk3qzftE536H68DNRRvygpzZ0BiqLEx+RvmZ7gLiH82BA1v/uMVqPRxMW7XhGLnlDw/GrZ8Xn9SFKwzrK6munXFcHe7Rp9AsTrSlO5CWjcvHAwE8NjADFDQam195cGvly5B1dD5FsA11yHsbFyu9lXACysyFajtK3KY84dw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YybHKF1E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28142C4CEC8;
	Tue,  3 Sep 2024 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725377693;
	bh=kqcnx46fPVCnHyYO9lP9tSUUrEpSVOPOi9ige20J/0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YybHKF1EBqYIIZ1ss/1llqNbwQUaMPyDFPMK4F+AQwmOhsWp7taq6ZosqZctPJ6fa
	 3RHm96I5ac+69NNdhjA07kZYxNYonlSNKff6MV2kJYUm0RuUXOMWDfFIZvP1ANRSGg
	 5l09cUN4TNcCzzyiKzAC3fyC2je6ZPL5Nly16nmJZihHy30NScSPICZ72z8y8fBMu8
	 6C7vjQh5gSNeODwtw4lNxTph7b+iRUG9179KjLWdhmJv7cBlGn8ln3Wbl/vixHD0PV
	 tb1tthFbmqBbbvkENOo94cLUcMjPmUMwspd6V7Quas+FI1964jJfq8z2v5GbD0EVRL
	 2UXKLZYfa+EKg==
Date: Tue, 3 Sep 2024 10:34:52 -0500
From: Rob Herring <robh@kernel.org>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	saikrishna12468@gmail.com, git@amd.com
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
Message-ID: <20240903153452.GA1050106-robh@kernel.org>
References: <20240903110717.2283362-1-sai.krishna.potthuri@amd.com>
 <20240903110717.2283362-2-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903110717.2283362-2-sai.krishna.potthuri@amd.com>

On Tue, Sep 03, 2024 at 04:37:15PM +0530, Sai Krishna Potthuri wrote:
> Add Xilinx Versal compatible string and corresponding groups, function and
> pins properties to support pin controller features on Versal platform.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  .../bindings/pinctrl/xlnx,versal-pinctrl.yaml | 385 ++++++++++++++++++
>  1 file changed, 385 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> new file mode 100644
> index 000000000000..740f8f393427
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> @@ -0,0 +1,385 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/xlnx,versal-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx Versal Pinctrl
> +
> +maintainers:
> +  - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> +
> +description: |
> +  Please refer to pinctrl-bindings.txt in this directory for details of the
> +  common pinctrl bindings used by client devices, including the meaning of the
> +  phrase "pin configuration node".
> +
> +  Versal's pin configuration nodes act as a container for an arbitrary number of
> +  subnodes. Each of these subnodes represents some desired configuration for a
> +  pin, a group, or a list of pins or groups. This configuration can include the
> +  mux function to select on those pin(s)/group(s), and various pin configuration
> +  parameters, such as pull-up, slew rate, etc.
> +
> +  Each configuration node can consist of multiple nodes describing the pinmux and
> +  pinconf options. Those nodes can be pinmux nodes or pinconf nodes.
> +
> +properties:
> +  compatible:
> +    const: xlnx,versal-pinctrl
> +
> +patternProperties:
> +  '^(.*-)?(default|gpio-grp)$':
> +    type: object
> +    patternProperties:
> +      '^mux':
> +        type: object
> +        description:
> +          Pinctrl node's client devices use subnodes for pin muxes,
> +          which in turn use below standard properties.
> +        $ref: pinmux-node.yaml#
> +
> +        properties:
> +          pins:
> +            description:
> +              List of pins to select (either this or "groups" must be specified)
> +            items:
> +              pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$'
> +            minItems: 1
> +            maxItems: 78
> +
> +          groups:
> +            description:
> +              List of groups to select (either this or "pins" must be
> +              specified), available groups for this subnode.
> +            items:
> +              anyOf:
> +                - pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$'
> +                - enum: [spi0_0_grp, spi0_1_grp, spi0_2_grp, spi0_3_grp, spi0_4_grp, spi0_5_grp,
> +                         spi0_ss_0_grp, spi0_ss_1_grp, spi0_ss_2_grp, spi0_ss_3_grp, spi0_ss_4_grp,
> +                         spi0_ss_5_grp, spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp, spi0_ss_9_grp,
> +                         spi0_ss_10_grp, spi0_ss_11_grp, spi0_ss_12_grp, spi0_ss_13_grp, spi0_ss_14_grp,
> +                         spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp, spi1_0_grp, spi1_1_grp,
> +                         spi1_2_grp, spi1_3_grp, spi1_4_grp, spi1_5_grp, spi1_ss_0_grp, spi1_ss_1_grp,
> +                         spi1_ss_2_grp, spi1_ss_3_grp, spi1_ss_4_grp, spi1_ss_5_grp, spi1_ss_6_grp,
> +                         spi1_ss_7_grp, spi1_ss_8_grp, spi1_ss_9_grp, spi1_ss_10_grp, spi1_ss_11_grp,
> +                         spi1_ss_12_grp, spi1_ss_13_grp, spi1_ss_14_grp, spi1_ss_15_grp, spi1_ss_16_grp
> +                         spi1_ss_17_grp, can0_0_grp, can0_1_grp, can0_2_grp, can0_3_grp, can0_4_grp,
> +                         can0_5_grp, can0_6_grp, can0_7_grp, can0_8_grp, can0_9_grp, can0_10_grp,
> +                         can0_11_grp, can0_12_grp, can0_13_grp, can0_14_grp, can0_15_grp, can0_16_grp,
> +                         can0_17_grp, can1_0_grp, can1_1_grp, can1_2_grp, can1_3_grp, can1_4_grp,
> +                         can1_5_grp, can1_6_grp, can1_7_grp, can1_8_grp, can1_9_grp, can1_10_grp,
> +                         can1_11_grp, can1_12_grp, can1_13_grp, can1_14_grp, can1_15_grp, can1_16_grp,
> +                         can1_17_grp, can1_18_grp, i2c0_0_grp, i2c0_1_grp, i2c0_2_grp, i2c0_3_grp,
> +                         i2c0_4_grp, i2c0_5_grp, i2c0_6_grp, i2c0_7_grp, i2c0_8_grp, i2c0_9_grp,
> +                         i2c0_10_grp, i2c0_11_grp, i2c0_12_grp, i2c0_13_grp, i2c0_14_grp, i2c0_15_grp,
> +                         i2c0_16_grp, i2c0_17_grp, i2c1_0_grp, i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
> +                         i2c1_4_grp, i2c1_5_grp, i2c1_6_grp, i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
> +                         i2c1_10_grp, i2c1_11_grp, i2c1_12_grp, i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
> +                         i2c1_16_grp, i2c1_17_grp, i2c1_18_grp, i2c_pmc_0_grp, i2c_pmc_1_grp,
> +                         i2c_pmc_2_grp, i2c_pmc_3_grp, i2c_pmc_4_grp, i2c_pmc_5_grp, i2c_pmc_6_grp,
> +                         i2c_pmc_7_grp, i2c_pmc_8_grp, i2c_pmc_9_grp, i2c_pmc_10_grp, i2c_pmc_11_grp,
> +                         i2c_pmc_12_grp, ttc0_clk_0_grp, ttc0_clk_1_grp, ttc0_clk_2_grp, ttc0_clk_3_grp,
> +                         ttc0_clk_4_grp, ttc0_clk_5_grp, ttc0_clk_6_grp, ttc0_clk_7_grp, ttc0_clk_8_grp,
> +                         ttc0_wav_0_grp, ttc0_wav_1_grp, ttc0_wav_2_grp, ttc0_wav_3_grp, ttc0_wav_4_grp,
> +                         ttc0_wav_5_grp, ttc0_wav_6_grp, ttc0_wav_7_grp, ttc0_wav_8_grp, ttc1_clk_0_grp,
> +                         ttc1_clk_1_grp, ttc1_clk_2_grp, ttc1_clk_3_grp, ttc1_clk_4_grp, ttc1_clk_5_grp,
> +                         ttc1_clk_6_grp, ttc1_clk_7_grp, ttc1_clk_8_grp, ttc1_wav_0_grp, ttc1_wav_1_grp,
> +                         ttc1_wav_2_grp, ttc1_wav_3_grp, ttc1_wav_4_grp, ttc1_wav_5_grp, ttc1_wav_6_grp,
> +                         ttc1_wav_7_grp, ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_clk_1_grp, ttc2_clk_2_grp,
> +                         ttc2_clk_3_grp, ttc2_clk_4_grp, ttc2_clk_5_grp, ttc2_clk_6_grp, ttc2_clk_7_grp,
> +                         ttc2_clk_8_grp, ttc2_wav_0_grp, ttc2_wav_1_grp, ttc2_wav_2_grp, ttc2_wav_3_grp,
> +                         ttc2_wav_4_grp, ttc2_wav_5_grp, ttc2_wav_6_grp, ttc2_wav_7_grp, ttc2_wav_8_grp,
> +                         ttc3_clk_0_grp, ttc3_clk_1_grp, ttc3_clk_2_grp, ttc3_clk_3_grp, ttc3_clk_4_grp,
> +                         ttc3_clk_5_grp, ttc3_clk_6_grp, ttc3_clk_7_grp, ttc3_clk_8_grp, ttc3_wav_0_grp,
> +                         ttc3_wav_1_grp, ttc3_wav_2_grp, ttc3_wav_3_grp, ttc3_wav_4_grp, ttc3_wav_5_grp,
> +                         ttc3_wav_6_grp, ttc3_wav_7_grp, ttc3_wav_8_grp, wwdt0_0_grp, wwdt0_1_grp,
> +                         wwdt0_2_grp, wwdt0_3_grp, wwdt0_4_grp, wwdt0_5_grp, wwdt1_0_grp, wwdt1_1_grp,
> +                         wwdt1_2_grp, wwdt1_3_grp, wwdt1_4_grp, wwdt1_5_grp, sysmon_i2c0_0_grp,
> +                         sysmon_i2c0_1_grp, sysmon_i2c0_2_grp, sysmon_i2c0_3_grp, sysmon_i2c0_4_grp,
> +                         sysmon_i2c0_5_grp, sysmon_i2c0_6_grp, sysmon_i2c0_7_grp, sysmon_i2c0_8_grp,
> +                         sysmon_i2c0_9_grp, sysmon_i2c0_10_grp, sysmon_i2c0_11_grp, sysmon_i2c0_12_grp,
> +                         sysmon_i2c0_13_grp, sysmon_i2c0_14_grp, sysmon_i2c0_15_grp,
> +                         sysmon_i2c0_16_grp, sysmon_i2c0_17_grp, sysmon_i2c0_alrt_0_grp,
> +                         sysmon_i2c0_alrt_1_grp, sysmon_i2c0_alrt_2_grp, sysmon_i2c0_alrt_3_grp,
> +                         sysmon_i2c0_alrt_4_grp, sysmon_i2c0_alrt_5_grp, sysmon_i2c0_alrt_6_grp,
> +                         sysmon_i2c0_alrt_7_grp, sysmon_i2c0_alrt_8_grp, sysmon_i2c0_alrt_9_grp,
> +                         sysmon_i2c0_alrt_10_grp, sysmon_i2c0_alrt_11_grp, sysmon_i2c0_alrt_12_grp,
> +                         sysmon_i2c0_alrt_13_grp, sysmon_i2c0_alrt_14_grp, sysmon_i2c0_alrt_15_grp,
> +                         sysmon_i2c0_alrt_16_grp, sysmon_i2c0_alrt_17_grp, uart0_0_grp, uart0_1_grp,
> +                         uart0_2_grp, uart0_3_grp, uart0_4_grp, uart0_5_grp, uart0_6_grp, uart0_7_grp,
> +                         uart0_8_grp, uart0_ctrl_0_grp, uart0_ctrl_1_grp, uart0_ctrl_2_grp,
> +                         uart0_ctrl_3_grp, uart0_ctrl_4_grp, uart0_ctrl_5_grp, uart0_ctrl_6_grp,
> +                         uart0_ctrl_7_grp, uart0_ctrl_8_grp, uart1_0_grp, uart1_1_grp, uart1_2_grp,
> +                         uart1_3_grp, uart1_4_grp, uart1_5_grp, uart1_6_grp, uart1_7_grp, uart1_8_grp,
> +                         uart1_ctrl_0_grp, uart1_ctrl_1_grp, uart1_ctrl_2_grp, uart1_ctrl_3_grp,
> +                         uart1_ctrl_4_grp, uart1_ctrl_5_grp, uart1_ctrl_6_grp, uart1_ctrl_7_grp,
> +                         uart1_ctrl_8_grp, gpio0_0_grp, gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
> +                         gpio0_4_grp, gpio0_5_grp, gpio0_6_grp, gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
> +                         gpio0_10_grp, gpio0_11_grp, gpio0_12_grp, gpio0_13_grp, gpio0_14_grp,
> +                         gpio0_15_grp, gpio0_16_grp, gpio0_17_grp, gpio0_18_grp, gpio0_19_grp,
> +                         gpio0_20_grp, gpio0_21_grp, gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
> +                         gpio0_25_grp, gpio1_0_grp, gpio1_1_grp, gpio1_2_grp, gpio1_3_grp, gpio1_4_grp,
> +                         gpio1_5_grp, gpio1_6_grp, gpio1_7_grp, gpio1_8_grp, gpio1_9_grp,
> +                         gpio1_10_grp, gpio1_11_grp, gpio1_12_grp, gpio1_13_grp, gpio1_14_grp,
> +                         gpio1_15_grp, gpio1_16_grp, gpio1_17_grp, gpio1_18_grp, gpio1_19_grp,
> +                         gpio1_20_grp, gpio1_21_grp, gpio1_22_grp, gpio1_23_grp, gpio1_24_grp,
> +                         gpio1_25_grp, gpio2_0_grp, gpio2_1_grp, gpio2_2_grp, gpio2_3_grp, gpio2_4_grp,
> +                         gpio2_5_grp, gpio2_6_grp, gpio2_7_grp, gpio2_8_grp, gpio2_9_grp, gpio2_10_grp,
> +                         gpio2_11_grp, gpio2_12_grp, gpio2_13_grp, gpio2_14_grp, gpio2_15_grp,
> +                         gpio2_16_grp, gpio2_17_grp, gpio2_18_grp, gpio2_19_grp, gpio2_20_grp,
> +                         gpio2_21_grp, gpio2_22_grp, gpio2_23_grp, gpio2_24_grp, gpio2_25_grp,
> +                         emio0_0_grp, emio0_1_grp, emio0_2_grp, emio0_3_grp, emio0_4_grp, emio0_5_grp,
> +                         emio0_6_grp, emio0_7_grp, emio0_8_grp, emio0_9_grp, emio0_10_grp,
> +                         emio0_11_grp, emio0_12_grp, emio0_13_grp, emio0_14_grp, emio0_15_grp,
> +                         emio0_16_grp, emio0_17_grp, emio0_18_grp, emio0_19_grp, emio0_20_grp,
> +                         emio0_21_grp, emio0_22_grp, emio0_23_grp, emio0_24_grp, emio0_25_grp,
> +                         emio0_26_grp, emio0_27_grp, emio0_28_grp, emio0_29_grp, emio0_30_grp,
> +                         emio0_31_grp, emio0_32_grp, emio0_33_grp, emio0_34_grp, emio0_35_grp,
> +                         emio0_36_grp, emio0_37_grp, emio0_38_grp, emio0_39_grp, emio0_40_grp,
> +                         emio0_41_grp, emio0_42_grp, emio0_43_grp, emio0_44_grp, emio0_45_grp,
> +                         emio0_46_grp, emio0_47_grp, emio0_48_grp, emio0_49_grp, emio0_50_grp,
> +                         emio0_51_grp, emio0_52_grp, emio0_53_grp, emio0_54_grp, emio0_55_grp,
> +                         emio0_56_grp, emio0_57_grp, emio0_58_grp, emio0_59_grp, emio0_60_grp,
> +                         emio0_61_grp, emio0_62_grp, emio0_63_grp, emio0_64_grp, emio0_65_grp,
> +                         emio0_66_grp, emio0_67_grp, emio0_68_grp, emio0_69_grp, emio0_70_grp,
> +                         emio0_71_grp, emio0_72_grp, emio0_73_grp, emio0_74_grp, emio0_75_grp,
> +                         emio0_76_grp, emio0_77_grp, gem0_0_grp, gem0_1_grp, gem1_0_grp, gem1_1_grp,
> +                         trace0_0_grp, trace0_1_grp, trace0_2_grp, trace0_clk_0_grp, trace0_clk_1_grp,
> +                         trace0_clk_2_grp, mdio0_0_grp, mdio0_1_grp, mdio1_0_grp, mdio1_1_grp,
> +                         gem_tsu0_0_grp, gem_tsu0_1_grp, gem_tsu0_2_grp, gem_tsu0_3_grp, pcie0_0_grp,
> +                         pcie0_1_grp, pcie0_2_grp, smap0_0_grp, usb0_0_grp, sd0_0_grp, sd0_1_grp,
> +                         sd0_2_grp, sd0_3_grp, sd0_4_grp, sd0_5_grp, sd0_6_grp, sd0_7_grp, sd0_8_grp,
> +                         sd0_9_grp, sd0_10_grp, sd0_11_grp, sd0_12_grp, sd0_13_grp, sd0_14_grp,
> +                         sd0_15_grp, sd0_16_grp, sd0_17_grp, sd0_18_grp, sd0_19_grp, sd0_20_grp,
> +                         sd0_21_grp, sd0_pc_0_grp, sd0_pc_1_grp, sd0_cd_0_grp, sd0_cd_1_grp,
> +                         sd0_wp_0_grp, sd0_wp_1_grp, sd1_0_grp, sd1_1_grp, sd1_2_grp, sd1_3_grp,
> +                         sd1_4_grp, sd1_5_grp, sd1_6_grp, sd1_7_grp, sd1_8_grp, sd1_9_grp, sd1_10_grp,
> +                         sd1_11_grp, sd1_12_grp, sd1_13_grp, sd1_14_grp, sd1_15_grp, sd1_16_grp,
> +                         sd1_17_grp, sd1_18_grp, sd1_19_grp, sd1_20_grp, sd1_21_grp, sd1_pc_0_grp,
> +                         sd1_pc_1_grp, sd1_cd_0_grp, sd1_cd_1_grp, sd1_wp_0_grp, sd1_wp_1_grp,
> +                         ospi0_0_grp, ospi0_ss_0_grp, qspi0_0_grp, qspi0_fbclk_0_grp, qspi0_ss_0_grp,
> +                         test_clk_0_grp, test_scan_0_grp, tamper_trigger_0_grp]
> +            minItems: 1
> +            maxItems: 78
> +
> +          function:
> +            description:
> +              Specify the alternative function to be configured for the
> +              given pin groups.
> +            enum: [spi0, spi0_ss, spi1, spi1_ss, can0, can1, i2c0, i2c1, i2c_pmc, ttc0_clk,
> +                   ttc0_wav, ttc1_clk, ttc1_wav, ttc2_clk, ttc2_wav, ttc3_clk, ttc3_wav, wwdt0,
> +                   wwdt1, sysmon_i2c0, sysmon_i2c0_alrt, uart0, uart0_ctrl, uart1, uart1_ctrl,
> +                   gpio0, gpio1, gpio2, emio0, gem0, gem1, trace0, trace0_clk, mdio0, mdio1, gem_tsu0,
> +                   pcie0, smap0, usb0, sd0, sd0_pc, sd0_cd, sd0_wp, sd1, sd1_pc, sd1_wp, sd1_cd,
> +                   ospi0, ospi0_ss, qspi0, qspi0_fbclk, qspi0_ss, test_clk, test_scan, tamper_trigger]
> +
> +        required:
> +          - function
> +
> +        oneOf:
> +          - required: [ groups ]
> +          - required: [ pins ]
> +
> +        additionalProperties: false
> +
> +      '^conf':
> +        type: object
> +        description:
> +          Pinctrl node's client devices use subnodes for pin configurations,
> +          which in turn use the standard properties below.
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +          - $ref: "#/$defs/pins"
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +$defs:
> +  pins:

You don't need $defs as you only have 1 reference to this.

But then the enum for 'groups' looks to be the same in both places from 
a quick glance? So you should have another $ref to this?

> +    properties:
> +      groups:
> +        description:
> +          List of pin groups to select in this subnode.
> +        enum: [spi0_0_grp, spi0_1_grp, spi0_2_grp, spi0_3_grp, spi0_4_grp, spi0_5_grp,
> +               spi0_ss_0_grp, spi0_ss_1_grp, spi0_ss_2_grp, spi0_ss_3_grp, spi0_ss_4_grp,
> +               spi0_ss_5_grp, spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp, spi0_ss_9_grp,
> +               spi0_ss_10_grp, spi0_ss_11_grp, spi0_ss_12_grp, spi0_ss_13_grp, spi0_ss_14_grp,
> +               spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp, spi1_0_grp, spi1_1_grp,
> +               spi1_2_grp, spi1_3_grp, spi1_4_grp, spi1_5_grp, spi1_ss_0_grp, spi1_ss_1_grp,
> +               spi1_ss_2_grp, spi1_ss_3_grp, spi1_ss_4_grp, spi1_ss_5_grp, spi1_ss_6_grp,
> +               spi1_ss_7_grp, spi1_ss_8_grp, spi1_ss_9_grp, spi1_ss_10_grp, spi1_ss_11_grp,
> +               spi1_ss_12_grp, spi1_ss_13_grp, spi1_ss_14_grp, spi1_ss_15_grp, spi1_ss_16_grp
> +               spi1_ss_17_grp, can0_0_grp, can0_1_grp, can0_2_grp, can0_3_grp, can0_4_grp,
> +               can0_5_grp, can0_6_grp, can0_7_grp, can0_8_grp, can0_9_grp, can0_10_grp,
> +               can0_11_grp, can0_12_grp, can0_13_grp, can0_14_grp, can0_15_grp, can0_16_grp,
> +               can0_17_grp, can1_0_grp, can1_1_grp, can1_2_grp, can1_3_grp, can1_4_grp,
> +               can1_5_grp, can1_6_grp, can1_7_grp, can1_8_grp, can1_9_grp, can1_10_grp,
> +               can1_11_grp, can1_12_grp, can1_13_grp, can1_14_grp, can1_15_grp, can1_16_grp,
> +               can1_17_grp, can1_18_grp, i2c0_0_grp, i2c0_1_grp, i2c0_2_grp, i2c0_3_grp,
> +               i2c0_4_grp, i2c0_5_grp, i2c0_6_grp, i2c0_7_grp, i2c0_8_grp, i2c0_9_grp,
> +               i2c0_10_grp, i2c0_11_grp, i2c0_12_grp, i2c0_13_grp, i2c0_14_grp, i2c0_15_grp,
> +               i2c0_16_grp, i2c0_17_grp, i2c1_0_grp, i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
> +               i2c1_4_grp, i2c1_5_grp, i2c1_6_grp, i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
> +               i2c1_10_grp, i2c1_11_grp, i2c1_12_grp, i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
> +               i2c1_16_grp, i2c1_17_grp, i2c1_18_grp, i2c_pmc_0_grp, i2c_pmc_1_grp,
> +               i2c_pmc_2_grp, i2c_pmc_3_grp, i2c_pmc_4_grp, i2c_pmc_5_grp, i2c_pmc_6_grp,
> +               i2c_pmc_7_grp, i2c_pmc_8_grp, i2c_pmc_9_grp, i2c_pmc_10_grp, i2c_pmc_11_grp,
> +               i2c_pmc_12_grp, ttc0_clk_0_grp, ttc0_clk_1_grp, ttc0_clk_2_grp, ttc0_clk_3_grp,
> +               ttc0_clk_4_grp, ttc0_clk_5_grp, ttc0_clk_6_grp, ttc0_clk_7_grp, ttc0_clk_8_grp,
> +               ttc0_wav_0_grp, ttc0_wav_1_grp, ttc0_wav_2_grp, ttc0_wav_3_grp, ttc0_wav_4_grp,
> +               ttc0_wav_5_grp, ttc0_wav_6_grp, ttc0_wav_7_grp, ttc0_wav_8_grp, ttc1_clk_0_grp,
> +               ttc1_clk_1_grp, ttc1_clk_2_grp, ttc1_clk_3_grp, ttc1_clk_4_grp, ttc1_clk_5_grp,
> +               ttc1_clk_6_grp, ttc1_clk_7_grp, ttc1_clk_8_grp, ttc1_wav_0_grp, ttc1_wav_1_grp,
> +               ttc1_wav_2_grp, ttc1_wav_3_grp, ttc1_wav_4_grp, ttc1_wav_5_grp, ttc1_wav_6_grp,
> +               ttc1_wav_7_grp, ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_clk_1_grp, ttc2_clk_2_grp,
> +               ttc2_clk_3_grp, ttc2_clk_4_grp, ttc2_clk_5_grp, ttc2_clk_6_grp, ttc2_clk_7_grp,
> +               ttc2_clk_8_grp, ttc2_wav_0_grp, ttc2_wav_1_grp, ttc2_wav_2_grp, ttc2_wav_3_grp,
> +               ttc2_wav_4_grp, ttc2_wav_5_grp, ttc2_wav_6_grp, ttc2_wav_7_grp, ttc2_wav_8_grp,
> +               ttc3_clk_0_grp, ttc3_clk_1_grp, ttc3_clk_2_grp, ttc3_clk_3_grp, ttc3_clk_4_grp,
> +               ttc3_clk_5_grp, ttc3_clk_6_grp, ttc3_clk_7_grp, ttc3_clk_8_grp, ttc3_wav_0_grp,
> +               ttc3_wav_1_grp, ttc3_wav_2_grp, ttc3_wav_3_grp, ttc3_wav_4_grp, ttc3_wav_5_grp,
> +               ttc3_wav_6_grp, ttc3_wav_7_grp, ttc3_wav_8_grp, wwdt0_0_grp, wwdt0_1_grp,
> +               wwdt0_2_grp, wwdt0_3_grp, wwdt0_4_grp, wwdt0_5_grp, wwdt1_0_grp, wwdt1_1_grp,
> +               wwdt1_2_grp, wwdt1_3_grp, wwdt1_4_grp, wwdt1_5_grp, sysmon_i2c0_0_grp,
> +               sysmon_i2c0_1_grp, sysmon_i2c0_2_grp, sysmon_i2c0_3_grp, sysmon_i2c0_4_grp,
> +               sysmon_i2c0_5_grp, sysmon_i2c0_6_grp, sysmon_i2c0_7_grp, sysmon_i2c0_8_grp,
> +               sysmon_i2c0_9_grp, sysmon_i2c0_10_grp, sysmon_i2c0_11_grp, sysmon_i2c0_12_grp,
> +               sysmon_i2c0_13_grp, sysmon_i2c0_14_grp, sysmon_i2c0_15_grp,
> +               sysmon_i2c0_16_grp, sysmon_i2c0_17_grp, sysmon_i2c0_alrt_0_grp,
> +               sysmon_i2c0_alrt_1_grp, sysmon_i2c0_alrt_2_grp, sysmon_i2c0_alrt_3_grp,
> +               sysmon_i2c0_alrt_4_grp, sysmon_i2c0_alrt_5_grp, sysmon_i2c0_alrt_6_grp,
> +               sysmon_i2c0_alrt_7_grp, sysmon_i2c0_alrt_8_grp, sysmon_i2c0_alrt_9_grp,
> +               sysmon_i2c0_alrt_10_grp, sysmon_i2c0_alrt_11_grp, sysmon_i2c0_alrt_12_grp,
> +               sysmon_i2c0_alrt_13_grp, sysmon_i2c0_alrt_14_grp, sysmon_i2c0_alrt_15_grp,
> +               sysmon_i2c0_alrt_16_grp, sysmon_i2c0_alrt_17_grp, uart0_0_grp, uart0_1_grp,
> +               uart0_2_grp, uart0_3_grp, uart0_4_grp, uart0_5_grp, uart0_6_grp, uart0_7_grp,
> +               uart0_8_grp, uart0_ctrl_0_grp, uart0_ctrl_1_grp, uart0_ctrl_2_grp,
> +               uart0_ctrl_3_grp, uart0_ctrl_4_grp, uart0_ctrl_5_grp, uart0_ctrl_6_grp,
> +               uart0_ctrl_7_grp, uart0_ctrl_8_grp, uart1_0_grp, uart1_1_grp, uart1_2_grp,
> +               uart1_3_grp, uart1_4_grp, uart1_5_grp, uart1_6_grp, uart1_7_grp, uart1_8_grp,
> +               uart1_ctrl_0_grp, uart1_ctrl_1_grp, uart1_ctrl_2_grp, uart1_ctrl_3_grp,
> +               uart1_ctrl_4_grp, uart1_ctrl_5_grp, uart1_ctrl_6_grp, uart1_ctrl_7_grp,
> +               uart1_ctrl_8_grp, gpio0_0_grp, gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
> +               gpio0_4_grp, gpio0_5_grp, gpio0_6_grp, gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
> +               gpio0_10_grp, gpio0_11_grp, gpio0_12_grp, gpio0_13_grp, gpio0_14_grp,
> +               gpio0_15_grp, gpio0_16_grp, gpio0_17_grp, gpio0_18_grp, gpio0_19_grp,
> +               gpio0_20_grp, gpio0_21_grp, gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
> +               gpio0_25_grp, gpio1_0_grp, gpio1_1_grp, gpio1_2_grp, gpio1_3_grp, gpio1_4_grp,
> +               gpio1_5_grp, gpio1_6_grp, gpio1_7_grp, gpio1_8_grp, gpio1_9_grp,
> +               gpio1_10_grp, gpio1_11_grp, gpio1_12_grp, gpio1_13_grp, gpio1_14_grp,
> +               gpio1_15_grp, gpio1_16_grp, gpio1_17_grp, gpio1_18_grp, gpio1_19_grp,
> +               gpio1_20_grp, gpio1_21_grp, gpio1_22_grp, gpio1_23_grp, gpio1_24_grp,
> +               gpio1_25_grp, gpio2_0_grp, gpio2_1_grp, gpio2_2_grp, gpio2_3_grp, gpio2_4_grp,
> +               gpio2_5_grp, gpio2_6_grp, gpio2_7_grp, gpio2_8_grp, gpio2_9_grp, gpio2_10_grp,
> +               gpio2_11_grp, gpio2_12_grp, gpio2_13_grp, gpio2_14_grp, gpio2_15_grp,
> +               gpio2_16_grp, gpio2_17_grp, gpio2_18_grp, gpio2_19_grp, gpio2_20_grp,
> +               gpio2_21_grp, gpio2_22_grp, gpio2_23_grp, gpio2_24_grp, gpio2_25_grp,
> +               emio0_0_grp, emio0_1_grp, emio0_2_grp, emio0_3_grp, emio0_4_grp, emio0_5_grp,
> +               emio0_6_grp, emio0_7_grp, emio0_8_grp, emio0_9_grp, emio0_10_grp,
> +               emio0_11_grp, emio0_12_grp, emio0_13_grp, emio0_14_grp, emio0_15_grp,
> +               emio0_16_grp, emio0_17_grp, emio0_18_grp, emio0_19_grp, emio0_20_grp,
> +               emio0_21_grp, emio0_22_grp, emio0_23_grp, emio0_24_grp, emio0_25_grp,
> +               emio0_26_grp, emio0_27_grp, emio0_28_grp, emio0_29_grp, emio0_30_grp,
> +               emio0_31_grp, emio0_32_grp, emio0_33_grp, emio0_34_grp, emio0_35_grp,
> +               emio0_36_grp, emio0_37_grp, emio0_38_grp, emio0_39_grp, emio0_40_grp,
> +               emio0_41_grp, emio0_42_grp, emio0_43_grp, emio0_44_grp, emio0_45_grp,
> +               emio0_46_grp, emio0_47_grp, emio0_48_grp, emio0_49_grp, emio0_50_grp,
> +               emio0_51_grp, emio0_52_grp, emio0_53_grp, emio0_54_grp, emio0_55_grp,
> +               emio0_56_grp, emio0_57_grp, emio0_58_grp, emio0_59_grp, emio0_60_grp,
> +               emio0_61_grp, emio0_62_grp, emio0_63_grp, emio0_64_grp, emio0_65_grp,
> +               emio0_66_grp, emio0_67_grp, emio0_68_grp, emio0_69_grp, emio0_70_grp,
> +               emio0_71_grp, emio0_72_grp, emio0_73_grp, emio0_74_grp, emio0_75_grp,
> +               emio0_76_grp, emio0_77_grp, gem0_0_grp, gem0_1_grp, gem1_0_grp, gem1_1_grp,
> +               trace0_0_grp, trace0_1_grp, trace0_2_grp, trace0_clk_0_grp, trace0_clk_1_grp,
> +               trace0_clk_2_grp, mdio0_0_grp, mdio0_1_grp, mdio1_0_grp, mdio1_1_grp,
> +               gem_tsu0_0_grp, gem_tsu0_1_grp, gem_tsu0_2_grp, gem_tsu0_3_grp, pcie0_0_grp,
> +               pcie0_1_grp, pcie0_2_grp, smap0_0_grp, usb0_0_grp, sd0_0_grp, sd0_1_grp,
> +               sd0_2_grp, sd0_3_grp, sd0_4_grp, sd0_5_grp, sd0_6_grp, sd0_7_grp, sd0_8_grp,
> +               sd0_9_grp, sd0_10_grp, sd0_11_grp, sd0_12_grp, sd0_13_grp, sd0_14_grp,
> +               sd0_15_grp, sd0_16_grp, sd0_17_grp, sd0_18_grp, sd0_19_grp, sd0_20_grp,
> +               sd0_21_grp, sd0_pc_0_grp, sd0_pc_1_grp, sd0_cd_0_grp, sd0_cd_1_grp,
> +               sd0_wp_0_grp, sd0_wp_1_grp, sd1_0_grp, sd1_1_grp, sd1_2_grp, sd1_3_grp,
> +               sd1_4_grp, sd1_5_grp, sd1_6_grp, sd1_7_grp, sd1_8_grp, sd1_9_grp, sd1_10_grp,
> +               sd1_11_grp, sd1_12_grp, sd1_13_grp, sd1_14_grp, sd1_15_grp, sd1_16_grp,
> +               sd1_17_grp, sd1_18_grp, sd1_19_grp, sd1_20_grp, sd1_21_grp, sd1_pc_0_grp,
> +               sd1_pc_1_grp, sd1_cd_0_grp, sd1_cd_1_grp, sd1_wp_0_grp, sd1_wp_1_grp,
> +               ospi0_0_grp, ospi0_ss_0_grp, qspi0_0_grp, qspi0_fbclk_0_grp, qspi0_ss_0_grp,
> +               test_clk_0_grp, test_scan_0_grp, tamper_trigger_0_grp]


