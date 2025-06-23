Return-Path: <linux-gpio+bounces-21985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341CBAE36F8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE81C1718F3
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5F320408A;
	Mon, 23 Jun 2025 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Rd3Wt/Th"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622961F7580;
	Mon, 23 Jun 2025 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663976; cv=none; b=ks67LiA2la2VlmuJw0juXpKGlvvUKb2XhhNDa6PBFkW1F3F6DXErFndLEnPCldjf8Y0rr4oeyMPOgZpk9XnJP4BIW1gQZw1fpwL4dNLqJjODdQnR3ODtCc8yGthWEiQD9vv4WpMAeROArT2mqAXoDP0ryXWwKxAL3tm6BM5wfHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663976; c=relaxed/simple;
	bh=1m5OnnxjWL9VN+wtnRzuA+rlHA6x1D626ue2vnZfXyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UFQRkciZ7/jEgrRdLerURMnL2dEKFRcZ2vExSCWsglThWvlO2vKNR/IbcBGFrPsOBTMVZoaDI7sqRCaK02ftngk3WQsAjB00xG2hKnh3PXZWC5g3IkeEIsHT7j7q3uj+AQAOPKx5DxWgxkUCG0BbKvV7pCiK9pgnt8TJNjeDIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Rd3Wt/Th; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N5NbDc016501;
	Mon, 23 Jun 2025 09:32:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	bdfof7YVHPqqVJskqcp8Mb6z68TEM/cVCbIwTuZD4YU=; b=Rd3Wt/ThdNvCV5K3
	Yl3NsW8IsJA2RKKJT1xL9OCVDGEfIwRcLR9CMYMT28jNbUlwrKZB/yC9evK/WPX1
	Kkdl2nMClijS9DuzJM44QZ3Zo3RW66z707vRzaLU5xCVdGJJ85BsPt7znm2+spLs
	hYHEDz2msv/BBGyrfgrHsFgHh/6rieyotldixKIBtSRo5T36+fhRa4mrHVkZCCnk
	ZLx8grgk2SXKU/G9IjalCKICwQcsaXAdaBQagWVsJVDs2Mt2JPffJoJJGLhXPu+V
	Pj+3lmBX7GV6wpzWk0gWWo/3DOYBVcXF5x37Zd5cHGo1xnKgAWqMkQgLvISEyCGY
	7vvpaQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5ner7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 09:32:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 58E0F4004C;
	Mon, 23 Jun 2025 09:31:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7582B54BB9;
	Mon, 23 Jun 2025 09:29:43 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 09:29:43 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 09:29:13 +0200
Subject: =?utf-8?q?=5BPATCH_v6_3/8=5D_MAINTAINERS=3A_add_Cl=C3=A9ment_Le_?=
 =?utf-8?q?Goffic_as_STM32_HDP_maintainer?=
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250623-hdp-upstream-v6-3-387536f08398@foss.st.com>
References: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
In-Reply-To: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01

Add Clément Le Goffic as STM32 HDP maintainer.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8afc99d4284d..b65ee4f24a14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23460,6 +23460,12 @@ F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
 
+ST STM32 HDP PINCTRL DRIVER
+M:	Clément Le Goffic <clement.legoffic@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
+F:	drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
 M:	Alain Volmat <alain.volmat@foss.st.com>

-- 
2.43.0


