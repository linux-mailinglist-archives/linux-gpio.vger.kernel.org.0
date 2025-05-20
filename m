Return-Path: <linux-gpio+bounces-20348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DFDABDE25
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 17:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7615B1B67FAF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8742512CC;
	Tue, 20 May 2025 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="P/E43kiI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641DC1D554;
	Tue, 20 May 2025 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753477; cv=none; b=QAOrHCoq0kYN8jUP1fdiCjgrT3rBLSXZ+z2r0Y0l1EEt+hP+VXmUuOYDlI4t8LwktoOrSFaFNlnZrfyynSmuKoQTlGet3ZRl73Xv4GsYpXBJ4V8epJoLLehpx5cpHAcObMGfrvFYs8I/ufturzGL6aOHs968EviOevUsrjy1t5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753477; c=relaxed/simple;
	bh=901IAHIHJiuCeovVY8qXNI5JjqYObVTJQjv49am/DJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ngLQOZtxBr9WY/BLa9MeWpgJer2oJulJGw5eTzwM0BuvHB/2FCJVPtCQMFq3FgVVr4g5ehLN9reFnme8Dqc2GfElwXarkEF6bjprUxsgWOrHH5txqSyXfn9zdtlk+6vzd5BLqm1aH0yJ2FzO0Sml1Xf02PR7567dP287GrktIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=P/E43kiI; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KEnRIG019007;
	Tue, 20 May 2025 17:04:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VsJ9BwEz1wd8EF9lpOMOQsDImQr6kHRBw5n5nBd+jPE=; b=P/E43kiInuUCyuB/
	2h64dMzcDGpB6Y0buaRhmzsROovX0DXm0/bfJjXTLvbm2Pu+g4cYkmLq933Hcfmj
	keZEhjcmZbRa0aPZa7HVUNUcsjx0cBs8rmVj1wdJ+bOUpD/Ln/vCgRF7KylNeBHX
	fFllBDmBRxLQ/uobyKfFyjBkf24SaLIC1FZwiBeuzs9Hao1Oqv/Li95dcSazAq/u
	YJ39Bx+XcHzYEe6OeUb3HPAbtCj02wJxqk5MF77LEhvuTw8KDAnuEgZV/U33TMmW
	70Smzt58kW2Dz5EKkOv3R+r35IeqFpRZDzXrtqFzGqLoUh6ESGYygcY/I4M1FyV9
	pYhnlw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfka5sst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 17:04:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9588140057;
	Tue, 20 May 2025 17:03:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2C73B20AE7;
	Tue, 20 May 2025 17:02:34 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:02:34 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 20 May 2025 17:02:31 +0200
Subject: [PATCH v2 4/8] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250520-hdp-upstream-v2-4-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-6f78e
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01

Add the hdp devicetree node for stm32mp13 SoC family

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 8512a6e46b33..b0537bcdb9d5 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -951,6 +951,12 @@ dts: thermal@50028000 {
 			clocks = <&rcc DTS>;
 			clock-names = "pclk";
 			#thermal-sensor-cells = <0>;
+		};
+
+		hdp: pinctrl@5002a000 {
+			compatible = "st,stm32mp131-hdp";
+			reg = <0x5002a000 0x400>;
+			clocks = <&rcc HDP>;
 			status = "disabled";
 		};
 

-- 
2.43.0


