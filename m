Return-Path: <linux-gpio+bounces-1242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2C80D16D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 17:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94BE61C210C7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D854D5A4;
	Mon, 11 Dec 2023 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQWGX3f6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49CC113
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:28 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3333fbbeab9so4206252f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311867; x=1702916667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdGNxHwkFDgSRHzfGx99KKt3ErVi98+WxBDX5+uzStQ=;
        b=ZQWGX3f6YOtqifJoY21hj9RAzjt+vWFuAEBoDql8R3ybBj9Zc1CypfyRzBuRCS8m7V
         7/pbJupY+B1odSK3DO8lfRHe70cnJC6I2hrCJD3L7uVIhzpvCStpbFywrh0joYaZxzmL
         gnCMM0JlDGVb3wVu0SNWMRbI2xct7z5c7r/byD1NHM4HP29cpmXJrpg3rlxNXqM4Ghd9
         HNUh2acGxiuIOv2WwHYQChQpVtLLKY8D3gkzlHYiBsMNRaRT3M3+LUCM665tor1PgZQX
         Wc5imZxCILNJYsyl6sRYHms9PaNSgyoUz2bDahNcakHcy1ZUhHTZpJ33VJnYJOSC6zQj
         1xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311867; x=1702916667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdGNxHwkFDgSRHzfGx99KKt3ErVi98+WxBDX5+uzStQ=;
        b=dD2XE/7ArsUd/L9K0W0EWuM9WPyubQoDnkKjUe/1WjFW7YJK8Egyd1BG/8Cj6wRoqL
         HvVfnoRTPBuOzy2FAXL6J95IpcsVGDJ8rDiF8Ev4ukkXyLdgymQkqfXbmOXAOppNHOz/
         IQqf8bp/u3+thUT6EMyxvHS0FNq3k/x7x2KDvGGFBhkTU0xJkppX2DXZZ7JEpZlYiSdY
         CWcYP+W22QD2xj407So/TNdKqifFfV8hMkndNSLkHb4mqwRWUwAFKg+mejBTO6VeFf6k
         dqGZr/O4uAZGAL2vfwdMmi27wWNeqk+nJb3FCqm9CsBtEsJSHXs5aVpS5wOfhHU/nFKO
         wKfg==
X-Gm-Message-State: AOJu0Yz5DTjbKm6uQxW0sCFy6qoFCTLtbYXxBfAtyFnRJQefRDIHsT67
	A/fRcYR4xYcsWdK+unFpJuZr4w==
X-Google-Smtp-Source: AGHT+IE4LU9MgKXkIbMR4OrQzQrTqKqOvwkGmMiqiLtt9BZKJZQntXMXDiVpjObOK8Ql7dpeuxyLHg==
X-Received: by 2002:adf:fd90:0:b0:333:2fd2:68cb with SMTP id d16-20020adffd90000000b003332fd268cbmr2476239wrr.94.1702311867131;
        Mon, 11 Dec 2023 08:24:27 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:26 -0800 (PST)
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
Subject: [PATCH v7 09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
Date: Mon, 11 Dec 2023 16:23:24 +0000
Message-ID: <20231211162331.435900-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the pin-controller found on the gs101 SoC used in
Pixel 6 phones.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 140 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 3 files changed, 143 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index cb965cf93705..8d08b29a21f6 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -796,3 +796,143 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 	.ctrl		= fsd_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(fsd_pin_ctrl),
 };
+
+/* pin banks of gs101 pin-controller (ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_alive[] = {
+	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c),
+};
+
+/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
+	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c),
+};
+
+/* pin banks of gs101 pin-controller (GSACORE) */
+static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
+	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08),
+};
+
+/* pin banks of gs101 pin-controller (GSACTRL) */
+static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
+	EXYNOS850_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00),
+};
+
+/* pin banks of gs101 pin-controller (PERIC0) */
+static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
+	EXYNOS850_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c),
+};
+
+/* pin banks of gs101 pin-controller (PERIC1) */
+static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c),
+};
+
+/* pin banks of gs101 pin-controller (HSI1) */
+static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
+	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04),
+};
+
+/* pin banks of gs101 pin-controller (HSI2) */
+static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
+	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08),
+};
+
+static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
+	{
+		/* pin banks of gs101 pin-controller (ALIVE) */
+		.pin_banks	= gs101_pin_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+		.pin_banks	= gs101_pin_far_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (GSACORE) */
+		.pin_banks	= gs101_pin_gsacore,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsacore),
+	}, {
+		/* pin banks of gs101 pin-controller (GSACTRL) */
+		.pin_banks	= gs101_pin_gsactrl,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsactrl),
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC0) */
+		.pin_banks	= gs101_pin_peric0,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC1) */
+		.pin_banks	= gs101_pin_peric1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume	= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI1) */
+		.pin_banks	= gs101_pin_hsi1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI2) */
+		.pin_banks	= gs101_pin_hsi2,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
+	.ctrl		= gs101_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(gs101_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 79babbb39ced..5ad92600320e 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1309,6 +1309,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &s5pv210_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_EXYNOS_ARM64
+	{ .compatible = "google,gs101-pinctrl",
+		.data = &gs101_of_data },
 	{ .compatible = "samsung,exynos5433-pinctrl",
 		.data = &exynos5433_of_data },
 	{ .compatible = "samsung,exynos7-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 9b3db50adef3..0b459651bc4a 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -351,6 +351,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
+extern const struct samsung_pinctrl_of_match_data gs101_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-- 
2.43.0.472.g3155946c3a-goog


