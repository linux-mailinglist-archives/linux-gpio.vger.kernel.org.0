Return-Path: <linux-gpio+bounces-35127-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKo4OY013Wl9agkAu9opvQ
	(envelope-from <linux-gpio+bounces-35127-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:27:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A982B3F1FFB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0878C3065A69
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 18:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B93383C60;
	Mon, 13 Apr 2026 18:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWLKszxi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB637EFF2
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104714; cv=none; b=UNAeukbvg1Q60XImgrBsvdpP/u3p4hXO67YrhLls9//R/Law7EnPyfOQ+M7elp5MgFQiWSVmI05RaQcwUmx1J5vPsweMjPK2v7LzrZCBrtRNEEPFPuUCoZo0ufrAGhNbzumYVVbqWxEDWzt1+zdaisPQBLGoE5H0WfqPzmSh5iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104714; c=relaxed/simple;
	bh=turxcnX6VN1eznYIWFKB43dvw3RiMLfdFwVTJ1DnT8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6w3n82udWLjiVFFj4DNAilpB36e9l3Lxjz9snfeiVJ+GTq+7Yw+e/b79rg8nOasfzI9iGTEm5NDtyAi4eFsk3i0i3yhac0Ifx9+ZY2KVFPtgDveb5YYVi8x9W3AXOlqOgzea0i8YkbRMSoVzFAnQWw/7bGdj1tHNeDOGWklx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWLKszxi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488afb0427eso59244825e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104711; x=1776709511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVO71wT2Z3EhUstHSSWgsmxaknRZDzEPaI688DZMWQM=;
        b=DWLKszxilW6AUZ5ef/pAmEOFsEZqLQr3X6vlBdKXM8qmsdcg/UZc6CyCn2yrFGmRz1
         +I7QnAqi1G6XjWLaxcbHy0sPfvBr24+RNdtwx+oUaCLomwBmXoEvvwDBK8Jl/MRXuy3B
         JoqHPoGuMwf9ztDahdF6Jhwv/m8jVYGQbcajm2peQpcjSTZIXOFOIh19AmX7aAbwixtt
         EvA1DY8BB7gNN7hVohbl/Lru36/NUZXUikpzvuElH93wwDjKphHa7IRwyYnW+0AQSA0x
         Rf0QPvfkoKlb8awLrGzmqN+4to3QVg4uIumcatmqalO06muz0dXROnIbrd+srCwK31iv
         pA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104711; x=1776709511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVO71wT2Z3EhUstHSSWgsmxaknRZDzEPaI688DZMWQM=;
        b=O4q6xIew717B5gKYyRUa7xo6QPetH03dzRSYF8h+yB5AHrahvNxk4oag4OvM6DVdg+
         TRkFJ3RfYwtY15Jy9fKENGVOXHo7cRyRK4f98Bchr9mj1vXcoO+3B086UMXQEcBZ1evW
         tewUxFi26D1//oXRTG4At63hWCBHSZk7f8bisce7KLCvszZ3okbXIW7AsVFxBYNNoKHg
         CdL8V4Rv76WAd7s3wVq9HzmqOvdEGQ3nZ9V2bBLyW/iABGrXHqZm0wkYdk5EICP5QdU9
         zSkMgdLFOElW4rZcPokWcT8VOX4LCedPZ8ii4Rx1kIlaeTLL9dOU5uazghTmwde3FyVn
         IrOg==
X-Forwarded-Encrypted: i=1; AFNElJ8MubWc2yPV8aoHE7b5UQPffhbcSlsR56cvGtzjVQnIrZUuCUt2Vy2RYOdsiLBfC0/QQmodO+he5ZSP@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVqJmeBjMVusi/w4Qlgt5QwBfe/uDSOuQqNiv61GU4ydxygnJ
	GtYbVQAMZhqklAC1Quk7fPI0fAnR9Z3rFFE9mJJN73opZTLBJNnY2dy9
X-Gm-Gg: AeBDievRg7HoCkunfNwagl+3HCcFxKhObZcUP7rMYp85+TLrWQjztQ8kPRk+IixPCMj
	K4pRdZbwGDRVmbCT6W8ghTOmQ/7CSfj0WnUyHzdRubvVB/+0vIBnirLfFsTh0U8vvmLia7yuj7r
	r5LD7IAuOaVZNDxH13nhJS5jvJf1cqD2vOYb1pM+Chj9A4hozCuOf3DPg3iu/9FdoZBcHjLhVGR
	kY9Xr0/CfxSzMSrEsNoicoxNGy0EaNO+bOKoNq/7XGuo4qtpZN+U+C/f26zEPzOBKKb76QPkOt4
	3BH1pGpFd7DLGS+63ypOh/pQjg0uB3UQi9n4wPOAoQn5tV1mBxCQV8pskAg4+zQWdXBo1a+KvLV
	E8xB6U5w27oIBr9d4YNIO5WANuS9se5Dvo/f7XOvFDBWg2P/iPynU3/oQcCVYzS2gmvQS/Nne2W
	7gMjrpgTabwO7EHHGTPtGTwSVg3tyjYsuW5i7SnMJ0YzglIyW/cOw95Td9jYLkzZywA4Dz1LKIn
	NbS2aK5Ttxx5ayUt4O9oueS+EpCiA7VeMib6vO8hwS7nWk=
X-Received: by 2002:a05:600c:608e:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488d688a11amr194803115e9.29.1776104710878;
        Mon, 13 Apr 2026 11:25:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm301175695e9.15.2026.04.13.11.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:25:10 -0700 (PDT)
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
Subject: [PATCH v2 5/5] pinctrl: renesas: rzg2l: Handle PUPD for RZ/V2H(P) dedicated pins in PM
Date: Mon, 13 Apr 2026 19:24:55 +0100
Message-ID: <20260413182456.811543-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-35127-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A982B3F1FFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/V2H(P), dedicated pins support pull-up/pull-down configuration
via PIN_CFG_PUPD. Add PUPD handling for dedicated pins in the PM
save/restore path.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index be6d229c927b..1aaa78469f52 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2798,6 +2798,12 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 						       GFP_KERNEL);
 		if (!dedicated_cache->nod[i])
 			return -ENOMEM;
