Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5BD3D3B1C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 15:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234972AbhGWMsE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 08:48:04 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:58014 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235005AbhGWMsC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 08:48:02 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NDBbPh018862;
        Fri, 23 Jul 2021 15:28:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=MGC4xO1+H+VuQg4eXW77rjhpuQlz4ADBsLC6hpf0qgM=;
 b=4daggNb7hF2V0KLGOFi6EcpOkzkotlCWUNYkQo9habwCX2oyZ0MpYi8i5lt/w2hTs6Nn
 JL4E7FEK2SkBiXml5TK5GZVhUn9kPy8ypzR9I+BQELlZVB2BMG8vyQ5ySPxDMF3zc19i
 nUvbicqaR2r3thvzB5/0DQdMqvXVjhXQSgvsZNpwOa9wImSQfUTWAPQjqdaMA5+6GfNs
 kYiiPCOYowXisk9sO3hzWjBX7xhii/NNszNLBGxvjNa6XWD/+Idx0QfKy15KZd4xdx8B
 VapngGMhDgRiLZAau1SH7bTz8aRqy006pBkF/B5gm1ATbYk32GoYgRfRtQ4YbxNcdsqp sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39ygng458u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jul 2021 15:28:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 877D310002A;
        Fri, 23 Jul 2021 15:28:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76535221783;
        Fri, 23 Jul 2021 15:28:15 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:15
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
Subject: [PATCH 4/7] ARM: stm32: add initial support for STM32MP13 family
Date:   Fri, 23 Jul 2021 15:28:07 +0200
Message-ID: <20210723132810.25728-5-alexandre.torgue@foss.st.com>
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

This patch adds initial support of STM32MP13 microprocessor family
based on Arm Cortex-A7. New Cortex-A infrastructure (gic, timer,...)
are selected if ARCH_MULTI_V7 is defined.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 57699bd8f107..98145031586f 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -48,6 +48,14 @@ config MACH_STM32MP157
 	select ARM_ERRATA_814220
 	default y
 
+config MACH_STM32MP13
+	bool "STMicroelectronics STM32MP13x"
+	select ARM_ERRATA_814220
+	default y
+	help
+	  Support for STM32MP13 SoCs:
+	  STM32MP131, STM32MP133, STM32MP135
+
 endif # ARMv7-A
 
 endif
diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index a766310d8dca..2ccaa11aaa56 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -18,6 +18,9 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32f769",
 	"st,stm32h743",
 	"st,stm32h750",
+	"st,stm32mp131",
+	"st,stm32mp133",
+	"st,stm32mp135",
 	"st,stm32mp157",
 	NULL
 };
-- 
2.17.1

