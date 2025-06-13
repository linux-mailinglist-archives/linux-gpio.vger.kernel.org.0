Return-Path: <linux-gpio+bounces-21515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DCAD8938
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D366C189E744
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 10:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638F42D23A9;
	Fri, 13 Jun 2025 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="puUEx0e5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97C2DA74A;
	Fri, 13 Jun 2025 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809790; cv=none; b=EMTCSaV+Nn7c+JX/BZZtvvnwMrR4pQpDrgPgyYYTJ3OIQFbkTrMuCIkZGkt9CabtG36Ux7xgPjry7Nc4pDW5gbFLgTkqh0Xazvbd18fLnJPXWjGTBETVC5+EDwj9Y3JtfyOheY7KoPzQzj7GhcAYPBcFoiY2Mg9nGmwxS9f5TyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809790; c=relaxed/simple;
	bh=P8a+DcLfMOt2qJJBryEw3cxweFZmrrMySmHyPB0vk8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JoRpKQdxxo1fOgeEtoe2sM1s49qZ1IYQnwP4B5YT2HDYVwm6EXVuckDLqjkArHnMDqj+ADzgocv7Q6u2vKUQpLdQjShGX/wcRjBfoWrrT+hNNsDNauj8xb7nHbjmV+AMC3kipt2nbM6Beq2RNYBYRDX9kYCC5Di+B2mAy2Y+z+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=puUEx0e5; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D7RvmI004643;
	Fri, 13 Jun 2025 12:16:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZTQBEKKpUKJ2EHlkrbcRSsrVXSaMIyD8QzSmT3bFAXA=; b=puUEx0e5d/GgZE1e
	6ZSt9DLF57Swr/ukU04ixc5+t85JSOMXJVsW2EkIIVFwoEMTbav75SCuwOFGL8Ep
	OwFsCArB3c1vXe0TA3K8kO3+9lWv+yU1T01jvg2Jfpml0Vi07lpoBC6sp+7B6z7I
	OkMmECdikBoGGpRKQOohsdRkw2XoL00c15v4pYlGKXNeuO9r3yFXBbt0w0TRieSm
	Fgx+Ln4wF4DBIXAfc+tXmqyjaiYzy8KowD1B+K31EluH39zY+E/VlYBnbdDfZrf0
	/1swET6cy+dkc5wcpm5mA5wUFLuDnKuSN5c1piGz3a8Irww7OhA4GD8ZgqLeXiP7
	5ZQqbA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y05jqrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 12:16:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE30240066;
	Fri, 13 Jun 2025 12:15:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16A9038C452;
	Fri, 13 Jun 2025 12:14:24 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:14:23 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 13 Jun 2025 12:14:20 +0200
Subject: [PATCH v5 9/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp157c-dk2 board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250613-hdp-upstream-v5-9-6fd6f0dc527c@foss.st.com>
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
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
X-Mailer: b4 0.15-dev-0537a
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01

On the stm32mp157fc-dk2 board, we can observe the hdp GPOVAL function on
SoC pin E13 accessible on the pin 5 on the Arduino connector CN13.
Add the relevant configuration but keep it disabled as it's used for
debug only.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 1b34fbe10b4f..a6ae6ca14cdc 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -63,6 +63,12 @@ &dsi_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&hdp {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&hdp2_gpo &hdp2_pins_a>;
+	pinctrl-1 = <&hdp2_sleep_pins_a>;
+};
+
 &i2c1 {
 	touchscreen@38 {
 		compatible = "focaltech,ft6236";

-- 
2.43.0


