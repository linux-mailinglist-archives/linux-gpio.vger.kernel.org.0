Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3E8E1874D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 11:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfEII7s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 04:59:48 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:11666 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726097AbfEII7X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 04:59:23 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x498wcEN026185;
        Thu, 9 May 2019 10:59:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+7wNELEx78IRxLLIQk8fXMQ2yhAOu8VYD8rixLi4P0o=;
 b=RuOMJ/m96uyrFZcBu+GqwXXVQJzstwy50w8HKoiY1vJpIuLXtJQAFRy4Z4ECZBlBvTkp
 XkHbclF5/ilVvnU8UjqFhTt6Py9xXQaE5XIOdUQhtFCT0yjD8s/wtzPNwfURr6ePw2WR
 9Hdqpz7hvVWPV4li+3MFWqWoHLeG0mRzx5yb3Kg4jthmiKvkJ292/Hua8+bpVITr+2BU
 KRO93AphyjcQqfFUzI7l2ZgBng5WHu8kfLNcoSTLa835PI9sDiOqmztVLhF9x9G4bjcE
 VylfmfGkog5dO6cLzmIz5hrol2/U7yE2NcbBq1jBF3dalpw3B2Hux3j7HBSycDUG4s7U CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sc9s4a9m3-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 09 May 2019 10:59:13 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 782523F;
        Thu,  9 May 2019 08:59:12 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EC5E153C;
        Thu,  9 May 2019 08:59:12 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Thu, 9 May 2019
 10:59:12 +0200
Received: from localhost (10.201.20.5) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 9 May 2019 10:59:11 +0200
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
Subject: [PATCH v6 7/9] ARM: dts: stm32: add orange and blue leds on stm32746g-eval
Date:   Thu, 9 May 2019 10:58:54 +0200
Message-ID: <1557392336-28239-8-git-send-email-amelie.delaunay@st.com>
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

Orange (LD2) and blue (LD4) leds on stm32746g-eval are connected on
STMFX gpio expander, offset 17 and 19.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/stm32746g-eval.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index 21e8912..2b166488 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -70,9 +70,15 @@
 			gpios = <&gpiof 10 1>;
 			linux,default-trigger = "heartbeat";
 		};
+		orange {
+			gpios = <&stmfx_pinctrl 17 1>;
+		};
 		red {
 			gpios = <&gpiob 7 1>;
 		};
+		blue {
+			gpios = <&stmfx_pinctrl 19 1>;
+		};
 	};
 
 	gpio_keys {
-- 
2.7.4

