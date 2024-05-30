Return-Path: <linux-gpio+bounces-6975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B58D5155
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C23271C22937
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404554F5ED;
	Thu, 30 May 2024 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDwF9ntH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60954747;
	Thu, 30 May 2024 17:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090953; cv=none; b=tXCYTQOwor/cSlUXx2bmO3QVTwUy+JBiLygHDhgb3qN0Em4o0fCjstFHZ3X0VQaAiCBt5ikhYBKGG5D2zL9pbNdFX38V9TbJIr9Ot/ehO7i2kWf368LSYyZM+eo7ioJLEiMWzeYmbZSJ9c+Z/8GBSUMghw27D3tUZ7OLp6UD0XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090953; c=relaxed/simple;
	bh=p7r0INwKdRWb48rWdh8TKxHgYlfbC3bweA28z1yvs8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KAKFfBxXQ4ze7V/RNoPZLHGxhsD83lrULNlh5Pgdn+lhJDBicD7x91Q1Arjrjazl4GoYWUZ6RgloEjBqMHQy5HiBliw3QrlNLG0Fn1+oI6R0bcwKFQcwfZj65MwP1hDMYxdOJrZ6qSU/kilyzDUUwSZZ1z1eGewazlgOF8eXcC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDwF9ntH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f62fae8c1aso2048195ad.3;
        Thu, 30 May 2024 10:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090950; x=1717695750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuqYrTdiqIXrKd3pr++y5Sw5lUnemumcABKGe+QWJdU=;
        b=HDwF9ntHykrMhOhs5HkfRE8R6Uwg6TptC8PXFQUr2p8TFpUjPD+FCHxIv5DuuRNgoI
         9wgH2sE2N9cErEnETrebFYgx4N8/JzHwOtow3xeKMAqeuo5mfDIIweR7Tc0dpYyJhPtS
         Qa/K3MclHIv42KMLY8TZnAEfzLUSjDggxEcbOhpon3c7iyh4PBPmnw3sai0/yqYmyQAi
         3jcCcnFVGWpyD2a5ykWfdktJKFkyBltbE+ad1g09NRQvtixxtvdr6YJOckfpJL/HG9RU
         u0yYgvt3hhmyahVJOVE3WeaeQweSa+WbxW6mLEDewfw7pMHmg0vZXKPSmpY2VfWxyLoR
         z3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090950; x=1717695750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuqYrTdiqIXrKd3pr++y5Sw5lUnemumcABKGe+QWJdU=;
        b=lVX4EMbLY04zww4wbwP+DIviCmhhQfMXvXhHsK+4/PeBSLUuxwmn2sNFw+p4ogFESX
         HQTqR0WaLdIWV+hYBF1bdiwuJcUntNmmN/I+RsM8w+Z/RBkJwH86REBeJa+TObNGj6HR
         JxrK9m7ElcPw4zcitFphjvAFdJjd7lLcnlRH0yWH7vCbkUGvM733cs3QTJGnI/cJ+iR4
         thMhcQkZsuTgJhauuxPCIHa3oFyUg4NtySeVLjYxuCAtI45FHbEfc9KYJcv0v06YL3Bw
         z5EX4NECo1UUhgmNf4PqKx/BSFJxr1A2pjcc0EwuZHRuM39jzmuVCZIe2diDd23oDTY6
         /USw==
X-Forwarded-Encrypted: i=1; AJvYcCWjj7mMNg2NYAw8ZApCqaPGIbwQtA+tVWJSEs2Y3MgaRmgVhgx5vdgMnCq9hUNL1IYvk8klYoenTndzxyiQD5M/XNWx+847x/xuHN9L6fQdjHVifElhIH+jz/xCkTWlUDHDkFB6IOWH1Hj0svPN9+31LTGT844UeDqFutyX/Tu4GU21Zd4=
X-Gm-Message-State: AOJu0Yy2aAGR2fvwNg4wkq/y7gCBxykv/0KHtGq59ao2eDPaJaek61QO
	ki1Lyz2gTHEJlmXLJnBwq50uGZjLX7RjaB1C9Agqp6mmXFzoDZgDWwEodx+sNP4=
X-Google-Smtp-Source: AGHT+IG1oulmJfkwr3qxRokPDnuzY03Qxkcp+yp1ih+aCj/GJy+riNXuIwLPJ7bg1aXekrIkh0iWtQ==
X-Received: by 2002:a17:903:228a:b0:1f4:5ad1:b65e with SMTP id d9443c01a7336-1f6197271a5mr33858015ad.34.1717090949791;
        Thu, 30 May 2024 10:42:29 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:29 -0700 (PDT)
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
Subject: [PATCH v3 10/15] pinctrl: renesas: pinctrl-rzg2l: Add support to configure the slew-rate
Date: Thu, 30 May 2024 18:38:52 +0100
Message-Id: <20240530173857.164073-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support to configure slew-rate property of the pin.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag

RFC->v2
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 807851c33e48..6b82e78afa7c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -127,6 +127,7 @@
 #define PFC(off)		(0x0400 + (off) * 4)
 #define PIN(off)		(0x0800 + (off))
 #define IOLH(off)		(0x1000 + (off) * 8)
+#define SR(off)			(0x1400 + (off) * 8)
 #define IEN(off)		(0x1800 + (off) * 8)
 #define ISEL(off)		(0x2C00 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
@@ -145,6 +146,7 @@
 #define PFC_MASK		0x07
 #define IEN_MASK		0x01
 #define IOLH_MASK		0x03
+#define SR_MASK			0x01
 
 #define PM_INPUT		0x1
 #define PM_OUTPUT		0x2
@@ -1049,6 +1051,13 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		arg = ret;
 		break;
 
+	case PIN_CONFIG_SLEW_RATE:
+		if (!(cfg & PIN_CFG_SR))
+			return -EINVAL;
+
+		arg = rzg2l_read_pin_config(pctrl, SR(off), bit, SR_MASK);
+		break;
+
 	case PIN_CONFIG_DRIVE_STRENGTH: {
 		unsigned int index;
 
@@ -1155,6 +1164,15 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			settings.power_source = pinconf_to_config_argument(_configs[i]);
 			break;
 
+		case PIN_CONFIG_SLEW_RATE:
+			arg = pinconf_to_config_argument(_configs[i]);
+
+			if (!(cfg & PIN_CFG_SR) || arg > 1)
+				return -EINVAL;
+
+			rzg2l_rmw_pin_config(pctrl, SR(off), bit, SR_MASK, arg);
+			break;
+
 		case PIN_CONFIG_DRIVE_STRENGTH:
 			arg = pinconf_to_config_argument(_configs[i]);
 
-- 
2.34.1


