Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1BECE404
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 15:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbfJGNod (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 09:44:33 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:19268 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726334AbfJGNoc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 09:44:32 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x97DaVoh022431;
        Mon, 7 Oct 2019 15:44:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ommXzVZDdDLmTcqjfffVTpYKbCoE51X3qzTVTHyEIOE=;
 b=fVAZRd1JuL2hng/tkR3VuQi7SZve5FiHkxnog+GRlTDojjznfGzUUhaDdzpyVO9F+Ts8
 cfdsuvOgth1lhpryfxq9bHf9TRL71Tu2YIFlIvtnoOINjM3h8u/Vhv/Qkl3ZEYp/N3sS
 v+ZMcOQmZ5NV4ztb4AnOHDGTmswawn/7TVXtCeyioq3IeBqZWuBtHmg+xawY05Uq+Q+z
 xlHsb0UbqFgL9CheHQC1L5QjXJtc5e3iee4ZxWyrUiUGa3JJUmDCGS1MsU02SBF0/Qdo
 rmgwAsG9MFtfn04dO7mm/iOf6+ydmQUNgI1tzCS/Kg64gCw84PqKxqOEZeNtFjwJ6xHt IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vegn0jns4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Oct 2019 15:44:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E920100034;
        Mon,  7 Oct 2019 15:44:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 628942B8A5E;
        Mon,  7 Oct 2019 15:44:13 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 7 Oct 2019 15:44:13
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
Subject: [PATCH 2/3] dt-bindings: pinctrl: stm32: Fix 'st,syscfg' description field
Date:   Mon, 7 Oct 2019 15:44:09 +0200
Message-ID: <20191007134410.10337-3-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007134410.10337-1-alexandre.torgue@st.com>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As there is only one item "st,syscfg" this commit moves phandle description
fields under "description" tag. It'll fix a validation issue seen  during
stm32 DT check.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 400df2da018a..754ea7ab040a 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -40,10 +40,9 @@ properties:
     allOf:
       - $ref: "/schemas/types.yaml#/definitions/phandle-array"
     description: Should be phandle/offset/mask
-    items:
-      - description: Phandle to the syscon node which includes IRQ mux selection.
-      - description: The offset of the IRQ mux selection register.
-      - description: The field mask of IRQ mux, needed if different of 0xf.
+      - Phandle to the syscon node which includes IRQ mux selection.
+      - The offset of the IRQ mux selection register.
+      - The field mask of IRQ mux, needed if different of 0xf.
 
   st,package:
     allOf:
-- 
2.17.1

