Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC9A187412
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 10:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405876AbfHIIas (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 04:30:48 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42828 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405818AbfHIIar (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 04:30:47 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x798UhsZ060670;
        Fri, 9 Aug 2019 03:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565339443;
        bh=/LQ7mn2gfK7/9aO67ju+/QCOcc+F8/so5NUcbTZEJhI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IBNlV8LR9mk9W/A3gC6Hz2mvMgW6LBjtR3V/DfOnpQ+/2vC2qyUGJ46sQmUaIUeDG
         3Q6VZ0cs2dMJ9WcP0Z8OO3b1akXvhlSJQJ9w8hROFopVbTCxmrFyFaf3+LqbVxjPI9
         vlOsTa4KEoVTajI5RJ3em7p2AKmwAxMR1RhXcZXk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x798UhYE117455
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 03:30:43 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 03:30:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 03:30:43 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x798USdi070370;
        Fri, 9 Aug 2019 03:30:41 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        <linus.walleij@linaro.org>
CC:     Keerthy <j-keerthy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 4/6] arm64: dts: ti: k3-j721e-common-proc-board: Disable unused gpio modules
Date:   Fri, 9 Aug 2019 13:59:45 +0530
Message-ID: <20190809082947.30590-5-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809082947.30590-1-lokeshvutla@ti.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are 10 gpio instances inside SoC with 3 groups as below:
- Group1: main_gpio0, main_gpio2, main_gpio4, main_gpio6
- Group2: main_gpio1, main_gpio3, main_gpio5, main_gpio7
- Group3: wkup_gpio0, wkup_gpio1

Only one instance can be used in each group at a time. So use main_gpio0,
main_gpio1 and wkup_gpio0 for the current linux context and mark other
gpio nodes as disabled.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../dts/ti/k3-j721e-common-proc-board.dts     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 63b47b839388..509579ca3db2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -52,3 +52,31 @@
 	/* UART not brought out */
 	status = "disabled";
 };
+
+&main_gpio2 {
+	status = "disabled";
+};
+
+&main_gpio3 {
+	status = "disabled";
+};
+
+&main_gpio4 {
+	status = "disabled";
+};
+
+&main_gpio5 {
+	status = "disabled";
+};
+
+&main_gpio6 {
+	status = "disabled";
+};
+
+&main_gpio7 {
+	status = "disabled";
+};
+
+&wkup_gpio1 {
+	status = "disabled";
+};
-- 
2.22.0

