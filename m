Return-Path: <linux-gpio+bounces-22891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0693AFB5B9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 16:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA793A89AF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 14:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2B22D8390;
	Mon,  7 Jul 2025 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgNdtAJR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E382D8393;
	Mon,  7 Jul 2025 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897936; cv=none; b=l9nf1Wa5wgYwfvgwYmg6+Z/C2en6KlgpFS/Hq8yLofa302S1rqE/kXX3Kko/5nvdkilanhiPxTIv8Wt0X0A4fON65s5/F63n5V0sEN7f3tmR7m5i51t9wvUUzmrMPsyLwnoLNPVFiu+zG49bIiFGB5oCokDGyX2ItGd8dQ+MuFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897936; c=relaxed/simple;
	bh=RCqVNrzJHaDjGi0nTRmKOCM2IBNClaZu6a32Pmp0POs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldEP2Floi9UruVmp8Wh/VB55qSuXbnS78G2MhSLwkRfcrsl97L359Wllg6pbGgfObrZhlqpGbzuBJdj93f/trJ2Z1M4KNkarGVEmjvOEbSFJDUEuNal6Q+ITz3h9JdoXoT7vVdG8yAbeuSJBGdEJ8TSlOtOLJiNwnkMv6mjq+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgNdtAJR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2194084f8f.0;
        Mon, 07 Jul 2025 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897933; x=1752502733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIhIWADLdNO/nd33yinxD1H8qsnfEtBKs3ChjZsVi4s=;
        b=NgNdtAJRAgmXiCUZHVeuB0r9oi5uz/Usng+0P58uuI0kzRq/7b3MoswdmByXRTYqvZ
         Pta+9hcn+eb0jqZcQVvdha7bjntUlrISLMgacYYgsaxNfGBDb7ImHZ3MEzZ5GD23uaII
         v+Nzg5wkgESL3Sr7PETJ3+bwS/CkuEVHinrQ0qos+2tEf8Hw/4n6CSHqmVra8pLLAk22
         0xXsnOVR8FMc6LHuEJwaEMsudYDnylgAhOjVBP8NzIBdqwH4f8iubb7tDNX8ichC1ibh
         6DvtggfDojbzcSiXjtDKI/wHo8EDJuT58Dk50YsLMDVVB4qgLywo760HS191YeQRxfZh
         pzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897933; x=1752502733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIhIWADLdNO/nd33yinxD1H8qsnfEtBKs3ChjZsVi4s=;
        b=d2VE/DAR84EmLMf8V9unRvRe+BvH4nEp6btC/AX60psQ0oHv4XgjmIzLIKXmdWl0Ue
         1gYCuN3/rys9eqiIP6EW7ZfFksUX/hFivfk7VQAkQLxB8Fz36BKMzX1bZVuc1eOZz783
         J3q6BYbzE2lIA45p6KsENSvQ2Sum+n2RtPi6Gsh4A+L0ylynOOvsYkJWh9Ba2ojkHO/J
         kxLfH5ZCMBvS84EdxQK41azxDTGzG4NDFck1AmYmTYacjt2y59uh2S6Fy043k4WEuBdL
         xqAZv7X6lRri3FkegQiSF+9uAR21bFwOonTErnruZKIrDJdaA50pBsbLWaSrGruAhDEI
         QoJQ==
X-Forwarded-Encrypted: i=1; AJvYcCULQKSjrzRq0vRw6oXzjMYbW5FPz+eCJTHrcQve6B9EuJbTEQbn8VqREHSz2gq/G0oPDW3v5Tailvpy@vger.kernel.org, AJvYcCVqM889bbNGej18YNHtCATz0oCh2guWJd85mnPm6VlVHZcs5t+3q54iFg7T3Tx9HwC4SerkUohVHZkhpsD9@vger.kernel.org, AJvYcCWPdBN4HoEpuNqVthTynZFp3MCfmdd6UVkdzoYNgxzKie5WASKX8/AP92Q/yRQbTUmaLp+JgrAJI8oTAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtHk2Jk+EZyc22Btsus0hxHq0fo5wK7EOZZsYlp03ItLpWs7c9
	nsUCpcvtLqiiS9nMJh6YXhr4to2ByVZCg6JAKMGNrBodxwJQV1DIFCXt
