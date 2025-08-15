Return-Path: <linux-gpio+bounces-24439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4CB28263
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 16:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B6C1700A8
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 14:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E203226980E;
	Fri, 15 Aug 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeZKVwGi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4382627EF;
	Fri, 15 Aug 2025 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755269275; cv=none; b=lgLu6O5InuonJYjBpbZVb08X1y9pZGgjKonDN6lxE7aofG29jOhC8d5DjgDdWfyNOkzlMYGbdM0/t8PkyATgMLhrEAwGSgmW7IaDShgg7shIon8C3IJU2iFQasSPylqyTcOkRjSTBQvoNRDJfcktcaoxc5Ura5JfSi/dOYhAFsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755269275; c=relaxed/simple;
	bh=VPXhJyGiz+xRJjzFrG3qdqfpmo8BvKMDWN1+m5VIYbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQazHNJQTI5MYmUQNkOpwRBKkeZN1b5+TgeCYfezgsgN9qGnm9whO4aKCNow4VIPci6rIS/qU0cWKEssIIMhECHGN+GjKoqdyO+3sINrnrR2WhFFkjVY+KZlinM6Y8gyzvhee35e5U/o693TfIBHklJ8Fi0r01d0Eqq6IIjIKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeZKVwGi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso12507295e9.0;
        Fri, 15 Aug 2025 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755269272; x=1755874072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/giwtKrBPupjmtQ7aVhl0CWOaN9MgEDJXD9+UP5su30=;
        b=MeZKVwGi/1JV4Dxc/kzk7fJMIEOpE4t0MBCjjiV7J4PUf1PJFXgkrbR6M/ybY9TQX6
         SQOnMQEJiATZgdcNnciMk80xxNgMqNOFUdB6XgOP+cEviaDpUNAXFZysfls5V1J1pu9p
         ObA4Y1DQG/7eAegz+QE6Xa9l8Ff3kbVd/8zYG6+mcoIvxspKJtD5hm1LKVTLpkIylYDA
         5AuapCUwYDSw5FdzhFgEaddDAXFD2zdktiD6LuCwskE5PddqBczieiZCf3sUAzRUombD
         doWj77NmGAa3yNudp1nnlhMNcg84cCAsicqqbUA51QJ830iHm9uRjhAJIH28W2/UH36l
         DXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755269272; x=1755874072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/giwtKrBPupjmtQ7aVhl0CWOaN9MgEDJXD9+UP5su30=;
        b=GOkz3LwMINxer/cMyU4EG8hKvNCOMemsEaFKOTFRTilGfP/P6TA9AJEMWiEvPxKV5Y
         T8pBjggXLE2JM0tQt09Yyk5w+S52gkIV3ObS6XVPoZay1WoSkgIp3JNku0oekZ/zr4Mr
         sEp+9MVwk2wTgCHz1l+w5IQ2oI3EnvaGkk+Vsis+L9jKsCW3llDrvkNvMMrp0Mb3s3vc
         TTONw9wxwcAEe/086Cuqz0ro2TB3OTJQ9lqy8iEAzEz7QEJlFZRr/j7rdfb2JuiHZQiy
         +yr2RoqAfcB/Rraw1U7NPxW7MgVkR6K11y+hq5f0cgJyj7rwQlk9rrseA+C8WWmQM8kw
         1tPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/xsVvmGkUqQTo6I4DMFnVO7HiZj6FbC7KjpebH4vsRsDOlKuAn3aYHlUGLxw2SlE6H9mj7bCQzXIG@vger.kernel.org, AJvYcCU9g3xZlfnUf/Wk8ISmVhSkH8UIINYT6enG9f6h1pxST0wESKQ+SOUCUvplDrV8Gxp1l3I2TiNRUxQ0HKCvcPBPzVk=@vger.kernel.org, AJvYcCXSTSFUlMUQjGMOO3p8J3bp4Hh4O/qeCMvj52F5TWEM0haHV+jIXJVzAzG1jwI5Sy+xYO2u4bR/2vQfsTdq@vger.kernel.org
X-Gm-Message-State: AOJu0YzLuaJayCNUDjoBSvPMJVYhLQCi6opMrBTySSF5NWMUlZ+ZTxnR
	veV62yxbyz1YF4HOqdbqeh3s56vP1feHFiiH0Aw9zzRjj3jjcHFpSb0S
