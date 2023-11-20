Return-Path: <linux-gpio+bounces-283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B16C7F1EF4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 22:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDD0A1C209EA
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 21:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DD9381AD;
	Mon, 20 Nov 2023 21:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kDgTZJ3Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98A2132
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:26 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40a5a444c3eso16814845e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515285; x=1701120085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWhOFljLv2/tw5JqGHvGcicw8UKClh7HYTXPWY6KLEs=;
        b=kDgTZJ3YMfUaOLSUt90O20aKXsNI3CoaLiBFkrV0qsOug8DuuwB7bwVVVyWOGHxfIF
         jMi3mCUvYrPLIWYoRef3KUurOOD5hXd6+7vg+s5wWpvGEtX3BeGTlHb3oiC4IfFQ1Rcp
         pJRLVcQvHG0PLDLb3d7p0KfhuFmRDnzEu+WM+fz+jp98vNhMSjjG9ImeEPpA65qxMnV4
         Z3GOswJYD7093V0YeAS5qKmrLNERRHKR2CtsZNnD4PK437+sDWA7u90f9nY4IFx29MWk
         tPh/ATWEXzOmMGU9UBZbpmNyI4pcWcmvWAN4OSPG5ZCDqZEnSrjxGQAXnjrkntXoPZjF
         hpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515285; x=1701120085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWhOFljLv2/tw5JqGHvGcicw8UKClh7HYTXPWY6KLEs=;
        b=w+uMIlBFK2ao2DM8rhUkt+IBDyJkwpfKNSQMTg3+4jkpr2iwWBaNKrg02oDNhFRIku
         GcIDpco+7qcDyk8rk1etVjFnzZaNnyUkCZ+LIq5omD7ISHm+RuXoa5ibnmZQCVXb6X5X
         ib0GZm762vDVEZbNswjOxnDb+6ghjP4UCzVuQgkDh1DutcUVoNUwtYWetSiHQzZmBeRC
         eyz114p8gZ4sNdPkrv4zj1GKRmbEmNQUz+0EYu1x4eSgG8320RvvBb2Qvt0OQogXQOiB
         JtuLH3wNNCVAUMktTKREvFNEQAROlWTuN2WSwGX2r1+QEv78ulEaxkSYc3GNktZYV2Dp
         m3Dg==
X-Gm-Message-State: AOJu0Yxq8DBoqg496qJ2HqmgZVwZfB2Dg3cpj8Rjqn9gLOM9nZ+1YmcK
	Sf+cJgJuhzy8o/hreMjjMPfCGA==
X-Google-Smtp-Source: AGHT+IHBhzwJiJdGsMnmi+3UeGlpsge9ikLJxmjkQ/MBy9ZT8uJesYsVK4+J9uetw5YhNSMaWkl5mg==
X-Received: by 2002:a05:600c:3c86:b0:40a:483f:f858 with SMTP id bg6-20020a05600c3c8600b0040a483ff858mr6175547wmb.6.1700515285140;
        Mon, 20 Nov 2023 13:21:25 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:24 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 12/19] pinctrl: samsung: Add filter selection support for alive banks
Date: Mon, 20 Nov 2023 21:20:30 +0000
Message-ID: <20231120212037.911774-13-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer Exynos SoCs have a filter selection register on alive bank pins.
This allows the selection of a digital or delay filter for each pin. If
the filter selection register is not available then the default filter
(digital) is applied.

On suspend we apply the analog filter to all pins in the bank (as the
digital filter relies on a clock). On resume the digital filter is
reapplied to all pins in the bank. The digital filter is working via
clock and has an adjustable filter delay register bitfield, whereas
the analog filter uses a fixed delay.

The filter determines to what extent signal fluctuations received through
the pad are considered glitches.

The code path can be exercised using
echo mem > /sys/power/state
And then wake the device using a eint gpio

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 89 ++++++++++++++++++++++-
 drivers/pinctrl/samsung/pinctrl-exynos.h  |  7 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h | 22 ++++++
 4 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 6b58ec84e34b..56fc11a1fe2f 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -269,6 +269,71 @@ struct exynos_eint_gpio_save {
 	u32 eint_mask;
 };
 