+
+		dedicated_cache->pupd[i] = devm_kcalloc(pctrl->dev, n_dedicated_pins,
+							sizeof(*dedicated_cache->pupd[i]),
+							GFP_KERNEL);
+		if (!dedicated_cache->pupd[i])
+			return -ENOMEM;
 	}
 
 	pctrl->cache = cache;
@@ -3136,7 +3142,7 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 	 * port offset are close together.
 	 */
 	for (i = 0, caps = 0; i < pctrl->data->n_dedicated_pins; i++) {
-		bool has_iolh, has_ien, has_sr, has_nod;
+		bool has_iolh, has_ien, has_sr, has_nod, has_pupd;
 		u32 off, next_off = 0;
 		u64 cfg, next_cfg;
 		u8 pincnt;
@@ -3160,6 +3166,7 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_sr = !!(caps & PIN_CFG_SR);
 		has_nod = !!(caps & PIN_CFG_NOD);
+		has_pupd = !!(caps & PIN_CFG_PUPD);
 		pincnt = hweight8(FIELD_GET(RZG2L_SINGLE_PIN_BITS_MASK, cfg));
 
 		if (has_iolh) {
@@ -3178,6 +3185,11 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + NOD(off),
 						 cache->nod[0][i]);
 		}
+		if (has_pupd) {
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off),
+						 cache->pupd[0][i]);
+		}
+
 		if (pincnt >= 4) {
 			if (has_iolh) {
 				RZG2L_PCTRL_REG_ACCESS32(suspend,
@@ -3199,6 +3211,11 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 							 pctrl->base + NOD(off) + 4,
 							 cache->nod[1][i]);
 			}
+			if (has_pupd) {
+				RZG2L_PCTRL_REG_ACCESS32(suspend,
+							 pctrl->base + PUPD(off) + 4,
+							 cache->pupd[1][i]);
+			}
 		}
 		caps = 0;
 	}
-- 
2.53.0


