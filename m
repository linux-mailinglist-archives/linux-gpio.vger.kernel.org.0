Return-Path: <linux-gpio+bounces-6973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4348D514F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E8A41F21442
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454E9537F0;
	Thu, 30 May 2024 17:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3hl755Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68F535B8;
	Thu, 30 May 2024 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090942; cv=none; b=l/RdCjuHJgXYw+rXkakDbv5iyIBGPPbfbAlNK4ehGHvctu4xu3gH0OpLK0xHDh/OL850KDq6dWyzw06Kwijpl9HBjiCb4DRaj6IIyE/utSvlab2AXHj6aALsQrz4mP3eE9f66wD/ZJljH7oUhqIbLxLgXQgtG3D3PAKvoXWF/Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090942; c=relaxed/simple;
	bh=Ynwo0kdC+1pKIASysskF4pkBy2e8UpPG54AnZTJK0Fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QuZKl/hAlH9l7SMb0g2YEcUYvl+PHSZMvjAYbyexdXAaMdfY9XN349iV217cuQsGWsDCrtekOntmOZmGDf5gpIVKkaTKZDfRCqH9K8Dde8qXHAHp8tYsYlam68QoTgMwmuf/tibEJz5nmt6As00ZI/r1C59Ogm/f0eProtJl1c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3hl755Y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f47f07aceaso1494115ad.0;
        Thu, 30 May 2024 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090940; x=1717695740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erHQArRzkGOGl9DPtQ1+BIrGdqkIkm0QXe4fD8l1GHs=;
        b=P3hl755YP/sKsbJ3JNRYDzAFRWo7TyIAA1RnhsYNT8OpSlRkbji6zxm+eAiOFcqbMn
         FxhewZ2CwNzjqPVLSS7Lolodx/wq6QopIcC7JNC/vQ3EJjSJpnbGVzmnMUZWJ6/QeZQd
         UbWQ2LgqDYN1Oa0wZWo38qPbbD1LJYhf2TghpN5dFVsDYtOzCgD/v7fsYMkKX2/xMFee
         wDL/Qng6khJHawH6PP6frw+5Rw/izW2BS3msU3PbWvICvku6pKKtXbnuMSevkF3CoXL3
         aolLxBgkNbo0ohkrXLTd6TYsTUE10Un1jmJLhQryEJ1oHNsCtSZ/aBu7jK72+7pDkRg7
         wlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090940; x=1717695740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erHQArRzkGOGl9DPtQ1+BIrGdqkIkm0QXe4fD8l1GHs=;
        b=vwtrtofedd0gz7GOLs3AcslsNTQ3qyWWoZwpHUOtOiTfgVaFA5TcL/1ovlTBaErRbr
         ihTUAuWAmLCoaaVTccealhTmzcS6fXjd7N9m36CIT5H4r3trmeRNKZJeD2CCwySNdZ6k
         GdD5TGdQkqkv8yGHCnyvETBBedm9tOe5/FKTaA4juEPTeJesF5jD0EFxxKJO0+0oqkQ5
         vaF0SOznf6vUgEPfSYUysX3rLlX0xRWNzASggmx/eRJdu5ZjmMjS1pNYJpheoZWbrPyL
         6qrZqFepcI6J6u4fQOL8BImcxG3H3zt8p2dA8X+UJXifPPxzgJ7rBSeBYpeCeHq49dUA
         7M0A==
X-Forwarded-Encrypted: i=1; AJvYcCUpgDKdwtZvlek7bXra++q1+bzM5Tj54wGsiW89GwNpZFciv0/itp5KOjTczAbc4IYpH4+2igtMtj3ObKhiH2ZVLRbMfQohg/LMxo95EmVBH7Z6tqUt9qOpB/FkLzuqr2QwJqW9XAfo/9QE7BumaJt96qaxnZGMtjV5apiP11ZwakIOWnQ=
X-Gm-Message-State: AOJu0YzyO/2V4zWkXV+zkdyCz3G8M0VfVf1LYn4KcFeRkiVaVpB/fkHj
	uVtRKpYllPEB0ZK99Fl1SamrDDCoY/k5cMWmj+tykcrWukbDzvgV
X-Google-Smtp-Source: AGHT+IGUATWMdJF+8FSF8bVv7WvaBdfOqMxUEeE+1OAJfmuDE2mTw3Z8XLab7zCmj6SOOTkzikVvGA==
X-Received: by 2002:a17:902:ec83:b0:1f4:7bf1:71f8 with SMTP id d9443c01a7336-1f6192ed3e4mr31768385ad.5.1717090940033;
        Thu, 30 May 2024 10:42:20 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:19 -0700 (PDT)
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
Subject: [PATCH v3 08/15] pinctrl: renesas: pinctrl-rzg2l: Add function pointer for writing to PMC register
Date: Thu, 30 May 2024 18:38:50 +0100
Message-Id: <20240530173857.164073-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduces pmc_writeb() function pointer, in the struct rzg2l_pinctrl_data
to facilitate writing to the PMC register. On the RZ/V2H(P) SoC, unlocking
the PWPR.REGWE_A bit before writing to PMC registers is required, whereas
this is not the case for the existing RZ/G2L family. This addition enables
the reuse of existing code for RZ/V2H(P). Additionally, this patch
populates this function pointer with appropriate data for existing SoCs.

Note that this functionality is only handled in rzg2l_gpio_request(), as
PMC unlock/lock during PFC setup will be taken care of in the
pwpr_pfc_lock_unlock() function pointer.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Now passing offset to pmc_writeb() instead of virtual address

RFC->v2
- No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index a3fd14b95c5a..f8a1a1f2eebe 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -254,6 +254,7 @@ struct rzg2l_pinctrl_data {
 	const u64 *variable_pin_cfg;
 	unsigned int n_variable_pin_cfg;
 	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
+	void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
 };
 
 /**
@@ -383,6 +384,11 @@ static const u64 r9a07g043f_variable_pin_cfg[] = {
 };
 #endif
 
+static void rzg2l_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset)
+{
+	writeb(val, pctrl->base + offset);
+}
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
@@ -1329,7 +1335,7 @@ static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	/* Select GPIO mode in PMC Register */
 	reg8 = readb(pctrl->base + PMC(off));
 	reg8 &= ~BIT(bit);
-	writeb(reg8, pctrl->base + PMC(off));
+	pctrl->data->pmc_writeb(pctrl, reg8, PMC(off));
 
 	spin_unlock_irqrestore(&pctrl->lock, flags);
 
@@ -2616,6 +2622,7 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.n_variable_pin_cfg = ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
 #endif
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
+	.pmc_writeb = &rzg2l_pmc_writeb,
 };
 
 static struct rzg2l_pinctrl_data r9a07g044_data = {
@@ -2628,6 +2635,7 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 		ARRAY_SIZE(rzg2l_dedicated_pins.rzg2l_pins),
 	.hwcfg = &rzg2l_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
+	.pmc_writeb = &rzg2l_pmc_writeb,
 };
 
 static struct rzg2l_pinctrl_data r9a08g045_data = {
@@ -2639,6 +2647,7 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.n_dedicated_pins = ARRAY_SIZE(rzg3s_dedicated_pins),
 	.hwcfg = &rzg3s_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
+	.pmc_writeb = &rzg2l_pmc_writeb,
 };
 
 static const struct of_device_id rzg2l_pinctrl_of_table[] = {
-- 
2.34.1


