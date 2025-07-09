Return-Path: <linux-gpio+bounces-23026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 174EDAFEE96
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E00EF543E03
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4042EA14C;
	Wed,  9 Jul 2025 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQpXxVWa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4513F2E9722;
	Wed,  9 Jul 2025 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077319; cv=none; b=EDSiKn8z/ajbLYkpBkXo5LvgYXLBncca22DjrPsLE6x6a6jkrjIbB+5xlARqRd9V/z8QnxgVxm2/P7gYiRONmeBuNnXC45iZLsi8sAPTA7jVwfnzF+Ppz3miEvbj8zW27fIOroIc8Bjj4DahEOe97d4hsQmuBqCKeU1gBEy7nfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077319; c=relaxed/simple;
	bh=FEefdo7gGWDr8pupO9oyHxETp/w8tXE1asAKs8xFNf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUV73Op7XpsJdJPZY4yrVkev0TksrW3eShGwjF4lhvkjKB+G2sJiBaMsOKxfgKPdN28qAruJWh9ZY0MgvWilB7g/HjMaWidkcZoZiM5ETi2RXR4Mg+5mXoZBpbAhwwHOfhEouQX98A4/xOo72VEFtEEa33zvFs6SMM0o/7r4phk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQpXxVWa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso76398f8f.2;
        Wed, 09 Jul 2025 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077315; x=1752682115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76nVrXKIo/jAoyMI3XJ2QxZEzzS9N+bzV0hB2Ue/F9s=;
        b=bQpXxVWa/DTj/z2n4K6r+/f2ruX/hBNbuIvgULKLIoIzAuF6xXmRNzfpHhbMQ4F0me
         8f3Mm1VKB9Nfae2EhUGVy7624IP7eZm6/iIJONQOGOS5+J+UlGBHoMJmFSNkMh6Z8jV8
         CTUjfWJti7y+gDZ8rQlgvaLoIVC/957ld74ouwHwRUh1rsqjYOLeEG+zVsBDJqjtVaby
         gtp8EJ10uzRFcyCDT4JOyS60NQ1J+OReMX4QBwKJJ8YxZgWcQiow4WaN7PrMTI+QWCfg
         0thyjYcbReAn5wGyBlUgeq1kpF4cmDG9zkgVW0SOFr2gK71HJF66ethWhqFgHHJvdVwh
         ANhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077315; x=1752682115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76nVrXKIo/jAoyMI3XJ2QxZEzzS9N+bzV0hB2Ue/F9s=;
        b=V2ApXnDMHu0LfvP7QBN+DpSYR7VADBmadukkb4gpI3EoD78aNcBILN9Di0AM1rsEFA
         F0/XfcYzBjX1Dd28deP4gK8DBPMSg/jlEosPvottg6lauHfxnV0oj8j3cwLs3g6ZyuLD
         LvPP+Fl1IREysXqIuYAPpsaJKmiDsg8u1qdp6QurSarReONlE4lXMM/yLYIRL4H5kP8o
         UbSSgoWnhDdgoCbbg1yB2Tw8SEEDlBhtdeJkrhsP1j0SVTBVmAWSxceTOy//hE3+CoXi
         88+EaoMPlwCJSXeIsw6amMoMJHKTxdxJLM+Bof6YHtf7xN4nkxUKXDX/jMnahFqScPmF
         KRCA==
X-Forwarded-Encrypted: i=1; AJvYcCXAo6z2TlMPSFXeXMrg2noYPmVGgchwgjPv4l9Ab9UzE5aCiJ3jGu5Z1ZNQLTVLNtQjLqdt9wlQjJZQ@vger.kernel.org, AJvYcCXMrgtUclHKkj6Qw7UgXOvH7/HnssaddbG2a8idGCNq6Y/oef0Kx8UN+Si/XvxUb7S+538UEzaddm38N3kN@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJrZp7Xbg0s6gjn9nGGC1/cfUWdSK4pRpIfN66KlO76YasL/c
	tM4x0H37U7Vn1oZwymwnmulJdzxeIJDdArf1AMAmjV7Ql7tYFX6a5H4D
X-Gm-Gg: ASbGncs3H6iqvEHRKFgXhhBaMRAg6jXZxQZq6X5WX3fwl41yCweIqSAbDS83ZgyffTs
	WDt+7QDfcmFf6vYIjLwKAL4U8QVozrWM57OiiKNyMC5FdYLVF7IBH0U8YCCIgRYVWBp6kWX3P9K
	sd/HgpmnZ2kKVdHOV0XFAOyg2x/UX5rjVLF2CSR9HMGJv1IIfsqvtCWDH98PeUQthafy2u7DG7m
	z23vuOB0oxH6tlLzsrcU4u7lyUbDimScZUBaJd6+l+0BZlh7YrGsTeeu6gL2HOB6Hv3Drx9NDho
	NVok3+n9dTe14ISnT31DhWNmocCs/u2O8tIcmyFgNw7RlWgT8dwHSrzemBglOz+zaBZUmadQd9S
	hdsnwGpcurXg=
X-Google-Smtp-Source: AGHT+IFuCxtYJhXND6eyKWWcAAqQN0A94wPLMPZtK2WkaLNK7Rw8E5vO4D2G3lHFasSYQ96k2Cs5KQ==
X-Received: by 2002:a05:6000:220d:b0:3a4:ed10:c14 with SMTP id ffacd0b85a97d-3b5e44e94damr2641451f8f.14.1752077314326;
        Wed, 09 Jul 2025 09:08:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c930:b02d:bf60:750b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm16639686f8f.53.2025.07.09.09.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 09:08:33 -0700 (PDT)
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
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/7] pinctrl: renesas: rzg2l: parameterize OEN register offset
Date: Wed,  9 Jul 2025 17:08:14 +0100
Message-ID: <20250709160819.306875-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index af4a40ca0a98..75b5bd032659 100644
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
@@ -3164,7 +3167,7 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	}
 
 	cache->qspi = readb(pctrl->base + QSPI);
-	cache->eth_mode = readb(pctrl->base + ETH_MODE);
+	cache->eth_mode = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
 
 	if (!atomic_read(&pctrl->wakeup_path))
 		clk_disable_unprepare(pctrl->clk);
@@ -3189,7 +3192,7 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	}
 
 	writeb(cache->qspi, pctrl->base + QSPI);
-	writeb(cache->eth_mode, pctrl->base + ETH_MODE);
+	writeb(cache->eth_mode, pctrl->base + pctrl->data->hwcfg->regs.oen);
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
 			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
@@ -3241,6 +3244,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 		.pwpr = 0x3014,
 		.sd_ch = 0x3000,
 		.eth_poc = 0x300c,
+		.oen = 0x3018,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
@@ -3256,6 +3260,7 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 		.pwpr = 0x3000,
 		.sd_ch = 0x3004,
 		.eth_poc = 0x3010,
+		.oen = 0x3018,
 	},
 	.iolh_groupa_ua = {
 		/* 1v8 power source */
-- 
2.49.0


