Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9A97714E28
	for <lists+linux-gpio@lfdr.de>; Mon, 29 May 2023 18:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjE2QW7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 May 2023 12:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjE2QWx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2023 12:22:53 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1B0124;
        Mon, 29 May 2023 09:22:22 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34TBPbu5003563;
        Mon, 29 May 2023 18:22:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=PDoE1Z+cF75l+gk9sdlZVUIvH6BbnuzzZQPvr/2NagA=;
 b=um3/lGK4AXmYmq6YiLzgwaBWt8i2wVUPRJcDo/PcGeBZ+VXm9SRfj1rzFiJ7Q0IdVSVz
 yZnR9fDpPEVbNem85O3p+9cEygYX6PYllWwJQtuwS+ImAjKeMUw2DuTP1EFHUenVHN2F
 hckkNik2ICrDjR/Msu1zQIXZEpmyGXk5aqZ/wssYjS6RsEEusNADSGBzS9TsiobiG5No
 b1QkkGsZXRgVA7brCzJ6bbyMwAcsGasunt2OnAogA1hCLhFR3Bv0keMVKK8/RGKJP7m8
 aR12yuVwShDosoflDblPd8nR9jAiMOMUhDXG3Eu2TSO9hqJjLNgvFlRJ9Hrk3azGmbc/ Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quag2ap28-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 May 2023 18:22:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 376E510002A;
        Mon, 29 May 2023 18:22:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89F0C227F09;
        Mon, 29 May 2023 18:21:44 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 18:21:44 +0200
From:   Alexandre Torgue <alexandre.torgue@foss.st.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <soc@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 05/11] arm64: introduce STM32 family on Armv8 architecture
Date:   Mon, 29 May 2023 18:20:28 +0200
Message-ID: <20230529162034.20481-6-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_10,2023-05-29_01,2023-05-22_02
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a dedicated ARCH_STM32 for STM32 SoCs config. First STM32 Armv8 SoC
family is the STM32MP25 which is composed of STM32MP251, STM32MP253,
STM32MP255, STM32MP257 SoCs.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 89a0b13b058d..b1818d100d88 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -277,6 +277,20 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_STM32
+	bool "STMicroelectronics STM32 SoC Family"
+	select GPIOLIB
+	select PINCTRL
+	select PINCTRL_STM32MP257
+	select ARM_SMC_MBOX
+	select ARM_SCMI_PROTOCOL
+	select COMMON_CLK_SCMI
+	help
+	  This enables support for ARMv8 based STMicroelectronics
+	  STM32 family, including:
+		- STM32MP25:
+			- STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
+
 config ARCH_SYNQUACER
 	bool "Socionext SynQuacer SoC Family"
 	select IRQ_FASTEOI_HIERARCHY_HANDLERS
-- 
2.17.1

