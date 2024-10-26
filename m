Return-Path: <linux-gpio+bounces-12158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D789B1AE5
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 22:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8847B1F212EA
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C341DB95D;
	Sat, 26 Oct 2024 20:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZEp/Jew"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2741DA634;
	Sat, 26 Oct 2024 20:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974786; cv=none; b=iyvASS+Y/Ak02YSyJ73Dm4g/xIbdDS7L7ocq+k+9C10nlWrmDYjjtwqMMhjkOahL6A3ErMtz8wvFCb1N5Z07CRMZA3DBPqjRK9x1nI61lw4zAJGnl0MAiDB4AY9P213Q4xc3ZNmpZy8dUf9JT2DXuWR0ihQtYvJ2h2Z+ym5R/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974786; c=relaxed/simple;
	bh=772kJCnYOtiOBy++PT2wl3V88OlSm4ef4aJGY+fHLYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ruRP0mlgu4rB8dFDdVmZDpwCz4JFZ624a6VefqrAcskm9n2fXtlLUXEVKdJCkoqE3XB3qfHGlIlQbKtVEKvGmigPvuuTr87eaULXe23+UE5trdaJZmTObv6hVdkqCsZaYbmsfCnYUlcADjFKzt6NbGhG8alnVvaPItc08AI5rCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZEp/Jew; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539fbbadf83so4090101e87.0;
        Sat, 26 Oct 2024 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974782; x=1730579582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAqXyJ+sd57/HN5TRgePj1d+VaJoxJ/E5Im16zWHmNY=;
        b=SZEp/JewyF6zVO2XsL1KEbv6/+9RzkiAcpKpf2t0nCJ9GqNdGtU7VanIv37F2Ekbmu
         7+0bC8E3ZM9rNBKh3sQr9jIZcY44No7PzS5RGVc6NWjTG94LOTnT9kIAitg5UFB09ZCW
         NQYBxvKjIsD52PcN99NZKZjPXS1QTjRKEdzDVVvDvymzD+TyFtyO5dGZAAqQD6MRQyLj
         irD6kEYttdSG4BBB6gQmJhilJHY5uecdEUzzYZCc95KcfH2wgzOfnTJ5/S1iKINzK1Ds
         WRd3gYz/HAOZa3UISG2jfe2soiJVW7alkDGL+67bFSo6BurrX57RqkwadyBymQEgHIGn
         qzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974782; x=1730579582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAqXyJ+sd57/HN5TRgePj1d+VaJoxJ/E5Im16zWHmNY=;
        b=ALu95dQyzvu1JYw7ZMZ94IozKdQAbP3WNe3HQUjoe1bhGlqhwKp1D5pepRDhh03gZZ
         V2tp5e/Gh6kYNY72r0Jm+mCD3GjvovgDRzFGUHCRZ5zokVYIcNcAm/3U/MKcn8myWizW
         RJL6TCzIk3Y/R8t7Iz4eBULf9eAwO2YXrZOAvFwtBbw6WNSFmqWY6UEnADNDtbqMDJUY
         k9motj7Q6v7iB5HdmnrX1HBXC80f67LFg++8LWQcjfIdQIB2iqXI8gEg1ruVV+woSTBB
         uji/50KgJM7tLRft3kd1R6Gyqmon/8HaE9TZaYSUEbDlJ6qbLuk0ee/Dba/ljRFzI0Gz
         Y4YA==
X-Forwarded-Encrypted: i=1; AJvYcCV25rN47nvYM7Pg0kzL8pQFdgaQvuTMIP97SxV87HHJDl209+ig4fmoXD1b/v2X+XmLHZ5GpyD5W2zb@vger.kernel.org, AJvYcCWKLzODKfgwAjBTg0yE1AMrectRSvjTxbmicb0O9bPZEkh76L1F74QQzQeNTVWWFYDVCzAMNmUAAYODkmve@vger.kernel.org, AJvYcCWQRuFXmC6x7dJU6ndqrQiMyaQw8iULAg3c1l/5btZdFjwesICicnW6FMg/J+U+axNaVkRtKQfdlXXGncZU7zglPVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeSQtpExMOtVwYPx5TwaAmT67DJsW8tb3MmUP9vZrLFj2lsR/e
	P8Sq068MMWMpP1uQtoLfSvHhij0paDsRQODV/N9/BLMxQSyYSFI69BbKDw==
X-Google-Smtp-Source: AGHT+IFPUYrCOBhBYch7XpKYen230Je9Z5xpOKaPCblTTpx9bDmGjGtMDMft0HEPU2hDXiMz8h3IzA==
X-Received: by 2002:a05:6512:3e0d:b0:53a:bb7:ed77 with SMTP id 2adb3069b0e04-53b348c6cacmr1278783e87.14.1729974781561;
        Sat, 26 Oct 2024 13:33:01 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:33:01 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:39 +0300
