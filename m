Return-Path: <linux-gpio+bounces-16065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA20A36DC8
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 12:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA6631894810
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 11:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1451D5ABF;
	Sat, 15 Feb 2025 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXXHCQYP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8021C7009;
	Sat, 15 Feb 2025 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739619192; cv=none; b=i076y3AtUyuBfktKK6tdqViNA8ZB7mlsED/317PmupqupLcddK0q1T5MWVT4brhmSr+Uk23/b8m9ZelD3kepjcnSrhQEXuGfZMw02OZEanCqsAEkgch8bfnrH18c4Tgh0QgDue0L4P2P9JDWlNf6CQSgBR5+HiQLtJ0pWE/I++4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739619192; c=relaxed/simple;
	bh=+9aa65dSRHAyHc32JFxrREeCshH3qxhAerXz/sQRjW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrOw+l+p7rRvpDj/w/DGwje06YjNjNPPh9mCjdrKcxMZgJ3HK4aeT0fln6ZaBCBTKcaciUREtD/5SyXN4e6fwLl+rzQCML6vC5kmh1HD3c3pmeH4vjqYbpwjaIBeByPwYslKQlR6tr4zzsrFvt2WIj4PMtHHwStXYH5NoGvzZqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXXHCQYP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso17481965e9.0;
        Sat, 15 Feb 2025 03:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739619189; x=1740223989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpEidbjY1/GWQgLUniwezom/J83sdftbQdc1o2m+qsw=;
        b=HXXHCQYP+59SRnabZl1gEJJ6aCnuFiHUIo+PdJkR8L8rMaydszeHuxj3R1pcXfEsan
         pxuIWFGzIo+8Bp2+JvJbGpv5qiJVoigFqARu9klowjpanPSE+NYwkUCpEawRUvRgNN1a
         D4Emi60ErKdBAstBdX6BdIjdZwRsn3EZz23a7YoIb/JI4eBgDczrKt5E/AgwiMAuiSch
         R+PT5hgwaB1cJXBrFWg/x/HM7sBX4Xbsvsyuoy74eGrRZbRxnu9X4QElQgQ+9I83PXid
         fftqXmKyqwtTBJAxHqTE3h9NAeva2t8hEUJ2N5mhqhVZmJPGs0Jl+FrIRjINPRUF6rX3
         Vp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619189; x=1740223989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpEidbjY1/GWQgLUniwezom/J83sdftbQdc1o2m+qsw=;
        b=W0MjBUSjakxkg+mSM7gFWC+bxLK/fCCYXxcewjuKggw7EoV+hFX5EWnA4l0inhNfR3
         TIBMxjtBTJMdVWr2lfjVnDw3FwguSs1i35JrhsfSRiNhH3ByWIrGC5wGKEur8fsRMeZo
         1RIx3Ui0W11A40BbU5kJDjI42kdjQix23bgTndCS+/FMct5V6tmRmBQp4gIR8I6cjAPe
         kGcvA3YMU0E6emChTXL5fHwK6naE9VysYGvQNUXLauOKEpMVO7j19dyqfTqMPNT8dLnj
         bRS+dK6af3UO/Ja5uolylBL8ySUU6tnB/e8D7Cni1dNnYl53izhRqnL848Ikt6oVxUGz
         Gvsw==
X-Forwarded-Encrypted: i=1; AJvYcCU29X981jf5IWvwfJm9t9gMNkhtrBvel+taO1HsOkPy5S31irTvHLmV/EuOZZ+ti/t4PQTo+7szqbMGow==@vger.kernel.org, AJvYcCUGYtKLKZXf4Qu8Srn/mwr9wzjl3KE9xQLtoacC9GH0KVCLavq18SuBeNbQX3UO7fG8F92HFvBDcTUxqAathbKQbpU=@vger.kernel.org, AJvYcCVZ2hj0hadu9/uR/6Gxn0uZeGWTErk1DEtK87uwET20UE1nhh5tPnizQFAdy4aRWzU4SXn2S2p4AQMN@vger.kernel.org, AJvYcCVe8mI30NReP+EvH3+/LE0YkUTfSO3VitdiRMNrNjRDEJsZYi20mtJzJVh6JXEPvHtgezwH/ls3va2U5eZ6@vger.kernel.org
X-Gm-Message-State: AOJu0YzHnwHJZqIgi57YGmtqi3mlQ5noqBMnWztej6EGZytjuXuolVi8
	UNZZX3myPCfyDKPGsSpSoO5Vi5tbNLXLe0Ba0OSw1U8BMBzg1BoY
X-Gm-Gg: ASbGncu3PZxzrTQEabA9BkTTRaM+uOgm6PjD6zGq2BZ1wqEB5mfmTyro9uhlkLFCbz3
	ztu9XEMjgDycFCEmx8wAbusSEAUJHFPsPY4CJ5uhj5DirTAVYCYqikn8XCgx2HHtcvvLB82v14q
	3BAVf7KAiKocBnuc1bcVmBX8THNFW1nzs1jgmNb07H/6/+PPmPTZy+F7Lidz+i4GnqADTs9u6QZ
	nIObZP9Za6LLnv/HYqT3/JfV+iumSmHE4f9Y0o9P6LtCreiLsHvCOqd4i6dRgULV3OBLZbksEdc
	nhvSCeVW+rRlWbwJeU3BtJTphEpRCrxzjYcV1sPJcNuHYukAhrf9s/a69iHIkyvgvII=
