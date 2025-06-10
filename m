Return-Path: <linux-gpio+bounces-21249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6FAD3D2F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 282AA3A82F3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C53244E8C;
	Tue, 10 Jun 2025 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="3GdcLlHw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D991242D81;
	Tue, 10 Jun 2025 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568836; cv=none; b=gplkE7Ak5FZGJ3wPrzeFBWG+OPBodzssHgcC5zvs9UUvxG3+Nhvupkv+lqZyHsgPjC8xt56+Tg2xCGW6802x9BZVkvqrLV3iwomaSMyp2ucgk07r7+i8aXPsCpCKPWcuMeDLtCm+nvFm9wlaCFv+kUHek01nmIEPZcfiA4NQTP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568836; c=relaxed/simple;
	bh=vEyxtOvvzT1x/0EKbCpZJLZCj3EO3eMEpcDvabIImyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Teacp5lTQvhapps0qXz3tBObD/O8Dh8HxNef0SJph8hq+rXgye8kmI48JH9mx72DRY6WZyMFW925BhhZIljBSPBQIi8G6KB4vk2cQK1KxZSs4p2jXJoEkeh/d+C9sp4AhqFuJ9gnhlGsbmFVwRi4Haon1rXjtwmOlxSLYLlXeQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=3GdcLlHw; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLErF010654;
	Tue, 10 Jun 2025 17:20:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	B+ZXpV4BuIsMc3QUoJ0VAAjnTmM9QAGHI8YQX/Zc9Mc=; b=3GdcLlHwqjDn8/nX
	UsUWkaCwbz+423zxg2m1fpeHdEeuPN9mxQ/H1VbRRyPDGypTJLYQdl/l5RAzbE4c
	HI6G7eY6J7kwNo8RPCMCVxbJ3KZdq+lMJUHIsvgMlisDc4Kq3GmDtwhveyDWg+vw
	Qx7X3F1XAgnj+M+2BMUyluoFviexxrbh9Pqo9RHuiP9WFd6BdLeZELgqwPOiMusX
	sABfFxhrrk6tD6Qd1Di6AKFcspxaCkQMNYerbA32fOv9h3RcSPwjnsrmmSoBPdbI
	1uy0Z82kVL/M/vebkMgWWvZdHPECwbAYaXbk1f8yhfyYk0L85m7ELM2xS5qBFs5F
	wVSyJQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y053d6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:20:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4472040045;
	Tue, 10 Jun 2025 17:19:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86830AEC934;
	Tue, 10 Jun 2025 17:18:42 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:18:42 +0200
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
Subject: [PATCH v2 1/5] pinctrl: stm32: Handle RSVD pin configuration
Date: Tue, 10 Jun 2025 17:18:33 +0200
Message-ID: <20250610151837.299244-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610151837.299244-1-antonio.borneo@foss.st.com>
References: <20250610151837.299244-1-antonio.borneo@foss.st.com>
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


