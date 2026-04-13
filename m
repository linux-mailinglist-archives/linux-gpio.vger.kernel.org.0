Return-Path: <linux-gpio+bounces-35126-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBsgEho13Wl9agkAu9opvQ
	(envelope-from <linux-gpio+bounces-35126-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:25:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E023F1F84
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A340301E020
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 18:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E0837C924;
	Mon, 13 Apr 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw4IVPL0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA7C366056
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104712; cv=none; b=gAlEBLGpP65/KjT0czkzApOnuHIiSFx2GL+CXc9camlO0piYaNutmi03XmnMuuZyegT3ZrawMUDO7hse9j1sCAlNvEJsP3DZYPn3EhTLmMnCOT39hMJ+cxpZ2lbyw/lZdLKPNtpBaAbyHKp1Bt47/nj+aCO6xwqhx3Gk80tUaH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104712; c=relaxed/simple;
	bh=ctHMnk/1g0jPYjYI2obSufNG3OHrd+HDWiATO42Of9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eA3Zg24VfO9ZitFvx2LufVcVUVxHNCS0+s/i11h33LPOfoweAv7VqU7439fsqwtTu7SQVbsdeg+GemiQp4d7YlngTSHvrkoZSe5+BZ4pX9mDsPUo4vQO7MBOinRRxXwYGM8484FkG20ICGic7mUvMjZg56B6CCXyOOhsBFrIees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw4IVPL0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488afb0427eso59244515e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104709; x=1776709509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSD4IEKgoiSeEKAhaOoScHrR4rPxBxdMU+VQyrkI5fY=;
        b=hw4IVPL0uKtbsaQUlzmr6Ao5LU76gobjuxC3EuCltXDNBzwmghZXwSnVNeNitJi7of
         2KQl6OK8OJVjP+wRfkiS9wasAk9wORClITo4VaziJVdnxAst4CqDa/0RVj0Tppadd7wC
         PQAjxUnB2bmgNjGunsn25xOY/sTREdxnFDRGM4iI920HL5Dkg7CosD8IhxSa4C4qNdF1
         dC0q87II1jYqTQQBWPzR17xjD+sRy4cxO+a/d2TrkHZOpHtbQNy+fpk6QDyLeLgnHG9f
         nwm44g7N3U1p5fE5iW2iuzM18id6yf4LIxmtPsoj7EHf/FFYrfjU0gCNyPGaKzPKOqhM
         TyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104709; x=1776709509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSD4IEKgoiSeEKAhaOoScHrR4rPxBxdMU+VQyrkI5fY=;
        b=gzMZXhqSkWFQUh7Uh1Q0xN7Tl1EcwaiT6K3xjeIQZQf42dncksw24A3D71qk4Cg5C8
         gcZaOnNPCY961wX/PTxLtQ4F4RvRYcSSQdeRawYpFuTgLfSWG8YvZWhNFbd5bnFFZpfx
         0NtFQSWTg9CUFkRwxjFe5ppomgB49MPXMoqy4eHWEUAmZXmVbvETDe21DkEMzT6pUP0K
         Uqnm/L5mky309ZO5GDXBCiF01kVR5zDTw92F0pXBz+gaCksm2M2dVznDWXXm6EDn5azM
         /2gRj81OHHuoQdRZLmsNdgtPUYSWH4D2/JmcznCLv8dg8UFb3UMWIXsDaEidVVC6/zQs
         h1qA==
X-Forwarded-Encrypted: i=1; AFNElJ9wOEo+v9wiF5d344CiXKFx+iF3gK2v1aNJey0AD46lC9y11OwNnHoPo4bg0z9iQQ8t8uf2060RK/Bl@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTMvdloPMhofYqBdc1wCS2cULV4CRhuYau8uaZfR695fum5L0
	o+B0r0SX1XSzGD2CC1UY55lMYauGoIAJK4fdspcjnxwToHCDeW2qFZp2
X-Gm-Gg: AeBDieuCc8fVnYXQheALz2tPKKGpTCy4ya7Ui6Zn7tawCrCkPU1vNEtQh6Ndm7pfJ7J
	YR00KfQGCQldsA0pmR988HvP+NhfHhPvtoYL1A6d5MR8drDhnNqkfzt2ihggdfNbtmIYeE7TXFf
	yciL5JsMbHvdJwNfZygJJZDAu+sKYQNtXAoNI20SdzbcVk3WhXa4eTJrKYJalsF84lbEh8ujcWZ
	RmJX7V8PceF+U/XvCQDp8ZQe34MuN4s/GTsG46ar5Hx76fuhjOkqIYoZvPrTNgFPA0BoOqipCbR
	ee2EjztMsI1YGbsKfeIzm77DpkDpLAKJ4ohT0rq2TsnEjOnx7mw9abPBrheMrjmOC7rV8Gh5ZeF
	8LPaLDxF2xa2P/m7oioqeRXxlm0TXncDnsDSHQEmJ0Esog5rrYlDSnuwfp2Iq+Q1G+kieBtcBfh
	6NCNFReuUjSh/ElxaHisH8HOMJzewMbgPAnlFc1aY4HWTUiwCseVsAVE3dTwHh/juxnivJAHX/z
	l0T2OkLI6Joi/zLpfDo4QDVdRPfGfjUmUnl3yl9FdAGHkM=
X-Received: by 2002:a05:600c:4987:b0:488:def6:bb17 with SMTP id 5b1f17b1804b1-488def6bce5mr74688915e9.4.1776104709159;
        Mon, 13 Apr 2026 11:25:09 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm301175695e9.15.2026.04.13.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:25:07 -0700 (PDT)
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
Subject: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH configuration in PM cache
Date: Mon, 13 Apr 2026 19:24:53 +0100
Message-ID: <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35126-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 14E023F1F84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when saving
and restoring pin configuration registers.

On RZ/V2H(P), the IOLH configuration is defined by the
PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
account for this, causing the IOLH registers to be skipped during PM
save/restore.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 1e8f631fcb66..b2eb9dca7eec 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		}
 
 		caps = FIELD_GET(PIN_CFG_MASK, cfg);
-		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
+		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B |
+				      PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV2H));
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_pupd = !!(caps & PIN_CFG_PUPD);
 		has_smt = !!(caps & PIN_CFG_SMT);
@@ -3131,7 +3132,8 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 		}
 
 		/* And apply them in a single shot. */
-		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
+		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B |
+				      PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV2H));
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_sr = !!(caps & PIN_CFG_SR);
 		pincnt = hweight8(FIELD_GET(RZG2L_SINGLE_PIN_BITS_MASK, cfg));
-- 
2.53.0


