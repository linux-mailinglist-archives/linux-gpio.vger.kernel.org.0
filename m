Return-Path: <linux-gpio+bounces-20352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FEAABDE35
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 17:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1963F1B6836C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3D4253357;
	Tue, 20 May 2025 15:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UdEvb/zk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF6250C18;
	Tue, 20 May 2025 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753486; cv=none; b=lNdOdOecHVbw1CG8qqH6jgFK7hkdBrvvjdPku47cLQ9yWbiVqcYv0Vw58I3BYXK28hLVmehzBlcDNTjOZahPYnC52cgs5B9VvoShSaXnF9duoMy0n0PJD67Yx2/mxvJ3OKToMBpqoDykzWrW27ZFl7kRNxI2BQSkkTCdoqmI5SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753486; c=relaxed/simple;
	bh=YZQE4tYZuMccx0vKTjnDG64cQ5GRtL3RUxH8TgioquI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fsxUK0TOaCZ/kJx3eNg5YWodzjIEIfb0/f+nDi0Uh0vQnfEgliKg3mmyNA+wtKUHy677ELt9ztYRq/po9usJRqsoFCWoc9X56v+Gv1s/ExYmpdkqkAtxGazGt/Qxr3OTDxaGNCCkNVSIVNXc/uXN9xHYE9iaYaipvqegyIyOmZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UdEvb/zk; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KEBkg9025217;
	Tue, 20 May 2025 17:04:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XDiPaUX7L0zqYZu1CgdfB/6W9p+CHs7zwPywjjpA6ls=; b=UdEvb/zkokxuCZz2
	YfWT7B9aIAdj6FGmIKSvFws3R3E8qYJiuSJJME50FcDkwelFWYqtlETfhvcQ7BAx
	JmTn12gpF9Z4xeX7e2rWqNwhLWuKc75huaIVRanl1kkac/W7rfmfVyfrI68XdT+f
	0Fenz0aJPmf3zDljYuZYieG0WDa12CknVFsqIF5WwG+y85Q4E/PH5O8C+uSkzOLA
	16T4g2wro65R49+iU+Y/YQHBAjMlh8kwEOLh+qkuIQXlvkQzjeymYqRAfOY627X3
	HEkjqowzDbry8nqPQPik3rTHJJIg/sGxZDJnx7G/vncOKbzQ7coI51Euvfs33r6R
	rK89Xw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46q41ebs6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 17:04:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 50A4640056;
	Tue, 20 May 2025 17:03:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9FB01B20AE6;
	Tue, 20 May 2025 17:02:35 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:02:35 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 20 May 2025 17:02:32 +0200
Subject: [PATCH v2 5/8] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp15
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250520-hdp-upstream-v2-5-53f6b8b5ffc8@foss.st.com>
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

Add the hdp devicetree node for stm32mp15 SoC family

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 0daa8ffe2ff5..b1b568dfd126 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -270,6 +270,13 @@ dts: thermal@50028000 {
 			status = "disabled";
 		};
 
+		hdp: pinctrl@5002a000 {
+			compatible = "st,stm32mp151-hdp";
+			reg = <0x5002a000 0x400>;
+			clocks = <&rcc HDP>;
+			status = "disabled";
+		};
+
 		mdma1: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;

-- 
2.43.0


