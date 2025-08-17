Return-Path: <linux-gpio+bounces-24467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01871B29376
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 16:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB6F52A25F5
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 14:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC4829B21C;
	Sun, 17 Aug 2025 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuKyj/8T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E401229E0FA;
	Sun, 17 Aug 2025 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755441030; cv=none; b=FEwX+c5dpCAwry1hEN3IHNiXgFFuP9buJcrH9JBmm8e0grOQpLo6lmhg5BHfvmPsI5t2qTs/Tq8nHg93qGtdsBGW+9rwm9Idk/kprey0YZsBxvmi5SduaAlUXbK1fK7Ec7svOghC5mj7JVlrO10guvCEPhnpGCFNILswjtkaoZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755441030; c=relaxed/simple;
	bh=9eLkhdjlCji7E+jkylN1lgFEoIP1qDqRl6O59VCoVSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGcNlC1jHX1MQnnuSsxt0Sq+eBfmrzOHQf4HN87w94mME40wUP5GM7pj1juBbSMt9aVeMmMxUYAc07EuR36oSuxKvhvEANi0MiIcWtqvcqY837Zsu4xganpsLS2eUaHLEhPxV/+1l70FNqNCcOP6xjLS5fWIP8AZM85hRKkZmGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuKyj/8T; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso22112445e9.3;
        Sun, 17 Aug 2025 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755441027; x=1756045827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5R8Hi/9JGtLxZzRD7M5EzGy0MS0wjSSCmammDop0GV4=;
        b=YuKyj/8THC3jufsCNt1pNHtGEi28Sz1qbQJuFJ0+5xmmPPcJSkZO6z0VHZxAnGhogw
         8tVEVem1t3plMysOKfnjMyhCDKgB8qEg29dDbqK3p9lComZAOn70kUJnMW7IapI12bt5
         uUqb0MbEfTVNUmf3S1gy/8w6utq//62hJ4Lf1rANlXe71bzJcKRR27CyJdd8s2YI6IBm
         d89LQUPyNVb7qL4v9HbAA6lJ3jwgOQIX4Jjm0lRcc0CHtP8SImTH/x1WMy2zeyNLnUsm
         OatyjtNpJp24PcZ2CfixEzbvLPeYE9VpP1SqFRaX5iPWeP1B5wqqgSrFanwx5D7umEtS
         jHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755441027; x=1756045827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5R8Hi/9JGtLxZzRD7M5EzGy0MS0wjSSCmammDop0GV4=;
        b=rP9EfkQAjlNq81CzaTd8zS7mtfBj6xHonh2dGyWqZHZK7Pdid3VRnv8zVZlqD6w/OA
         BBYE/4C3PuPa6buSE4CgrzOsxSj2IuC4OM6AGF7Ogv7KwqhiMPPmpt3dSZZYhUlVRnS1
         rM4D8F7wlU43oX4GBotjriz6CPtYGD6shoHIvqAnqpa+7GEptkKi0ITYIePiz60PF0Io
         3F0ZZfoI6E0vJ7gKIRzheZdJU8k+s0oreNMw+tDVsvhAAgT9xc/8WKw1UKaAPdXYY+5l
         Jg1Os7tTkFHu8zpEU2gdN6/ZyILUYUBQuwO3XZdMcbKcr44SICrw8AO2DvUrb7tSmPEu
         a8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGm56Spzfo6vdPn8ji5RwJWjk9xnS87MsBdgcacyA+8BmcsdZUB89Fg/nJXJc9l3pzm1dx+YZHFzpitP0b8G3CtnY=@vger.kernel.org, AJvYcCWFmJMFp/Hj/CZXHxEz3jCYPKLpHEZbCQp5Y4m/78txM3Nwjb9B/AxKtqgifObSj+cEXlYJt6Jq7s0N@vger.kernel.org, AJvYcCXNrOGJv1oZ1ZRAd7g8wo3WT+xFDbJ51PxmYPi7mEMwNREdcT3+C53xxS26Y46bs6RGD7tqS0AYueQIJh1O@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvuUPO3lBuDzLVpRcPPT6nQ1Jix30ErL2na17uDfG0SERYu4W
	PUroMwyUlJhpKa4SF528/Mg8EW8q48WCt7jI0qRuP5V1AZ4P5eFereeU
X-Gm-Gg: ASbGnctRd05ivzBsHBLs2CdKVJ23gC/uQtoNiNyLN8K02BtPFdMcq1ZiqFEvjA0+jY2
	xfIeWoUs5mRXaYt3eq3IvpslSlCsYWrdTWcdvGRsmAcGg6Bl13X+cQzN63u90Mby7uiAWllhGPK
	ZmYw2eoAux5UYFhmsUZgKxqnyMceJYbgT2MAQMz09h6SiTZjW2ShqlAy5Xh9GKthC0wsIw28/cN
	259/x+lStVzzkb0ozejVysE8NK2Gk29fRWTKedKxq+F+GYiSE+Pu8QLLFYKjATgfouEOF/YOpkr
	uO82MDKOeucF38yziD76yGc68M7Zw3UTWNKLDUKH8uPD1HA+7ITCr9S5p9dRI0ZAjL46RqkK5HU
	6VLSC2PRi9bxiw+EjrtkXz3EhxCHUwTaqaxuA/xUd6EdNx+qDnwGvV74qcJ1AmxTf3irex9V70w
	==
X-Google-Smtp-Source: AGHT+IG5HdTIUFKCtQt3n2tGpuVl8oxuFQsDBWJbM02vhdze33sL+HuPuvnsqNwJuyHggrTgs3yNmQ==
X-Received: by 2002:a05:600c:1c9d:b0:459:da76:d7aa with SMTP id 5b1f17b1804b1-45a2185d715mr59132355e9.25.1755441026874;
        Sun, 17 Aug 2025 07:30:26 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cfed5sm129938485e9.7.2025.08.17.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:30:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Fix OEN resume
Date: Sun, 17 Aug 2025 15:30:19 +0100
Message-ID: <20250817143024.165471-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817143024.165471-1-biju.das.jz@bp.renesas.com>
References: <20250817143024.165471-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The write to PFC_OEN register is controlled by the write protect register
(PWPR). Currently OEN register write in resume() is done without enabling
the write access in PWPR leading to incorrect operation.

Fixes: cd39805be85b ("pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index b182b3b8a542..2b5d16594bb7 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3165,6 +3165,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
+	unsigned long flags;
+	u8 pwpr;
 	int ret;
 
 	if (!atomic_read(&pctrl->wakeup_path)) {
@@ -3174,7 +3176,15 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	}
 
 	writeb(cache->qspi, pctrl->base + QSPI);
+	spin_lock_irqsave(&pctrl->lock, flags);
+	if (pctrl->data->hwcfg->oen_pwpr_lock) {
+		pwpr = readb(pctrl->base + regs->pwpr);
+		writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
+	}
 	writeb(cache->oen, pctrl->base + pctrl->data->hwcfg->regs.oen);
+	if (pctrl->data->hwcfg->oen_pwpr_lock)
+		writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
 			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
-- 
2.43.0


