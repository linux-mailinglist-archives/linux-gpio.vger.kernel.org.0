Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC79B1D1859
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 17:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389088AbgEMPAe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 11:00:34 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:49131 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389155AbgEMPAN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 11:00:13 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04DEwJv0008668;
        Wed, 13 May 2020 16:59:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=QTCaThy3GVFCYOhCkPvOzFwaT3nv8roy2DLEbs0qBbo=;
 b=c+3ilERflSrBijQAJJe6KdPE0lLVj+4f4Lcx5gSA2cUC/2uEPNyJFLy00GETTt6p7y5f
 fHKSf6vukoNpXa6w+E2JH8mssiWxFPrxm6618QjqKBXlBCMgd3dvH1raB09XvRMzQBJa
 vagqwuh5vSiblFFvojO19IL/qMnTVrHMrFX5AoGZD1lIGkkKZDHyonrP1nbDbcrrzWzG
 nYD5XZMCuTeSOseoVNpt8Xg+Hk8No/PAIJByhcmB21+E9LgFT/3AOM/s9oC7JjfPILHW
 3QNFfk9Jk3Si/44+ky826t7QZWG4n5MyGuohjaZWC1kdQ2wfrowb825vOWlNE9VSHT42 IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3100vqdeb4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 May 2020 16:59:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1BE9310002A;
        Wed, 13 May 2020 16:59:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 084EC2D3006;
        Wed, 13 May 2020 16:59:58 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 13 May 2020 16:59:57
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <gregkh@linuxfoundation.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 15/15] dt-bindings: usb: dwc2: Fix issues for stm32mp15x SoC
Date:   Wed, 13 May 2020 16:59:35 +0200
Message-ID: <20200513145935.22493-16-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200513145935.22493-1-benjamin.gaignard@st.com>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-13_06:2020-05-13,2020-05-13 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Correct the compatible list for stm32mp15x SoC.
Fix the name of the stm32mp15x dedicated supply to be aligned with
what the driver use.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 0d6d850a7f17..1357b861310d 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -44,7 +44,9 @@ properties:
       - const: st,stm32f4x9-hsotg
       - const: st,stm32f7-hsotg
       - const: st,stm32mp15-fsotg
-      - const: st,stm32mp15-hsotg
+      - items:
+          - const: st,stm32mp15-hsotg
+          - const: snps,dwc2
       - const: samsung,s3c6400-hsotg
 
   reg:
@@ -90,7 +92,7 @@ properties:
   vusb_a-supply:
     description: phandle to voltage regulator of analog section.
 
-  vusb33d-supply:
+  usb33d-supply:
     description: reference to the VBUS and ID sensing comparators supply, in
       order to perform OTG operation, used on STM32MP15 SoCs.
 
-- 
2.15.0

