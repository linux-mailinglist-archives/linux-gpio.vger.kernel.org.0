Return-Path: <linux-gpio+bounces-11763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D19AB31F
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 876AD1F26533
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5631BD507;
	Tue, 22 Oct 2024 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="8Jp8x4lc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B556B1BD017;
	Tue, 22 Oct 2024 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612797; cv=none; b=u9qpAxo3L+46IQTluPhKaURQHHVe5n9i5aBQu2r0fIlxXqg93PEBDhJBsmqdKvDzOokepz0etZgJOtunKoW1cIgwNQ66lmCwoSfhXFNl0ZnPSyL3VWi7kl/Hxs/rTatdMERdLkOav77uy25bl3MnAVJNqibxeFVuvdpvSSEVUsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612797; c=relaxed/simple;
	bh=Q1LPVL1qY11IL2pkDaSu29C2Tay92eFuvX2UT2SSlh0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lHtLZ9puUALjr+S/vPik25AgCUtVN5PmkEGyhi54kftgzxYWVCsbG4JMoqmgG25BPbLdLaGiusr+yBRdcJY8jU01vaxm5qyEdVpnuGMpOLOgqcUYnWt7vuvSbX+JKIZREHyiQ8jkbid5N6CMgHK21YtVf0qZK9tk6FMpx6gAgf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=8Jp8x4lc; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBuEdV018515;
	Tue, 22 Oct 2024 17:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	SQi4pHyG2P14Jz7LE4zkxL+ka34czOOwxK0/DKpZ6Gg=; b=8Jp8x4lcOdfLSjuB
	iXDI9bBL7FRfJD7lmSEQoFJkciiGhYStPaGKoQE7x622JSYTWJ4yXM5b3+tXxIW7
	g9EYR4qx2xamC8wIOItk6gHSA0OKqwYVuh2R1oAPEfniNPN8568MQ8KxrdMMve64
	s8gJBnP2FgBLs+ST4Yxa6znYPoLK6Zd+A9Kx2OH0Ioeb074IOxbBlGAG+76CiCvY
	yRb421cFIJTxI5WDmTXvrxT3KIz06wKS5N8U2xq5cDxVlO3y8TduKMtaVzEml5zL
	1gLNaXTnFske9x7KVxOLUO54yoHRghhxVO3hY7bily6T/Qs5cADkx5GG52C1AbuD
	thBgKQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42cpb0v8k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:59:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E7D2C4005B;
	Tue, 22 Oct 2024 17:58:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7E3526E863;
	Tue, 22 Oct 2024 17:57:33 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:33 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 11/14] dt-bindings: pinctrl: stm32: support for stm32mp215 and additional packages
Date: Tue, 22 Oct 2024 17:56:55 +0200
Message-ID: <20241022155658.1647350-12-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

Add support for st,stm32mp215-pinctrl and st,stm32mp215-z-pinctrl.
Add packages AM, AN and AO (values : 0x1000, 0x2000 and 0x8000)

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 +++-
 include/dt-bindings/pinctrl/stm32-pinfunc.h                   | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 9a7ecfea6eb5b..0a2d644dbece3 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -27,6 +27,8 @@ properties:
       - st,stm32mp135-pinctrl
       - st,stm32mp157-pinctrl
       - st,stm32mp157-z-pinctrl
+      - st,stm32mp215-pinctrl
+      - st,stm32mp215-z-pinctrl
       - st,stm32mp257-pinctrl
       - st,stm32mp257-z-pinctrl
 
@@ -59,7 +61,7 @@ properties:
       Indicates the SOC package used.
       More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
+    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800, 0x1000, 0x2000, 0x4000]
 
 patternProperties:
   '^gpio@[0-9a-f]*$':
diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
index af3fd388329a0..01bc8be78ef72 100644
--- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
+++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
@@ -41,6 +41,9 @@
 #define STM32MP_PKG_AI	0x100
 #define STM32MP_PKG_AK	0x400
 #define STM32MP_PKG_AL	0x800
+#define STM32MP_PKG_AM	0x1000
+#define STM32MP_PKG_AN	0x2000
+#define STM32MP_PKG_AO	0x4000
 
 #endif /* _DT_BINDINGS_STM32_PINFUNC_H */
 
-- 
2.34.1