X-Google-Smtp-Source: AGHT+IHyCPSEBmQlx/qhu1ncVuarnzN6MoZNJ/ZDMmDp1+v3FMsG5gLX645v3LFJP5PZT4Gw8eYXbA==
X-Received: by 2002:a05:600c:2319:b0:438:9280:61d5 with SMTP id 5b1f17b1804b1-43960bcb171mr115812385e9.5.1739619188837;
        Sat, 15 Feb 2025 03:33:08 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm7147538f8f.61.2025.02.15.03.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:33:08 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] pinctrl: samsung: add exynos2200 SoC pinctrl configuration
Date: Sat, 15 Feb 2025 13:32:48 +0200
Message-ID: <20250215113248.159386-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the pin-controller found on the Exynos2200 SoC
used in Samsung Galaxy S22, S22 Plus and S22 Ultra phones.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 168 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 3 files changed, 171 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 3ea7106ce..0e310c095 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -70,6 +70,174 @@ static const struct samsung_pin_bank_type exynos8895_bank_type_off  = {
 /* Pad retention control code for accessing PMU regmap */
 static atomic_t exynos_shared_retention_refcnt;
 
+/* pin banks of exynos2200 pin-controller - ALIVE */
+static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x20, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x60, "gpa3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpa4", 0x10),
+	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
+	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
+	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
+};
+
+/* pin banks of exynos2200 pin-controller - CMGP */
+static const struct samsung_pin_bank_data exynos2200_pin_banks1[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTW(2, 0x0, "gpm0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x20, "gpm1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x40, "gpm2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpm3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpm4", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(2, 0xa0, "gpm5", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(2, 0xc0, "gpm6", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpm7", 0x1c),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x100, "gpm8", 0x20),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x120, "gpm9", 0x24),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x140, "gpm10", 0x28),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x160, "gpm11", 0x2c),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x180, "gpm12", 0x30),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x1a0, "gpm13", 0x34),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm20", 0x48),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm21", 0x4c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm22", 0x50),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpm23", 0x54),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x2c0, "gpm24", 0x58),
+};
+
+/* pin banks of exynos2200 pin-controller - HSI1 */
+static const struct samsung_pin_bank_data exynos2200_pin_banks2[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpf0", 0x00),
+};
+
+/* pin banks of exynos2200 pin-controller - UFS */
+static const struct samsung_pin_bank_data exynos2200_pin_banks3[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpf1", 0x00),
+};
+
+/* pin banks of exynos2200 pin-controller - HSI1UFS */
+static const struct samsung_pin_bank_data exynos2200_pin_banks4[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gpf2", 0x00),
+};
+
+/* pin banks of exynos2200 pin-controller - PERIC0 */
+static const struct samsung_pin_bank_data exynos2200_pin_banks5[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpb0",  0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpb1",  0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpb2",  0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpb3",  0x0c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4",  0x10),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpc0",  0x14),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xc0, "gpc1",  0x18),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpc2",  0x1c),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x100, "gpg1",  0x20),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpg2",  0x24),
+};
+
+/* pin banks of exynos2200 pin-controller - PERIC1 */
+static const struct samsung_pin_bank_data exynos2200_pin_banks6[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0,  "gpp7",  0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp8",  0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp9",  0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpp10", 0x0c),
+};
+
+/* pin banks of exynos2200 pin-controller - PERIC2 */
+static const struct samsung_pin_bank_data exynos2200_pin_banks7[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpp0",  0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1",  0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2",  0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpp3",  0x0c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp5",  0x10),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp6",  0x14),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp11", 0x18),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpc3",  0x1c),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x100, "gpc4",  0x20),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpc5",  0x24),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x140, "gpc6",  0x28),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpc7",  0x2c),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x180, "gpc8",  0x30),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpc9",  0x34),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x1c0, "gpg0",  0x38),
+};
+
+/* pin banks of exynos2200 pin-controller - VTS */
+static const struct samsung_pin_bank_data exynos2200_pin_banks8[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpv0", 0x00),
+};
+
+static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks	= exynos2200_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 CMGP data */
+		.pin_banks	= exynos2200_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 2 HSI1 data */
+		.pin_banks	= exynos2200_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks2),
+	}, {
+		/* pin-controller instance 3 UFS data */
+		.pin_banks	= exynos2200_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 4 HSI1UFS data */
+		.pin_banks	= exynos2200_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 PERIC0 data */
+		.pin_banks	= exynos2200_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 6 PERIC1 data */
+		.pin_banks	= exynos2200_pin_banks6,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 7 PERIC2 data */
+		.pin_banks	= exynos2200_pin_banks7,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks7),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 8 VTS data */
+		.pin_banks	= exynos2200_pin_banks8,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks8),
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos2200_of_data __initconst = {
+	.ctrl		= exynos2200_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos2200_pin_ctrl),
+};
+
 /* pin banks of exynos5433 pin-controller - ALIVE */
 static const struct samsung_pin_bank_data exynos5433_pin_banks0[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index cfced7afd..04a8a23f4 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1469,6 +1469,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 #ifdef CONFIG_PINCTRL_EXYNOS_ARM64
 	{ .compatible = "google,gs101-pinctrl",
 		.data = &gs101_of_data },
+	{ .compatible = "samsung,exynos2200-pinctrl",
+		.data = &exynos2200_of_data },
 	{ .compatible = "samsung,exynos5433-pinctrl",
 		.data = &exynos5433_of_data },
 	{ .compatible = "samsung,exynos7-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index bb0689d52..a43803027 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -373,6 +373,7 @@ struct samsung_pmx_func {
 };
 
 /* list of all exported SoC specific data */
+extern const struct samsung_pinctrl_of_match_data exynos2200_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos3250_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos4210_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos4x12_of_data;
-- 
2.43.0


