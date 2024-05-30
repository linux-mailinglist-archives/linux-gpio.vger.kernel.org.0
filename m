Return-Path: <linux-gpio+bounces-6969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43E8D513E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B23AFB23BF7
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231E250267;
	Thu, 30 May 2024 17:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh/fZGfS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA25029E;
	Thu, 30 May 2024 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090922; cv=none; b=qZ25oiKH0+RHB/Mr9VUywQRYWqD9ulW5ZEuoKt+eo1kuZJBFYrwSR+r9TwAPY3MwE2uZOeXXY3VdWEi/0OVQJoBl4rWaZs7XyMAmb4G86A3Pxt0c2p4OiYv+pEcwfj+5vPH8hMBiGVi/IxLEr30hInLr78apQmRabIEcchodb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090922; c=relaxed/simple;
	bh=npBIA2AN3P3Z9oBXGKns2tbyk+iq2Mkf1hxJByQehpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dvaQGg/R01OnPNbAtWVfFWx02LyyEUFK5gWWrqt/Tja4bwcrh30aUhi6KknoaCM7U6iC2y+5BYzzS667PmHOIyvfG+f9RWFNotbkOyOZYWjCQayilDhGC+09kwvxoOIiIFtK5cUKZaOjWdINbe6Jpyc8+9NrDaCdzhYlXe1SBB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh/fZGfS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f44b45d6abso7986435ad.0;
        Thu, 30 May 2024 10:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090921; x=1717695721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9boa91Tqllq1NXO1CCdarz9fWly9uLdvq3LVU3UoO90=;
        b=Vh/fZGfSTq3U8ksL1pv3YLKcs592FtePeRxILYFmTuJkM2KMXL0kH6O6/hkPKWBNdj
         xDa0foGKVajjnhKbsmf1oq0Z1VS40YugwqjulT2PXAPxhN48fvfuRbVLRBFQ2g9UIKSM
         GuVH9uzfFMkHxhNe7HpSX2dnA5w78fOR4EQj/9ptoL0bUqNWR8Pa5sBKrO/sZzUJ/TAd
         2ui7HNq3Mp96xxkTtXQKj1wTK/BbfO0jcT9NZ4Curbnm+2Zn/ITQLxZZNu0OVTZGGAu5
         7TkkMN2628QZQKs21MWUeLb+4Qv3yOZ+P3a5P/WClkcSENJqScZRowazOX1qk4z2NmOY
         DvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090921; x=1717695721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9boa91Tqllq1NXO1CCdarz9fWly9uLdvq3LVU3UoO90=;
        b=t1cSR9SH/uNlXjG3Ku2ELQouwmKVN/bo7Ukwz+OoKSNDVk7CSqxLy3UT8CPx6mhTTJ
         yl0gcFcLOZGhCReJkmcdYueOF68KWRoQeffmdNaCDaI9MZm7K9xUSJuYi4LgB/hzQDs3
         HbfQ483rFHWncVCc3r6SC2TxP3efwejRwXh3wYNTTSQwHzi1yLjup36Cirb+kqozLQ09
         yQbSu2+pZR++An929LV6/eaoBDpQma19MaSYjb+q6QkF1AAn4iLiKa6GpB9euC8YGk1V
         rLw0BYgXtzLhLes+jQDljFp4T6lz9cewxpGrPBkRZWCCp9poQfWeYwyrF2uPiuYr4nLu
         wcdg==
X-Forwarded-Encrypted: i=1; AJvYcCVsWNI2GdtBth4N+aNgLXDm4G8LN6YxDzcZESB73Et2h9Q72qRm+/D/mc9jK1wRAnQ9WAcBm4h2ty06gxg/VCk2h54s1R3Ve2hanR55jX3CozjKZU2vyyWgIYZ0LiUaGMPRnBnPukssegpnVyFOaMXwTXnyKdfO88nZaMMkvOm/uIkwAHQ=
X-Gm-Message-State: AOJu0YxXtQAyicpITGhyKKTJ088uUkEKvk8ooVDM+/t7EzybVxfttQ3A
	Qx027D2Cs9c55q1SW+dOksZhK78WagLM5eWNEnOBFENTtT5uefSQ
X-Google-Smtp-Source: AGHT+IEGo4IAeu8fYpzlsEySYE/Xwsv0HQtvYpHA9yCK99b+/UMqf/3mEQmHe3jESQ8MppdFEsOumQ==
X-Received: by 2002:a17:902:f551:b0:1e4:df0c:a570 with SMTP id d9443c01a7336-1f6192f7debmr30816245ad.8.1717090920451;
        Thu, 30 May 2024 10:42:00 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 04/15] pinctrl: renesas: pinctrl-rzg2l: Drop struct rzg2l_variable_pin_cfg
