Return-Path: <linux-gpio+bounces-17179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D9A557AA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 21:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FD9616716D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 20:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AAF279334;
	Thu,  6 Mar 2025 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVU6z45i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA2B278150
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293793; cv=none; b=q0vzm/22VbmuI6VU7N+M9ARngQ+H/9QFayWXKV5fCQixWpJv6JVZvwiQRwCWLjTXFShMlcC4WiDaN89Db2+OSfbZxuxTj7/PrIDr9UGjwii7QNFljEttGtTKCJeKfz0XqSrUvJWJK5/fDXZtRAxKfLSBLoxXY5B+2wNGF2oxFDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293793; c=relaxed/simple;
	bh=AamfFD2BRSllOH2t+3HFL8aEOK6cAWC0xj27tH28/zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFUF3AzVD57g7QwZ+YBD6dZJMJL1FRa/N916lAfoRe2gLnYvQqEEIJIzG9wyxa6j/UkjlR+n6nxjfqFbEQJOUTJLFUQ6vazYjQKaOKtTP0481axtuFG3JSuxmST6hm8gvGRnqtXldXXIenzEvNw8y00lkFMSjFDwc4we/0qAIrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVU6z45i; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39127512371so803129f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 12:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741293788; x=1741898588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fem2BHJ56Zg047K6qtXL+URWCBpvNsPCC9PMf7iwoqY=;
        b=lVU6z45ikXYeqpXzSrmAXQDt/jBu14hrJGlzy24hJctpnWBiOHc13kAKAboX2pCzwW
         ce9PILSU4oIhQdNbVYHNQ7AtxpVa0MUNqcDzrLPKTlQmrlaSBBcPzPrNle6ysBU274WG
         /xEdZjd5+U2t2zgXordznhPPz/Om/JhvTbVRzEK8l6RBAdg/K0Y/HPaIO2lEOlIAqh1G
         uZNM5igXSjqLRh42O5zi9gebX40ZiKtDeHffYS4mSUO7H4f7gDejtDmAOuIZNFcGRE2T
         GrAjbfAkXDUQaysTXP8UV+oJ6D7hrYqmt+ohUQ5KU0M4H8wSK73olVUChHxWu1r58Zpu
         XhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293788; x=1741898588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fem2BHJ56Zg047K6qtXL+URWCBpvNsPCC9PMf7iwoqY=;
        b=IqFymmyaiW5GWvnxyaCAD5vNnQex9a2TdHLGvhA3osuGZjIIv9IImIEd2ELwXnEioF
         Ly2SFwS0Beb/Cs6KR1F8j7S5M5ZyhiEcwlkV0+qHQDujn5jqMz9AZnIjrG9MOURRIWbl
         eJF+yRpTobJoR4FblIm/zPY1sGhJ1DMb6JXWSkiz23CiZQhGvo2LRHFDB9yDROWohDhm
         tX2Ghw2cXkyPlirLTWLeumnmJ5qGpywj9gEzKmT1cgRHMyL+TihIx1uRgR//g1HdP+bB
         HO/xnPE+Pesob7qyc5UsyR+1gV6zr5Dnr/fJ0mqtx748RSlmzh6NQEOVoYluw0DVMhhs
         8qHg==
X-Forwarded-Encrypted: i=1; AJvYcCUav9yCjsOReLUDs2yHUyJ8hv1296e3o7LtTGzb/T2nLodzM0olICvFGZNYo2hkm4TeWjBNt67TDahi@vger.kernel.org
X-Gm-Message-State: AOJu0YydLVehZQrIXiyu/g82YESM7OyMKfrYuDrsUxW+a7lwLP3nXuFP
	VUG2K1rZvg6df9kp8HJRqmyvrx0oNLSeiwTeRpPerMZXEoG5cNZGhYORCg7Jl1w=