X-Gm-Gg: ASbGncvvRRF3NxNw6pB3BY4e203/8bzWqGNH1sfGgym6+DeWt7cXxzwywbtCtK+zhTc
	7WVZuBMj7JjcZG5W5Hd8KFmzYvwExmmI399ZQUIsqwUrqYXhah1vnUwElD2tt4xXY3/J8rIgVmG
	0k6pqjS2me628Par0xtilWXQVWdSw+SIXx2DCL1agSOvWqV+wnhx8VH28C2LfTSebGxHcI8bbdX
	4WjztYAKp3h5gTBGB29OY3o5LNWIPaFFzm0v7PUQRWR0yiAe/QYAgU1ipSsJSMbBDFAbCU+Fh3k
	ao9tcC2qYEXOXGQK+rKOK6RoNrh4i2nSdbXDztUrTglH/EUuqWRbnu49yiwuuRuWvCv3iYUsmM8
	FzBZ0cOd0oLIVji6ciNc=
X-Google-Smtp-Source: AGHT+IGjLz6S5fM35cF5+hKHA2tlk2smJKUGXb+pW5FqZs9HjzbC9U07thu3RNUJDSRoioKMADfuCA==
X-Received: by 2002:a05:6000:200c:b0:3b3:9c56:b825 with SMTP id ffacd0b85a97d-3b4955895fbmr11097185f8f.22.1751897932896;
        Mon, 07 Jul 2025 07:18:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b966cbsm10131868f8f.49.2025.07.07.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:18:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v3 3/3] pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC
Date: Mon,  7 Jul 2025 15:18:48 +0100
Message-ID: <20250707141848.279528-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707141848.279528-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250707141848.279528-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/N2H (R9A09G087) SoC from Renesas shares a similar pin controller
architecture with the RZ/T2H (R9A09G077) SoC, differing primarily in the
number of supported pins-576 on RZ/N2H versus 729 on RZ/T2H.

Add the necessary pin configuration data and compatible string to enable
support for the RZ/N2H SoC in the RZ/T2H pinctrl driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes.

v1->v2:
- New patch.
---
 drivers/pinctrl/renesas/Kconfig         |  3 ++-
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 0d0920f4678b..8cbd79a13414 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -45,6 +45,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_RZG2L if ARCH_R9A09G056
 	select PINCTRL_RZG2L if ARCH_R9A09G057
 	select PINCTRL_RZT2H if ARCH_R9A09G077
+	select PINCTRL_RZT2H if ARCH_R9A09G087
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
 	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
 	select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
@@ -304,7 +305,7 @@ config PINCTRL_RZN1
 	  This selects pinctrl driver for Renesas RZ/N1 devices.
 
 config PINCTRL_RZT2H
-	bool "pin control support for RZ/T2H" if COMPILE_TEST
+	bool "pin control support for RZ/N2H and RZ/T2H" if COMPILE_TEST
 	depends on 64BIT && OF
 	select GPIOLIB
 	select GENERIC_PINCTRL_GROUPS
diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 877f6d00830f..55c64d74cb54 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -764,6 +764,12 @@ static const u8 r9a09g077_gpio_configs[] = {
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f,
 };
 
+static const u8 r9a09g087_gpio_configs[] = {
+	0x1f, 0xff, 0xff, 0x1f, 0, 0xfe, 0xff, 0, 0x7e, 0xf0, 0xff, 0x1,
+	0xff, 0xff, 0xff, 0, 0xe0, 0xff, 0xff, 0, 0xff, 0xff, 0xff, 0x1,
+	0xe0, 0xff, 0xff, 0x7f, 0, 0xfe, 0xff, 0x7f, 0, 0xfc, 0x7f,
+};
+
 static struct rzt2h_pinctrl_data r9a09g077_data = {
 	.port_pins = rzt2h_gpio_names,
 	.n_port_pins = ARRAY_SIZE(r9a09g077_gpio_configs) * RZT2H_PINS_PER_PORT,
@@ -771,11 +777,22 @@ static struct rzt2h_pinctrl_data r9a09g077_data = {
 	.n_ports = ARRAY_SIZE(r9a09g077_gpio_configs),
 };
 
+static struct rzt2h_pinctrl_data r9a09g087_data = {
+	.port_pins = rzt2h_gpio_names,
+	.n_port_pins = ARRAY_SIZE(r9a09g087_gpio_configs) * RZT2H_PINS_PER_PORT,
+	.port_pin_configs = r9a09g087_gpio_configs,
+	.n_ports = ARRAY_SIZE(r9a09g087_gpio_configs),
+};
+
 static const struct of_device_id rzt2h_pinctrl_of_table[] = {
 	{
 		.compatible = "renesas,r9a09g077-pinctrl",
 		.data = &r9a09g077_data,
 	},
+	{
+		.compatible = "renesas,r9a09g087-pinctrl",
+		.data = &r9a09g087_data,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.49.0


