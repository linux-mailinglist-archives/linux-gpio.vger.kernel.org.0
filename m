Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A141D1861
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 17:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388954AbgEMPBL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 11:01:11 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:49047 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389141AbgEMPAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 11:00:03 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04DEwJut008668;
        Wed, 13 May 2020 16:59:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=S05pCgK8uWODd8RKtzygV/WicL2iwG1ylDDr0DNrkBw=;
 b=02JQy10iogJpp2aYijzyKo5v4HiJUHo14501F4YVI2mEpSaEQeBr/fQ3/uC5a4Rjyrs6
 4nwViSiYAc5p9Oi02FSMvszXqhXkgc/DcsykWbICjMkk+NHjT1ZAPUFUnZMFZbOy3u33
 Yw1Y2VhWKuwTKW5uNOKg0oXZYzx1167cXQ65dLrx2JXQs2XAKo9IvmXtBlqu3eRG5zxM
 xjlDm6gblRwL52U8YLyPj7i0E0iP2zh40G3nfHnM1is1ROJl/OYASA02s54qRRWYf19/
 1a2thPoAr89Abn9AonYJAab8GIBgaiQ7Q+N33htGkmEnCeiBt7JLUO/3Xa3Y13JPrc2i 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3100vqde9a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 May 2020 16:59:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2540310002A;
        Wed, 13 May 2020 16:59:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16CBC2D3006;
        Wed, 13 May 2020 16:59:47 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 13 May 2020 16:59:46
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
Subject: [PATCH 05/15] ARM: dts: stm32: remove useless interrupt-names property on stm32f746
Date:   Wed, 13 May 2020 16:59:25 +0200
Message-ID: <20200513145935.22493-6-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200513145935.22493-1-benjamin.gaignard@st.com>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE3.st.com
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
 arch/arm/boot/dts/stm32f746.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 93c063796780..5d69a0c653eb 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -304,7 +304,6 @@
 			assigned-clock-parents = <&rcc 1 CLK_LSE>;
 			interrupt-parent = <&exti>;
 			interrupts = <17 1>;
-			interrupt-names = "alarm";
 			st,syscfg = <&pwrcfg 0x00 0x100>;
 			status = "disabled";
 		};
-- 
2.15.0

