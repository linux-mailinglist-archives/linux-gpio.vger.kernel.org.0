Return-Path: <linux-gpio+bounces-16540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F95A43832
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 09:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03F3C178979
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 08:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670DB26281A;
	Tue, 25 Feb 2025 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nC2GRX3W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F17C261364;
	Tue, 25 Feb 2025 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473538; cv=none; b=t/HaAk8/8sUkSmzxXpQKCEtiesfwLq8ETTj8jhQHE1GMRQC6milnQmykDCemvM978vSsN57j2Nygpi1dcgPLyL3DHXFeKEkvmTz66JGXnt0ktqy21tXA9RPz9DTvfcSB/2wRV77EqqApKF8iv56ZjTxRwp4+xFB337n0WTNBeB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473538; c=relaxed/simple;
	bh=HfehjW+Fe/Xy/uzYxRImEvw6aSJ00yfmPKS1OVbl28o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rfDrAf2+2jMpWcoBqVmMQAogbjZ0PMqQo4vok5CV3cDWSGP4TKa46Pmf5PNltYME2GanfTF2J/CGI4d6JByhRT+wPLgJxXqXsSW8SOpf/Lhg1QA3TDye/JinMecwwv36osnaV+Ipcra7tlPNrlAyqSIPlQcWPhd/VM2Dm8iTsx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nC2GRX3W; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7lqXA000766;
	Tue, 25 Feb 2025 09:52:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	J2yxfbKgPGF9vwYBDWO/BnP5mUD9w8yyaZXb38xTgW8=; b=nC2GRX3W1NsXSMvB
	6ih/iR4IJy0/kw10GELfjorf99thW7Tp/+AjrPCOa7TeOHVu8rRBRqvWNkWvwgmV
	BPyGudzYS6teHdfabPFTnQh+BN/tSBffjtWMLi3efb1WzkIrgrBho7bFu2Wg0Jiv
	I8QQWS0OW2HYJ8oBa4F4cwRXBv34Gthf/7FnaYsLbe/7Ye8sLXyS0NR98JmRieI0
	/y+jLdmZZ+R6W2gutDLpbaSDvFvAcO3a2GZlboUh40u/Aj+f4C7NUPb8OWwtoyeV
	YULjgWBWMW1mmEyTXU1JI63dK7RrtGbrD1xX5ffEMS+TeCueBMr60acygflcrAms
	N5Duug==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp1t4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:52:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 337014005A;
	Tue, 25 Feb 2025 09:50:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F80947A7A1;
	Tue, 25 Feb 2025 09:48:09 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:09 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:04 +0100
Subject: [PATCH 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250225-hdp-upstream-v1-5-9d049c65330a@foss.st.com>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
In-Reply-To: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
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
X-Mailer: b4 0.15-dev-42535
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01

Add the hdp devicetree node for stm32mp13 SoC family

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 0019d12c3d3d..73c9971c4c80 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -919,6 +919,13 @@ timer {
 			};
 		};
 
+		hdp: pinctrl@5002a000 {
+			compatible = "st,stm32mp-hdp";
+			reg = <0x5002a000 0x400>;
+			clocks = <&rcc HDP>;
+			status = "disabled";
+		};
+
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;

-- 
2.43.0


