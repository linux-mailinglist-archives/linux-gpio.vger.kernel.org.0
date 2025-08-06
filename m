Return-Path: <linux-gpio+bounces-24049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2DB1CCB1
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 21:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49F573B2FA2
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 19:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E717D2BE648;
	Wed,  6 Aug 2025 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avrJgx39"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA49F2BD5A1;
	Wed,  6 Aug 2025 19:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510167; cv=none; b=WRh6hwAVtt2szjyHubE7rCDLTWsQaaVAkFT0kM85qpUuwSChbtmAAdiCx3xJjByn17pbu07O8Eq5XJTYzNVBv2DGzujwh3KiIVyqdIkSwEEGRAiIuPBs1HYGqklenS6xM8vbM2UeTTKntgVPhEj8iiHJK6zHxxChaa4AxCaKKvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510167; c=relaxed/simple;
	bh=hYDRoky2L59t5R09izY9K11rQCfbeXV85vr06wezBLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfnitKzZW3ByM8Gj94ljSobHsGXqJ9pW7aTT4SNsBI2laCGbeRk4Ld1GTKQkcXgyuqLH0dxNnMfaPoBa2t4lEyXAEsWEP9Q3KkrfxL7F3b3tAssLE7SWhmGjqrHrFgxdZZ0nHPs/tUa3gOgztDyqFceZBGYFho0N3gfmaC5OmQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avrJgx39; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so102133f8f.2;
        Wed, 06 Aug 2025 12:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510164; x=1755114964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8qQ5s4D16ZAu2yhPB8VcPdFUqDNzTEXN1ru7c5Tko0=;
        b=avrJgx39Ai0qHcTVjWITH8DboYe3VEj9CO8PPgeNbgMvEu8Ae4+3aNowzCn4p1BI8a
         z1LKlkdyefnzLCIoS9OTA8ZcJiP6+SUvLVs+eAdoRWGUFF/vjKXDaoTqL97KfSsGVUYD
         dld+DdJKpMjItrsfirPe4QOCXkvMmicV0LpuRX+UYtsMbqG6lOC4YGsXM9fbj6fq3Unm
         L42OJv8wbwZwTmuednbEuIHCkTamlnjqRLp3ZxpnYXh4z7bZejPp7l6GMooAm9/rp/iq
         ek/ZX8m8a8LdtLfdBqbKGM6ruUBVI6w59OyDN+9Vpwf5QltzUod4eFjbBV33bDiUXVEm
         YUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510164; x=1755114964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8qQ5s4D16ZAu2yhPB8VcPdFUqDNzTEXN1ru7c5Tko0=;
        b=LS/N2M8PquuS2NE+aQeuUIsPAiPC26ZviTXrUTvSGtGwkHBtAfZu9TPNSbih5FWcXx
         rYa8aaFArGz17iU2Ir0uy6bBFPqORgzQi6+TRMew8NDwvF1lwC0WtE2WiJKz6ApHGRQs
         zqM2yiGWBEDRFWzvHB9Yq4iNiOa+t4skQhl7OuPRpXCrd67xgddnUdffmjX8o0p3Xl1b
         CxqbddFfw4xii4c8iVAAtycFqLdgHjTRgdXev2oDi/vO3yCwa4NhUjVxhnzU22w46YQX
         9FJxnzKEMo9qHqdiw12A5uJF3+o4dkaeBOnKCayPQ6ql1oXbDoWvXyda+9iW/T2ycDor
         8L4A==
X-Forwarded-Encrypted: i=1; AJvYcCVY4lDpLp9YSZ9w8C9TudIbZMUjE6OYH0csk9p5wkYNYOZO3zKHkzsz3Lw6+D4sDR/MuUB38NFpJdpP@vger.kernel.org, AJvYcCVt1B71IyFkP0Jb7ljMeyAXVRFk3jKo+wd3HEA09WFh+FXjd0ApJB4P6r0idi3PsrwwM2UCEvcu1zhQjnD8@vger.kernel.org
X-Gm-Message-State: AOJu0YxPlyl2hdCbQtcyCwPoID+T7/Nm5MnzWNXXt6T2NSgnXmqOrKBg
	1NYWtEkw51zfR2TxR3qw+9SbRLGM5Q/WROcuX/RJpBlE3tGiSSedBfr/
X-Gm-Gg: ASbGncvWKdxrCspMKeHnkRPa9Ml2Lxe3mMqIYrtUV+v0+FLn0qOhqMpNRjIB+X4hIFU
	3SBodl6O/5H4xSXj36UPGsi7DeQlRyMjtG+qN84yjJa24kvHgiisJb3J1vdMsUQx3Tq66QjWSO7
	qZclPzImAuWMWl1ND69vy9Ulnb93DcoID25s3KbOA8XWF+RuENgMXaFkG0XacFG/KyjNJCG2I7a
	tJNHFUDATWqTeYCg1MSWgROu0DWPm3yKy0ebhCh8zsCDEuCDAHVnqjaY2SoTbHGNH72hRhoC84w
	3dFF545CkfBldVwXFRi7q6N1d7vtPFQ4BOaCrc4WdQR9NXx+UPxaxzJWd7wMzeUJxmeqi/TiV0F
	XuCHZ00V9gO8+LtCSyUQ+AY7T1O9E5J5KOfoMs8MBdGjgzxvavWkhK5vQYIDqun9hX6GaszJ90w
	==
