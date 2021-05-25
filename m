Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE4739083F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 19:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhEYSA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 14:00:57 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52262 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234097AbhEYSAx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 14:00:53 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PHxLoY009985;
        Tue, 25 May 2021 12:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621965561;
        bh=zU79vjzMjEJ+h5F57BdhVTx10Ng0E9vNzul9uwfoG6c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WnpARJZse9tL+oLIoDJSGme2m3H2yqB8lN5jmOrTY5RvZdd/BzcpvRjJwgWtKJwX0
         uBwE31vAigkbbCpDLgsCsh4QnwdhmOo/FdPPzEsFApt+EK/mICIOesZaNSaGaCDaJl
         TmOgw++/JEtpHcyTZSbWihrEpdQi2fPxdvZuQ8Vg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PHxLpt072323
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 May 2021 12:59:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 25
 May 2021 12:59:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 25 May 2021 12:59:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PHxJcf015339;
        Tue, 25 May 2021 12:59:20 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v2 3/5] ARM: dts: omap3: align gpio hog names with dt-schema
Date:   Tue, 25 May 2021 20:58:56 +0300
Message-ID: <20210525175858.11611-4-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210525175858.11611-1-grygorii.strashko@ti.com>
References: <20210525175858.11611-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO Hog dt-schema node naming convention expect GPIO hogs node names
to end with a 'hog' suffix.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/omap3-evm-processor-common.dtsi | 2 +-
 arch/arm/boot/dts/omap3-gta04a5.dts               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-evm-processor-common.dtsi b/arch/arm/boot/dts/omap3-evm-processor-common.dtsi
index b4109f48ec18..e6ba30a21166 100644
--- a/arch/arm/boot/dts/omap3-evm-processor-common.dtsi
+++ b/arch/arm/boot/dts/omap3-evm-processor-common.dtsi
@@ -195,7 +195,7 @@
  * for bus switch SN74CB3Q3384A, level-shifter SN74AVC16T245DGGR, and 1.8V.
  */
 &gpio2 {
-	en_usb2_port {
+	en-usb2-port-hog {
 		gpio-hog;
 		gpios = <29 GPIO_ACTIVE_HIGH>;	/* gpio_61 */
 		output-low;
diff --git a/arch/arm/boot/dts/omap3-gta04a5.dts b/arch/arm/boot/dts/omap3-gta04a5.dts
index fd84bbf3b9cc..9ce8d81250aa 100644
--- a/arch/arm/boot/dts/omap3-gta04a5.dts
+++ b/arch/arm/boot/dts/omap3-gta04a5.dts
@@ -37,7 +37,7 @@
 };
 
 &gpio5 {
-	irda_en {
+	irda-en-hog {
 		gpio-hog;
 		gpios = <(175-160) GPIO_ACTIVE_HIGH>;
 		output-high;	/* activate gpio_175 to disable IrDA receiver */
-- 
2.17.1

