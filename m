Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB902D4757
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 18:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730940AbgLIQ7e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 11:59:34 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56962 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731114AbgLIQ7W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 11:59:22 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9Gvi5g027281;
        Wed, 9 Dec 2020 10:57:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607533064;
        bh=92CVOWAOr9MqUwOD62DZFS7ytWoHkBgOQSoQ8N/R3aI=;
        h=From:To:CC:Subject:Date;
        b=aeqCT6Goh+4hq11v6nOXvSyng1f45QZ4HILy575zJhLwaXy1KtwosMeQOJsFsQCY3
         7I0UpC/gkTtadG8E5FezcNNJvkE/Nl6Zjda27GUMk5XqewDIbp9GUaaCISTLJU/Hrt
         S/dbnUeayS2lye/goyYMDLr2WCyv09JVCgeLZFuQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9GviDs127932
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Dec 2020 10:57:44 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 10:57:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 10:57:44 -0600
Received: from gsaswath-HP-ProBook-640-G5.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9Gvd9S090706;
        Wed, 9 Dec 2020 10:57:40 -0600
From:   Aswath Govindraju <a-govindraju@ti.com>
CC:     Sekhar Nori <nsekhar@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: gpio: Add compatible string for AM64 SoC
Date:   Wed, 9 Dec 2020 22:27:31 +0530
Message-ID: <20201209165733.8204-1-a-govindraju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for AM64 SoC in device tree binding of davinci GPIO
modules as the same IP is used.

Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
---
 Documentation/devicetree/bindings/gpio/gpio-davinci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
index cd91d61eac31..696ea46227d1 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -7,6 +7,7 @@ Required Properties:
 			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
 			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
 			"ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
+			"ti,am64-gpio", "ti,keystone-gpio": for AM64 SoCs
 
 - reg: Physical base address of the controller and the size of memory mapped
        registers.
-- 
2.17.1

