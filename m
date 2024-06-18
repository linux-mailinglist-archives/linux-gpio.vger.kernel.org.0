Return-Path: <linux-gpio+bounces-7552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A020090DAFB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 19:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562161F22172
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 17:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB2514C58E;
	Tue, 18 Jun 2024 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UF45Ne/s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDEF74BED;
	Tue, 18 Jun 2024 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718732936; cv=none; b=Pk6Ytrf9MDni1sOUZSRMh12lX9tvbEtBfkKwxudWwRTzAl6A1LVm1Mex5dli7z6v34wkTPTZTlj2twcEIIcw7hYpRBbss1RqpNcXnbyloVfCzdsLR+l38e/ff9Ij62YDYP7Is5WtN0CSvjt9wAlgq+YQ1oTIV0hLbwtN2B2Twy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718732936; c=relaxed/simple;
	bh=d8MiCPsTsovGTnI/Q5kn39SiBUQCeSWE1hTH3dewO6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ikGU4Q2MtUh+PlSKUOYhFaS2HTQabDKD9EeSPiDiizdUm11xy9GTDYvsNWtDf+GgaLdBdrLF6oiLcJ3jsg2TeUEdLuFS092iu2abrz1waEFmrSdsPoN11zCiJp/Oaiu09HIxc/UkWymiPpSXmW3PGvsSgyUzYTtu/3pgylTgtag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UF45Ne/s; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so45774f8f.0;
        Tue, 18 Jun 2024 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718732933; x=1719337733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqMGpF9MafdhPPbTmf43XMwZfWHpPGtAVPqYCKy47u4=;
        b=UF45Ne/s5h2qfYWemwvMEhi7ir4NoP1R/CRIIOokFiDijH594X4wpnJ/MEDMzyh8Ek
         OuJ5zo8WTCIRXxnZ95oIbpn3QXGEuadfV9HAtfZrrsJMkIaXS2qeiPL5rKzGad/lRUnf
         Z9akP67h4ncZwWAbvANeus5dOKOmN/rGKpNFWyuhpoBnanVFJ67gN1n/IDpLubD6g2c5
         nMTOzPTA5SrPYaDJMvLQGqFeQMss2+XgoI+k+4lz68W377OANPpRG9WdX4dAWiNuxbew
         25KP4ZD3EENj/L05Dht2Abc1yuC/WdLTe8UCWF/5eCS2oGmOLfUKnitmvtu0W9COIReD
         JqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718732933; x=1719337733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqMGpF9MafdhPPbTmf43XMwZfWHpPGtAVPqYCKy47u4=;
        b=MTR8Jxi7ytALza/cIXleFTNye02YJK51plqQenQQ/kYQUxfJd//jzQLXZjVe/E5A4i
         6/yUdcIitPiyAebDQlSmRO41+RxY+BzL1Ifry+xBwpJlNTjetiGNn/OSKTkXV47O39kT
         V9k7TlEQZlF28a25ZJdM1awuRfwUO6AghLypJmTA3defv9qffoVB9ltiWDXl5q+aT1Vf
         LWqHn4o32JZAUxxf1WXckQUGTcnK8/u0sNsg+ND2JTvstA29rH5oFv2lERmUbnkjJNCi
         X0lq+SzBycEwK1YqWc0NVh8+9KKY6c0NDeOWKouIw961GbghldXPyV8xU3rgaVfro2Hs
         4gdw==
X-Forwarded-Encrypted: i=1; AJvYcCU31yX+zVJsjnQd6BKBcYFf2zZOzzA8k1LJAJhJHR/hrfM+FY/XHixagwY+EO6S9cgIt5b0/L4QtmFb/nKCanicju+WqwbuMX96q2MhsnhCc9NPfIs0bQi5LNSz0mgJx99+ZSSCdv+s7w==
X-Gm-Message-State: AOJu0YxC8ypBymHgHGe4+G2dfYFkq/9F61IPZYhvv9U3DQ1m3Kc4OWr7
	i7fWOW8ZwJdSCtMdxLfcL+OV5Rz40JgkAuZylAT7lJ9Kem2bKoxh
X-Google-Smtp-Source: AGHT+IFU2BQNoe5ElKYcuGGZUhS+jx5+G1VSSadIGz9IqSPchK6rXimY4Od4/Mp6yqGMkMjGahQwmA==
X-Received: by 2002:a05:6000:248:b0:363:337a:3e0 with SMTP id ffacd0b85a97d-363338946b5mr8521f8f.1.1718732932393;
        Tue, 18 Jun 2024 10:48:52 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:d6f0:b448:a40c:81a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36289a4faeasm1253644f8f.95.2024.06.18.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:48:51 -0700 (PDT)
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
Subject: [PATCH 1/4] pinctrl: renesas: rzg2l: Update PIN_CFG_MASK() macro to be 32-bit wide
Date: Tue, 18 Jun 2024 18:48:28 +0100
Message-Id: <20240618174831.415583-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Modify the `PIN_CFG_MASK()` macro to be 32-bit wide. The current maximum
value for `PIN_CFG_*` is `BIT(21)`, which fits within a 32-bit mask.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 32945d4c8dc0..bfaeeb00ac4a 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -89,7 +89,7 @@
 
 #define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(62, 55)
 #define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(54, 47)
-#define PIN_CFG_MASK			GENMASK_ULL(46, 0)
+#define PIN_CFG_MASK			GENMASK_ULL(31, 0)
 
 /*
  * m indicates the bitmap of supported pins, a is the register index
@@ -1187,7 +1187,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	u64 *pin_data = pin->drv_data;
 	unsigned int arg = 0;
 	u32 off;
-	u64 cfg;
+	u32 cfg;
 	int ret;
 	u8 bit;
 
@@ -1322,7 +1322,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	u64 *pin_data = pin->drv_data;
 	unsigned int i, arg, index;
 	u32 off, param;
-	u64 cfg;
+	u32 cfg;
 	int ret;
 	u8 bit;
 
@@ -2755,9 +2755,9 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 
 	for (u32 port = 0; port < nports; port++) {
 		bool has_iolh, has_ien;
-		u64 cfg, caps;
+		u32 off, caps;
 		u8 pincnt;
-		u32 off;
+		u64 cfg;
 
 		cfg = pctrl->data->port_pin_configs[port];
 		off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
@@ -2801,7 +2801,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, bool suspend)
 {
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->dedicated_cache;
-	u64 caps;
+	u32 caps;
 	u32 i;
 
 	/*
-- 
2.34.1


