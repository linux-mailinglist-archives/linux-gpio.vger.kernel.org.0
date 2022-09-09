Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F7B5B3326
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 11:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiIIJGs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 05:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbiIIJGK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 05:06:10 -0400
Received: from mail-m11883.qiye.163.com (mail-m11883.qiye.163.com [115.236.118.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CEE6BCD7
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 02:06:02 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11883.qiye.163.com (Hmail) with ESMTPA id C19A5840668;
        Fri,  9 Sep 2022 17:06:00 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 2/6] ARM: dts: rockchip: add 'clock-names' for gpio dt nodes
Date:   Fri,  9 Sep 2022 17:05:54 +0800
Message-Id: <20220909090558.3609190-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909090558.3609190-1-jay.xu@rock-chips.com>
References: <20220909090558.3609190-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTktLVh8aSUpNGUJLTElOGlUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxw6FDo*CT0eOjZKHk0KTE8i
        KzwaFBlVSlVKTU1JTEpPSE1KSE9JVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQU1OQkg3Bg++
X-HM-Tid: 0a83217fb47d2eb8kusnc19a5840668
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add 'clock-names' property for gpio dt nodes, which is used by the gpio
driver to identified as the index for the gpio controller.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 arch/arm/boot/dts/rk3036.dtsi  | 3 +++
 arch/arm/boot/dts/rk3066a.dtsi | 6 ++++++
 arch/arm/boot/dts/rk3188.dtsi  | 4 ++++
 arch/arm/boot/dts/rk322x.dtsi  | 4 ++++
 4 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index 912c21667dd4..0ae701f40b83 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -584,6 +584,7 @@ gpio0: gpio@2007c000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2007c000 0x100>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO0>;
 
 			gpio-controller;
@@ -597,6 +598,7 @@ gpio1: gpio@20080000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20080000 0x100>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO1>;
 
 			gpio-controller;
@@ -610,6 +612,7 @@ gpio2: gpio@20084000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20084000 0x100>;
 			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO2>;
 
 			gpio-controller;
diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index fe565440d6ad..343b44238269 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -283,6 +283,7 @@ gpio0: gpio@20034000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20034000 0x100>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO0>;
 
 			gpio-controller;
@@ -296,6 +297,7 @@ gpio1: gpio@2003c000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2003c000 0x100>;
 			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO1>;
 
 			gpio-controller;
@@ -309,6 +311,7 @@ gpio2: gpio@2003e000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2003e000 0x100>;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO2>;
 
 			gpio-controller;
@@ -322,6 +325,7 @@ gpio3: gpio@20080000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20080000 0x100>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO3>;
 
 			gpio-controller;
@@ -335,6 +339,7 @@ gpio4: gpio@20084000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20084000 0x100>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO4>;
 
 			gpio-controller;
@@ -348,6 +353,7 @@ gpio6: gpio@2000a000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2000a000 0x100>;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO6>;
 
 			gpio-controller;
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index cdd4a0bd5133..bc6f53c87c08 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -228,6 +228,7 @@ gpio0: gpio@2000a000 {
 			compatible = "rockchip,rk3188-gpio-bank0";
 			reg = <0x2000a000 0x100>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO0>;
 
 			gpio-controller;
@@ -241,6 +242,7 @@ gpio1: gpio@2003c000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2003c000 0x100>;
 			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO1>;
 
 			gpio-controller;
@@ -254,6 +256,7 @@ gpio2: gpio@2003e000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2003e000 0x100>;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO2>;
 
 			gpio-controller;
@@ -267,6 +270,7 @@ gpio3: gpio@20080000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20080000 0x100>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO3>;
 
 			gpio-controller;
diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index a814e813a5da..4ce2b3f00d48 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -956,6 +956,7 @@ gpio0: gpio@11110000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x11110000 0x100>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO0>;
 
 			gpio-controller;
@@ -969,6 +970,7 @@ gpio1: gpio@11120000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x11120000 0x100>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO1>;
 
 			gpio-controller;
@@ -982,6 +984,7 @@ gpio2: gpio@11130000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x11130000 0x100>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO2>;
 
 			gpio-controller;
@@ -995,6 +998,7 @@ gpio3: gpio@11140000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x11140000 0x100>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "bus";
 			clocks = <&cru PCLK_GPIO3>;
 
 			gpio-controller;
-- 
2.25.1

