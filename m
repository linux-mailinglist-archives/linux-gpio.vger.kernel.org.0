Return-Path: <linux-gpio+bounces-21246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D866BAD3D01
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCBB516F3C6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BC323BCF2;
	Tue, 10 Jun 2025 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="yfULawb1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A446B235060;
	Tue, 10 Jun 2025 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568832; cv=none; b=RwQYLXj82NOttE4YTa7eVwAXEBh07H9eitN5KUPYfEtL7h8DkUFGcEx+2Jlsfr1EK3gG15f/PNbqW9iLR7qXkqyUYezI827UL4+9Mfn19PG8sVDgKP6yt77Dee0gt0FKVeeHQxyX0tFN9imhS7XtYCsHRAVBM+NcraHoO9N4/u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568832; c=relaxed/simple;
	bh=LMw9B13I0H9SXVXuGdE+hvMWY8Sl3UGv48j/sluw2Mo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrDvwCIN6PIAn+HP+4X4tkSp8RUiyGsjWOC8qqQfjn/z+u+Ke/sccBKqOxAmx+/wjUxn2kF4Gmx066rvbqmDtMCPGP1g3Z1jO1wBfSWXY19EqUHh51lO3/iSCBglrWitsYSAdWervou1fU3oX/AzoXFQQd7q2UTcxHcINbIR/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=yfULawb1; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLDiq020330;
	Tue, 10 Jun 2025 17:20:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zgHCfxHCSrQZLBdhcD+8YVibXqq6yEAZb7msrNjGwik=; b=yfULawb1xYoeXaOH
	H7Iw6CuLSzfK3VIpACq7JNmiqWLNx0hOvamJOUBoCiwREQ9UcI+RsQH9dnmh186l
	Tl0gFFn08o1E1qKOfI7Tcu2zB14z0r5ntteiwYvSUYAGNQz+Q/AaO3GA6BscJ7Vt
	30ZZRgFqp8QutVCGrLefqyVzUdvDw3/j0t68qQNsuMNeOR97J/1evh2xjUWKE96x
	b66uuLb+B/9agX2lSQ0dSg0JH4gmk51MIbBZGAsz0KAAiTMy94o7YtwbuLsWbPM1
	kRUYfUNnPLQFRg89iCfMJ1lqrsJD52dlJXWLEOFJQSRxhRpwTtxPsnDthWS/HFtw
	m4IuwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aja58g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:20:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6202B40046;
	Tue, 10 Jun 2025 17:19:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9CDFB74DC5;
	Tue, 10 Jun 2025 17:18:43 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:18:43 +0200
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
Subject: [PATCH v2 3/5] ARM: dts: stm32: Add pinmux for CM4 leds pins
Date: Tue, 10 Jun 2025 17:18:35 +0200
Message-ID: <20250610151837.299244-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610151837.299244-1-antonio.borneo@foss.st.com>
References: <20250610151837.299244-1-antonio.borneo@foss.st.com>
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


