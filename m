Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C084A3D3B1A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 15:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235160AbhGWMsE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 08:48:04 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51402 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234972AbhGWMsC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 08:48:02 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NDBpmh019207;
        Fri, 23 Jul 2021 15:28:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=iBoH+/IMNmZJPhWTx8FB8yHSnaU+16pX2EaI38Jq0TY=;
 b=MgY0T1m2Q1PrNIXnZiMVgUOND6YpGKBbYIEHLwFrs/gTpKKlJaWtyx5znXKbWfo1Ji85
 nT6CgpHj7yyXp9AHtekcqINtCpGarO5iMiflnIGD7RuiYzIDlt2I/3EeecZ/0IyGQVKX
 qtUK8fx7K1JT2dI9JBhiKhoeZ1aOK0EQvrp0V0/x+bVCuoCcA1bCACPMehWrjJpAX72C
 9zqngn2itgmV7DVGcB3Swy1pd+v9FDWHqk1nsUDDZ9059ujtuioZdiEL/2v/x6zG6xni
 FlPHN2CSjMhRRTcrPs0HDnhMlb8CXZGC8TDblNs4PDXB7eedTYLQ3ueG5VJ5rUu7JPDR pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39ypq8jp08-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jul 2021 15:28:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBC35100039;
        Fri, 23 Jul 2021 15:28:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C85F2221783;
        Fri, 23 Jul 2021 15:28:14 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:14
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
Subject: [PATCH 3/7] docs: arm: stm32: introduce STM32MP13 SoCs
Date:   Fri, 23 Jul 2021 15:28:06 +0200
Message-ID: <20210723132810.25728-4-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-23_05:2021-07-23,2021-07-23 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

STM32MP13 SoCs are derivative of STM32MP15 SoCs. They embed one Cortex-A7
plus standard connectivity.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
index d4f34ae9e6f4..2bda5461a80b 100644
--- a/Documentation/arm/index.rst
+++ b/Documentation/arm/index.rst
@@ -55,6 +55,7 @@ SoC-specific documents
    stm32/stm32h750-overview
    stm32/stm32f769-overview
    stm32/stm32f429-overview
+   stm32/stm32mp13-overview
    stm32/stm32mp157-overview
 
    sunxi
diff --git a/Documentation/arm/stm32/stm32mp13-overview.rst b/Documentation/arm/stm32/stm32mp13-overview.rst
new file mode 100644
index 000000000000..3bb9492dad49
--- /dev/null
+++ b/Documentation/arm/stm32/stm32mp13-overview.rst
@@ -0,0 +1,37 @@
+===================
+STM32MP13 Overview
+===================
+
+Introduction
+------------
+
+The STM32MP131/STM32MP133/STM32MP135 are Cortex-A MPU aimed at various applications.
+They feature:
+
+- One Cortex-A7 application core
+- Standard memories interface support
+- Standard connectivity, widely inherited from the STM32 MCU family
+- Comprehensive security support
+
+More details:
+
+- Cortex-A7 core running up to @900MHz
+- FMC controller to connect SDRAM, NOR and NAND memories
+- QSPI
+- SD/MMC/SDIO support
+- 2*Ethernet controller
+- CAN
+- ADC/DAC
+- USB EHCI/OHCI controllers
+- USB OTG
+- I2C, SPI, CAN busses support
+- Several general purpose timers
+- Serial Audio interface
+- LCD controller
+- DCMIPP
+- SPDIFRX
+- DFSDM
+
+:Authors:
+
+- Alexandre Torgue <alexandre.torgue@foss.st.com>
-- 
2.17.1

