Return-Path: <linux-gpio+bounces-33598-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJvgONAcuWm8rAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33598-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:20:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 266082A6831
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA310302F903
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 09:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE9F3947A3;
	Tue, 17 Mar 2026 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKXKWBWC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DBF3659E0
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739043; cv=none; b=XXh1qzWV9eAAspSMExh0aDYyIx9d64DUwzEI8fFDCF/8rCRuJzNjV2ZWj1RDAIOV61wln8yH4MPO7CzTpMePfwNfCMgXkP3cvV4lXsut9GxjOV7m5zGlA3SdzWhxihv80gk5uuflfqenD0TusyYOKSDVj25X8Y86oBwkYsqHBY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739043; c=relaxed/simple;
	bh=Aij4QSJbc2SHAAPiNK0v2C11MArAEMRU80yQFCpR3G8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+N0CVJ5AU4sSLo7KuqurMwRm0ybzVMl2pJFc1dy0/D42YF8FlidVRoDIMDCkIUD5abx9Z/5qGTzy8YgG8R8reN4JY3MQrzC9QOeNkAaZGrTGxGtcZDBbUVHQM3J5ndqpkcCdRZQ4HQ8ay8CTJMTgjtXYdKuom9IbZxKJS7DUl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKXKWBWC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486b96760easo2500425e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773739037; x=1774343837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYRJV2+dt7vDmdQuBVN01b08iS8nDG5cKKiaKd33MSU=;
        b=WKXKWBWCUaikIYbdNje71JunXeIbmHQlSWKrKIPNjz1Lpay3OsGq+BoOaNGPnpahLu
         fcFGqWzumXHz+jq8m5qLeo32CuSBCXNhQ3df/zCjnrdCeMZ0WkckLwb4M0zvUsPfRJLT
         GuVwkse/cqUVwZc9jPEn9TTQbkA1h5RtiQwyyKvTtgZ1nIN6iL2OdzCCbGOmmDZEmuzs
         +DVPnuXNPmZjtSEXRrU/MruMpI8pzeRGNTal3UG7pp6CuHKnwdLzU02Htaq1wYwC7t7s
         6soSnQDSGZ08EFMRwx242jkjafkbu7fsfBNSvkp1+89K9T1fwjR/i36dIIg1MRk2HvfR
         9/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739037; x=1774343837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYRJV2+dt7vDmdQuBVN01b08iS8nDG5cKKiaKd33MSU=;
        b=rl7wZNJsNcvAMOTcNyNBFy7uURRctohsCXVQ1U9esNzdJcbWP7bsOQ8PSlKp9Ug7V6
         4JljocLivpctkdR3OUaB2FcM3qhnf+NX9HUDp6Fmzs3GusjZZq9JnhD8EVwpXKBEt0fv
         ICodMAby4BoY9dG7u7wV4iwvanYkVVIBKE89gzoNqoYfOrGLsW2ocTZG2TUqIvnFvgJZ
         VHvR6Rtovb3dnEkWN9JlRHf9/EJV1W6Vc6gpLuCCxJi/PObR+WxyO7L4xpOnSlEtaBef
         LmvbgBifoWBP+gLLDwKxu1gfC7ievSy9WguYBW1SNcW3xAma9+tlcXoPaxesyTwk8MwS
         maWA==
X-Forwarded-Encrypted: i=1; AJvYcCUDMfFfWgivsbLxwEOpCfoPxxYeoPeCA5I+tkQLik4XZjxtJT8+Eo/Lbvl9ULFubR9o4+A0nZVSbVo8@vger.kernel.org
X-Gm-Message-State: AOJu0YyynDJp6yxYnwYaiGY+NQ8kzL8yVx8s8s/2Fp7D+9ibVcA7ru4C
	v+x2PRo0+GvF+5fz0d/Xwtzqd+DZv+YwigvKe+dfW5lFxPWVpqTlwvdE
X-Gm-Gg: ATEYQzziXGIZ4nOOQGa/LfQPQCuBLaU2JubWGZo7D4s+fi7M51gp9SFb8QEhbzVUj3R
	3hj6EhxyLy3YWNTWXuo0OW3Z4xcbXBw0BlmneWBjesPIt2A1kmd2TsUboBjJh5JiVQwaKOx//kJ
	lUxjERf1QEqFActg6CMJrsZmg1EvzExjKay0degL3v0l0OjL7RGgHb0ho5jUUigeEcmQLh/mNQW
	0FtBCRiQznO5H2XPE0BXwveSBA9GKqkdyrBRAysHperPuyrKWRa5RG/HCBaAOq5dlex3yBLnzir
	b9jLYPDYdXw+F/HIc9akK1bomo/Q/I/6FcN8wh0+kU21kHTwBOptrK43h6t1IrZnj0DFxsyuXWT
	HK+nogTgUqLs21kb2SLlSa6+5qiV7MlreKY27JlFCeo39FOulMSZq+BFvHMUkPiGyR/ST2iNzRp
	QF8/KHQLE7ZiY+DjSH5XZ6goESWjCTEgzgW0JcphX36oGi1siF
X-Received: by 2002:a05:600c:4ed1:b0:485:3d43:7c9a with SMTP id 5b1f17b1804b1-4855670e6dcmr282009045e9.25.1773739036875;
        Tue, 17 Mar 2026 02:17:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3d427457sm27555028f8f.3.2026.03.17.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:17:16 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Fix save/restore of {IOLH,IEN,PUPD,SMT} registers
Date: Tue, 17 Mar 2026 09:17:12 +0000
Message-ID: <20260317091714.141179-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33598-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 266082A6831
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The driver uses rzg2l_pinctrl_pm_setup_regs() for save/restore {IOLH,IEN,
PUPD,SMT} registers during str and it handles only for port with same
pincfg for all the pins in the port. Extend the code to support the port
with variable pincfg in pins to save/restore {IOLH,IEN,PUPD,SMT}
registers.

Fixes: 254203f9a94c ("pinctrl: renesas: rzg2l: Add suspend/resume support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda02..3e5436acdbbe 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3001,9 +3001,12 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 {
 	u32 nports = pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
+	u32 pin_off = 0;
 
-	for (u32 port = 0; port < nports; port++) {
+	for (u32 port = 0; port < nports; port++, pin_off += RZG2L_PINS_PER_PORT) {
+		const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[pin_off];
 		bool has_iolh, has_ien, has_pupd, has_smt;
+		u64 *pin_data = pin_desc->drv_data;
 		u32 off, caps;
 		u8 pincnt;
 		u64 cfg;
@@ -3012,6 +3015,12 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
 		pincnt = hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg));
 
+		if (cfg & RZG2L_VARIABLE_CFG) {
+			cfg = pin_data[pin_off];
+			for (unsigned int i = 1; i < RZG2L_PINS_PER_PORT; i++)
+				cfg |= pin_data[pin_off + i];
+		}
+
 		caps = FIELD_GET(PIN_CFG_MASK, cfg);
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
-- 
2.43.0


