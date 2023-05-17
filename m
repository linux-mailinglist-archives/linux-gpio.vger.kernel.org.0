Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97605706D1E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 May 2023 17:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjEQPqe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 May 2023 11:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjEQPqd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2023 11:46:33 -0400
X-Greylist: delayed 2218 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 17 May 2023 08:46:30 PDT
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07848558B;
        Wed, 17 May 2023 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
        ; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
        :From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date
        :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
        References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
        List-Owner:List-Archive; bh=IDRJwtLsO/yeHBOhvU39bxW+bfvC/DJiGxuwhVpGSJI=; b=L
        72JGwLZ0CrNmH62H4XitVMSAiKLvB3sUcq9nYXl1a5dZnNwCSf/oTYOWWZL2eGdDgNXtrLmCgyyHh
        5q/7HgvpsAkUynIPxSStqmKtzbi7GVodVJDEIWY7jLyya5lEez0iOLOvKPsUn5he8gmCAstPhI3mq
        Aogs2YJY4Tl4AmKE=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:45486 helo=pettiford.lan)
        by mail.hugovil.com with esmtpa (Exim 4.92)
        (envelope-from <hugo@hugovil.com>)
        id 1pzIkw-0007IE-6L; Wed, 17 May 2023 11:07:59 -0400
From:   Hugo Villeneuve <hugo@hugovil.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     hugo@hugovil.com, linux-gpio@vger.kernel.org,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 17 May 2023 11:07:46 -0400
Message-Id: <20230517150746.3823249-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
Subject: [PATCH 1/2] dt-bindings: sc16is7xx: Add property to change GPIO function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Some variants in this series of uart controllers have GPIO pins that
are shared between GPIO and modem control lines.

The pin mux mode (GPIO or modem control lines) can be set for each
ports (channels) supported by the variant.

This adds a property to the device tree to set the GPIO pin mux to
modem control lines on selected ports if needed.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../bindings/serial/nxp,sc16is7xx.txt         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt b/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
index 0fa8e3e43bf8..426b7285ad50 100644
--- a/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
+++ b/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
@@ -23,6 +23,9 @@ Optional properties:
     1 = active low.
 - irda-mode-ports: An array that lists the indices of the port that
 		   should operate in IrDA mode.
+- modem-control-line-ports: An array that lists the indices of the port that
+			    should have shared GPIO lines configured as modem
+			    control lines.
 
 Example:
         sc16is750: sc16is750@51 {
@@ -35,6 +38,17 @@ Example:
                 #gpio-cells = <2>;
         };
 
+	sc16is752: sc16is752@54 {
+		compatible = "nxp,sc16is752";
+		reg = <0x54>;
+		clocks = <&clk20m>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		modem-control-line-ports = <1>; /* Port 1 as modem control lines */
+		gpio-controller; /* Port 0 as GPIOs */
+		#gpio-cells = <2>;
+	};
+
 * spi as bus
 
 Required properties:
@@ -59,6 +73,9 @@ Optional properties:
     1 = active low.
 - irda-mode-ports: An array that lists the indices of the port that
 		   should operate in IrDA mode.
+- modem-control-line-ports: An array that lists the indices of the port that
+			    should have shared GPIO lines configured as modem
+			    control lines.
 
 Example:
 	sc16is750: sc16is750@0 {
@@ -70,3 +87,14 @@ Example:
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	sc16is752: sc16is752@0 {
+		compatible = "nxp,sc16is752";
+		reg = <0>;
+		clocks = <&clk20m>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		modem-control-line-ports = <1>; /* Port 1 as modem control lines */
+		gpio-controller; /* Port 0 as GPIOs */
+		#gpio-cells = <2>;
+	};
-- 
2.30.2

