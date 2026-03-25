Return-Path: <linux-gpio+bounces-34168-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACDuD4QpxGmZwgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34168-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 19:29:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B3F32A93B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 19:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A1CD30439E5
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 18:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9443A3264E7;
	Wed, 25 Mar 2026 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKD0PHgC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E831B837
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463339; cv=none; b=VWT5CAWptvcx0/OB11vQiWCKNIvKP+DkRRLllg7VdSxdIhjrPCgHT6fHVDmtPCC+XpnkBKYStNaqLclm7YLYUOgqwxhmXuF8fRC3gauHJw1/C2juPV8UJ72wM3jla9oR/haz1FOtnokL51SAVuyMuypr84Ig9rGTosDsy8ZLiiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463339; c=relaxed/simple;
	bh=UL+AURT5jtnyYGqcwNV5lnfBTznUkJN4teJpL2nnBRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fmZvpcDetFWigPrumVkXgoDyQfXcUV2H1Rxf1v4YTTgjsnZ0a8PfMUSBhrJjWrCwT4ayHq+4InyaSJpQ7imckyVJGSZpi4xunetTt4DaKU8WsWjT0f18IgGkppT4oaU7KKgmw7BuHCfl72lb6lmpudxeHX3USJTBdnQPNJKWjPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKD0PHgC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486ff201041so1622635e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774463336; x=1775068136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9O2lEmcvtjMRERfz6Xg1r++Ms5MKOHzkz+QJWi+Ruis=;
        b=TKD0PHgCZzTdw5pkh6lvZevpQA36Og0S0B0by4ekbmE2xZIaB3L6IrJEpZConwpxtb
         243k7hMvGQHNshLEBqBqGw2PQ6OMGySau/VfyennzjW5+ulrW8eoKparQqW14yXZyH/E
         GdCYIhXQJAoh4waWFFzgLdOVPwrlUt47/BiAK5mmI0qJuUsxbZIFNo7/WlpBHfpUzfSL
         6qpaFjdUELbP2M7jXRPATcBJNQn8dDimw4LLvrhtft07ShsMT0avLvYL/wGI0JD++lxI
         cFpZtWcveDW/gEo9DFxpAMuwnSqVndSChIoGIbttX2H+vM6m+BOrsRtlXzRf+pdETBum
         /HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774463336; x=1775068136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O2lEmcvtjMRERfz6Xg1r++Ms5MKOHzkz+QJWi+Ruis=;
        b=GZwuhjpxOLHjoa88IrQ7CdyFUcPqhlbr1bTM5A2uVYtKbFXcTqvCXE2Ki00WgRU3xl
         /QxAOvpCeq3YesCS/kRxgDsGZf8oNBY/wlZT4KzhC07LEsH86ECqr7yK1Obgpjw2oD04
         eTXVBnflKurxLVfrPJG6Pjis+d0hOZWQ9kmxRnR0XLF/nj0+3/wrd+Wn03AnfEYJXgMz
         2FJ6uTAExFf/3cgP9GRHIik3QAghflsNQou6A7SSomcMtlp3yQ1oKQ38x4gX7WWZBJOB
         qdjwZwJwwkf7AKYijCfraBqJC8OYfqYcvN0CUa+HLA9cGafcq9sqsV2JyyLNj0rwPTrJ
         UPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX02w6x3esVfCZ8LPdkdhLWD7K86dUzJDl5m6uiguW5kXSl1MwL+YswoLZ4i3yt5INmYRMCF5MyNtkV@vger.kernel.org
X-Gm-Message-State: AOJu0YyqsKyZTGlHU0c7XVDFU/NaVvZGOtyqNuGxmL2g2c9qjsclc/2M
	7aeldIp+2VoCziSIgZWL6X8PIKg4qwUHydb9QfeF/ijTM1EeCpD4X31F
X-Gm-Gg: ATEYQzyeMv+91j/1OSlDSp4f/5URENcw5hxwYCbdFy6Xpn7y3KykLQCJLOzpW45E43p
	B+yTIyeZFquhgSxYMhAqzkqG+4STjx6p9daN+4yad0WKz+URRtiPutDmDQcvcDW/u7AVSgY5XbO
	Q53RMds/LOiAX0Xfn+pNAsTeDFskrxLipPns8oAvFVYyy3Qdf/sokp9u8QcnYhhTfdC2/YGcSku
	+8BtoesM2QtDdHNPH+P3/G9n+QWl+RUbn0qytHMf7SlVzUjzTVrPb8YkgzZ9U8rTZwcKXF6VrJB
	EZORm/iyf4lzInGriauC6eaGcT3q/ST/vt8nXpDZnYEUFszn67Pycd2JwLrxXxcWT4FOJaxvjE2
	7wCMIpD1YsDuKi7M3P9pfL+F9/aKXS9sfPwcrxNy0LTiVMPfJTxFLrZXd5DcgPecIOEmqtwerwm
	lBUtJpFzo70qSm4vivRWWH1IQMejgFtnI+Gv7sdp7zH4PYwTecTXF6XswR/UA=
X-Received: by 2002:a05:600d:1c:b0:485:3fe6:2209 with SMTP id 5b1f17b1804b1-48715fd4de3mr56752805e9.11.1774463336200;
        Wed, 25 Mar 2026 11:28:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871e5ec998sm11924135e9.6.2026.03.25.11.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:28:55 -0700 (PDT)
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
Subject: [PATCH v2] pinctrl: renesas: rzg2l: Fix save/restore of {IOLH,IEN,PUPD,SMT} registers
Date: Wed, 25 Mar 2026 18:28:47 +0000
Message-ID: <20260325182849.84660-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34168-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: F3B3F32A93B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The rzg2l_pinctrl_pm_setup_regs() handles save/restore of
{IOLH,IEN,PUPD,SMT} registers during s2ram, but only for ports where all
pins share the same pincfg. Extend the code to also support ports with
variable pincfg per pin, so that {IOLH,IEN,PUPD,SMT} registers are
correctly saved and restored for all pins.

Fixes: 254203f9a94c ("pinctrl: renesas: rzg2l: Add suspend/resume support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description
 * Improved the logic.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda02..e20d199833ee 100644
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
@@ -3012,6 +3015,11 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
 		pincnt = hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg));
 
+		if (cfg & RZG2L_VARIABLE_CFG) {
+			for (unsigned int i = 1; i < RZG2L_PINS_PER_PORT; i++)
+				cfg |= *pin_data++;
+		}
+
 		caps = FIELD_GET(PIN_CFG_MASK, cfg);
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
-- 
2.43.0


