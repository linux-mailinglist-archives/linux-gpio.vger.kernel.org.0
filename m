Return-Path: <linux-gpio+bounces-21254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7700EAD3D69
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E923AC720
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C11324A076;
	Tue, 10 Jun 2025 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fRIBy1Bx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CBD24418D;
	Tue, 10 Jun 2025 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569098; cv=none; b=rJTrYzi2h11dlEVjlPw380hJKPYaIPX0dLfpGt5w/qZVsFw0tUfoUL7y4Iu+uTrY+FctISu+v1MW1CYIjcdVTpjQl7feV5dErblqF7Z6inlrHKtNbid60TPI5pmeRxMElURPA0kiEmfxkybfihBk1LwwKuUO6uVDGXoTIrP5wLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569098; c=relaxed/simple;
	bh=lh6yUknaZvNc4C48s8G5w7LhWfffxBprO0PLz0v5C8U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LEJtHwInSLMXlgVPRmjGWeUOKXUSW2NAfbxs2dRKUT6s7Bae9W8BxQpV+o+tzsQcgG+lCoLo7OIndJsFn+8RB276Gp/doN8/KIqB8ZYWbm3UCPcmu8RpzLszXkNH2j7V177hW5vx5o8H8JKCKTC8ofPuaGOd63PuPHz/ZAI2NI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fRIBy1Bx; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLFRk012963;
	Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6jFgEWw4ARwHHobxDSziy501YUd5MUew54ky5yZYuxs=; b=fRIBy1BxcpFxUqXZ
	zFzb+4hJFSEaZOpDRM+1lBrH+cRSNV1X52Jit1DkbvovitiXs6S4q5NAgdcI+nNI
	/dv13hLMhWOkVSUUQxAvyAQtzZ13rbxKZyzudUcD/rJVzbGbVBxAlnsx/2BJtLl0
	kEISu9Ow4LKrqXAS7xN2MBZ01GsDt9iOF+KNhmu8D+WxB/4wiYF1rHpuIpyrRNGA
	AZ29Zl5vVTthSC1xV5sevT4ObOStkC9HQtrI//yzLL4wa4fuvL+bB69YMIVJJj2L
	MMiVA3vT4nSvphcQn84rUh/bSA8r9+Nq4Y7cvnjcf0NDsfg+RLnRwkqbQNqK9a2Y
	DGR3cw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aume5nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C9E4A40055;
	Tue, 10 Jun 2025 17:23:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1ED6DB79BAB;
	Tue, 10 Jun 2025 17:23:15 +0200 (CEST)
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
Subject: [RESEND PATCH v2 4/5] ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and stm32mp15xx-dkx
Date: Tue, 10 Jun 2025 17:23:08 +0200
Message-ID: <20250610152309.299438-5-antonio.borneo@foss.st.com>
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

Add to the node m4_rproc the pinctrl property corresponding to the
orange LED.
The GPIO is reserved for the coprocessor Cortex-M4 and will be
ignored by Linux.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts  | 2 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 9cf5ed111b52e..f6c478dbd0418 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -328,6 +328,8 @@ &m4_rproc {
 			<&vdev0vring1>, <&vdev0buffer>;
 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
 	mbox-names = "vq0", "vq1", "shutdown", "detach";
+	pinctrl-names = "default";
+	pinctrl-0 = <&m4_leds_orange_pins_b>;
 	interrupt-parent = <&exti>;
 	interrupts = <68 1>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index a5511b1f0ce30..26f36a232d42d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -479,6 +479,8 @@ &m4_rproc {
 			<&vdev0vring1>, <&vdev0buffer>;
 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
 	mbox-names = "vq0", "vq1", "shutdown", "detach";
+	pinctrl-names = "default";
+	pinctrl-0 = <&m4_leds_orange_pins_a>;
 	interrupt-parent = <&exti>;
 	interrupts = <68 1>;
 	status = "okay";
-- 
2.34.1


