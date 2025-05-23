Return-Path: <linux-gpio+bounces-20534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39822AC22E5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 14:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B75B188C671
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 12:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B72119F422;
	Fri, 23 May 2025 12:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="swUO2dDH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DBF1991A9;
	Fri, 23 May 2025 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004050; cv=none; b=qdH/JKjujmXJhAR76Sm8L35+5VX5EyW5iuAGhUzr3G21o9g/eCWpJ7eYIZja2rB0os8uVNw5g4pY0Uj7sX2XV3mv8H8dGXgmRPbu5BdihjEhyz8Bbmik3lf7iAKXcZZWohmOKwMbcdMMn9Ra/tMztGi46oT+IF8LgDiiXlIuOCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004050; c=relaxed/simple;
	bh=+HZ1hAlMJLfS8JRxhzEDYGYpGNGcjsFe5N6n4fXa37s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HAaJafY/2uOpK+VgLuchf3M1yinAcD3jxyMA+sbcmdLc8EorgPAaiwmpROcQEeSU5MGyD0fT39hep3P6GdLAWE+gStPKS35ctZ5nmpXIL1n6DeIB8WyO+GXUryz2h/49h5mO0YCZ7PsbuNG0pgZ3ukAE37bR4yICM3roAPsbPqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=swUO2dDH; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCZhFg031186;
	Fri, 23 May 2025 14:40:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	q1Xe+iFfoFaZmcBVvqZtaLKC4sE7WOeQvKFEpMrwsnw=; b=swUO2dDH/z8E1BrC
	GOKktnCEAuRpXR9N4TIGZzPcf/eZ+pYNiCVBWbKn9ENyPey3usCVP/5fwsKmCma/
	507JAr/laSByH4CDReYro8Qymjt8EGAprVVd9lJrstEWDhHbRx5QP3yAtmlvRNtg
	NPJJ5o+lqClS2lr1hvp7l4Yn1itw2NY7w0nTL9wy2XdA7dtZ8FlDNXFQI/ROBn1C
	jZMn+1ZVm7XD5rA8VflahEZzcWuPb5DHW9gXyTJAz0PpRuJk6RZAQ9ODBVfCFLze
	iNetHEbCLuQkd9Bp8TAvwLejjKthuOSNkdEKBpHUVZ6GAgWDlTwUTp2KMIemRQE2
	AN1x3g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4e7ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 14:40:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F405440051;
	Fri, 23 May 2025 14:39:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4FD8FA0D91F;
	Fri, 23 May 2025 14:38:29 +0200 (CEST)
Received: from localhost (10.48.81.67) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 14:38:29 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 23 May 2025 14:38:19 +0200
Subject: [PATCH v3 7/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250523-hdp-upstream-v3-7-bd6ca199466a@foss.st.com>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
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
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01

Add the hdp devicetree node for stm32mp25 SoC family

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 87110f91e489..0fd79acd458f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -917,6 +917,13 @@ package_otp@1e8 {
 			};
 		};
 
+		hdp: pinctrl@44090000 {
+			compatible = "st,stm32mp251-hdp";
+			reg = <0x44090000 0x400>;
+			clocks = <&rcc CK_BUS_HDP>;
+			status = "disabled";
+		};
+
 		rcc: clock-controller@44200000 {
 			compatible = "st,stm32mp25-rcc";
 			reg = <0x44200000 0x10000>;

-- 
2.43.0