X-Google-Smtp-Source: AGHT+IEgdSqQorBxu1+lbrIJZYzSHBE1okALkImsIf0XBri5AQraP6piN3QCRYmMim0MjydZV2Qz2A==
X-Received: by 2002:a05:6000:400b:b0:3b7:98bc:b856 with SMTP id ffacd0b85a97d-3b8f41f2ac4mr3220313f8f.41.1754510163871;
        Wed, 06 Aug 2025 12:56:03 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm24137782f8f.27.2025.08.06.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 12:56:03 -0700 (PDT)
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
Subject: [PATCH v3 2/7] pinctrl: renesas: rzg2l: parameterize OEN register offset
Date: Wed,  6 Aug 2025 20:55:50 +0100
Message-ID: <20250806195555.1372317-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare for supporting SoCs with varying OEN register locations by
parameterizing the OEN offset in the rzg2l driver. Introduce an `oen`
field in the rzg2l_register_offsets structure and update rzg2l_read_oen(),
rzg2l_write_oen(), suspend/resume caching, and SoC hwcfg entries to use
this offset instead of the hard-coded ETH_MODE value.

As part of this change, rename the field `eth_mode` in the register cache
to `oen` to better reflect its general purpose and decouple the naming
from a specific register.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Renamed `eth_mode` to `oen` in the rzg2l_pinctrl_reg_cache struct
- Added a if condition to check if the OEN register offset is defined
  before reading/writing it in suspend/resume functions
- Updated commit message

v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 29 +++++++++++++++----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index af4a40ca0a98..c45ae685fad3 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -146,7 +146,6 @@
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
-#define ETH_MODE		(0x3018)
 #define PFC_OEN			(0x3C40) /* known on RZ/V2H(P) only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
@@ -221,11 +220,13 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * @pwpr: PWPR register offset
  * @sd_ch: SD_CH register offset
  * @eth_poc: ETH_POC register offset
+ * @oen: OEN register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
 	u16 sd_ch;
 	u16 eth_poc;
+	u16 oen;
 };
 
 /**
@@ -322,7 +323,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @ien: IEN registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
- * @eth_mode: ETH_MODE register cache
+ * @oen: Output Enable register cache
  * @qspi: QSPI registers cache
  */
 struct rzg2l_pinctrl_reg_cache {
@@ -335,7 +336,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*pupd[2];
 	u8	sd_ch[2];
 	u8	eth_poc[2];
-	u8	eth_mode;
+	u8	oen;
 	u8	qspi;
 };
 
@@ -1073,11 +1074,12 @@ static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 	if (bit < 0)
 		return 0;
 
-	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
+	return !(readb(pctrl->base + pctrl->data->hwcfg->regs.oen) & BIT(bit));
 }
 
 static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
 {
+	u16 oen_offset = pctrl->data->hwcfg->regs.oen;
 	unsigned long flags;
 	int bit;
 	u8 val;
@@ -1087,12 +1089,12 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 		return bit;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
-	val = readb(pctrl->base + ETH_MODE);
+	val = readb(pctrl->base + oen_offset);
 	if (oen)
 		val &= ~BIT(bit);
 	else
 		val |= BIT(bit);
-	writeb(val, pctrl->base + ETH_MODE);
+	writeb(val, pctrl->base + oen_offset);
 	spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
@@ -1126,11 +1128,12 @@ static u32 rzg3s_oen_read(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 	if (bit < 0)
 		return 0;
 
-	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
+	return !(readb(pctrl->base + pctrl->data->hwcfg->regs.oen) & BIT(bit));
 }
 
 static int rzg3s_oen_write(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
 {
+	u16 oen_offset = pctrl->data->hwcfg->regs.oen;
 	unsigned long flags;
 	int bit;
 	u8 val;
@@ -1140,12 +1143,12 @@ static int rzg3s_oen_write(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 		return bit;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
-	val = readb(pctrl->base + ETH_MODE);
+	val = readb(pctrl->base + oen_offset);
 	if (oen)
 		val &= ~BIT(bit);
 	else
 		val |= BIT(bit);
-	writeb(val, pctrl->base + ETH_MODE);
+	writeb(val, pctrl->base + oen_offset);
 	spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
@@ -3164,7 +3167,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	}
 
 	cache->qspi = readb(pctrl->base + QSPI);
-	cache->eth_mode = readb(pctrl->base + ETH_MODE);
+	if (pctrl->data->hwcfg->regs.oen)
+		cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
 
 	if (!atomic_read(&pctrl->wakeup_path))
 		clk_disable_unprepare(pctrl->clk);
@@ -3189,7 +3193,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	}
 
 	writeb(cache->qspi, pctrl->base + QSPI);
-	writeb(cache->eth_mode, pctrl->base + ETH_MODE);
+	if (pctrl->data->hwcfg->regs.oen)
+		writeb(cache->oen, pctrl->base + pctrl->data->hwcfg->regs.oen);
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
 			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
@@ -3241,6 +3246,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 		.pwpr = 0x3014,
 		.sd_ch = 0x3000,
 		.eth_poc = 0x300c,
+		.oen = 0x3018,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
@@ -3256,6 +3262,7 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 		.pwpr = 0x3000,
 		.sd_ch = 0x3004,
 		.eth_poc = 0x3010,
+		.oen = 0x3018,
 	},
 	.iolh_groupa_ua = {
 		/* 1v8 power source */
-- 
2.50.1


