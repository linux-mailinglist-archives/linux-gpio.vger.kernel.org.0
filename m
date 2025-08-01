Return-Path: <linux-gpio+bounces-23962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95EEB18534
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 17:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86F8B561438
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 15:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8563E27BF99;
	Fri,  1 Aug 2025 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mjbs6OA8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E68527AC4D;
	Fri,  1 Aug 2025 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754063167; cv=none; b=aPdRHC3NQ3R6Xv9yEEJmDFVtCWXlG6aAGXMEO5K+4j6Auon6A2NI6MrlVBOm9wYltc2RF+sIJtMxhDsloPJGE/sU/CBf2rD5rA3Zmcr44HimItICQB4FPqyNRnawRKkrENZK+61NNsCBmmEKP4l3jHg9rH++9lOBLVzi4OksMJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754063167; c=relaxed/simple;
	bh=4u/ERZo4s3oLx9uWszOTt0WmSC82PHA4dPnPCmk6B9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psokLcGpKZLA1snveLJMMq8/vPPG2mhEg3rd8F08rq/3/QvsVv2fDleY5akvWIZQxD19Na0OCFkEjaP+DIdns7sogC7NzFylvFCGqKVy6dpfeISlf85J2qeXLyR1qji9bMGWBO1+egoJThYFsA/ITQ0DEdeu57EkLdpw+60sW88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mjbs6OA8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-458a84e2917so12405585e9.1;
        Fri, 01 Aug 2025 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754063164; x=1754667964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPa5bQCjhcQssZJBxoWXb+FRc52wbSzCoxCNyn60iwU=;
        b=Mjbs6OA8tbx8NHA3a42d/c0pw3RGYmY2xY0lWDIzEOeM1cb7xvwSy4AEFLe6/GfWJn
         DPh0oyVO5IKRIkhsGYXTzOGW9SrgLdJhm4QRrrQYNKYPe8bhH1/KNMOxOBohoxN/coCT
         NQWiHoLMOD1kvVjK5VBL2nKi/JOTRFvBVGO3jP1XmYReseZkAUIaMFebF+MMh64WgaeB
         BjS7MT+gI469pymSkrFvxc2VhUyRF5waoR4G4AXPjQ4i8pyIi2EGKkAlHiKHAl2LDuX5
         JcfqdpUf3NNy0V1hUbaZg/Xi3Z1eSzmULoeZAiH0ZfuP8AQBsvGVgqqYj2Wk0kxOJfqB
         ltjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754063164; x=1754667964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPa5bQCjhcQssZJBxoWXb+FRc52wbSzCoxCNyn60iwU=;
        b=GG4tLZpjGHAZ27bDsaw2REamItMvse9j55QJlEplyhJ/QmMifrD5DrmAZUBNntehxN
         qeqQb1GkRmy8lppbH+mqnxgvsX0FOxNfYfAhk/ZijaNc5UYUMNFK2vo5MVzptAx4NtgH
         sdCb2b1D3zpAxgPspcpYXmPBzKW+aZT6veEV7YNPp8I8SY9Njraj8inbEaIn1Lb9JJwP
         u0wAoxq7rMCRZfQ1zn9IR1z156P6mRdiPa+OepcRffMm6JweuFtuI48b3vPy+Oi4JsQ+
         r+ALxiWkttVpPEW6MiPm3/tpDh03co8TWk9poOJf5OVYVIANNPxwjzJNizsnim9Axy57
         cKDw==
X-Forwarded-Encrypted: i=1; AJvYcCUcECUGRaXE58DSaB+dcF0xI8/yL56sHYuu79p00DWtAaeivcZgKpPWm9Bodqo8Nc8I7lKA+NYXrj5I@vger.kernel.org, AJvYcCVqQP2JsZCG/3zj9BWaImN7iJdOGEXluVGxw+bj7/j7TZ4bE3lX5/qzBOnq7Iyea3cr6O8K2tduudlvbXKS@vger.kernel.org, AJvYcCWc+CDbypJLvO7PM3MKcd1a3HkYjHTUtXId0fwKeMHvZQSzSpWkHp6avSFVj24N3yWL0r6TYaXGCTLuYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9lPPNudK5WLRRbisNrf8ys0JxB13S13IlQlL0o05u+d9P6peD
	T/Cs9jdaQ9ROp/QnpRa07lAO+b2J6uJMBm3VZbKs6kBMI5fTv1wC4+IfyEXwZw==
X-Gm-Gg: ASbGncsOGVblkKr4FY5yy3mKCN67UutepAYsdWvcUVkCJNDo6cHESzNplsAjqKkpLCt
	n4TiXZAsIx/Yzljwt/hGgxjA/CTLHg71wXrML7tZsxD3RFWRZJPO5XK8UuecMrbNNLedOvjcWtT
	dPaZCkZQIuKY6VSecWCZQP+/XYoYPKxAWbzNCFcGq4F6cXpcWGq53YnsHqmYdXVURx60nJMYZ7p
	j8i2aOFDSnGlkzjbozII7hxT4NdKacNhtySwDfXV2VSH62Z2uFnzeCVLnaKD4Cq4TGF20p4Pu55
	GSGYskLE5v+bCPXW5wUpOCEmnSRXWCdh7+5J+KKMclPYEWZzdlbka3kcnbAWuPwz+VRi1PKOmWb
	JDBhIsoutmcYIsHSAyZPpF/qex8+t92CL5QHO3P4heKLqsvIdIM2bhyCkZPyQSVhHbpUQ4hraoL
	VlH9NBX54=
X-Google-Smtp-Source: AGHT+IEy1d0OjMb4ZEYvw+mMcSASJHq1ZBcUQZZYLP9JZltpwwHzGAjuBq72r9RUWMLB4u9IEdwKOA==
X-Received: by 2002:a05:600c:1388:b0:456:25e7:bed with SMTP id 5b1f17b1804b1-4589af5ba2fmr105484575e9.14.1754063163618;
        Fri, 01 Aug 2025 08:46:03 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469582sm6194406f8f.52.2025.08.01.08.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:46:02 -0700 (PDT)
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
Subject: [PATCH v4 3/3] pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC
Date: Fri,  1 Aug 2025 16:45:50 +0100
Message-ID: <20250801154550.3898494-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4:
- No changes.

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
2.50.1


