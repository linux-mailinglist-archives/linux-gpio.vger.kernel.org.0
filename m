Return-Path: <linux-gpio+bounces-16542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23987A43837
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 09:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE730189C619
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 08:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC51D263898;
	Tue, 25 Feb 2025 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dkV29SQM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7200125E469;
	Tue, 25 Feb 2025 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473538; cv=none; b=p4PlnWR0syWJxwGShJf1DuIOjR+BkP5soxLpJckPYGC8iqf6B3ttqAndeGxZoiWyuOSRbjifRnkIKd7EJy03Tf5Xg9P/VoY9W+BxEEN6XAXxxt+/5OFJmvfwpNHLvPuIcnFP1IqYHoHjegR7LhyRK+9ZLquFug1os9Fm5BJpnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473538; c=relaxed/simple;
	bh=zglWrd8ezJ+A3E4LMfw8ZkD47cutBd5KuqdRmAou9CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AloIdfAPaT7bYbFmjZrMd70vdPwyj3/nMMKgp/XBj+uB9/7cZlFrZz+7vM/6fxRjzTLBx+9eqk7zJ5lTDb2JHnszfMxWZ6INsSodkeSSx5JhozDITU4IHs58MlsKoLJb/astrgN12l2Ujw3D/XcU/uhyfbQwZnBZRgBCKL8mrZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dkV29SQM; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7lqX8000766;
	Tue, 25 Feb 2025 09:51:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	oOcN9TjJ8kI82gXu1mJ0KoE7660yxLYsGvX6pzPGc6M=; b=dkV29SQM6ZNk+Qk/
	/NLjgIYrZvKlWsXeVLRuhdIQ95Gw80kJazNCkVA0N7x23a/AnkwqkaRxgVh5gcqv
	/YlGBypnLfElDcDckb2DDS3c4C2wISumpmML3fEjyiZ0PnPHT740vGYiej1JETsw
	7t29MPKVS2l9XuYqv81NmTxfi6QTNb0SSn+QrQW57ivMu5PYi7iuq+76cK2DTSYZ
	enLi2bYgqbNdgKGRNbFu6LaldbmM9g08XukVk96h//S1UZP40Zco0p2WBOq5m4KV
	DvLiJ38IRgikka7z0PRfeXB9AqNdewa0AHtbwLTI3kvoHaczlIepGzQhLtPB7n2z
	PHxhyw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp1t46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:51:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BB2E40058;
	Tue, 25 Feb 2025 09:50:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DEF0A47A7B2;
	Tue, 25 Feb 2025 09:48:08 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:08 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:03 +0100
Subject: =?utf-8?q?=5BPATCH_4/9=5D_MAINTAINERS=3A_Add_Cl=C3=A9ment_Le_Gof?=
 =?utf-8?q?fic_as_STM32_HDP_maintainer?=
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250225-hdp-upstream-v1-4-9d049c65330a@foss.st.com>
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

Add Clément Le Goffic as STM32 HDP maintainer.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..c277b10cf48b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22425,6 +22425,13 @@ F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
 
+ST STM32 HDP PINCTRL DRIVER
+M:	Clément Le Goffic <clement.legoffic@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
+F:	drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+F:	include/dt-bindings/pinctrl/stm32mp*-hdp.h
+
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
 M:	Alain Volmat <alain.volmat@foss.st.com>

-- 
2.43.0


