Return-Path: <linux-gpio+bounces-27321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3DCBF39F7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE9334F687E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364582E8B81;
	Mon, 20 Oct 2025 21:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGq9M0MN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DCE2E7161;
	Mon, 20 Oct 2025 21:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994062; cv=none; b=dHpyTEKIRc/XEOkfwluLj6jrCQGV4gKzbQQvym8uYucizNE/9Cw11F2consbYtE9wGvLW0NauY0shxr5w7k2MD//PoDb14UkmrJZJWHSagG50fD0g4dneyR9n8StB5VhWe8rlvHbXUI8Sk3xM0jQ8er3laYpixvoAPgaVNAH6Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994062; c=relaxed/simple;
	bh=fdb04/UXq0k1A3E/aDkCKpgJXxkT2OTX0kv7hJ1bLJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiYzUnvZiEkrnYKmQ+I2Ohg18JPq0XjFJIs1oXD1KbbEjb+aaL3uAhXkdbFoKn3WmYAyApiLnBPyg8y65yBhinWfeyiacsjxgifUxJIb58y50aPblmcuIUNwTtfWs4HAzoXMIZznOnfZa54x8JPkdiej8kPoC10thNJlWGf52X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGq9M0MN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39AA9C116C6;
	Mon, 20 Oct 2025 21:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760994062;
	bh=fdb04/UXq0k1A3E/aDkCKpgJXxkT2OTX0kv7hJ1bLJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGq9M0MNOggeZpnXdJJ6X9SYsXv8zXFEU67Y24OrLEFUORwii+usmNj+ohy6na3sS
	 /+Wm95xFht71eTT14fwRSgI7Wt0apfeUfs3UL9ueUlifgHzF6wib1Ww+Cix+gE3Gv4
	 VU6e/omnQukTtPSldel2VD+fdtW4fthxEd+EhPvUMuuB+QMlhpysq3VuacAo6TG73+
	 t1e/jqBkLGExLtXMPMtNv+29YJT40paGeOwX6BWcPSeJhHIQArBPVWNI5uxngD4e96
	 5+FfpcLeXOvWrKv7iw4E3Y3ZF8uCerMPOLonBkqADVGRcSqMivJH3VSXORaHtQ+wKr
	 2Q9yW71kpwI4Q==
Date: Mon, 20 Oct 2025 16:01:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: document pic64gx "gpio2"
 pinmux
Message-ID: <176099405922.1818847.11880394494608466257.robh@kernel.org>
References: <20251014-retype-limit-e6cbe901aa07@spud>
 <20251014-stream-zipfile-cd8d6c12b2da@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-stream-zipfile-cd8d6c12b2da@spud>


On Tue, 14 Oct 2025 15:35:34 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The pic64gx has a second pinmux "downstream" of the iomux0 pinmux. The
> documentation for the SoC provides no name for this device, but it is
> used to swap pins between either GPIO controller #2 or select other
> functions, hence the "gpio2" name. Currently there is no documentation
> about what each bit actually does that is publicly available, nor (I
> believe) what pins are affected. That info is as follows:
> 
> pin     role (1/0)
> ---     ----------
> E14	MAC_0_MDC/GPIO_2_0
> E15	MAC_0_MDIO/GPIO_2_1
> F16	MAC_1_MDC/GPIO_2_2
> F17	MAC_1_MDIO/GPIO_2_3
> D19	SPI_0_CLK/GPIO_2_4
> B18	SPI_0_SS0/GPIO_2_5
> B10	CAN_0_RXBUS/GPIO_2_6
> C14	PCIE_PERST_2#/GPIO_2_7
> E18	PCIE_WAKE#/GPIO_2_8
> D18	PCIE_PERST_1#/GPIO_2_9
> E19	SPI_0_DO/GPIO_2_10
> C7	SPI_0_DI/GPIO_2_11
> D6	QSPI_SS0/GPIO_2_12
> D7	QSPI_CLK (B)/GPIO_2_13
> C9	QSPI_DATA0/GPIO_2_14
> C10	QSPI_DATA1/GPIO_2_15
> A5	QSPI_DATA2/GPIO_2_16
> A6	QSPI_DATA3/GPIO_2_17
> D8	MMUART_3_RXD/GPIO_2_18
> D9	MMUART_3_TXD/GPIO_2_19
> B8	MMUART_4_RXD/GPIO_2_20
> A8	MMUART_4_TXD/GPIO_2_21
> C12	CAN_1_TXBUS/GPIO_2_22
> B12	CAN_1_RXBUS/GPIO_2_23
> A11	CAN_0_TX_EBL_N/GPIO_2_24
> A10	CAN_1_TX_EBL_N/GPIO_2_25
> D11	MMUART_2_RXD/GPIO_2_26
> C11	MMUART_2_TXD/GPIO_2_27
> B9	CAN_0_TXBUS/GPIO_2_28
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,pic64gx-pinctrl-gpio2.yaml      | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


