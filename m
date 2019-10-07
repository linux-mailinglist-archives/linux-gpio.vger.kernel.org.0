Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBBCBCE401
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 15:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfJGNod (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 09:44:33 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:7940 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727442AbfJGNoc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 09:44:32 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x97DfgGa028132;
        Mon, 7 Oct 2019 15:44:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=iGH7FTmB/qEZDe7wAQErzy1jp41QX8/5E3SOIpqUc3Q=;
 b=yQAdvBHoXCZfxbEwha7pnFyVfOgVvJibetR3AHJI9Kl0BNofay1EXEtNlVPl6bihNpTW
 VmEiVCinmAb69Npwnz3ZhXjfjeKweY6SrFx19vy6lLidg2cg1112WaWNnb5lM2FbBNXl
 IImKL66v1n700al6VylD4aXwz3wut1813d0uPAf4LYk6ghYYly43DtNh0O1bRv6rONzh
 V4mdury8JvTwNgdkT8Qo/yUBMRH2Kwyiod/pWzjMJ0qiYeMYujkj8yiI16wb/EquwntV
 VnYPubYr88KeEOttFEKVV/EI85hKsS/L3HxNH+jR5e7enDipeSRjWka0I9zTMdcWmZPu bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vegxvjk6p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Oct 2019 15:44:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11598100039;
        Mon,  7 Oct 2019 15:44:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3C7A2B8A5E;
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
Subject: [PATCH 3/3] dt-bindings: usb: generic-ehci: Add "companion" entry
Date:   Mon, 7 Oct 2019 15:44:10 +0200
Message-ID: <20191007134410.10337-4-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007134410.10337-1-alexandre.torgue@st.com>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

"companion" entry is present in "generic.txt" usb binding file. This commit
adds it also in generic-ehci yaml binding.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 059f6ef1ad4a..f89897fe2df6 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -63,6 +63,11 @@ properties:
     description:
       Set this flag to force EHCI reset after resume.
 
+  companion:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+     Phandle of a companion.
+
   phys: true
 
 required:
-- 
2.17.1

