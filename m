Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B23CD18749
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 11:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfEII7W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 04:59:22 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:59098 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726704AbfEII7W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 04:59:22 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x498w67U020291;
        Thu, 9 May 2019 10:59:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9twJqd6jluw4HzPOoOYy/UurKqCCV3MvSz8VkuY2g7k=;
 b=jFAVCd5r9bsfk1AW4dwt2i34Epo82zW+MhxcTlBMOb0FOB5e62dztRNARua+txE9uQSG
 KHh394VVa0mIBsRROBNpHB2SQJwHbtiPyB1ktFG7U5MDX0YgX1JNqvSa3ZXd05to36jB
 vp00Z23+8bbp+9aUCTaOTk3ITKuf9++V6KPzIfEcSQMMiSR9h7SG20YaiDd1/U+QM7W7
 mX8/7nKvIZKlyUQy7H3DDSQFCfrv8HRneJfLwABeXj6p5DPqnrbUl3nSDpleK3voB3Qj
 it+fPLncdjrS+BxE6zUUa/fSCy/ptx+RgLogWVZ4qx+iti7372B205M+7T21UQzw4IWs Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2scfv2gj3f-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 09 May 2019 10:59:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6171E43;
        Thu,  9 May 2019 08:59:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37122153B;
        Thu,  9 May 2019 08:59:10 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Thu, 9 May 2019
 10:59:10 +0200
Received: from localhost (10.201.20.5) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 9 May 2019 10:59:09 +0200
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
Subject: [PATCH v6 5/9] ARM: dts: stm32: add STMFX support on stm32746g-eval
Date:   Thu, 9 May 2019 10:58:52 +0200
Message-ID: <1557392336-28239-6-git-send-email-amelie.delaunay@st.com>
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

This patch adds support for STMicroelectronics Multi-Function eXpander
(STMFX) on stm32746g-eval. It is connected on i2c1.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/stm32746g-eval.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index d90b0d1..58e0457 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -44,6 +44,7 @@
 #include "stm32f746.dtsi"
 #include "stm32f746-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "STMicroelectronics STM32746g-EVAL board";
@@ -115,6 +116,22 @@
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
+
+	stmfx: stmfx@42 {
+		compatible = "st,stmfx-0300";
+		reg = <0x42>;
+		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&gpioi>;
+
+		stmfx_pinctrl: stmfx-pin-controller {
+			compatible = "st,stmfx-0300-pinctrl";
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
+		};
+	};
 };
 
 &rtc {
-- 
2.7.4