Subject: [PATCH v3 08/10] pinctrl: samsung: Add Exynos9810 SoC specific
 data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-8-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=9499;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=772kJCnYOtiOBy++PT2wl3V88OlSm4ef4aJGY+fHLYg=;
 b=F92Ag5kxO4BZPCtvP7uOevuw+TQi4vq4CN6Sbve8uNXX1Mq7JsgnwphEaH1kF2gpBaUBojaBm
 HfZ0Y4WS4NAAFLEC3xtT+W8l5BOfL1Mw1DYspUFlso00YvjPDz5dmoU
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add Samsung Exynos9810 SoC specific data to enable pinctrl
support for platforms based on Exynos9810.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 154 +++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
 3 files changed, 157 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index f07c26d374425505019447161150929f7677f91d..3ea7106ce5eae3c21f11790b5a40037042c1d407 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -767,6 +767,160 @@ const struct samsung_pinctrl_of_match_data exynos990_of_data __initconst = {
 	.num_ctrl	= ARRAY_SIZE(exynos990_pin_ctrl),
 };
 
+/* pin banks of exynos9810 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks0[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTN(6, 0x000, "etc1"),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTN(6, 0x0A0, "gpq0"),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x0C0, "gpa4", 0x10),
+};
+
+/* pin banks of exynos9810 pin-controller 1 (AUD) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks1[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpb2", 0x08),
+};
+
+/* pin banks of exynos9810 pin-controller 2 (CHUB) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks2[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gph1", 0x04),
+};
+
+/* pin banks of exynos9810 pin-controller 3 (CMGP) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks3[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm10", 0x20),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm11", 0x24),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm12", 0x28),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm13", 0x2C),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm14", 0x30),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm15", 0x34),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm16", 0x38),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm17", 0x3C),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm40", 0x40),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm41", 0x44),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm42", 0x48),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm43", 0x4C),
+};
+
+/* pin banks of exynos9810 pin-controller 4 (FSYS0) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks4[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpf0", 0x00),
+};
+
+/* pin banks of exynos9810 pin-controller 5 (FSYS1) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks5[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(7, 0x000, "gpf1", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf2", 0x04),
+};
+
+/* pin banks of exynos9810 pin-controller 6 (PERIC0) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks6[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp3", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg0", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0A0, "gpg1", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0C0, "gpg2", 0x18),
+};
+
+/* pin banks of exynos9810 pin-controller 7 (PERIC1) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp4", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp5", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp6", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpc0", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpc1", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpd0", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x0C0, "gpg3", 0x18),
+};
+
+/* pin banks of exynos9810 pin-controller 8 (VTS) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks8[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(3, 0x000, "gpt0", 0x00),
+};
+
+static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks      = exynos9810_pin_banks0,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks0),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 AUD data */
+		.pin_banks      = exynos9810_pin_banks1,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks1),
+	}, {
+		/* pin-controller instance 2 CHUB data */
+		.pin_banks      = exynos9810_pin_banks2,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 3 CMGP data */
+		.pin_banks      = exynos9810_pin_banks3,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks3),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 4 FSYS0 data */
+		.pin_banks      = exynos9810_pin_banks4,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 FSYS1 data */
+		.pin_banks      = exynos9810_pin_banks5,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 6 PERIC0 data */
+		.pin_banks      = exynos9810_pin_banks6,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 7 PERIC1 data */
+		.pin_banks      = exynos9810_pin_banks7,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks7),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 8 VTS data */
+		.pin_banks      = exynos9810_pin_banks8,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks8),
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos9810_of_data __initconst = {
+	.ctrl		= exynos9810_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos9810_pin_ctrl),
+};
+
 /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __initconst = {
 	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 42e40860841bcc94e3c11bf313df792da10ab00b..bbedd980ec67234aad847b757f40af5002b11ebb 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1479,6 +1479,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos850_of_data },
 	{ .compatible = "samsung,exynos8895-pinctrl",
 		.data = &exynos8895_of_data },
+	{ .compatible = "samsung,exynos9810-pinctrl",
+		.data = &exynos9810_of_data },
 	{ .compatible = "samsung,exynos990-pinctrl",
 		.data = &exynos990_of_data },
 	{ .compatible = "samsung,exynosautov9-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 615048f945243d4173d40142f1e62c8aeefe5b7e..bb0689d52ea0b4392714fa9bcdcbae8d253c73a1 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -385,6 +385,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos9810_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos990_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;

-- 
2.46.2


