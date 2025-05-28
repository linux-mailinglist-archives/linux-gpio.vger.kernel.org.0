Return-Path: <linux-gpio+bounces-20668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AA1AC6A97
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 15:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20D587A43D8
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 13:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C1B289364;
	Wed, 28 May 2025 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bcd8cvsK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F31126A0E0;
	Wed, 28 May 2025 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439207; cv=none; b=WUNou7a0vfih0kbFdTS6ouKCyqNOeVoY9B6rkYuWG2/NU2EtPeZCbu6/+dRUSR2HNclubo5LEe5MOh64dwA1Sxy5WlhvoOcxfY9fEBiLPkAKBEHHr8qMlOFUySXiwJTd+sAE80gXZ/wPwNSQuz3dThOOEjFXhVXnQtLnQbJ6ZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439207; c=relaxed/simple;
	bh=KHbjyN2d2s1I0/J03YDGAwgAwHS1sT7K6Bg42y+oCC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j0RjYt5sQXiBGaErpXnpI0hTghaMTEK/x+v3vnFOsi3B2bI5rf4e0Lwsf7xLa7RW/rZzndwuWV14b4DowCeV5nGS5yx7rRxZHapY+Nd57QIpkELU4X/TUd5va/DTIctteV9+ptrIbJIWlSEUy1pDJX0ScUa9hnMB6ihfhZZW/dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bcd8cvsK; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCXnlC019251;
	Wed, 28 May 2025 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vOKCvrg9T946MeKb54UlHJZ6LDnhr4kD9B8NCELZ49s=; b=bcd8cvsK+mcjyYwr
	BG8kIBEUsHAZLder+fY5vncgL2M9lQI8otrEzOVGGF9Cz+gpQcXi2zh+7i/fHChD
	wJZ16YghCKv19E6OmgefAhGEOGOUHeBeeCcP0JFMiCoci4/TtgAs0upaBl8GPdmL
	EixYoeIEyAVI5+iJm6qDNlaUKVutUS9l7M2StK5NcNW9OMJ2J8Qa+v0hpgW99lsC
	NHZOPXiwlG/xB78O0HMLglkeEtxlwBd3uJVehWVhLmKQ4e5FE1985fCw4v537pCN
	UpLlNiamFfPQWEmrbiKuUES5Jzi5BeR15aGFogNVwsGA3uyfll9PD5/RAactdBtm
	Zkonwg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4quvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 15:33:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E1FF340051;
	Wed, 28 May 2025 15:31:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 419386CB808;
	Wed, 28 May 2025 15:31:03 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:31:03 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 28 May 2025 15:30:57 +0200
Subject: =?utf-8?q?=5BPATCH_v4_4/9=5D_MAINTAINERS=3A_add_Cl=C3=A9ment_Le_?=
 =?utf-8?q?Goffic_as_STM32_HDP_maintainer?=
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250528-hdp-upstream-v4-4-7e9b3ad2036d@foss.st.com>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
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
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01

Add Clément Le Goffic as STM32 HDP maintainer.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f21f1dabb5fe..c0c30fe00a2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23023,6 +23023,12 @@ F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
 
+ST STM32 HDP PINCTRL DRIVER
+M:	Clément Le Goffic <clement.legoffic@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
+F:	drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
 M:	Alain Volmat <alain.volmat@foss.st.com>

-- 
2.43.0


