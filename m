Return-Path: <linux-gpio+bounces-17515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F78A5E6F2
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 23:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD960189C25B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 22:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5412A1F1518;
	Wed, 12 Mar 2025 21:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOjC99r7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99411F0E5D
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741816781; cv=none; b=b9irY8VPpINrDQpDc35wOerjWSKD1pLbbCH67JmAcRrZlIQUSp7ZodRSRPhx070jXNLfnXRnA466jyeWW9tGMXtuQyfEyJ2J7xIijc446GqrMn2j/2euRzCHgd0INmSMUAYfcwcD7rWjlSKvUIYix4/8ISpQW5f7bT9EHHnsxwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741816781; c=relaxed/simple;
	bh=SkBbnPsVX15wtHtN6iY5cx+NaOV7n4YOhSv2f1BtU64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fV1473Zqx3Jek5JA/1Ce/35kSUGhHm4UmMB6P61wC0cuqIWOZX5QlQSEn7tE9vd2QW45nBoqd0zqzOKHx6HCR2pjjHw7prOJSIO/inVOmqtjMgT8tyKRs+cDZXJDX9a4zc4CSAc2slPDK7FNrgGr2dCVrGJziA5pmut1SwR/wNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOjC99r7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso2252885e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741816777; x=1742421577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hewRn4TFzt6guGzWgtaUCJe9z9aGdKj5SqHFjFZfBSM=;
        b=xOjC99r7GSZouOd84cH/GlT8XloOb3QGlil2gotkcj5Eb0spEi5o62Zgw/+uPFziGa
         c5KBNbqrvSabIBup4AtD4b+Z3wbOwiknDk1Gi6nmFYMnCwolr61YCQCzv667LM6dtMKu
         zJXbGUOguAv15vlL8BwX/IUUCE7/6/2EpRAlhNbhCcJ5VMrc2OG5hxELr3vGhslI2Rr8
         kJh1Xil61ow0zwlJOymQ+LPiPsq7J2Qq7dMeVjgezchMxC+lKhP17OjWXEL7PXjjJI/5
         lFw72lEQVos6LHulDJH3PcpMPdQlvyd9Mj+awlju4okoG8DnrrKoUvmtL2nLCUWrw6rN
         23vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741816777; x=1742421577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hewRn4TFzt6guGzWgtaUCJe9z9aGdKj5SqHFjFZfBSM=;
        b=uwx4eeTdTD/QfeLvIwrZlRc3wDd/fotizTHLeSvWr6XvRbC5OwhfasCGsfg4Rdgt7S
         6xO/W/fPga/E5KSf1Ggp26XpqETN0wmvx8VPk1p0tbBzlw4iDp/5KBxp5NRoYAuqXdVp
         rNorj4cc4u8VR/ZT7CJmZrs0v5Wq/AU2T5x3/3TOvLQ7aehDuLV81C8FchAGpUNjAmNF
         9WRT4qtb+Opg5dcbTf+fZ/wGfkDpcSCAdvX+8GQFhZ56MG9xQbpqhXEGlpgbfSSSKT8Q
         nQP6mveGeLZNlzDXG0UIDY1jescOOJS3m49jm/10y1jV768tQLtClvmod0ojVu88pmVa
         vBCg==
X-Forwarded-Encrypted: i=1; AJvYcCX3sNMlBeYJSBVWai27bHXDWaXON6fFLf8td9qY8CBAn24av1T9WTnwhMU3OaSCofmTOmh97C1VtSVw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0MiLeszyF459gurMadrTXcpPSG5efGdLd37vJ4faKxkdiMZyn
	iNaKSUhfgCZRTibOnECrmIJH6MVWRzr6OAsPTUNlg6ZRd4yCw8/zAuAA1GCfEvI=
