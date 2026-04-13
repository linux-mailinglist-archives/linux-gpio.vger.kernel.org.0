Return-Path: <linux-gpio+bounces-35124-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DB9LDg13Wl9agkAu9opvQ
	(envelope-from <linux-gpio+bounces-35124-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:26:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9CA3F1FA1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32869304094E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 18:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D6236165C;
	Mon, 13 Apr 2026 18:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFEuZ2oN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EE22E3FE
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104709; cv=none; b=Au9mqZNKHRpJQdJRPbfmaJmagJeY/n7b2GKrUpeVvcjUKZU++2iMJroOTST41PmazDkgQPczBBJTEm/HPOx9ZgOyVY+FMw01YD+E8rXXwr1PsgawNoR/FetpsoHVBMEAcYgZNLbQ2KIM4RiQW3UxW8GAkveu1nWcndzbnFxH/nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104709; c=relaxed/simple;
	bh=cBFo06Qs8zryMh2Fij9/Im87Zl7Y6ils4ITVNZ8OOaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbAp05AhCmXNwWxT05tMQnONj/Jvz+GkUBLxgfBsjeheKETnp6X6mb2aom+ePi4ypvrjo32/HY4kRF4XaQFZPNFK4bwzvmGqw1AO7gfrWO0lapG2mMHUmP6r7dabhEG2ugZZ3YKE4kmbzyQWGd5gu0/2tHMUg5nsS4VW9iiClsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFEuZ2oN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso26049425e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104707; x=1776709507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nagTRmYKFkoTf8+mO64XZTWVXTJ06QmVA5WY/pQVWrM=;
        b=oFEuZ2oNYePUDLztK+/zDIQ61hVDSNHzElOqyOOYYBY1oZQeoFYZ4/37TgwV8jzxbS
         ZQM0YQz/PywQSGlBKzEyQ3bZoBn+xgz06HvDHJrxsEbcazsRUjPARlTJBrb/2yuQeV8o
         QyMJnmtutTS1WM+Zg5dY1S794c3eDt/OmconmLW0ACL+I2IAAMHdvOtDdy/TEzAMOFKZ
         Og250vffQdCHti4iLFLrmk3esEKptoPx1DFaX8tJSXgoNfw6YOv/iq+PBLfHxMZhih+F
         ypz7kVrmqiN/8lt1olOtJkwdRTWSAWy+4896wy0zT8hC2/ZSbdBBczor51XgalQ0tJd1
         2Uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104707; x=1776709507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nagTRmYKFkoTf8+mO64XZTWVXTJ06QmVA5WY/pQVWrM=;
        b=sy45jbRnDoy/qrUY2faPOB9fVoQMciI83ONNmkZfx1+4ETMEhyZxchJqOvb0FTrw+r
         /zmhrDbGJD11QV5FYGhjP+PeAyLKahECuLVUedLw4Q47mExsnlSl9vnsW9Tmw+zVrMfd
         KwTVWadkqv3KANH2zCTqPXDZsCyCznsio6ZuZycDanZvU41JSBvGSMIQYLd+KCRsDhoV
         ayoYGpYniHKj64+DAmZA2oG0vnv5LH4Dd5wlC7zYC2iBH/u9X+yQoDPs+cfJcgmkQxZj
         tjc6BeqKc1GoZ2xY5XThhYQm+68hir8xZ+xoSLDyMfLnW/i2L2yHy/hEQVE1a+xncUQd
         Nrrw==
X-Forwarded-Encrypted: i=1; AFNElJ8QEK27jp6xT911iBgZiHIXQjReZEQW6qbZArsHTyFK4muZ9ZMfagIp6eSAoqd1Syp1ibWk91GqjTm7@vger.kernel.org
X-Gm-Message-State: AOJu0YzqUXZF6Dqz2WomYnMgUtwfjh+aE0l+zSEHHhAeAcTQGCJ9N/nX
	Ptg+tHdw6Qs9pXdouHxQ/CN546FSyuRhiiKt/CNj2r+W/JH4V5OyqBEq
X-Gm-Gg: AeBDietYMmHdDtfV/MBECutvXy/SMz+kvgZtU9W1h5YI61CleX5rxUNBLrmyg7bxF0f
	MJhoaD8b+8wjdjj39mh/lLrQKOEXfgziUFl6XeznhLAwdIbQkB4DPSeOntT88AwpvkHkAq0wvRy
	4NEqxLCiAlLraNb5yYvzFjNtNFCwDDVNbdRqvIzYoWW0EuABTMw+HnHoCyl6gvc8u8QMYGZc77x
	SjwbjklbosLiqEB+dabpaiMY7EsbxJ5/ZeAAKepGjIG+n9DPNElLTlAZ0Hr33eT0PPhdHO29Wmm
	Z5dtotEOEUE4e9ZyfGC6RdzgcEw2wa1TTaBTPXHlKI4duSnbZ1sHVsEXrIsWql4sMWVl/PVwXUw
	N4OryDIePweuIx0tEOhB0+uGfSWRlkad3TskOdtcpg5JbJkGGLWFmBzIYv7j8Sjidx0WiBHRO1b
	Qt03cc4WkFKkWrycygubdSX5kfAWG+b1l4jMEMK/cpcePCdGySNq0fJ6eVgL8QkLlBYMMBhlqpN
	vLUM9zc0ks0JTgHCjFbSWXzzhrZwy/e2IaPC1rVdOLKrS4=
X-Received: by 2002:a05:600c:c0c9:b0:487:1826:d89b with SMTP id 5b1f17b1804b1-488d67e262cmr131972925e9.9.1776104706627;
        Mon, 13 Apr 2026 11:25:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm301175695e9.15.2026.04.13.11.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:25:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/5] pinctrl: renesas: rzg2l: Fix SMT register cache handling
