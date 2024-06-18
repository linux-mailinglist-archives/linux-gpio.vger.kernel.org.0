Return-Path: <linux-gpio+bounces-7555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF9590DB05
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 19:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FA7F1F242FE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 17:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C565154420;
	Tue, 18 Jun 2024 17:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xag0zhcX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6271214F9DC;
	Tue, 18 Jun 2024 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718732939; cv=none; b=HhVa+xj9fZIfU6qQ4Xpa9t8aVgiFDXPkL1wThcoTIniE/wgxTAbP0EPNqq9eV9NcTX4nFFFizZt0jEWsRguIEzlg/JcC1XW0RhIIQzPzo79H/MKU82pJR9SqTxUokCWdsjrrhB41Y6hYFZHvkfgQvkf3i1R87Rz62kar/DLC53A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718732939; c=relaxed/simple;
	bh=oUFsCSlWE0iUV7ei20P+IMHW6NNaNUwPBRaqtARWzGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VZbJShpWF/9JxkBIxrgmApR1CPzDDrxWkGcMRN/276PwYlB/MPkG3C6DvF5NKLJ46wrEfynO3i5jd4eRh5ivi0mbsoYRPmzRIwD9/ZhUmI81Y4l0/uDJEeJVA1CGvVP6+7zh50GRnytRqYGUJWbx1TGRGTVrKpGmlzpDTVeHJpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xag0zhcX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4217a96de38so41515705e9.1;
        Tue, 18 Jun 2024 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718732936; x=1719337736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsV4kQ/yyu8OJnHBlUaVv2q+K5a9fhVpenLs4nf79qw=;
        b=Xag0zhcXkMay2fs2o46EVQZfsYQSXWZq4r3WPd9dlSfKSYHfmjHnApWv+MQ6VFlEOY
         NLm46Q2b8uqs7Nk7D/ECnOclfMbCUGo5HDtNN9gQJY27Qr+gcVLG+8yhUSa0xVz6EJo+
         yEsNx2I7uiFUv6KkiwdCCKRQ/lcwZE3Jr513af/hm0uw04BeJU3dNpiW4bpDqLj+7z20
         MRVHGDUJhxrK9VTDC772iuMY/8bSsIj0b1KtgMNl4089AcGdhGrYxqkdDxRLzDrqihN1
         nrEPJkpb9tog+Ih6OEJZOmIq1TvvY0gUervVS+Hhe3DWg4TKFzSIhOQMAEfCZ3C9/kOe
         Yplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718732936; x=1719337736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsV4kQ/yyu8OJnHBlUaVv2q+K5a9fhVpenLs4nf79qw=;
        b=soUDFq14B7hnk2wmnH48kmeZPMW+/wnHEOFW4fBy+2SCQ5cTYMHXyDBHsv2wuNHsd/
         OgCyycclwMkWjkOM80RybFa2ZWwz2EsutGeGbNSde0Krzd7noo3WrGNzNiI5kg1iJw1r
         meP09s4xOGC2bybAsPRrojw52ms1gmH9JhLGFfnM+lBFJhwWJ6xnasKT4aGWc4G7H8u3
         l49fq0Key+cdvJn+JBDof7HuwkmQ6z26H85zUnZgBoO0kAgfBCXRhDFpeKbc1scyDmdZ
         eD/l90U7x42f2z9SgueOhqDscFN0agZt2aIuNKCeTR21HwI0Se4bvaC4Dy4rdDwvkXFB
         y/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2X/PDzWT4vRuygshybMsxbP3wzqtvX6JiidV0RI0ePSiS7fNbpBr7h+P7quWit6Lbzwwr4CT/xwU8qMKYMumhjJvucRH6vXPX3DichOLLXIeL+xbaWdhIsW+ULbsu+21krhdzPO+euw==
X-Gm-Message-State: AOJu0YwCmkRW3aIdEyX/C5i9ImcxmPtrF4Df9cQdorvj/NH3DOsk0egY
	tWEVWJ2D4zPR1XvzL2e/h2HGJpFvHwZxae+R+9nJlMoL7IdWH6teqDicsXrXQzw=
X-Google-Smtp-Source: AGHT+IEiuNR/Sc1oNADyJL4in6YAftBjKMaeDiDn8aN1dFTiEHQt+X/SVRnW3oNz3hvZUvX+LeUlYg==
X-Received: by 2002:a05:6000:ad2:b0:360:9e6a:5987 with SMTP id ffacd0b85a97d-363171e2b87mr209462f8f.12.1718732935612;
        Tue, 18 Jun 2024 10:48:55 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:d6f0:b448:a40c:81a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36289a4faeasm1253644f8f.95.2024.06.18.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:48:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] pinctrl: renesas: rzg2l: Reorganize variable configuration macro
Date: Tue, 18 Jun 2024 18:48:31 +0100
Message-Id: <20240618174831.415583-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The `PIN_CFG_VARIABLE` macro did not indicate the capabilities of a pin
but served as a flag indicating that the pins of a port have different
capabilities.

To better reflect its purpose, move the `PIN_CFG_VARIABLE` macro beside
`RZG2L_SINGLE_PIN` and rename it to `RZG2L_CFG_VARIABLE`. Additionally,
introduce new macros for packing variable port configurations:

- `RZG2L_GPIO_PORT_PACK_VARIABLE(n, a)`: Combines `RZG2L_CFG_VARIABLE`
  with `RZG2L_GPIO_PORT_PACK` to handle variable pin configurations
  for a packed port.
