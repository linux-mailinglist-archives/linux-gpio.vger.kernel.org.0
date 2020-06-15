Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D2E1F98F9
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730670AbgFONek (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:34:40 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:62212 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730144AbgFONdM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592227992; x=1623763992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ocWwAHGLDpwRsiyn8IYZMcfhC8Ol2jDQSyOYycWpEvI=;
  b=lUQORoJxX/CnVX+mc4C+Z+mYBKct6iPpYiqeT5+ZEHCNwONjJ88fDP4T
   w34T2hu2quaeELnc1/qJLS+LXIJ6tK5AAv7IZVuW1KAbhJLfYt6tW8EJx
   h0LfkkzIki3zDbz1/AjaYN8q6nDs4yqSVXGaPAdZNHH6ojZyrnJgxew9B
   NmgU5/jy0Y9zl7cm/68rrQL1fI/yAGAGXq4kzzmvCSrufBqapZ22sh81x
   RdW9dwhNp7GHG5W58rqqxj0iqre7s2Wl7IYpdHHrnBHjZ+A+BcBAm7Gnp
   vvSa8+LEfqBFBcKQBQ1eCjg29/a8Du3Im7n00Is7tgEztPb3UR10bfjrk
   A==;
IronPort-SDR: /pS9FphvLqbSjrYfPxe0RnBxe1q+EI6DTzPx4KjZrCDMT7ro6+Vrba+6f30m6L1zYUxVJA5A+j
 W5jXd6kLDOVv+q8kVRC1ejz/Wcxm5h2fUnGiVKwernBlN6hd74xe7U8SavTjiGJxkocKc9OzsP
 xJqOBaOHC3rYhNlXAvccitg0kAN8AzHylw+44XQSekp6ccq9eKZILOGUyhWSqolHJpDR3+Qf3M
 2fykgNMqjKHBLjAy7aNq0etkGWIXRGUAaQEKZZ6JGtgkT+5nbAJnr+mIChv5w3lIRhWr8/86Lp
 xuQ=
X-IronPort-AV: E=Sophos;i="5.73,514,1583218800"; 
   d="scan'208";a="83619467"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2020 06:33:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 15 Jun 2020 06:33:08 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 15 Jun 2020 06:33:08 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 04/10] arm64: dts: sparx5: Add pinctrl support
Date:   Mon, 15 Jun 2020 15:32:36 +0200
Message-ID: <20200615133242.24911-5-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615133242.24911-1-lars.povlsen@microchip.com>
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This add pinctrl support to the Microchip Sparx5 SoC.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 arch/arm64/boot/dts/microchip/sparx5.dtsi     | 26 +++++++++++++++++++
 .../dts/microchip/sparx5_pcb134_board.dtsi    |  5 ++++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  5 ++++
 3 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi b/arch/arm64/boot/dts/microchip/sparx5.dtsi
index 4a54b7d039167..baf4176ce1dfe 100644
--- a/arch/arm64/boot/dts/microchip/sparx5.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -109,6 +109,8 @@ gic: interrupt-controller@600300000 {
 		};
 
 		uart0: serial@600100000 {
+			pinctrl-0 = <&uart_pins>;
+			pinctrl-names = "default";
 			compatible = "ns16550a";
 			reg = <0x6 0x00100000 0x20>;
 			clocks = <&ahb_clk>;
@@ -120,6 +122,8 @@ uart0: serial@600100000 {
 		};
 
 		uart1: serial@600102000 {
+			pinctrl-0 = <&uart2_pins>;
+			pinctrl-names = "default";
 			compatible = "ns16550a";
 			reg = <0x6 0x00102000 0x20>;
 			clocks = <&ahb_clk>;
@@ -138,5 +142,27 @@ timer1: timer@600105000 {
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		gpio: pinctrl@6110101e0 {
+			compatible = "microchip,sparx5-pinctrl";
+			reg = <0x6 0x110101e0 0x90>, <0x6 0x10508010 0x100>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&gpio 0 0 64>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+
+			uart_pins: uart-pins {
+				pins = "GPIO_10", "GPIO_11";
+				function = "uart";
+			};
+
+			uart2_pins: uart2-pins {
+				pins = "GPIO_26", "GPIO_27";
+				function = "uart2";
+			};
+
+		};
+
 	};
 };
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
index 005cf6babb9b3..9b2aec400101b 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
@@ -7,4 +7,9 @@
 #include "sparx5_pcb_common.dtsi"
 
 /{
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
+		priority = <200>;
+	};
 };
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
index 005cf6babb9b3..9b2aec400101b 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
@@ -7,4 +7,9 @@
 #include "sparx5_pcb_common.dtsi"
 
 /{
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
+		priority = <200>;
+	};
 };
-- 
2.27.0

