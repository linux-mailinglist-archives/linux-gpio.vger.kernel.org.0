Return-Path: <linux-gpio+bounces-21256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D43FAD3D4E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7C827B17C9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E28E25291C;
	Tue, 10 Jun 2025 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gbFNVWnD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D72C23AE9B;
	Tue, 10 Jun 2025 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569099; cv=none; b=EllWl8sO2S0PFMfn7fo39z3LTaABuwcGvh/hegdB1xZM1WRg9SKjRdqbFsCF/8lk6by0PFGV6/jpgD9zh+HamtC3ATlX6tu44VW1QD732FMZNgORJRy7cwHcuM61xD/PkO6xk9jLtRuI5CXIrINzjyzlClgTpQBkJVjudvoNhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569099; c=relaxed/simple;
	bh=LMw9B13I0H9SXVXuGdE+hvMWY8Sl3UGv48j/sluw2Mo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fLGRUMHQlrGnlWC0xO8JA9YE4qjnndqgNu45aGQRDmNG+0cw8ZlPXj10jWu0OD0YlrLu9IcQbs9+ZQGTuSShsGe2LZbvezhtVRtAKhgU8dD85sVpHq2KVtNCZmLwURpbzrBk0IxQjAEW7HS6k1xHWEKyqhvCTVirRKLHPUYFJRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gbFNVWnD; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLFJT028167;
	Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zgHCfxHCSrQZLBdhcD+8YVibXqq6yEAZb7msrNjGwik=; b=gbFNVWnDU5B4VYPw
	JLXZoZjW3QzBbTMtKQGrMLN+zbOs3B6+9b0IDIO19iZTL1e2CxTbdN/2zdpPxZEi
	HI9bKSS/7sm/Ne0h6uxWzB4t85pLsNtIM8phH2b+i3tix+fF1OFA8lSE3pZ3LM5w
	5TwSqLVCMxxyc8f0zyLHeM+EbqZ1E1+MDmgY2YFSu2tygqt/LE/kFVPQSiSgP0eY
	/0Q7kQGxQcx7H75ZQghOm95AmCAbfBJkqa/hdEhkjW8n7RYRSxHjHWxBIJjatmUX
	JCjrR4sggFJZdm5lyi7p2Yc7ZSZ/+TINYtgM+tQ2tOttYDoynbmBqToisXisUOLG
	ChaC7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2nueh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 443BF40052;
	Tue, 10 Jun 2025 17:23:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B5BEB79BA8;
	Tue, 10 Jun 2025 17:23:14 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:23:14 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [RESEND PATCH v2 3/5] ARM: dts: stm32: Add pinmux for CM4 leds pins
Date: Tue, 10 Jun 2025 17:23:07 +0200
Message-ID: <20250610152309.299438-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01

The GPIO H7 on boards stm32mp15xx-dkx and the GPIO D8 on boards
stm32mp15xx-ed1 are used by the coprocessor Cortex-M4.
Linux running on Cortex-A should not use the GPIO and should left
it available for the coprocessor.

Add two pinmux groups, one for each families of boards, setting
the GPIO function as Reserved (RSVD).

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index 40605ea85ee1d..835b034d0aa7e 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -1304,6 +1304,20 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m4_leds_orange_pins_a: m4-leds-orange-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 7, RSVD)>;
+		};
+	};
+
+	/omit-if-no-ref/
+	m4_leds_orange_pins_b: m4-leds-orange-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 8, RSVD)>;
+		};
+	};
+
 	/omit-if-no-ref/
 	mco1_pins_a: mco1-0 {
 		pins {
-- 
2.34.1


