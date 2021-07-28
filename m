Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D31F3D8FD4
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236665AbhG1Nz7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236585AbhG1Nz6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:55:58 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6B8C061765;
        Wed, 28 Jul 2021 06:55:56 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id t66so2304655qkb.0;
        Wed, 28 Jul 2021 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GgO3gM/qgV5j5bSek0cT3huCLqsL7htsJRkhag9gcPQ=;
        b=nUonId8Ux9H+Q1PLhPVCcvVhhM2ufdC1ixNx/TtrNFGyrsPxlqL5nbT78pupBjE41z
         5PVaMChvHpl8pjp/nSotW01U3CGoPjozNv0lVpi/fXVOmhaNWAnQpJkMa41tqGzqmvXp
         NM+//0YGIsel7Dhg6AA5Gz47xgZisq86xNW8trsMJ6uMD0G2Z4WgeYbTyK0hOQBoIw5U
         JXBAjinAoPxWxgZ7uzszDrpPxvPaZvT0GWqI/HtAWuPnMOqPHdCYTTCqR4SFa12IevCT
         3l8BAbpKIdyya0jd451Zuq3E6Fr4egz09EanhOoyNpHBB48JL5wq/9XSBabD7ns+PY/9
         dvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GgO3gM/qgV5j5bSek0cT3huCLqsL7htsJRkhag9gcPQ=;
        b=AjXdKnbKM48GiTt05qLSjKh1AiKkO8pidFs25tJRRWWWitrwbjQYqQuOvPwgaRrBmw
         aHcCa5vGgsp1JHO3wj/0AUCYCNGEG5Cny0TUWbC3yGPFxaDJmjUS9Mn3MAWSbPsihqWr
         hZh+suHCB8h7mTlzl0GMcC7tXh9Sd0gplG+6brMPIPJGFlaSHCADtXrQDQV/XpjPAWBH
         XKwvJao90t4eLRoGUE1NRcFh17wxWfnrjaPke+1ozYjgS1wKrZAgr3b7FDPIL3Zth3T1
         vHK87N0ZmCcVEnxvj0QisL2qllO0WCWyS7rrU0sLLFveixHaXEyrnJC7M+83z1pnzjx0
         DWlA==
X-Gm-Message-State: AOAM5317uwnBZoCqyCNZfH2EL4uwcAYZOTtkZ3HdiKE86GJAwykOKYMJ
        xOtaLn4iKyAB/Fg1yq0SU3k=
X-Google-Smtp-Source: ABdhPJy2oT201nlumhEghSYmup93Xi96Yjn/wFnGRnKG9n1L0wCYEgxK0QLaj120CZ2Df3+Bo14ooA==
X-Received: by 2002:a37:a413:: with SMTP id n19mr27085612qke.462.1627480555518;
        Wed, 28 Jul 2021 06:55:55 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:55 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 4/9] arm64: dts: rockchip: add rk356x gmac1 node
Date:   Wed, 28 Jul 2021 09:55:29 -0400
Message-Id: <20210728135534.703028-5-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728135534.703028-1-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the gmac1 controller to the rk356x device tree.
This is the controller common to both the rk3568 and rk3566.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index c2aa7aeec58d..77c679304916 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -18,6 +18,7 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		ethernet1 = &gmac1;
 		gpio0 = &gpio0;
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
@@ -344,6 +345,53 @@ sdmmc2: mmc@fe000000 {
 		status = "disabled";
 	};
 
+	gmac1: ethernet@fe010000 {
+		compatible = "rockchip,rk3568-gmac", "snps,dwmac-4.20a";
+		reg = <0x0 0xfe010000 0x0 0x10000>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "macirq", "eth_wake_irq";
+		clocks = <&cru SCLK_GMAC1>, <&cru SCLK_GMAC1_RX_TX>,
+			 <&cru SCLK_GMAC1_RX_TX>, <&cru CLK_MAC1_REFOUT>,
+			 <&cru ACLK_GMAC1>, <&cru PCLK_GMAC1>,
+			 <&cru SCLK_GMAC1_RX_TX>, <&cru CLK_GMAC1_PTP_REF>;
+		clock-names = "stmmaceth", "mac_clk_rx",
+			      "mac_clk_tx", "clk_mac_refout",
+			      "aclk_mac", "pclk_mac",
+			      "clk_mac_speed", "ptp_ref";
+		resets = <&cru SRST_A_GMAC1>;
+		reset-names = "stmmaceth";
+		rockchip,grf = <&grf>;
+		snps,mixed-burst;
+		snps,tso;
+		snps,axi-config = <&gmac1_stmmac_axi_setup>;
+		snps,mtl-rx-config = <&gmac1_mtl_rx_setup>;
+		snps,mtl-tx-config = <&gmac1_mtl_tx_setup>;
+		status = "disabled";
+
+		mdio1: mdio {
+			compatible = "snps,dwmac-mdio";
+			#address-cells = <0x1>;
+			#size-cells = <0x0>;
+		};
+
+		gmac1_stmmac_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <4>;
+			snps,rd_osr_lmt = <8>;
+			snps,blen = <0 0 0 0 16 8 4>;
+		};
+
+		gmac1_mtl_rx_setup: rx-queues-config {
+			snps,rx-queues-to-use = <1>;
+			queue0 {};
+		};
+
+		gmac1_mtl_tx_setup: tx-queues-config {
+			snps,tx-queues-to-use = <1>;
+			queue0 {};
+		};
+	};
+
 	qos_gpu: qos@fe128000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe128000 0x0 0x20>;
-- 
2.25.1

