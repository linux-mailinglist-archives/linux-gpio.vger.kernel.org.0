Return-Path: <linux-gpio+bounces-21518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CDAD8931
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 067967A6D70
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 10:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D272D5C7E;
	Fri, 13 Jun 2025 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="t+zAykKv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C18D279DD6;
	Fri, 13 Jun 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809791; cv=none; b=RjqsqSph2zVVk/3X9ymae1yuTy6xX9sluZh1rrurKIKbFbbmZ1lWbr0CzGrYNnlauRyTiZt/jelKnWm/mgcvhvYYCYHVOAmYMxvh866wfDoGsbFIRC96zzCVQXZmtBCv78dDU6c+oNPElhsnQo3zRjOnsyMei60xzAxifAWGZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809791; c=relaxed/simple;
	bh=EDdF/5KCBoEdY5LAVwQHmTWg/mrwYpI5r+cO/zdDYIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SE3xRIUz766jiuvCfBGBYFeZ/OrTNLG4Lsu9eQG7EFxSsjufIWfaazS6NmzOD3yJ29Qq0GSmU1IdXVzeUgWLH670Oo4je3G4zc+PMG4BoyxJsaztIheVYFxAMPB/ghKYrhSbGqb9jQ5v0nLIEyqcWtBpdVe9tQBm7Sb15XckpyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=t+zAykKv; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D7c4F6008338;
	Fri, 13 Jun 2025 12:16:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZMyyj5buSxftlccdSeuM3libTxcs3x9i/7d96dILmVM=; b=t+zAykKv3En48ZF5
	XcPFD221B7uMJCV8s2FBGNAWIRMt1RtxWnX0gHG9Kk7Y+mkuxxHPFieXC5TIZ2eS
	fS4P+Ufo0XKac7groNILF6jQEw7UMuyt99vz1zQWUmzvXcWITTe7YUITaEEobGdV
	6pZav/9ciVGkNwiDw8RjAcBBHqhe+N0kdqVwQ8Q2TRAA73o5xTLFv0nqqOHV6KiA
	TQHTaIEdmeipO1KWlg93oCsrRPXLsm4icF6sdh1CIWp0rQeG2if5dtszqJk+fLvz
	B0Zl8dQVx9cyQsZ6jt73C1GdqtZy/JaPGGksV+n4qKaIJBMjb/pWZpQT4Pcd4/fE
	5BpqAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumwhuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 12:16:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CFCC640057;
	Fri, 13 Jun 2025 12:15:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 208F2210235;
	Fri, 13 Jun 2025 12:14:18 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:14:17 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 13 Jun 2025 12:14:12 +0200
Subject: [PATCH v5 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO
 gpiochip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250613-hdp-upstream-v5-1-6fd6f0dc527c@foss.st.com>
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

When using bgpio_init with a gpiochip acting as a GPO (output only), the
gpiochip ops `direction_input` was set to `bgpio_simple_dir_in` by
default but we have no input ability.

Adding this flag allows to set a valid ops for the `direction_output`
ops without setting a valid ops for `direction_input` by default.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/gpio/gpio-mmio.c    | 11 ++++++++++-
 include/linux/gpio/driver.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 4841e4ebe7a6..09b9e1275e7e 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -335,6 +335,11 @@ static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_ou
 		return pinctrl_gpio_direction_input(gc, gpio);
 }
 
+static int bgpio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
+{
+	return -EINVAL;
+}
+
 static int bgpio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	return bgpio_dir_return(gc, gpio, false);
@@ -566,7 +571,11 @@ static int bgpio_setup_direction(struct gpio_chip *gc,
 			gc->direction_output = bgpio_dir_out_err;
 		else
 			gc->direction_output = bgpio_simple_dir_out;
-		gc->direction_input = bgpio_simple_dir_in;
+
+		if (flags & BGPIOF_NO_INPUT)
+			gc->direction_input = bgpio_dir_in_err;
+		else
+			gc->direction_input = bgpio_simple_dir_in;
 	}
 
 	return 0;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b53233051bee..97cc75623261 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -750,6 +750,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 #define BGPIOF_NO_SET_ON_INPUT		BIT(6)
 #define BGPIOF_PINCTRL_BACKEND		BIT(7) /* Call pinctrl direction setters */
+#define BGPIOF_NO_INPUT			BIT(8) /* only output */
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,

-- 
2.43.0