Date: Thu, 30 May 2024 18:38:46 +0100
Message-Id: <20240530173857.164073-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Drop the rzg2l_variable_pin_cfg struct and instead use the
RZG2L_VARIABLE_PIN_CFG_PACK() macro for the variable pin configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 187 +++++++-----------------
 1 file changed, 54 insertions(+), 133 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index fe810d8dfa58..84d5882099a0 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -114,6 +114,13 @@
 						 FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
 						 FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
 
+#define VARIABLE_PIN_CFG_PIN_MASK		GENMASK_ULL(54, 52)
+#define VARIABLE_PIN_CFG_PORT_MASK		GENMASK_ULL(51, 47)
+#define RZG2L_VARIABLE_PIN_CFG_PACK(port, pin, cfg) \
+	(FIELD_PREP_CONST(VARIABLE_PIN_CFG_PIN_MASK, (pin)) | \
+	 FIELD_PREP_CONST(VARIABLE_PIN_CFG_PORT_MASK, (port)) | \
+	 FIELD_PREP_CONST(PIN_CFG_MASK, (cfg)))
+
 #define P(off)			(0x0000 + (off))
 #define PM(off)			(0x0100 + (off) * 2)
 #define PMC(off)		(0x0200 + (off))
@@ -234,18 +241,6 @@ struct rzg2l_dedicated_configs {
 	u64 config;
 };
 
-/**
- * struct rzg2l_variable_pin_cfg - pin data cfg
- * @cfg: port pin configuration
- * @port: port number
- * @pin: port pin
- */
-struct rzg2l_variable_pin_cfg {
-	u64 cfg:47;
-	u64 port:5;
-	u64 pin:3;
-};
-
 struct rzg2l_pinctrl_data {
 	const char * const *port_pins;
 	const u64 *port_pin_configs;
@@ -254,7 +249,7 @@ struct rzg2l_pinctrl_data {
 	unsigned int n_port_pins;
 	unsigned int n_dedicated_pins;
 	const struct rzg2l_hwcfg *hwcfg;
-	const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
+	const u64 *variable_pin_cfg;
 	unsigned int n_variable_pin_cfg;
 };
 
@@ -331,131 +326,57 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 	unsigned int i;
 
 	for (i = 0; i < pctrl->data->n_variable_pin_cfg; i++) {
-		if (pctrl->data->variable_pin_cfg[i].port == port &&
-		    pctrl->data->variable_pin_cfg[i].pin == pin)
-			return (pincfg & ~PIN_CFG_VARIABLE) | pctrl->data->variable_pin_cfg[i].cfg;
+		u64 cfg = pctrl->data->variable_pin_cfg[i];
+
+		if (FIELD_GET(VARIABLE_PIN_CFG_PORT_MASK, cfg) == port &&
+		    FIELD_GET(VARIABLE_PIN_CFG_PIN_MASK, cfg) == pin)
+			return (pincfg & ~PIN_CFG_VARIABLE) | FIELD_GET(PIN_CFG_MASK, cfg);
 	}
 
 	return 0;
 }
 
-static const struct rzg2l_variable_pin_cfg r9a07g043f_variable_pin_cfg[] = {
-	{
-		.port = 20,
-		.pin = 0,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
-		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 20,
-		.pin = 1,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
-		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 20,
-		.pin = 2,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
-		       PIN_CFG_IEN  | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 20,
-		.pin = 3,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 20,
-		.pin = 4,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 20,
-		.pin = 5,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 20,
-		.pin = 6,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 20,
-		.pin = 7,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 23,
-		.pin = 1,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_NOGPIO_INT
-	},
-	{
-		.port = 23,
-		.pin = 2,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 23,
-		.pin = 3,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 23,
-		.pin = 4,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 23,
-		.pin = 5,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 24,
-		.pin = 0,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 24,
-		.pin = 1,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 24,
-		.pin = 2,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 24,
-		.pin = 3,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 24,
-		.pin = 4,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_NOGPIO_INT,
-	},
-	{
-		.port = 24,
-		.pin = 5,
-		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
-		       PIN_CFG_NOGPIO_INT,
-	},
+static const u64 r9a07g043f_variable_pin_cfg[] = {
+	RZG2L_VARIABLE_PIN_CFG_PACK(20, 0, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(20, 1, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(20, 2, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+					   PIN_CFG_IEN  | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(20, 3, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(20, 4, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(20, 5, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(20, 6, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(20, 7, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(23, 1, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(23, 2, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(23, 3, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(23, 4, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(23, 5, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(24, 0, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(24, 1, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(24, 2, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(24, 3, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(24, 4, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_NOGPIO_INT),
+	RZG2L_VARIABLE_PIN_CFG_PACK(24, 5, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+					   PIN_CFG_NOGPIO_INT),
 };
 #endif
 
-- 
2.34.1


