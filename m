Return-Path: <linux-gpio+bounces-20666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C139EAC6A93
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 15:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 064D27A2259
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 13:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D96288538;
	Wed, 28 May 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kl814dqG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9691428751D;
	Wed, 28 May 2025 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439201; cv=none; b=mR0vdrmGLZ0SAu9PXgd2ZZuEwbdJU1BPqLSrPz0Si7IN4GARv2iHiVj5BLBA54FEVHnPCunyRtVOZjyl7teSfFZ+7jhjaW75eHxG92440QZJ1RLKHASA2yananRyFE8TE0hTUpGgTTy12HFSDsAcRtLB6F5BFKs5kerkJVaVuko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439201; c=relaxed/simple;
	bh=G4nnRfKUQeHDcQinxtuGQUF6giZzdtMuIKCcHDFpGxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GrE3XyLN4zTmln/YX4iDRQtEPTv1P70lkKvzK6/dwkvaezMwFKaDD69ZbWJMLNI8dScSrxWEZCbXAOrcTfTNx2oC2vHvHQZMMVVkJwX6cPVd6mvCEB+/SO8INbGi9xGMzC+adloOn0MAj6wxDhgZYC8TeqhaJ+L4F6FJo1RHLW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kl814dqG; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SC8uDa028907;
	Wed, 28 May 2025 15:32:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/fb3UPZu5WN39hqyomy18YDn8fBiBvMNblbm+Y5i2po=; b=kl814dqGPeFuSLFL
	npVSgaX618J4kCsu13eiO+jS2rH+UwlnExum79SSgzu8sVDRqxWyh43XzWFvJNaI
	gp3/uJCyBnwk0T3A8g97n+0TSMTKgThX4gdhYb8iNevZ4+h7TzzeQsyXevcrSEAO
	jg2wWKkt/39v95TeHUDp9gyUs+CPJCklub2/iMzG02TOpBxpJBgiRtzdMYIQU14L
	f0tdL9RGS4sFMBULRG4S/EoXeapvNYwM/94/Y9Q2Z+9rDI+iEByJ9YpnB55QKb+m
	dTQeq6ik1qNCphbvI87+g61bskosNsIESA0MnzzVtI0bUAowOuM95AwwMQ7Se4s0
	++t4Gw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3891que-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 15:32:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 14C2F4004F;
	Wed, 28 May 2025 15:31:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 066E06CCECA;
	Wed, 28 May 2025 15:31:01 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:31:00 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 28 May 2025 15:30:54 +0200
Subject: [PATCH v4 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO
 gpiochip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
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

When using bgpio_init with a gpiochip acting as a GPO (output only), the
gpiochip ops `direction_input` was set to `bgpio_simple_dir_in` by
default but we have no input ability.

Adding this flag allows to set a valid ops for the `direction_output`
ops without setting a valid ops for `direction_input` by default.

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
index 4c0294a9104d..42890db9b10e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -749,6 +749,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 #define BGPIOF_NO_SET_ON_INPUT		BIT(6)
 #define BGPIOF_PINCTRL_BACKEND		BIT(7) /* Call pinctrl direction setters */
+#define BGPIOF_NO_INPUT			BIT(8) /* only output */
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,

-- 
2.43.0


