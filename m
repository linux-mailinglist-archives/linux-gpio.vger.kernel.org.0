Return-Path: <linux-gpio+bounces-21224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D233CAD3B2F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FE65178C29
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8651A4E70;
	Tue, 10 Jun 2025 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QB6LI3p2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8E146D65;
	Tue, 10 Jun 2025 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565980; cv=none; b=JTDQur2g33kuNylmyBB08tAaAy3qsh5spnKkxPrevhJzQ6lZBPPKWM31E5pNNidU6kJEtuQNom7D88cXOX2TC5EuyiV4wBDfOWbN4rIsrkBHdDiDyUp9G/XjF/iNrYD5OOgqk8bOludwK8TwhUBfrGLtmMYUGcj0OM24E6+0uqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565980; c=relaxed/simple;
	bh=EVjWOqV2QBAT8jLfJQ2WDUkaBCeYiwJtvxfijd5mTIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fMHBX997JzwM1QQNKpYRnvWy18ggsBwv07FB3QcdIvO4zDbjVqLn/XP+h5O4FUgMQ3Mj0YZ4n9zTqAxHacPzJwJiEVG5m8h6LgeXBq1qOp5ULs4ynH+Jx9nFtOOsV9bk7tZfFLtGU9jBJ8HKk4eQAgGzGH2FB+MYT39CHJtPNRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QB6LI3p2; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLOPl020944;
	Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	aG0pL2OVGY0Hzli2z3vyxFT0bTfI27PE+mrGr61jjqQ=; b=QB6LI3p2qxGS5ZVi
	r+J2dp0cx+LqbLrjG/rCcyK76DCtiuzTfBORFbW4sCc6qXzT98EnMmHVVI7Dc5bW
	6Hp42pZDO67AUlolp70XVg3wBJADijRYS9vG3D8/CgkKiMSiT+y3GArUW1um4p/L
	smfl5a6TNBuTrDvxE30OyNspTNXs5FezOo8kCahrahlD+MccYqmZR97vgAfF/vqY
	VtaLPRKd1408YbjHGGhHZuOhaoOHLfeDOKpUMtTGpcmIaeJUs+7FeqJ+hFyPuGRO
	K6kq3Wtgdx7/1ps2iprO+4KMg3SLbaJ78teUab5lBpu42vO+FzCNjHg9JTyPpzdC
	sGVJvg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aja4vu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 649F3400CC;
	Tue, 10 Jun 2025 16:31:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E3C0B4FF52;
	Tue, 10 Jun 2025 16:30:49 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:48 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for STM32 pinctrl drivers and documentation
Date: Tue, 10 Jun 2025 16:30:42 +0200
Message-ID: <20250610143042.295376-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
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
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01

Add an entry to make myself a maintainer of STM32 pinctrl drivers
and documentation.
Exclude the HDP driver, already covered by another maintainer.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..13b1226cc4b9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23471,6 +23471,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
 F:	drivers/memory/stm32_omm.c
 
+ST STM32 PINCTRL DRIVER
+M:	Antonio Borneo <antonio.borneo@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+F:	drivers/pinctrl/stm32/
+F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
+X:	drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+
 ST STM32 SPI DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-spi@vger.kernel.org
-- 
2.34.1