X-Gm-Gg: ASbGncsUgwmLjDNmcB0svJC/8e6cCM+tDd873bRz1joyIWkw5dOoL/06roxYNTz1nuP
	Rw3FYC4yNZfb2ykXDZQXstUtTOlETmnnLDbqTH/VYD5AZAF9Zu8aHF6T7jmbg6vVZlK1uXpAz7k
	DRus69i0DO/sMecq5AXgas/Zcfh4C5PtsIa2U0Yo2s11CWSjU83lmtFbkyjZZ6QPMzrDby1YXl1
	hSWUKPCFHZtvTHnPCMRenL3MFkWvw4cYQWse5ggJd+qGGOAcvIhoEjoBxSU3+/F0ET/5WGbLYGE
	FQy/cLlX4uqs2xTPlbIwQPQnIrok/1Z2HaoWJ78ILf8Z4sqwDN5JyGtCsz93RKbJD8JhEBa82ly
	g6WTqlPgemXnfVONg+tOUy9MvEmPkAzmbR3aqsLeKjS2H3fa+ITR7r3SXKjpquzOljF4pv70Dqg
	==
X-Google-Smtp-Source: AGHT+IEDx4ZypH+jNjoSslTKWg80k+9kqAIMiPE/inwLA5CyZ3cMf8v2l8nvUldJHof0VIiDHfvwhA==
X-Received: by 2002:a05:600c:3b20:b0:459:e06b:afbd with SMTP id 5b1f17b1804b1-45a2185e958mr21947525e9.29.1755269271844;
        Fri, 15 Aug 2025 07:47:51 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6c324fsm59523755e9.1.2025.08.15.07.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:47:51 -0700 (PDT)
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
Subject: [PATCH 2/2] pinctrl: renesas: rzg2l: Don't reconfigure the pin if it is same as reset values
Date: Fri, 15 Aug 2025 15:47:45 +0100
Message-ID: <20250815144749.143832-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815144749.143832-1-biju.das.jz@bp.renesas.com>
References: <20250815144749.143832-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Don't reconfigure the pin if the pin's configuration values are same as
reset values during resume() to avoid spurious IRQ. E.g: For NMI function
the PS0 pin configuration are PMC = 1 and PFC = 0 and is same as that of
reset values. Currently during resume the pin is already in NMI function.
But the code is forcefully setting it to GPIO HI-Z state and then again
reconfiguring to NMI function leading to spurious IRQ.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 34 +++++++++++++++----------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2b5d16594bb7..086fcb18c6d8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3103,27 +3103,35 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 		pm = readw(pctrl->base + PM(off));
 		for_each_set_bit(pin, &pinmap, max_pin) {
 			struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
+			u32 pfc_mask;
+			u32 pfc_val;
 
 			/* Nothing to do if PFC was not configured before. */
 			if (!(cache->pmc[port] & BIT(pin)))
 				continue;
 
-			/* Set pin to 'Non-use (Hi-Z input protection)' */
-			pm &= ~(PM_MASK << (pin * 2));
-			writew(pm, pctrl->base + PM(off));
+			pfc_val = readl(pctrl->base + PFC(off));
+			pfc_mask = PFC_MASK << (pin * 4);
 
-			/* Temporarily switch to GPIO mode with PMC register */
-			pmc &= ~BIT(pin);
-			writeb(pmc, pctrl->base + PMC(off));
+			/* Nothing to do if reset value of the pin is same as cached value */
+			if ((cache->pfc[port] & pfc_mask) != (pfc_val & pfc_mask)) {
+				/* Set pin to 'Non-use (Hi-Z input protection)' */
+				pm &= ~(PM_MASK << (pin * 2));
+				writew(pm, pctrl->base + PM(off));
 
-			/* Select Pin function mode. */
-			pfc &= ~(PFC_MASK << (pin * 4));
-			pfc |= (cache->pfc[port] & (PFC_MASK << (pin * 4)));
-			writel(pfc, pctrl->base + PFC(off));
+				/* Temporarily switch to GPIO mode with PMC register */
+				pmc &= ~BIT(pin);
+				writeb(pmc, pctrl->base + PMC(off));
 
-			/* Switch to Peripheral pin function. */
-			pmc |= BIT(pin);
-			writeb(pmc, pctrl->base + PMC(off));
+				/* Select Pin function mode. */
+				pfc &= ~pfc_mask;
+				pfc |= cache->pfc[port] & pfc_mask;
+				writel(pfc, pctrl->base + PFC(off));
+
+				/* Switch to Peripheral pin function. */
+				pmc |= BIT(pin);
+				writeb(pmc, pctrl->base + PMC(off));
+			}
 		}
 	}
 
-- 
2.43.0


