Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2F0E649C78
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Dec 2022 11:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbiLLKmO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 05:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbiLLKlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 05:41:02 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E2711A25;
        Mon, 12 Dec 2022 02:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670841339; x=1702377339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i3oNkgCvGU7XkodDrTd0cWtqh6zSgIUVOFBt3scNphg=;
  b=COT+kRMEoTBl+tKd5vICHx9LzlHdfcYmQmPSW83VOOfFVOJZLZ9Q951g
   3rwPbG6ggGpacxNXyFjWTWWcIx4o2YxrDtQV07HGiRDxercrA7OzXDaOn
   WQ3ddgySTCSZlO2oQ6iv1xjBl1HGanMtlub4wgiS/zK9x07r6gwld0Fc2
   3cFlvkbQGCsCdzA01K+7nomdUsVCcb0VukgtH/5BOy3w/WhfQ2gdRwODW
   GniN2y5oa/aNg5B6nyAtRFO1ciialzk2n9eyIpC6byR5nlyc5f+m8/qaD
   ovZ1gmCxWlLG8DNnyrCOsJt1TTjKN/rLyF4IKSHwJzsTAMwR5AeBJimhN
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665439200"; 
   d="scan'208";a="27892500"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Dec 2022 11:35:33 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 12 Dec 2022 11:35:33 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 12 Dec 2022 11:35:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670841333; x=1702377333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i3oNkgCvGU7XkodDrTd0cWtqh6zSgIUVOFBt3scNphg=;
  b=oh6PR8MF9h+qP1lUjZ0btU9L2xXDzAVP+ZV2Qjwb3Hx/159oI10e9MKU
   V9J3pTVMy4OF8jJUaql3zPBTYSclQ2Q/8zzw7PEIXehIVsHecNvCqsst5
   Bk09vX6OH+qYOY3/27iqEuMUUjh7XZOyfF4CZYGA0E3RF/NJd60tHgCsa
   nGs9M8w6Yb+m7pdsTcbiutOKUYXpRlQH3rlYv7hwTUL5Pgjcy1j99BWU4
   aYYdge98faC//8c8y2O8wWM/npLOGkFz3K30jI7o5FO6tdyedrt/EnULT
   GSoXIrWfi7Qi+8PV/RXFdrvzDzESFM7/izB2RSiMISTp8WfGolfh8DJpC
   g==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665439200"; 
   d="scan'208";a="27892499"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2022 11:35:33 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 094C2280071;
        Mon, 12 Dec 2022 11:35:33 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 3/3] arm64: dts: mba8mx: Add GPIO ramp-up delays
Date:   Mon, 12 Dec 2022 11:35:25 +0100
Message-Id: <20221212103525.231298-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
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

GPIO6 on expander0 has a ramp-up time of ~113ms, so add a 120ms delay

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index cac8a44cba604..b5de77acc3f9c 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -192,6 +192,11 @@ expander0: gpio@23 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		gpio-ramp-up-delays-us = <0>, <0>, <0>, <0>,
+					 <0>, <0>, <120000>, <0>,
+					 <0>, <0>, <0>, <0>,
+					 <0>, <0>, <0>, <0>;
+
 		sd-mux-oe-hog {
 			gpio-hog;
 			gpios = <8 0>;
-- 
2.34.1

