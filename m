Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB733D3B13
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 15:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235118AbhGWMsD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 08:48:03 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51398 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234988AbhGWMsC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 08:48:02 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NDBpmi019207;
        Fri, 23 Jul 2021 15:28:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=XhswAGJy0KaG+hF+K6NXqnL9VJ5xv+ZMnAp1aClpQ+0=;
 b=rLG0XS+yJ+rJxVRR+UDZDjHh1AApHnQeA62f4bt81mH/aUHoe8KKCndGMRKgVtuwaKG3
 t4HUzf/PxeXVVxTKCYaWN3MEeTIDqjAK88m2KyPXlO3yAPCidTrJHLGIhJ5LPEuwfRN1
 Dmggn9zM/w9z1GNH5Otx2LGoqZbE6fYljCRYl8jyzA/UzAgB6cHGHLkqqxPJsLiPjsTX
 cFROCUUnPtmjnDCFY4/UdtEyI0Gwcbpfwv0YHr7gQHqcNo0GeCh/87rETFpk7jsr6Zx2
 FHaY0AzxdN1P45h5YhbRcecpYpA6z3vKWsWGfFhpW54TpH3GZrT19i3jqE/gtd7j1kvU tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39ypq8jp0c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jul 2021 15:28:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C657E10002A;
        Fri, 23 Jul 2021 15:28:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6232221783;
        Fri, 23 Jul 2021 15:28:16 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:16
 +0200
From:   Alexandre Torgue <alexandre.torgue@foss.st.com>
To:     Linus Walleij <linus.walleij@linaro.org>, <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 6/7] dt-bindings: stm32: document stm32mp135f-dk board
Date:   Fri, 23 Jul 2021 15:28:09 +0200
Message-ID: <20210723132810.25728-7-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-23_05:2021-07-23,2021-07-23 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add new entry for stm32mp135f-dk board.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 9a77ab74be99..9ac7da01c6c3 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -55,6 +55,10 @@ properties:
           - enum:
               - st,stm32h750i-art-pi
           - const: st,stm32h750
+      - items:
+          - enum:
+              - st,stm32mp135f-dk
+          - const: st,stm32mp135
       - items:
           - enum:
               - shiratech,stm32mp157a-iot-box # IoT Box
-- 
2.17.1

