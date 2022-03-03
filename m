Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4BC4CC0CA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Mar 2022 16:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbiCCPH6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Mar 2022 10:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234419AbiCCPHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 10:07:54 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EA51903ED;
        Thu,  3 Mar 2022 07:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646320028; x=1677856028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FfwJnd4RJ6/gE4d4xqFwUabMx1Ri19JiOjn5wgRsrq8=;
  b=f/RVWS+OmV/7pxN9K+GSN6NMZ/Jxes2egZ15ixInS4h1l5uyDYm8tBq+
   GqpL9SS82KyAKc+vm5Kbe9lgxVLBeDA0efE2fQTRueTWh7o+lwwm7b5zZ
   nhUTTrcjhndfccZ7oHrSRX6CXcmAmBXYdZm3ETtpVV3T+pLT2bOl95xd/
   f2pwojCihqqzFolnYu9ZVc2LiLXt4wx2UcGTnojLhxaec2C7JtL8xsd2s
   6jr4KQt34hLziqZdgUtoVUwzP1dYi1MCVnsSYyQl9qit67jQSQxct/oNr
   i+83YVsRMBhSjYiYcVS3gpLQTbGLYKjdSp6NZ7z4TsZyoW1rqOvGhR1Qg
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643670000"; 
   d="scan'208";a="22439563"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Mar 2022 16:07:03 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 03 Mar 2022 16:07:03 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 03 Mar 2022 16:07:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646320023; x=1677856023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FfwJnd4RJ6/gE4d4xqFwUabMx1Ri19JiOjn5wgRsrq8=;
  b=OMjLBXhBtvS5mVC5lN3v9azRW5bd+tG4YAKQcg/uRQD9mOUJLpwyhLba
   M4PurRVXbOI5NPBaoXb1oiuNuhcL3vxvnsMdN+H5iYqZIhAX84GaufJx8
   1seR10LTYHYWvRHVBGrOrNdjbHm4lE+sooT33nc64ZMJ7znbOktRJC3da
   oVAHhW4r+ebsTXf8FnQVPN2HtPcEFIrdcuIc6E5JQF2qZM9gZ7u4/w/0H
   3MuETcunMV6o9CBsp770WOhhRMg61Cwbn2/VqW7jlcTbxBsuTMoKHOEgO
   2N9Z4EMnoVDEjvo4tZKPZhXZNJKK8WGOjOGGVFxKwuJvbqAvqthWEsjBc
   w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643670000"; 
   d="scan'208";a="22439562"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Mar 2022 16:07:03 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 38A21280075;
        Thu,  3 Mar 2022 16:07:03 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: imx7s: fix iomuxc_lpsr node name
Date:   Thu,  3 Mar 2022 16:06:53 +0100
Message-Id: <20220303150653.1903910-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303150653.1903910-1-alexander.stein@ew.tq-group.com>
References: <20220303150653.1903910-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Schema requires the node being named 'pinctrl'.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/imx7s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 5af6d58666f4..008e3da460f1 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -446,7 +446,7 @@ wdog4: watchdog@302b0000 {
 				status = "disabled";
 			};
 
-			iomuxc_lpsr: iomuxc-lpsr@302c0000 {
+			iomuxc_lpsr: pinctrl@302c0000 {
 				compatible = "fsl,imx7d-iomuxc-lpsr";
 				reg = <0x302c0000 0x10000>;
 				fsl,input-sel = <&iomuxc>;
-- 
2.25.1

