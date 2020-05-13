Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1861D1840
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 17:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389158AbgEMPAO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 11:00:14 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:49043 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389142AbgEMPAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 11:00:03 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04DEwJuu008668;
        Wed, 13 May 2020 16:59:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JWzwrNh3nE/7ShXP/Ib08KUjuRLg+lYaWrsytOK3vj8=;
 b=JjTS/Fg9Wazr9t3Jks16qyc7mKewLkMmzffYnzpYJHXTAMweL9XSlTg7uKRmOmEC0ugk
 lgTdLp1r2m+CkRty7fkl3O6kZ+4Fecrz+Xzy4n6/Sv5rdnlKJD7UvS911BZ8jQC43kSp
 3lO+K9ELoLsnbrgpGfHPWpv8sXeWt2YGOvXHoix/PYWKO2FgvKovLFmj9CWGTUC7T8Zg
 u6ywRmAKbhPeiFWqfJ5jeslt0Z/daYCET/lczXHk0PAl34UjiqeVfcZrXLGoppDNcaIm
 lKR9bFFSOutwnUT0PdYKgAJaQd9ogUKH96dTG8uZwzNcm6j1VZokRWrXRlaVxV1YP9MS IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3100vqde9u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 May 2020 16:59:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DBAD100034;
        Wed, 13 May 2020 16:59:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4FF572D3006;
        Wed, 13 May 2020 16:59:49 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 13 May 2020 16:59:48
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
Subject: [PATCH 07/15] ARM: dts: stm32: update led nodes names for stm32f769-disco
Date:   Wed, 13 May 2020 16:59:27 +0200
Message-ID: <20200513145935.22493-8-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200513145935.22493-1-benjamin.gaignard@st.com>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-13_06:2020-05-13,2020-05-13 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update led nodes names to be aligned with yaml description

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f769-disco.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
index 1626e00bb2cb..0ce7fbc20fa4 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -66,11 +66,11 @@
 
 	leds {
 		compatible = "gpio-leds";
-		green {
+		led-green {
 			gpios = <&gpioj 5 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
-		red {
+		led-red {
 			gpios = <&gpioj 13 GPIO_ACTIVE_HIGH>;
 		};
 	};
-- 
2.15.0