+/*
+ * Set the desired filter (digital or analog delay) to every pin in
+ * the bank. Note the filter selection bitfield is only found on alive
+ * banks. The filter determines to what extent signal fluctuations
+ * received through the pad are considered glitches.
+ */
+static void exynos_eint_flt_config(struct samsung_pinctrl_drv_data *d,
+				   struct samsung_pin_bank *bank, int filter)
+{
+	unsigned int flt_reg, flt_con = 0;
+	unsigned int val, shift;
+	int i;
+	int loop_cnt;
+
+	/*
+	 * The FLTCON register has the following layout
+	 *
+	 * BitfieldName[PinNum][Bit:Bit]
+	 * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
+	 * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
+	 * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
+	 * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
+	 *
+	 * FLT_EN	0x0 = Disable, 0x1=Enable
+	 * FLT_SEL	0x0 = Delay filter, 0x1 Digital filter
+	 * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1
+	 */
+
+	flt_con |= EXYNOS9_FLTCON_EN;
+
+	if (filter)
+		flt_con |= EXYNOS9_FLTCON_DIGITAL;
+
+	flt_reg = EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
+
+	/*
+	 * If nr_pins > 4, we should set FLTCON0 register fully.
+	 * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
+	 */
+	if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN)
+		loop_cnt = EXYNOS9_FLTCON_NR_PIN;
+	else
+		loop_cnt = bank->nr_pins;
+
+	val = readl(d->virt_base + flt_reg);
+	for (i = 0; i < loop_cnt; i++) {
+		shift = i * EXYNOS9_FLTCON_LEN;
+		val &= ~(EXYNOS9_FLTCON_MASK << shift);
+		val |= (flt_con << shift);
+	}
+	writel(val, d->virt_base + flt_reg);
+
+	/* Loop for FLTCON1 pin 4 ~ 7 */
+	if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN) {
+		loop_cnt = (bank->nr_pins - EXYNOS9_FLTCON_NR_PIN);
+		val = readl(d->virt_base + flt_reg + 0x4);
+		for (i = 0; i < loop_cnt; i++) {
+			shift = i * EXYNOS9_FLTCON_LEN;
+			val &= ~(EXYNOS9_FLTCON_MASK << shift);
+			val |= (flt_con << shift);
+		}
+		writel(val, d->virt_base + flt_reg + 0x4);
+	}
+}
+
 /*
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
@@ -321,6 +386,10 @@ __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 			goto err_domains;
 		}
 
+		/* Set Delay Analog Filter */
+		if (bank->fltcon_type != FLT_DEFAULT)
+			exynos_eint_flt_config(d, bank,
+					       EXYNOS9_FLTCON_DELAY);
 	}
 
 	return 0;
@@ -555,6 +624,11 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		if (bank->eint_type != EINT_TYPE_WKUP)
 			continue;
 