- `RZG2L_GPIO_PORT_SPARSE_PACK_VARIABLE(m, a)`: Combines
  `RZG2L_CFG_VARIABLE` with `RZG2L_GPIO_PORT_SPARSE_PACK` to handle
  variable pin configurations for a sparse port.

Due to the above change the configuration macros have been reorganized
as follows:
- Shift the bit positions of `PIN_CFG_NOGPIO_INT`, `PIN_CFG_NOD`,
  `PIN_CFG_SMT`, `PIN_CFG_ELC`, and `PIN_CFG_IOLH_RZV2H` down by one
  to accommodate the removal of `PIN_CFG_VARIABLE`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 29 +++++++++++++++----------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 37a99d33400d..9a67de960470 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -57,14 +57,14 @@
 #define PIN_CFG_IOLH_C			BIT(13)
 #define PIN_CFG_SOFT_PS			BIT(14)
 #define PIN_CFG_OEN			BIT(15)
-#define PIN_CFG_VARIABLE		BIT(16)
-#define PIN_CFG_NOGPIO_INT		BIT(17)
-#define PIN_CFG_NOD			BIT(18)	/* N-ch Open Drain */
-#define PIN_CFG_SMT			BIT(19)	/* Schmitt-trigger input control */
-#define PIN_CFG_ELC			BIT(20)
-#define PIN_CFG_IOLH_RZV2H		BIT(21)
+#define PIN_CFG_NOGPIO_INT		BIT(16)
+#define PIN_CFG_NOD			BIT(17)	/* N-ch Open Drain */
+#define PIN_CFG_SMT			BIT(18)	/* Schmitt-trigger input control */
+#define PIN_CFG_ELC			BIT(19)
+#define PIN_CFG_IOLH_RZV2H		BIT(20)
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
+#define RZG2L_CFG_VARIABLE		BIT_ULL(62)	/* Variable cfg for port pins */
 
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
@@ -100,12 +100,17 @@
 #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)	(FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
 						 FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
 						 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
+#define RZG2L_GPIO_PORT_SPARSE_PACK_VARIABLE(m, a)	\
+						(RZG2L_CFG_VARIABLE | \
+						 RZG2L_GPIO_PORT_SPARSE_PACK(m, a, 0))
 
 /*
  * n indicates number of pins in the port, a is the register index
  * and f is pin configuration capabilities supported.
  */
 #define RZG2L_GPIO_PORT_PACK(n, a, f)	RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
+#define RZG2L_GPIO_PORT_PACK_VARIABLE(n, a)	(RZG2L_CFG_VARIABLE | \
+						 RZG2L_GPIO_PORT_PACK(n, a, 0))
 
 #define RZG2L_SINGLE_PIN_INDEX_MASK	GENMASK_ULL(62, 56)
 #define RZG2L_SINGLE_PIN_BITS_MASK	GENMASK_ULL(55, 53)
@@ -371,7 +376,7 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 
 		if (FIELD_GET(VARIABLE_PIN_CFG_PORT_MASK, cfg) == port &&
 		    FIELD_GET(VARIABLE_PIN_CFG_PIN_MASK, cfg) == pin)
-			return (pincfg & ~PIN_CFG_VARIABLE) | FIELD_GET(PIN_CFG_MASK, cfg);
+			return (pincfg & ~RZG2L_CFG_VARIABLE) | FIELD_GET(PIN_CFG_MASK, cfg);
 	}
 
 	return 0;
@@ -1835,13 +1840,13 @@ static const u64 r9a07g043_gpio_configs[] = {
 	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x06, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
 				    PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
 				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P19 */
-	RZG2L_GPIO_PORT_PACK(8, 0x07, PIN_CFG_VARIABLE),				/* P20 */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x07),						/* P20 */
 	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x08, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
 				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P21 */
 	RZG2L_GPIO_PORT_PACK(4, 0x09, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
 			     PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),				/* P22 */
-	RZG2L_GPIO_PORT_SPARSE_PACK(0x3e, 0x0a, PIN_CFG_VARIABLE),			/* P23 */
-	RZG2L_GPIO_PORT_PACK(6, 0x0b, PIN_CFG_VARIABLE),				/* P24 */
+	RZG2L_GPIO_PORT_SPARSE_PACK_VARIABLE(0x3e, 0x0a),				/* P23 */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x0b),						/* P24 */
 	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x0c, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_FILONOFF |
 				    PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
 				    PIN_CFG_NOGPIO_INT),				/* P25 */
@@ -1913,7 +1918,7 @@ static const u64 r9a09g057_gpio_configs[] = {
 				      PIN_CFG_ELC),		/* P8 */
 	RZG2L_GPIO_PORT_PACK(8, 0x29, RZV2H_MPXED_PIN_FUNCS),	/* P9 */
 	RZG2L_GPIO_PORT_PACK(8, 0x2a, RZV2H_MPXED_PIN_FUNCS),	/* PA */
-	RZG2L_GPIO_PORT_PACK(6, 0x2b, PIN_CFG_VARIABLE),	/* PB */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x2b),			/* PB */
 };
 
 static const struct {
@@ -2637,7 +2642,7 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 		if (i && !(i % RZG2L_PINS_PER_PORT))
 			j++;
 		pin_data[i] = pctrl->data->port_pin_configs[j];
-		if (pin_data[i] & PIN_CFG_VARIABLE)
+		if (pin_data[i] & RZG2L_CFG_VARIABLE)
 			pin_data[i] = rzg2l_pinctrl_get_variable_pin_cfg(pctrl,
 									 pin_data[i],
 									 j,
-- 
2.34.1


