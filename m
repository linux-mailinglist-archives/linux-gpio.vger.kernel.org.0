Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080E95B3327
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 11:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbiIIJGu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 05:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbiIIJGK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 05:06:10 -0400
Received: from mail-m11883.qiye.163.com (mail-m11883.qiye.163.com [115.236.118.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82BC52809
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 02:06:04 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11883.qiye.163.com (Hmail) with ESMTPA id 61FC48404DD;
        Fri,  9 Sep 2022 17:06:01 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 3/6] arm64: dts: rockchip: add gpio alias for gpio dt nodes
Date:   Fri,  9 Sep 2022 17:05:55 +0800
Message-Id: <20220909090558.3609190-4-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909090558.3609190-1-jay.xu@rock-chips.com>
References: <20220909090558.3609190-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGkJJVkNMGk5PQkpCHkIaHVUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktPSElVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mxw6PRw6LT0dHDY5NE0DTE4Y
        HxcKCSlVSlVKTU1JTEpPSE1JS09NVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUhITU03Bg++
X-HM-Tid: 0a83217fb6e02eb8kusn61fc48404dd
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
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 5 +++++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 5 +++++
 4 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 2dfa67f1cd67..fa189701cdc9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -20,6 +20,11 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &gpio4;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 49ae15708a0b..22c2857bcdcf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -20,6 +20,10 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index a4c5aaf1f457..fc7e3f2bc786 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -20,6 +20,10 @@ / {
 
 	aliases {
 		ethernet0 = &gmac;
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 9d5b0e8c9cca..caffcaee2d6c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -20,6 +20,11 @@ / {
 
 	aliases {
 		ethernet0 = &gmac;
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &gpio4;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
-- 
2.25.1

