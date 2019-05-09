Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C66F118727
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 10:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfEII7Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 04:59:16 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:6094 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725847AbfEII7Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 04:59:16 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x498wb9Y026179;
        Thu, 9 May 2019 10:59:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=1UyEBDJymqP5OtimlkOG99j5qz0+pfDo8v1NPKOlLvA=;
 b=WgcOtnOZvnR8FnJtoqjwpeldh6m83gdMXbUVAoVwp97Xuc2y5IWHU96d9ktRET+XaezB
 va42kMrFyQBGAUIX5Y+hI7yi8l5x3H0Ma5JID6/KmdUYz0N7DPZgne9waQxjOwNYWQY1
 OzzcH0vNi1ha9BAHy89LM00PEE2ZYKaMzD4KAcjfTvhZrV13TkDANiMdT0c9cyEIdBT3
 kdV5R2X9bbs9ofviQAxyagB50I0iuTmKM8YspE/OpAYow+6S5QOnPniiOaz6VBruw1t8
 zg1I7jkV2tIgsZxP0/lEL3eRhGuAB5YXGc6QMb9FWe+RyZS2X1hBG4RiC1A33yWnVfbJ 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sc9s4a9kd-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 09 May 2019 10:59:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C66963F;
        Thu,  9 May 2019 08:59:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5867153E;
        Thu,  9 May 2019 08:59:05 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 9 May 2019
 10:59:05 +0200
Received: from localhost (10.201.20.5) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 9 May 2019 10:59:04 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v6 1/9] dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
Date:   Thu, 9 May 2019 10:58:48 +0200
Message-ID: <1557392336-28239-2-git-send-email-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.5]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds documentation of device tree bindings for the
STMicroelectronics Multi-Function eXpander (STMFX) MFD core.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mfd/stmfx.txt | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt

diff --git a/Documentation/devicetree/bindings/mfd/stmfx.txt b/Documentation/devicetree/bindings/mfd/stmfx.txt
new file mode 100644
index 0000000..f0c2f7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/stmfx.txt
@@ -0,0 +1,28 @@
+STMicroelectonics Multi-Function eXpander (STMFX) Core bindings
+
+ST Multi-Function eXpander (STMFX) is a slave controller using I2C for
+communication with the main MCU. Its main features are GPIO expansion, main
+MCU IDD measurement (IDD is the amount of current that flows through VDD) and
+resistive touchscreen controller.
+
+Required properties:
+- compatible: should be "st,stmfx-0300".
+- reg: I2C slave address of the device.
+- interrupts: interrupt specifier triggered by MFX_IRQ_OUT signal.
+  Please refer to ../interrupt-controller/interrupt.txt
+
+Optional properties:
+- drive-open-drain: configure MFX_IRQ_OUT as open drain.
+- vdd-supply: phandle of the regulator supplying STMFX.
+
+Example:
+
+	stmfx: stmfx@42 {
+		compatible = "st,stmfx-0300";
+		reg = <0x42>;
+		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&gpioi>;
+		vdd-supply = <&v3v3>;
+	};
+
+Please refer to ../pinctrl/pinctrl-stmfx.txt for STMFX GPIO expander function bindings.
-- 
2.7.4

