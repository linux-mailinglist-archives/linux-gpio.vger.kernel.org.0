Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC20390844
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 19:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234012AbhEYSBA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 14:01:00 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51352 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233937AbhEYSBA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 14:01:00 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PHxSVH086204;
        Tue, 25 May 2021 12:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621965568;
        bh=5cnZpS1Cf4bSDQTSIxoTQa9N0oVeA1ZVmY5gEFbDlCA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zDnXsJAQMA17OaVSo8HexglhUfhMc1l0AN7a1ySx74jF03sf88I8B8MwG2xTjDuT1
         O/YsoT0T0En+uBHtfFOZO2imoSADS14VTt0kbiRG56gubrg052XfHMwU2mTrFkSg6F
         EbJAnVeEvy8QOhgS8am2ZD1YMUJSolKgoE15oRi0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PHxSQZ072426
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 May 2021 12:59:28 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 25
 May 2021 12:59:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 25 May 2021 12:59:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PHxRvv049697;
        Tue, 25 May 2021 12:59:27 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v2 4/5] ARM: dts: omap5-board-common: align gpio hog names with dt-schema
Date:   Tue, 25 May 2021 20:58:57 +0300
Message-ID: <20210525175858.11611-5-grygorii.strashko@ti.com>
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
 arch/arm/boot/dts/omap5-board-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi b/arch/arm/boot/dts/omap5-board-common.dtsi
index d8f13626cfd1..45435bb88c89 100644
--- a/arch/arm/boot/dts/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/omap5-board-common.dtsi
@@ -149,7 +149,7 @@
 
 &gpio8 {
 	/* TI trees use GPIO instead of msecure, see also muxing */
-	p234 {
+	msecure-hog {
 		gpio-hog;
 		gpios = <10 GPIO_ACTIVE_HIGH>;
 		output-high;
-- 
2.17.1

