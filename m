Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 090D25B331B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 11:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbiIIJGt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 05:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiIIJGK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 05:06:10 -0400
Received: from mail-m11883.qiye.163.com (mail-m11883.qiye.163.com [115.236.118.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462865B78D
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 02:06:01 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11883.qiye.163.com (Hmail) with ESMTPA id 34DDD840555;
        Fri,  9 Sep 2022 17:06:00 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 1/6] ARM: dts: rockchip: add gpio alias for gpio dt nodes
Date:   Fri,  9 Sep 2022 17:05:53 +0800
Message-Id: <20220909090558.3609190-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909090558.3609190-1-jay.xu@rock-chips.com>
References: <20220909090558.3609190-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkgaVh4dQ0JITUsfTB0fT1UTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pio6Tjo*Cz0iUTZRNEJJTEIc
        OilPCRdVSlVKTU1JTEpPSE1LTE9JVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUhNT0M3Bg++
X-HM-Tid: 0a83217fb2372eb8kusn34ddd840555
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add gpio alias for gpio controller dt nodes, which is used by the
new gpio driver to get the index of gpio controller for driver.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 arch/arm/boot/dts/rk3036.dtsi  | 3 +++
 arch/arm/boot/dts/rk3066a.dtsi | 6 ++++++
 arch/arm/boot/dts/rk322x.dtsi  | 4 ++++
 arch/arm/boot/dts/rk3288.dtsi  | 9 +++++++++
 arch/arm/boot/dts/rk3xxx.dtsi  | 4 ++++
 5 files changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index 9b0f0497567d..912c21667dd4 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -17,6 +17,9 @@ / {
 	interrupt-parent = <&gic>;
 
 	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index de9915d946f7..fe565440d6ad 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -13,6 +13,12 @@
 / {
 	compatible = "rockchip,rk3066a";
 
+	aliases {
+		gpio4 = &gpio4;
+		gpio5 = &gpio5;
+		gpio6 = &gpio6;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index ffc16d6b97e1..a814e813a5da 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -15,6 +15,10 @@ / {
 	interrupt-parent = <&gic>;
 
 	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 487b0e03d4b4..4d5184e27389 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -19,6 +19,15 @@ / {
 
 	aliases {
 		ethernet0 = &gmac;
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &gpio4;
+		gpio5 = &gpio5;
+		gpio6 = &gpio6;
+		gpio7 = &gpio7;
+		gpio8 = &gpio8;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 616a828e0c6e..e2cb4b51d02f 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -16,6 +16,10 @@ / {
 
 	aliases {
 		ethernet0 = &emac;
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
-- 
2.25.1