X-Gm-Gg: ASbGncsKhpZOra5Ps3vQeSDrFgW5wqTetkpfdGQUJT00ycaV4LwPCOMD/EbYyKqesvj
	Hn4TQ1CXMSXu+5YbIwhJJ6SH7v5yxcAej7+scAh96ohWyiJUULmK+eGtDYxXd8Xym/rWe0O6L9u
	mXyPpw17UhVnNduAPVPU2X8IvNc46ZqsgBv3vYD5ZI3ombKwC5Jgp4oL4TsqmAVM+RQgvT27Jqk
	Mn0ZeMxjxngPrFlORv2lYa7isz6bJxb4nxm7JlKmyrbgLsIhJndeXqFTbEorFqfbzFTc029fG8j
	6XJuLXfNi2M2pJT8A/79RynwxnXtlgGUXlO93j7VdfH+GGHyln728YKZFPjAM51loumtQWqdCz9
	b
X-Google-Smtp-Source: AGHT+IErrW6KaUE3r0yNKle6RE9MujQTtaEPJ6L13qcJhERWA4il9AORO6vfqZfpXrdKRD87xfLXxA==
X-Received: by 2002:a05:600c:4ed1:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-43ce7ae4df2mr142086825e9.1.1741816777079;
        Wed, 12 Mar 2025 14:59:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188bb34asm110175e9.18.2025.03.12.14.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 14:59:36 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 21:59:02 +0000
Subject: [PATCH v5 5/5] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250312-pinctrl-fltcon-suspend-v5-5-d98d5b271242@linaro.org>
References: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
In-Reply-To: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5535;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=SkBbnPsVX15wtHtN6iY5cx+NaOV7n4YOhSv2f1BtU64=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn0gO+PsQliP2TZVr6zz3elNKIi9ZDEuphHGwft
 9qY8fm0lriJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9IDvgAKCRDO6LjWAjRy
 uriQD/sFGSrrlBo4k9ymB93PltMTCcgETREBPLXAP5zK5ADUpQfeU3gY34DvflTL9PYlTw5UTlB
 yb0lvAy/BKiZ9lNfJJwxwI8dEnNQHz6LBDqSGW6rb5wzA0vQ25sa71+tygTSJhJyCyEphpyz2u0
 Nv9vBYCyzTusptmyNnGcnYP5KR90weJubvTaiBisuFDqZTy7KRYuYHXy5k0JAclgpXpKSIFl809
 o77xypJB7Y/mkxK9x9f3jKdGcdlMXh+9aEDwzL153/Q/pV9driNFZ8lQGtHHWcMxOSVrVhYTXsE
 pCjChZTUTh7eI0RokedEJVs/Y4jmHy/o5DPEpD2mBYpFxefK+Fv7N46dfDKtntHpaU2i6DpzMRe
 oIPJGKjU2X7YBZxMRVVF+HKWr5EsmsLrV3yKarvgH5NAa087UU7oeKRoveOYsG6tlP0+PR+12pF
 3CBqP2eMlB9cBlpaF1+jHUqVlv8RiX3X4iUIHzEgNVVl5bdygiKfp0iZX87AcXI2QZUVYnp1kDF
 rU62K7K6X4mZF4nwKkGXFBbKuT9SDKq+KqL2aRRYpkmR5MZA9woVgD1QRbkELy05Cb9ZfHZ6DVh
 02UFesU5aI9p2Dbo91xijRLvbMoIp7yGyXy2wZ3n4C4PB1QFsdTXWgVpXY0WtXSd0RH5osakIs4
 L5PQLKOLch2Q1og==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Newer Exynos based SoCs have a filter selection bitfield in the filter
configuration registers on alive bank pins. This allows the selection of
a digital or analog delay filter for each pin. Add support for selecting
and enabling the filter.

On suspend we set the analog filter to all pins in the bank (as the
digital filter relies on a clock). On resume the digital filter is
reapplied to all pins in the bank. The digital filter is working via
a clock and has an adjustable filter delay flt_width bitfield, whereas
the analog filter uses a fixed delay.

The filter determines to what extent signal fluctuations received through
the pad are considered glitches.

