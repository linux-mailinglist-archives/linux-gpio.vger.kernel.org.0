Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3DECE40C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 15:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfJGNob (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 09:44:31 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:59256 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727324AbfJGNob (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 09:44:31 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x97DaVte022434;
        Mon, 7 Oct 2019 15:44:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=az9dy2ktIqgkk5jYrhMqsSlUq7PYeTVraawDvBq1iLs=;
 b=CnGVHQae22DWj2D5/tu8rSKxqi4JNXRIxWp0XLbbq5xjzm2RXXSbZ4iIvwplKPNrv230
 fKI78F6XCb+wQyH1F6e4hg+6k2ZdIkscyK8AeZAW9gMDXMKEpKFAeBFihXQN8VI5lJvk
 oh2nw0YlWlj3EPpOanF76JOjN5I3a8EZY7BMl/Jzvh8ZzRTI/y5OQrs5U9qEcsLcWqmn
 zQjhNcws1CySwI2zYgpWe9jpmppa41dsYguiBmAXosTwXqV0B+VxzsOuFsYEHM4SLbmz
 boVgsDQATUufm+/VX4p7ojXZcahoEOYjf6IAluuhirtEfpP+qf6FtguBxt4xWaSc78e2 yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vegn0jns0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Oct 2019 15:44:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C652D100038;
        Mon,  7 Oct 2019 15:44:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA4502B8A5E;
        Mon,  7 Oct 2019 15:44:12 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 7 Oct 2019 15:44:12
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: arm: stm32: Add missing STM32 boards
Date:   Mon, 7 Oct 2019 15:44:08 +0200
Message-ID: <20191007134410.10337-2-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007134410.10337-1-alexandre.torgue@st.com>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This commit documents missing STM32 boards:

-STM32MCU: F429 disco/eval, F469-disco, F746 disco/eval, F769 disco,
H743 disco/eval.

-STM32MPU: MP157 dk1/dk2/ed1/ev1.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 4d194f1eb03a..1fcf306bd2d1 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -13,19 +13,38 @@ properties:
   compatible:
     oneOf:
       - items:
+          - enum:
+              - st,stm32f429i-disco
+              - st,stm32429i-eval
           - const: st,stm32f429
-
       - items:
+          - enum:
+              - st,stm32f469i-disco
           - const: st,stm32f469
-
       - items:
+          - enum:
+              - st,stm32f746-disco
+              - st,stm32746g-eval
           - const: st,stm32f746
-
       - items:
+          - enum:
+              - st,stm32f769-disco
+          - const: st,stm32f769
+      - items:
+          - enum:
+              - st,stm32h743i-disco
+              - st,stm32h743i-eval
           - const: st,stm32h743
-
       - items:
           - enum:
               - arrow,stm32mp157a-avenger96 # Avenger96
+              - st,stm32mp157c-ed1
+              - st,stm32mp157a-dk1
+              - st,stm32mp157c-dk2
+
+          - const: st,stm32mp157
+      - items:
+          - const: st,stm32mp157c-ev1
+          - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
 ...
-- 
2.17.1

