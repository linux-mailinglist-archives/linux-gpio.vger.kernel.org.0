Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493B938ECD2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 17:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233874AbhEXPZS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 11:25:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55112 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhEXPW3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 11:22:29 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14OFKFpY043109;
        Mon, 24 May 2021 10:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621869615;
        bh=3LslfCdr+KwTeC4qD/H9BC+KoF3rigZSwH6VeGzdsq4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FWXr18ecpZ99MzMY+NrmMOYYawUvbB1zcxITYmMq4Qhz3LNjUFNzzLGFJImzcY2wP
         TUL6No55idLM9DxYjmxnXHHiza13yjIJQ1DyQTkwgeE26D7sMWE3Rxoi7HmXX+zDNX
         bJpNABZ2VKpbYsTepjpGzO+kjm7xCDVGLNSN5nI0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14OFKFeN113044
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 May 2021 10:20:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 10:20:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 24 May 2021 10:20:15 -0500
Received: from gsaswath-HP-ProBook-640-G5.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14OFJv27055198;
        Mon, 24 May 2021 10:20:08 -0500
From:   Aswath Govindraju <a-govindraju@ti.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        David Lechner <david@lechnology.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/2] ARM: dts: da850-lego-ev3: align GPIO hog names with dt-schema
Date:   Mon, 24 May 2021 20:49:53 +0530
Message-ID: <20210524151955.8008-2-a-govindraju@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524151955.8008-1-a-govindraju@ti.com>
References: <20210524151955.8008-1-a-govindraju@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO hog dt-schema node naming convention expect GPIO hogs node names
to end with a 'hog' suffix.

Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
---
 arch/arm/boot/dts/da850-lego-ev3.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
index afd04a423856..1e86cde86406 100644
--- a/arch/arm/boot/dts/da850-lego-ev3.dts
+++ b/arch/arm/boot/dts/da850-lego-ev3.dts
@@ -412,14 +412,14 @@
 	status = "okay";
 
 	/* Don't pull down battery voltage adc io channel */
-	batt_volt_en {
+	batt-volt-en-hog {
 		gpio-hog;
 		gpios = <6 GPIO_ACTIVE_HIGH>;
 		output-high;
 	};
 
 	/* Don't impede Bluetooth clock signal */
-	bt_clock_en {
+	bt-clock-en-hog {
 		gpio-hog;
 		gpios = <5 GPIO_ACTIVE_HIGH>;
 		input;
@@ -433,19 +433,19 @@
 	 * anything, but they are present in the source code from LEGO.
 	 */
 
-	bt_pic_en {
+	bt-pic-en-hog {
 		gpio-hog;
 		gpios = <51 GPIO_ACTIVE_HIGH>;
 		output-low;
 	};
 
-	bt_pic_rst {
+	bt-pic-rst-hog {
 		gpio-hog;
 		gpios = <78 GPIO_ACTIVE_HIGH>;
 		output-high;
 	};
 
-	bt_pic_cts {
+	bt-pic-cts-hog {
 		gpio-hog;
 		gpios = <87 GPIO_ACTIVE_HIGH>;
 		input;
-- 
2.17.1