Date: Mon, 13 Apr 2026 19:24:51 +0100
Message-ID: <20260413182456.811543-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35124-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6D9CA3F1FA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Store SMT register cache per bank instead of using a single array.

On RZ/V2H(P), the SMT register is split across two 32-bit registers: bits
0/8/16/24 control pins 0-3, while pins 4-7 are controlled by the
corresponding bits in the next register. The previous implementation
cached only a single SMT register, leading to incomplete save/restore of
SMT state.

Convert cache->smt to a per-bank array and allocate storage for both
halves. Update suspend/resume handling to save and restore both SMT
registers when present.

Fixes: 837afa592c623 ("pinctrl: renesas: rzg2l: Add suspend/resume support for Schmitt control registers")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 561e6018fd89..5722cd4c581d 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -335,7 +335,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*iolh[2];
 	u32	*ien[2];
 	u32	*pupd[2];
-	u32	*smt;
+	u32	*smt[2];
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
@@ -2737,10 +2737,6 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 	if (!cache->pfc)
 		return -ENOMEM;
 
-	cache->smt = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->smt), GFP_KERNEL);
-	if (!cache->smt)
-		return -ENOMEM;
-
 	for (u8 i = 0; i < 2; i++) {
 		u32 n_dedicated_pins = pctrl->data->n_dedicated_pins;
 
@@ -2759,6 +2755,11 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 		if (!cache->pupd[i])
 			return -ENOMEM;
 
+		cache->smt[i] = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->smt[i]),
+					     GFP_KERNEL);
+		if (!cache->smt[i])
+			return -ENOMEM;
+
 		/* Allocate dedicated cache. */
 		dedicated_cache->iolh[i] = devm_kcalloc(pctrl->dev, n_dedicated_pins,
 							sizeof(*dedicated_cache->iolh[i]),
@@ -3066,8 +3067,14 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 			}
 		}
 
-		if (has_smt)
-			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SMT(off), cache->smt[port]);
+		if (has_smt) {
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SMT(off),
+						 cache->smt[0][port]);
+			if (pincnt >= 4) {
+				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SMT(off) + 4,
+							 cache->smt[1][port]);
+			}
+		}
 	}
 }
 
-- 
2.53.0


