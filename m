Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A730D64C664
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Dec 2022 10:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237966AbiLNJyY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Dec 2022 04:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238056AbiLNJyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Dec 2022 04:54:00 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16C021C;
        Wed, 14 Dec 2022 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671011634; x=1702547634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LzqGGxmF1t3qGuJLCa6X1QP62ut/E2OTUEGN+pkAN+I=;
  b=Z7PornlXpW7/J2W4xxlcLomCOdtd+HHnHEqaNRLbY4MqiUb7q3Uk0iKM
   2a7Wa4UTAg+QkjNNC3ib3JNI1fgUdV1h4UyDRKnwSK90swbFHR/ZX6Kby
   UvoGsVr5i5/L6ZZ7fTCQFA4srt8Ot6lWhkQ+xKFWXKLkNv2nyAKISp0mf
   0rm09RYsowdjESM2/bsJrMjBFLF7UYQsiuSpJqqZJd3gr0OdgCiMO51AK
   qOYTGMdZSszBh/YeZnmHIijwl47dIOvWE38pBl2B22uDQzHVn4J7bpRCQ
   1uF4tLtSOVAKhsqB4xV3tll+3I+1o7CroH4k4DuCA68+b/cuhesxHu7ol
   w==;
X-IronPort-AV: E=Sophos;i="5.96,244,1665439200"; 
   d="scan'208";a="27943179"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Dec 2022 10:53:48 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 14 Dec 2022 10:53:48 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 14 Dec 2022 10:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671011628; x=1702547628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LzqGGxmF1t3qGuJLCa6X1QP62ut/E2OTUEGN+pkAN+I=;
  b=dlA0EUnXY7/pe8a6VpYC68WVr4InRSwN2qHkBOOL5gWii78uIIkY/S7t
   zi7cZ/ATnCcuwjQTcICzNsptpES85t+XQeJ/q+irWs/XBTd7aTsIk7zyf
   B/y3cwdRTW69UQnO7SDXgQEQ5DTn9XmiIhwjve8EePPuZPsIZervJ0HoP
   Hzk8cYnt0aqPnENxcwAwgBxfRdJM2/4LP8rvKgibe5vym8vmR9t+rmtrN
   dDDH5Qp9QvDhc43BOczHF6Lq37ol3+2YoeIlq3wbHQnkAexg1Q8xJAHSt
   Z5jcV0Wq7K6VcPg2Ln3J+imds5F2pNUmvreJZTxvsSwXPPsWF7uW4/eg5
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,244,1665439200"; 
   d="scan'208";a="27943178"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Dec 2022 10:53:48 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3CD34280072;
        Wed, 14 Dec 2022 10:53:48 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH v2 3/3] [DNI] arm64: dts: mba8mx: Use gpio-delay for LVDS bridge
Date:   Wed, 14 Dec 2022 10:53:42 +0100
Message-Id: <20221214095342.937303-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a gpio-delay for LVDS_BRIDGE_EN_1V8 which ramp-up time is defined
by the external RC filter.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index b0662dfa6194..a1ceadfa5b3d 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -75,6 +75,14 @@ led2: led2 {
 		};
 	};
 
+	gpio_delays: gpio-delays {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		input-gpios = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		gpio-line-names = "LVDS_BRIDGE_EN_1V8";
+	};
+
 	panel0: panel_lvds0 {
 		/*
 		 * Display is not fixed, so compatible has to be added from
@@ -191,6 +199,10 @@ expander0: gpio@23 {
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		gpio-line-names = "", "", "", "",
+				  "", "", "LVDS_BRIDGE_EN_3V3", "",
+				  "", "", "", "",
+				  "", "", "", "";
 
 		sd-mux-oe-hog {
 			gpio-hog;
@@ -272,7 +284,7 @@ &i2c3 {
 	dsi_lvds_bridge: bridge@2d {
 		compatible = "ti,sn65dsi83";
 		reg = <0x2d>;
-		enable-gpios = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio_delays 0 130000 0>;
 		vcc-supply = <&reg_sn65dsi83_1v8>;
 		status = "disabled";
 
-- 
2.34.1

