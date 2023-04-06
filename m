Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76EAF6D92D4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Apr 2023 11:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236430AbjDFJeT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Apr 2023 05:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236398AbjDFJeQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Apr 2023 05:34:16 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810917DB2;
        Thu,  6 Apr 2023 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680773649; x=1712309649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6XP91ScDw7bmd9vfpre0zMVL9UyNBhmX4DToTuq72Ho=;
  b=lIIsPYi3faq8aOgbbZxcHf+p1HzDOVCmiZCOHK13VdItzZJTRX9xccRW
   nkIiOE5VWx1EzQKlG06OHoEOFnobpqfXuWheVxCS8RkCQu/deCfLa0hF2
   OClx0oEtAfeueIsiwM8Md3I8LitW6+RoI2oGy/x5EozA83R52CtDnSOck
   /yFLG9IC01tZplU5ZrUEPJng++T9sRb3zYLBgy4LPmYjZoYzvLu82s1/H
   htzNr3DxKiOU5KC6AWCDMToXVC6Ec1szaHu1PgYldbFqwI5xB1o+2nFOR
   XeL3wEBAwF8SSkJ4qKQ05M/TPkrOWx5gUhm2zmW6opZLV8+pZpRmfoLOo
   w==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30188775"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Apr 2023 11:33:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 06 Apr 2023 11:33:52 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 06 Apr 2023 11:33:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680773632; x=1712309632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6XP91ScDw7bmd9vfpre0zMVL9UyNBhmX4DToTuq72Ho=;
  b=iEK9GZEprqLHDNNg63Yu0IhSV9Klw+Iu3pr7UC2awjCYUluCeBTHOwwu
   2huxTvFnsb3M8whvHxxCqRhivHsHqnq4CmzgPURIFtyLL2ixHK6pMjzvQ
   3lZlCk4DT2kja9y1AJQ5E29RJvCZtjF0HTixJqnaV0DR5F4RSuBAkeSAn
   d2b5nF/rHeoOyptMK5MscCdaq5yAOFKnXjKDqduDEsnFkfxVVKCSbwHX0
   EdhzDGj2+aUFoICfjg/auvNB7XPov3NGeZkk953KQt8blHGhdTxzi72Wi
   yc5LNhfiiFfeMjABphyMsVo+N+/9nFMvOODFleF3OULk9xB1TyJoEIxSr
   A==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30188773"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Apr 2023 11:33:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8C312280072;
        Thu,  6 Apr 2023 11:33:52 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 3/3] [DNI] arm64: dts: mba8mx: Use gpio-delay for LVDS bridge
Date:   Thu,  6 Apr 2023 11:33:44 +0200
Message-Id: <20230406093344.917259-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
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
Changes since RFC v2:
* Removed 'input' prefix
* Removed 'gpio-line-names' for GPIO controller node

 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 691e91e84dec..3bae1c8fb8ed 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -75,6 +75,14 @@ led2: led2 {
 		};
 	};
 
+	gpio_delays: gpio-delays {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		gpio-line-names = "LVDS_BRIDGE_EN_1V8";
+	};
+
 	panel0: panel_lvds0 {
 		/*
 		 * Display is not fixed, so compatible has to be added from
@@ -269,7 +277,7 @@ &i2c3 {
 	dsi_lvds_bridge: bridge@2d {
 		compatible = "ti,sn65dsi83";
 		reg = <0x2d>;
-		enable-gpios = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio_delays 0 130000 0>;
 		vcc-supply = <&reg_sn65dsi83_1v8>;
 		status = "disabled";
 
-- 
2.34.1

