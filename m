Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330733D8FE2
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236809AbhG1N4E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236691AbhG1N4A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:56:00 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CBFC061765;
        Wed, 28 Jul 2021 06:55:59 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id w6so1551680qvh.3;
        Wed, 28 Jul 2021 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rg5BgE/uGT7G9Q0TLIac/vS9ZXh8BbNch3GcxmLfwSM=;
        b=KCMf4446wjqkcLAvYc/vbvupqGYrOHZZ1b02HVjhPcRI1c6i7NsQaGzfkq1QnfTT31
         2YKT54nBCT6qx31A1U62D7cYJLst9iGtgFl6GlTWuuJeR31jSGibVdt0akxtzC+WvfKk
         UMzycK+q3Oj2QCgKtVMCysTOssh9c5XXnbQq4HLgtZpDl80b2IVvGdJ2lYIqMUSA8ijP
         A2owYG8DvECR7B6mux0+ZiX+whWSAm9poS7pQp0++qrg5bXJYdJzIPjMCfI2ChemRP/n
         wQ+0ggx1uDKhckqHt2AT+eXPbFLR9UmMM7MwD8g7ES8/ZHw97N+Y4VMhteaeRBZ+BiW9
         Sd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rg5BgE/uGT7G9Q0TLIac/vS9ZXh8BbNch3GcxmLfwSM=;
        b=qtbDFDO7oXO2mXclzCHbv8uAcdCGdrdQsIoXAJ0UcSWiwcj7nU5v/sNqtyTl0vsdMj
         fO0O5bZNi7Qn3iLMBYL9uLq5v0UO4E6elD7rvCiIpTrU13/GuBBC5Ttuk/LZU+2Wki6g
         1f6a5dBgP1eFl7SkQ5u4nD4Jxya/84+mrJY+WiYnZa85gdgkpSgP8xKMmg5u8eea1kTZ
         3ypeDZ1DAVm78bDIRkbwSVR7e3jY1X0W8OEq899vNdCe9NOsP8YALeBbcQhbLpwjvRYR
         9LIjx33GVEfDXjfnj9KgvMHCy7xasGcC79UsCMqrnTwB1FPE1ynRlkn2FPJP5Izpy8Cs
         Hr/A==
X-Gm-Message-State: AOAM533iasASpk//zHysSfCf04qDEBOzubCl/YCrCc+qXgjsO5gW/0NT
        c/FdBmf2JhW4HM/b1maXp3Y=
X-Google-Smtp-Source: ABdhPJx8XWhJEjfq2Fvj726/Hw5wJ13Qv7bdtDwqT3fTu3+dsAeyAiYP3xpg2dW5kECYjUuFPVmy1w==
X-Received: by 2002:a05:6214:188c:: with SMTP id cx12mr30649qvb.7.1627480558176;
        Wed, 28 Jul 2021 06:55:58 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:57 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 8/9] arm64: dts: rockchip: enable gmac node on quartz64-a
Date:   Wed, 28 Jul 2021 09:55:33 -0400
Message-Id: <20210728135534.703028-9-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728135534.703028-1-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable the gmac controller on the Pine64 Quartz64 Model A.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index a3cdb6c2bec6..90cdabfac86b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -19,6 +19,13 @@ chosen: chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	gmac1_clkin: external-gmac1-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "gmac1_clkin";
+		#clock-cells = <0>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -116,6 +123,29 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&gmac1 {
+	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>, <&gmac1_clkin>;
+	clock_in_out = "input";
+	phy-supply = <&vcc_3v3>;
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1m0_miim
+		     &gmac1m0_tx_bus2
+		     &gmac1m0_rx_bus2
+		     &gmac1m0_rgmii_clk
+		     &gmac1m0_clkinout
+		     &gmac1m0_rgmii_bus>;
+	snps,reset-gpio = <&gpio0 RK_PC3 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	/* Reset time is 20ms, 100ms for rtl8211f */
+	snps,reset-delays-us = <0 20000 100000>;
+	tx_delay = <0x30>;
+	rx_delay = <0x10>;
+	phy-handle = <&rgmii_phy1>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -336,6 +366,13 @@ regulator-state-mem {
 	};
 };
 
+&mdio1 {
+	rgmii_phy1: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
 &pinctrl {
 	bt {
 		bt_enable_h: bt-enable-h {
-- 
2.25.1

