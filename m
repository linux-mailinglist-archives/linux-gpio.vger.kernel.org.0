Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349863D904A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235467AbhG1OVV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:21:21 -0400
Received: from gloria.sntech.de ([185.11.138.130]:50348 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235445AbhG1OVV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 10:21:21 -0400
Received: from [95.90.166.74] (helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m8kQu-00062f-4X; Wed, 28 Jul 2021 16:21:16 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: rockchip: add rk356x gmac1 node
Date:   Wed, 28 Jul 2021 16:21:15 +0200
Message-ID: <21568327.EfDdHjke4D@diego>
In-Reply-To: <20210728135534.703028-5-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-5-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

Am Mittwoch, 28. Juli 2021, 15:55:29 CEST schrieb Peter Geis:
> Add the gmac1 controller to the rk356x device tree.
> This is the controller common to both the rk3568 and rk3566.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 48 ++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index c2aa7aeec58d..77c679304916 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -18,6 +18,7 @@ / {
>  	#size-cells = <2>;
>  
>  	aliases {
> +		ethernet1 = &gmac1;
>  		gpio0 = &gpio0;
>  		gpio1 = &gpio1;
>  		gpio2 = &gpio2;

Looking back at the discussion about mmc aliases in board-dts vs. soc-dtsi
I get the feeling the ethernet alias would be same case, as not all boards
will expose ethernet.

In the very least the ethernet alias should be part of the rk3566/rk3568 dtsi
files, doing ethernet0 = &gmac1 for rk3566 and ethernet1 = &gmac1 for rk3568.

But I do think the board-dts would be the more appropriate place.


Heiko

> @@ -344,6 +345,53 @@ sdmmc2: mmc@fe000000 {
>  		status = "disabled";
>  	};
>  
> +	gmac1: ethernet@fe010000 {
> +		compatible = "rockchip,rk3568-gmac", "snps,dwmac-4.20a";
> +		reg = <0x0 0xfe010000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "macirq", "eth_wake_irq";
> +		clocks = <&cru SCLK_GMAC1>, <&cru SCLK_GMAC1_RX_TX>,
> +			 <&cru SCLK_GMAC1_RX_TX>, <&cru CLK_MAC1_REFOUT>,
> +			 <&cru ACLK_GMAC1>, <&cru PCLK_GMAC1>,
> +			 <&cru SCLK_GMAC1_RX_TX>, <&cru CLK_GMAC1_PTP_REF>;
> +		clock-names = "stmmaceth", "mac_clk_rx",
> +			      "mac_clk_tx", "clk_mac_refout",
> +			      "aclk_mac", "pclk_mac",
> +			      "clk_mac_speed", "ptp_ref";
> +		resets = <&cru SRST_A_GMAC1>;
> +		reset-names = "stmmaceth";
> +		rockchip,grf = <&grf>;
> +		snps,mixed-burst;
> +		snps,tso;
> +		snps,axi-config = <&gmac1_stmmac_axi_setup>;
> +		snps,mtl-rx-config = <&gmac1_mtl_rx_setup>;
> +		snps,mtl-tx-config = <&gmac1_mtl_tx_setup>;
> +		status = "disabled";
> +
> +		mdio1: mdio {
> +			compatible = "snps,dwmac-mdio";
> +			#address-cells = <0x1>;
> +			#size-cells = <0x0>;
> +		};
> +
> +		gmac1_stmmac_axi_setup: stmmac-axi-config {
> +			snps,wr_osr_lmt = <4>;
> +			snps,rd_osr_lmt = <8>;
> +			snps,blen = <0 0 0 0 16 8 4>;
> +		};
> +
> +		gmac1_mtl_rx_setup: rx-queues-config {
> +			snps,rx-queues-to-use = <1>;
> +			queue0 {};
> +		};
> +
> +		gmac1_mtl_tx_setup: tx-queues-config {
> +			snps,tx-queues-to-use = <1>;
> +			queue0 {};
> +		};
> +	};
> +
>  	qos_gpu: qos@fe128000 {
>  		compatible = "rockchip,rk3568-qos", "syscon";
>  		reg = <0x0 0xfe128000 0x0 0x20>;
> 