+		/* Set Digital Filter */
+		if (bank->fltcon_type != FLT_DEFAULT)
+			exynos_eint_flt_config(d, bank,
+					       EXYNOS9_FLTCON_DIGITAL);
+
 		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
 					      GFP_KERNEL);
 		if (!bank->irq_chip) {
@@ -658,6 +732,7 @@ static void exynos_pinctrl_suspend_bank(
 void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
 {
 	struct samsung_pin_bank *bank = drvdata->pin_banks;
+	struct samsung_pinctrl_drv_data *d = bank->drvdata;
 	struct exynos_irq_chip *irq_chip = NULL;
 	int i;
 
@@ -665,6 +740,10 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
 		if (bank->eint_type == EINT_TYPE_GPIO)
 			exynos_pinctrl_suspend_bank(drvdata, bank);
 		else if (bank->eint_type == EINT_TYPE_WKUP) {
+			/* Setting Delay (Analog) Filter */
+			if (bank->fltcon_type != FLT_DEFAULT)
+				exynos_eint_flt_config(d, bank,
+						       EXYNOS9_FLTCON_DELAY);
 			if (!irq_chip) {
 				irq_chip = bank->irq_chip;
 				irq_chip->set_eint_wakeup_mask(drvdata,
@@ -707,11 +786,19 @@ static void exynos_pinctrl_resume_bank(
 void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
 {
 	struct samsung_pin_bank *bank = drvdata->pin_banks;
+	struct samsung_pinctrl_drv_data *d = bank->drvdata;
 	int i;
 
 	for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
-		if (bank->eint_type == EINT_TYPE_GPIO)
+		if (bank->eint_type == EINT_TYPE_GPIO) {
 			exynos_pinctrl_resume_bank(drvdata, bank);
+		} else if (bank->eint_type == EINT_TYPE_WKUP ||
+			   bank->eint_type == EINT_TYPE_WKUP_MUX) {
+			/* Set Digital Filter */
+			if (bank->fltcon_type != FLT_DEFAULT)
+				exynos_eint_flt_config(d, bank,
+						       EXYNOS9_FLTCON_DIGITAL);
+		}
 }
 
 static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 3ac52c2cf998..e2799ff1b5e9 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -50,6 +50,13 @@
 
 #define EXYNOS_EINT_MAX_PER_BANK	8
 #define EXYNOS_EINT_NR_WKUP_EINT
+/* EINT filter configuration */
+#define EXYNOS9_FLTCON_EN		BIT(7)
+#define EXYNOS9_FLTCON_DIGITAL		BIT(6)
+#define EXYNOS9_FLTCON_DELAY		(0 << 6)
+#define EXYNOS9_FLTCON_MASK		0xff
+#define EXYNOS9_FLTCON_LEN		8
+#define EXYNOS9_FLTCON_NR_PIN		4
 
 #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
 	{						\
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 79babbb39ced..50c360b4753a 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1105,6 +1105,8 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		bank->eint_func = bdata->eint_func;
 		bank->eint_type = bdata->eint_type;
 		bank->eint_mask = bdata->eint_mask;
+		bank->fltcon_type = bdata->fltcon_type;
+		bank->fltcon_offset = bdata->fltcon_offset;
 		bank->eint_offset = bdata->eint_offset;
 		bank->name = bdata->name;
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 9b3db50adef3..5fab3885a7d7 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -82,6 +82,20 @@ enum eint_type {
 	EINT_TYPE_WKUP_MUX,
 };
 
+/**
+ * enum fltcon_type - filter selection
+ * @FLT_DEFAULT: filter not selectable, default digital filter
+ * @FLT_SELECT: filter selectable (digital or delay)
+ *
+ * Some banks on newer Exynos based SoCs have a selectable filter on alive
+ * banks of 'analog/delay' or 'digital'. If the filter selection register is
+ * not available then the default filter is used (digital).
+ */
+enum fltcon_type {
+	FLT_DEFAULT,
+	FLT_SELECTABLE,
+};
+
 /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
 #define PIN_NAME_LENGTH	10
 
@@ -122,6 +136,8 @@ struct samsung_pin_bank_type {
  * @eint_type: type of the external interrupt supported by the bank.
  * @eint_mask: bit mask of pins which support EINT function.
  * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
+ * @fltcon_type: whether the filter (delay/digital) is selectable
+ * @fltcon_offset: SoC-specific EINT filter control register offset of bank.
  * @name: name to be prefixed for each pin in this pin bank.
  */
 struct samsung_pin_bank_data {
@@ -133,6 +149,8 @@ struct samsung_pin_bank_data {
 	enum eint_type	eint_type;
 	u32		eint_mask;
 	u32		eint_offset;
+	enum fltcon_type fltcon_type;
+	u32		fltcon_offset;
 	const char	*name;
 };
 
@@ -147,6 +165,8 @@ struct samsung_pin_bank_data {
  * @eint_type: type of the external interrupt supported by the bank.
  * @eint_mask: bit mask of pins which support EINT function.
  * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
+ * @fltcon_type: whether the filter (delay/digital) is selectable
+ * @fltcon_offset: SoC-specific EINT filter control register offset of bank.
  * @name: name to be prefixed for each pin in this pin bank.
  * @id: id of the bank, propagated to the pin range.
  * @pin_base: starting pin number of the bank.
@@ -170,6 +190,8 @@ struct samsung_pin_bank {
 	enum eint_type	eint_type;
 	u32		eint_mask;
 	u32		eint_offset;
+	enum fltcon_type fltcon_type;
+	u32		fltcon_offset;
 	const char	*name;
 	u32		id;
 
-- 
2.43.0.rc1.413.gea7ed67945-goog