X-Gm-Gg: ASbGncuvdNz5CbEZ+eNscVd6nxbwjNV/Oh41lzqgefk2DpNtoOVl9SqEMrb2wRwXEbx
	Hhw8xhLC2bz88IG3aJbD0btTIHpqu9enmbE9I41puoWJDvqyqpr9PP3dtoicP+YuCm7sMEji/yk
	RbAMS1SdKgmNEm5zBxsMsKCq/UabYNvaIO3OeqZLX350hQoOWjqpbvKbU95nh3WnVslmPlbsKNB
	wmrSAjdHiMPNG7vC8wAGFmoq/zF2UgJH90Fdnus+P21vGaEP31UNNpHwlKhz9J6ERpJN2/BvUHA
	/Qu9XKFw+SCt+Cpk6ly/bqh51H35jK8t8bKgvpqYI1Yf9FlCV5PEsfmQ76kPztO07gw7mYiHFpU
	=
X-Google-Smtp-Source: AGHT+IHrEeyZfY9AxpVM023cb5jmtDaJMaJBllSguHY5Co+8WkZqWGk8TEfsF2KY220yHb4QBK80CA==
X-Received: by 2002:a5d:47a2:0:b0:38f:28dc:db58 with SMTP id ffacd0b85a97d-39132d66aecmr438953f8f.10.1741293788547;
        Thu, 06 Mar 2025 12:43:08 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm30081715e9.33.2025.03.06.12.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:43:08 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 06 Mar 2025 20:42:38 +0000
Subject: [PATCH v3 4/4] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-pinctrl-fltcon-suspend-v3-4-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5693;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=AamfFD2BRSllOH2t+3HFL8aEOK6cAWC0xj27tH28/zs=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnygjTd1L6tDY6tRfMy0W1Arkbde2BmYW/fNK57
 3LRpgrGNY+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8oI0wAKCRDO6LjWAjRy
 ustdD/9DYc5Hd2mErlBUZrqIzZpcf+Q0IYKa0auc+0N87j/47bOmaMPx1hEu0GSshAnlowCjF7t
 61QDuP1Nr9Eoib8h+icCOG0QiA5vH7eQl7C1/qh56hxP+c831MkFjzTUsusftjriFZl7wzLSMHf
 m6qJB65lCvM1aWVqBd9j9LYs8EYDxSeO7WMr42P3TqU6k0D5gRN2RcHNetdqnkehHhPKLXna/Vw
 UjKfGET2XoIsSGHpB96dTcnaCRgnCIExBYg5guwlMXYGpZrVKinAEzd38U/zKlNbY9aAtZS+s9z
 CRRVhRDeK1VX3P4s4+D1YQrvfAKD5TYZMLhxlJ8vC5XWhqYpxi4rRNvR2K+l5iG9r1EbU0sbeGU
 n86EPTTH94NCpkZ/UYPeIZrNqI1c/8dcjXNBD3IpcgIUpRmIGFgrkogIpQptIc/kzGdNbbBY1Y6
 1gKWbtVVz2nKIrvd0Kt2LMrOa32cjYoP7KbuPq36q2jeus2t9cra0Bdb2cPbdPl/BwquIzfId8A
 O2NIp4jqEnBVc6+Djh1M//DsbyTOD+6cjaaFax9bfP0vXWBDtqQ2A0k4VNkiDAgIMpR2cwqp7l0
 w1d4AFBRUI9lXQjg7n1vDBmFk5qnH46qchc+oRmcPuXXppTzfZTlEzA4MiiCDSBKXYFs7XWWwNo
 hrak8vzTgUVOlQA==
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
 drivers/pinctrl/samsung/pinctrl-exynos.c | 37 +++++++++++++++++++++++++++++++-
 drivers/pinctrl/samsung/pinctrl-exynos.h | 20 +++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 9cffbe9ee64aa5236026978ac2466b709da5bffc..1176efc0ef0464d1a6fc70b0a04f5ddd73ef88a4 100644
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
@@ -828,8 +859,10 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
 				 bank->name, save->eint_fltcon1);
 		pr_debug("%s: save    mask %#010x\n",
 			 bank->name, save->eint_mask);
-	} else if (bank->eint_type == EINT_TYPE_WKUP)
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
 		exynos_set_wakeup(bank);
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_ANALOG);
+	}
 }
 
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
@@ -883,6 +916,8 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
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
2.49.0.rc0.332.g42c0ae87b1-goog


