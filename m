Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA49F1D1872
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 17:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389290AbgEMPBK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 11:01:10 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:36892 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389144AbgEMPAE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 11:00:04 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04DEv03b016527;
        Wed, 13 May 2020 16:59:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=mwyeERxk2B3fi4OoJUIvRQEZ7pcDFkiAPomoxGvPt0U=;
 b=GLLfwc4J0Jvwd0moB7yT47ZWedecVE36DC1qcp8jh4WJLXfSi6l64VpaESlrq/8kwdYM
 mWY9qD5iZ2KDHcrivNxOWECZzMfFpl5IMs2SIDCumF8ZRwYalj/5dum6oQuwDBpFfg0D
 vHj1GlIzppfP/5rD568GPcxihohxPmSDKBOEL+K75LxwhirjygfgbfkW73MtgbqOaT2g
 ZOrGXlYRBV42QaE2+FVWWP3NzD8/OUNnzqskiB/yvofLHyjFehgyY7UOlE9MDuEf8ES6
 8OKpMqZvmiQTmFfh7SqIarS7yb/xQupc34Pp1iCjrTFC5KVzmUhXrwP1kcOo7If+KjhX 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3100vydgmp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 May 2020 16:59:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A336210002A;
        Wed, 13 May 2020 16:59:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 948962D3006;
        Wed, 13 May 2020 16:59:52 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 13 May 2020 16:59:51
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
Subject: [PATCH 10/15] ARM: dts: stm32: Update nodes names for stm32h743 pinctrl
Date:   Wed, 13 May 2020 16:59:30 +0200
Message-ID: <20200513145935.22493-11-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200513145935.22493-1-benjamin.gaignard@st.com>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-13_06:2020-05-13,2020-05-13 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the nodes names to be aligned with yaml description

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
index e44e7baa3f17..fa5dcb6a5fdd 100644
--- a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
@@ -163,7 +163,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			i2c1_pins_a: i2c1@0 {
+			i2c1_pins_a: i2c1-0 {
 				pins {
 					pinmux = <STM32_PINMUX('B', 6, AF4)>, /* I2C1_SCL */
 						 <STM32_PINMUX('B', 7, AF4)>; /* I2C1_SDA */
@@ -173,7 +173,7 @@
 				};
 			};
 
-			ethernet_rmii: rmii@0 {
+			ethernet_rmii: rmii-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G', 11, AF11)>,
 						 <STM32_PINMUX('G', 13, AF11)>,
@@ -256,7 +256,7 @@
 				};
 			};
 
-			usart1_pins: usart1@0 {
+			usart1_pins: usart1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
 					bias-disable;
@@ -269,7 +269,7 @@
 				};
 			};
 
-			usart2_pins: usart2@0 {
+			usart2_pins: usart2-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
 					bias-disable;
@@ -282,7 +282,7 @@
 				};
 			};
 
-			usbotg_hs_pins_a: usbotg-hs@0 {
+			usbotg_hs_pins_a: usbotg-hs-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF10)>,	/* ULPI_NXT */
 							 <STM32_PINMUX('I', 11, AF10)>, /* ULPI_DIR> */
-- 
2.15.0

