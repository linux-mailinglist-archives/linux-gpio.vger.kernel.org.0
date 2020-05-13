Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5777C1D1823
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 17:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389100AbgEMO77 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 10:59:59 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:36874 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728692AbgEMO77 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 10:59:59 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04DEv04V016507;
        Wed, 13 May 2020 16:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=gGm+A+xLfFLIdcplBj2XagGVRg1huBKVNN3U+ziANAM=;
 b=wt5Ru6ncq/krmYZIHfxLjeZhJ4Q8YszE/s9iMAM2fB0v6lIxxPjydWgOsoVcIl+DQBdH
 90qetO/XA2HZM8lHaWLSlcFSmL+S6bje0RvHVxPYQ4IXVRQcHo50qa2plBHg+nKL3fcV
 1rGuCJYxbg2vyA4ajohcAuTkFSOR1+g/BJU8XhdJf8RI6Wzbr4QyW11mvOTnhdQVabaM
 djOORT0E74ch4iUgifLbA6ApNAO7Fz0zRara2/8VrjzXB1kWIEk18gZXjF09zpqKOC0X
 iAP6qxm40unuakCQlx43A1iq7RtTLvQNF3kIZrirGmdsiVtOfqzPXuNqrjP1PkKTsPnn uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3100vydgkq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 May 2020 16:59:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B12BA100034;
        Wed, 13 May 2020 16:59:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C4E42D3004;
        Wed, 13 May 2020 16:59:42 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 13 May 2020 16:59:41
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
Subject: [PATCH 01/15] ARM: dts: stm32: remove useless interrupt-names property on stm32f429
Date:   Wed, 13 May 2020 16:59:21 +0200
Message-ID: <20200513145935.22493-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200513145935.22493-1-benjamin.gaignard@st.com>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-13_06:2020-05-13,2020-05-13 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Driver doesn't use interrupt's name to get it so remove it from
the node.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index d7770699feb5..3537430fd4a3 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -322,7 +322,6 @@
 			assigned-clock-parents = <&rcc 1 CLK_LSE>;
 			interrupt-parent = <&exti>;
 			interrupts = <17 1>;
-			interrupt-names = "alarm";
 			st,syscfg = <&pwrcfg 0x00 0x100>;
 			status = "disabled";
 		};
-- 
2.15.0

