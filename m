Return-Path: <linux-gpio+bounces-22188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64FAE83B6
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 15:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFAC2177BBE
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 13:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D2926462B;
	Wed, 25 Jun 2025 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml/VPwQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B60263C8A;
	Wed, 25 Jun 2025 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856842; cv=none; b=KLTYyL9L6lHyVxdrQulcr2rLMI7SMqgAmvmO4DwJweQVQpssVAIZlkh2ntRcK/Di9CFrK+5o1+XFLIHHAGdKjasXeRQobH8mbGPrU/yRI1BfMxP5aG63FhYmOzb5GyDCH77NgVHU5/bIOAN6To+zlaoagGlnm+ccb67B9HrYL9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856842; c=relaxed/simple;
	bh=lt39ufVYtI+ad7AwtcKhH2ldt5HaYIJXUNW1ahNUKmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLHTyBSYyUrNDvDQQNlaKwJZ6jLTnv4JX9woxemnSxhpbnddMX/sbAMZUZE+ddpvau8PY/0WWf7CSAUJu+yhReWtAIJb2OdN3HUXrasPPkEkhERx2gYWonffZE7oZSWeyUjAJtU/hCFn2oEoMi4HRPMfq0WEuhczuEnPmYhw58E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml/VPwQF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so1127804f8f.1;
        Wed, 25 Jun 2025 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750856839; x=1751461639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNwXQa5uASnFrCMFfqksx3QUZk21ZxKYLgwLeF+6AVQ=;
        b=ml/VPwQFlh5U/bwMdRgXz1Um1yrB4Ol2As2FlPq9cRq6AtsDXW+aJBK2WHATeSgXs2
         /42fKNUUH5CCljk2oI1vGncqcGHFilcbkSW706cZHqVlpl00jgNp7M50QYQCDfqSttjU
         jhrux01Dc08+N4NOQ0GCJfi5DPNWuN6VyTE584nSk6S5Hlf/dIFfsR7Jgz1kyjfbL3TY
         ah8H+ZwNhpoqRgkkjVxafvTgZi2XN/JSF2G5Wl8eDMjcZ747i0rUnvt0rDm5csJbeVBZ
         MPM7R26oxVtbE2aCFb7OeAZA8imF+Ee4Dq/eDBxVSxH7YbejcvxWsCwI37R+c9E33JTs
         sAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856839; x=1751461639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNwXQa5uASnFrCMFfqksx3QUZk21ZxKYLgwLeF+6AVQ=;
        b=IMspCH4FP5rbrHO4ejVFp1bJEstXfJJ4mn55Hq7lDeMtuN2TteNjlhnd2ZN5VLJkqZ
         KKnNYwPPbF3exPrbXbLXtwOLyFF+WXHKNB5UBiZC2Loz4MvpcmEd3Gs5GLMZGY7P1Kfm
         9HtugVZhPvUkC5tIVWAY+K+rHPfLhfRmrYosh88AeiPE3u/o5VsJoyeHuJdfoQPhEUF5
         VIDbdPrz45SavQgMmgF46p318HWGiskUGD6l2QcaGqi7375/Lez7qlQocFWKFq79xoal
         WxZ/Cy4y/cGQapMWD9IIMccgXK5rSuQYdqEnNz7J493KKeTZpyLuGlk+2EonG84Byqrx
         zNRA==
X-Forwarded-Encrypted: i=1; AJvYcCUE/LCks0Q58G8H+67w2xeo2molP6UXUSXoSs7IXOGDnpGMHNHIl4wRCweDd+WPcyBXtvAsKSuh1gkCSeGZ@vger.kernel.org, AJvYcCVCljn3EM64boBjXYgBm39MVko7lUU2M+yHIWjKukd9+NUsPL8CWzM/VHtleITZAbJjoGA/NUZga8m8@vger.kernel.org, AJvYcCVH4eR3qoZgXbA1Y641zTiZhb3msfyKPJ5XtYoRqC5TR+Xb5SsDO0ttN+U/a0KvtKBBHWMxoaLB/ksfnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztHNhsLtaCdnuzC/vqwbAqGv4u94Q3/eLROgGh4c4a34ZzgYoj
	isX2ewwk+y76iTHHdmo5kKtgfAN8hzg+aV3U8LM5bvU29SDda+aTFp/m
X-Gm-Gg: ASbGncsaVWVL67BcN1DjNUqV2BYw5V0xBY4qeNOsDqbCIEXs+gscGHAY7acqKfbYOJ3
	bZjRRgq8tq9bOIqS1rIwmmHub15qNNVxoHEmJ9vBQLlqCwGGpBnJXlbo9R8q3nc9hUa9TVHWkBT
	m9zvu3ei+SHPr8aGT8JDxTBw+JF2wKkTJQhBwUazDK8L3lUWYbOudFiBEJSGGJhvopicWQHTnio
	qDENKlIwnMQbObviXW3ECYgfRfXJ+nVaoSVw/pzNprFhCW/QJe0ep+Nxs/C98xc0QiISbUHuAsg
	cAvlkjDC7CdlCfNs7zCFe8AgbGP86EzsC9JsqJvlIrVBUGanbdHnH26txoDhjTrkXt2nJyWQWO1
	Z33TDIuLeSArstqleSHCO
X-Google-Smtp-Source: AGHT+IGM/I2I8RtGdKJYiRI3C3ep83OslLhNqviRR6IV9ZY1FV04+i7bDfQS/C0AHvblidqHEwENPA==
X-Received: by 2002:a05:6000:4106:b0:3a4:e665:ca5 with SMTP id ffacd0b85a97d-3a6ed638bc3mr2223941f8f.23.1750856838833;
        Wed, 25 Jun 2025 06:07:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810977esm4548501f8f.83.2025.06.25.06.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:07:17 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC
Date: Wed, 25 Jun 2025 14:07:12 +0100
Message-ID: <20250625130712.140778-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625130712.140778-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625130712.140778-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- New patch
---
 drivers/pinctrl/renesas/Kconfig         |  5 +++--
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index eab8e00a2b24..ec94e6d6acd5 100644
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
@@ -251,9 +252,9 @@ config PINCTRL_RZN1
 	  This selects pinctrl driver for Renesas RZ/N1 devices.
 
 config PINCTRL_RZT2H
-	bool "pin control support for RZ/T2H"
+	bool "pin control support for RZ/N2H and RZ/T2H"
 	depends on OF
-	depends on ARCH_R9A09G077 || COMPILE_TEST
+	depends on (ARCH_R9A09G087 || ARCH_R9A09G077) || COMPILE_TEST
 	select GPIOLIB
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index d1dfe4b9a085..613f75337ee6 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -763,6 +763,12 @@ static const u8 r9a09g077_gpio_configs[] = {
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
@@ -770,11 +776,22 @@ static struct rzt2h_pinctrl_data r9a09g077_data = {
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


