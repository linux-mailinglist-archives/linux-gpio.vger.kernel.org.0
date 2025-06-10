Return-Path: <linux-gpio+bounces-21255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2DAAD3D4C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE4C717D2CE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BB02517AA;
	Tue, 10 Jun 2025 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="vOrEkKb/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B512441A6;
	Tue, 10 Jun 2025 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569098; cv=none; b=ep8LT+mWegF3DNJ9H9MHbx62TRJ+6npMTu2QZxaKC6hHKe1bPqRNSsB0Zi3Vz4bzsm7Tyx/gQrL0v+3zDUp1ubqY9DHm5pml0j0xu9r6a1gKDYJSo+AG1r7UJD4ao09Mloe+6f5BWugLsW0o1GU3YxGMU2so+KDZptowQJhVEBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569098; c=relaxed/simple;
	bh=vEyxtOvvzT1x/0EKbCpZJLZCj3EO3eMEpcDvabIImyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDRYuV00Ib6oPFz2z7GQm8RcWkk9MuJcx4pZzUyInuHPhlIyDZhvZW+XxlJAVBIr57vgzK/YAzmZLQ5Z2OyY/Fu/j3MmXtPdRbu+f5DXmLOivGAxTIpVM4LPHaGH6ChGWepps4ZKN8qPb4HIdHWe5Ho5HWW4yCjHOCR307G5CxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=vOrEkKb/; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AF1VY0031553;
	Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	B+ZXpV4BuIsMc3QUoJ0VAAjnTmM9QAGHI8YQX/Zc9Mc=; b=vOrEkKb/p3NVqL6F
	6jH1eya55lRO3KyQR+wQ27u5KZTW9PWzO8ifrfzUfnm4n9oaGVol3Jx0YLxxruO3
	YanbSukWtX8lbpAhn2QnE8y2ovHqDmGyjMqmcTCyVbVNP8ovwXNn8AsTUDd1luO6
	rU3ue/YiqjpMaxVcwZZKgrJsMi4M3WG/iuuDlBfrrd6Hqk+xZrXxGPEykdvq7smY
	/+o0xnHn7kD5iHO7yRpl4Vn7nQsznuRcqKKOEnoB+2hdWkoFcXW587fdUucEvBlN
	0R6rOSKSBffWRIAXd1SOlLWX+imdhX25rE4C2MZ2frbnNHcLyzZlfM4SGz41slAV
	uSoUUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y053dsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 28BCC40044;
	Tue, 10 Jun 2025 17:23:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6844BB79BB9;
	Tue, 10 Jun 2025 17:23:13 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:23:13 +0200
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
Subject: [RESEND PATCH v2 1/5] pinctrl: stm32: Handle RSVD pin configuration
Date: Tue, 10 Jun 2025 17:23:05 +0200
Message-ID: <20250610152309.299438-2-antonio.borneo@foss.st.com>
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

From: Fabien Dessenne <fabien.dessenne@foss.st.com>

When a pin is assigned to a coprocessor not running Linux, the pin
should be flagged in the DT as reserved and not usable by Linux.

Add pin configuration RSVD (Reserved) and instrument the driver to
not update the mux setting.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 9 +++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ba49d48c3a1d1..e0c85f55557af 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -77,6 +77,7 @@ static const char * const stm32_gpio_functions[] = {
 	"af8", "af9", "af10",
 	"af11", "af12", "af13",
 	"af14", "af15", "analog",
+	"reserved",
 };
 
 struct stm32_pinctrl_group {
@@ -541,6 +542,9 @@ static bool stm32_pctrl_is_function_valid(struct stm32_pinctrl *pctl,
 		if (pin->pin.number != pin_num)
 			continue;
 
+		if (fnum == STM32_PIN_RSVD)
+			return true;
+
 		for (k = 0; k < STM32_CONFIG_NUM; k++) {
 			if (func->num == fnum)
 				return true;
@@ -841,6 +845,11 @@ static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
+	if (function == STM32_PIN_RSVD) {
+		dev_dbg(pctl->dev, "Reserved pins, skipping HW update.\n");
+		return 0;
+	}
+
 	bank = gpiochip_get_data(range->gc);
 	pin = stm32_gpio_pin(g->pin);
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 5e5de92ddd58c..8a1c9570b078f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -17,7 +17,8 @@
 #define STM32_PIN_GPIO		0
 #define STM32_PIN_AF(x)		((x) + 1)
 #define STM32_PIN_ANALOG	(STM32_PIN_AF(15) + 1)
-#define STM32_CONFIG_NUM	(STM32_PIN_ANALOG + 1)
+#define STM32_PIN_RSVD		(STM32_PIN_ANALOG + 1)
+#define STM32_CONFIG_NUM	(STM32_PIN_RSVD + 1)
 
 /*  package information */
 #define STM32MP_PKG_AA		BIT(0)
-- 
2.34.1


