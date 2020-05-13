Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE5F1D1880
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 17:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389359AbgEMPBl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 11:01:41 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:56864 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389054AbgEMPAA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 11:00:00 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04DEwD45012631;
        Wed, 13 May 2020 16:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=025BdDCIbH+soZnGtfFatgeiqUpOJOBVAr2pjtailGs=;
 b=VpSg27vNaBoUL5DdSod8WIQVrYEcmqnNJD03nTOvBjhmbct4BGA7y4y4VSeNxCBQGlmc
 vWtXjFQF8Xfv5MJu3ko9bOqQUij1l2bxcA0xBfZxAuxoyr1eEf+JOuB0Vj1Ad0V/LXWF
 TRm6Rj7VyaPFw6yhDtMhhlI9BFtNQMWvdRCKqKt+F3C+uzM7tbo2I8lJCGhnSq95gm4F
 kH+hHuD0d20NQS5ttEsavOqnkhOWIDA09tbPpJPWFQ47Q7ZgHkh3k3jNXezgzS3V12XE
 Z7RfVkPvcNRNXS5KDK8VSZsiqeKNRcohi5gACkKtBsVjrMdNntatvJQKld7Bm40HDQMX VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3100vn5e2b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 May 2020 16:59:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C83D8100038;
        Wed, 13 May 2020 16:59:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B250B2D3006;
        Wed, 13 May 2020 16:59:43 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 13 May 2020 16:59:42
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
Subject: [PATCH 02/15] ARM: dts: stm32: update pwm pinctrl node names for stm32f4
Date:   Wed, 13 May 2020 16:59:22 +0200
Message-ID: <20200513145935.22493-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200513145935.22493-1-benjamin.gaignard@st.com>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-13_06:2020-05-13,2020-05-13 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename pwm pinctrl nodes name to matching with yaml bindings
requirements.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 392fa143ce07..031caaf40e89 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -257,7 +257,7 @@
 				};
 			};
 
-			pwm1_pins: pwm-1 {
+			pwm1_pins: pwm1-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 8, AF1)>, /* TIM1_CH1 */
 						 <STM32_PINMUX('B', 13, AF1)>, /* TIM1_CH1N */
@@ -265,7 +265,7 @@
 				};
 			};
 
-			pwm3_pins: pwm-3 {
+			pwm3_pins: pwm3-0 {
 				pins {
 					pinmux = <STM32_PINMUX('B', 4, AF2)>, /* TIM3_CH1 */
 						 <STM32_PINMUX('B', 5, AF2)>; /* TIM3_CH2 */
-- 
2.15.0