The code path can be exercised using
echo mem > /sys/power/state
And then wake the device using a eint gpio

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---

Changes since v2:
* Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
* Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)

Changes since v1:
* Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
* Move filter config comment to header (Andre)
* Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
* Remove misleading old comment (Andre)
* Refactor exynos_eint_update_flt_reg() into a loop (Andre)

Note: this patch was previously sent as part of the initial gs101/ Pixel 6
series and was dropped in v6. This new version incorporates the review
feedback from Sam Protsenko here in v5.

Link: https://lore.kernel.org/all/20231201160925.3136868-1-peter.griffin@linaro.org/T/#m79ced98939e895c840d812c8b4c2b3f33ce604c8

Changes since previous version
* Drop fltcon_type enum and use bool eint_flt_selectable (Sam)
* Refactor and add exynos_eint_update_flt_reg() (Sam)
* Rename function to exynos_eint_set_filter() for easier readability (Sam)
* Remove comments and `if bank->fltcon_type != FLT_DEFAULT)` checks and indentation (Sam)
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 34 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h | 20 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 7887fd41665111d7c4b47e2d74f4e6e335914915..41de39767a3e09a6b1cb446aeec48552546a98a3 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -369,6 +369,37 @@ struct exynos_eint_gpio_save {
 	u32 eint_mask;
 };
 
+static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int con)
+{
+	unsigned int val, shift;
+	int i;
+
+	val = readl(reg);
+	for (i = 0; i < cnt; i++) {
+		shift = i * EXYNOS_FLTCON_LEN;
+		val &= ~(EXYNOS_FLTCON_DIGITAL << shift);
+		val |= con << shift;
+	}
+	writel(val, reg);
+}
+
+/*
+ * Set the desired filter (digital or analog delay) and enable it to
+ * every pin in the bank. Note the filter selection bitfield is only
+ * found on alive banks. The filter determines to what extent signal
+ * fluctuations received through the pad are considered glitches.
+ */
+static void exynos_eint_set_filter(struct samsung_pin_bank *bank, int filter)
+{
+	unsigned int off = EXYNOS_GPIO_EFLTCON_OFFSET + bank->eint_fltcon_offset;
+	void __iomem *reg = bank->drvdata->virt_base + off;
+	unsigned int con = EXYNOS_FLTCON_EN | filter;
+
+	for (int n = 0; n < bank->nr_pins; n += 4)
+		exynos_eint_update_flt_reg(reg + n,
+					   min(bank->nr_pins - n, 4), con);
+}
+
 /*
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
@@ -831,6 +862,7 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
 			 bank->name, save->eint_mask);
 	} else if (bank->eint_type == EINT_TYPE_WKUP) {
 		exynos_set_wakeup(bank);
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_ANALOG);
 	}
 }
 
@@ -886,6 +918,8 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
 			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
 		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 		       + bank->eint_offset);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);
 	}
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 773f161a82a38cbaad05fcbc09a936300f5c7595..66acbd08d3445ca6ee7358d3c4a6cb2be5d82842 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -52,6 +52,26 @@
 #define EXYNOS_EINT_MAX_PER_BANK	8
 #define EXYNOS_EINT_NR_WKUP_EINT
 
+/*
+ * EINT filter configuration register (on alive banks) has
+ * the following layout.
+ *
+ * BitfieldName[PinNum][Bit:Bit]
+ * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
+ * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
+ * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
+ * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
+ *
+ * FLT_EN	0x0 = Disable, 0x1=Enable
+ * FLT_SEL	0x0 = Analog delay filter, 0x1 Digital filter (clock count)
+ * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1
+ */
+
+#define EXYNOS_FLTCON_EN		BIT(7)
+#define EXYNOS_FLTCON_DIGITAL		BIT(6)
+#define EXYNOS_FLTCON_ANALOG		(0 << 6)
+#define EXYNOS_FLTCON_LEN		8
+
 #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
 	{						\
 		.type		= &bank_type_off,	\

-- 
2.49.0.rc1.451.g8f38331e32-goog


