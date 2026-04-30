Return-Path: <linux-gpio+bounces-35852-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKFxLzQi82nIxQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35852-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:34:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AE249FE27
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C21E300D745
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62DA3A5E64;
	Thu, 30 Apr 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZENjqUB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AD43A16AA
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541673; cv=none; b=mMyQ4RK+ycTVYK4HnqDavAauueebXPBk/vSgQ47e648K2EViXg6RxK4ArVwfUzVx/8q223zjCGyY0jwsQg7oRW+Xm3YOBZbelB1Kd+8oxfFdENTJ46MjTwTtoUV3enB8EtD3V8i4mWwvkJ0MwZkZd8ibvD30v0KbCevqRIZx6xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541673; c=relaxed/simple;
	bh=JcDxBvVYuzHTM0pBmSHEbRu5yB+4Iol+TmC03eQIgL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HABjWARZt6RmKezFFugr4uyITD+SefAPNK9MKJ6YCd2thmyH3NhiEnb67ZEw42Wz0yNCewo9CZs34g1ErwyBnIwY35Xguz4U5B6ou88KZWnibWf4I3Tej4vva67vtGpSVU9mI0tJ+YpOhQ706DG5AHbo56UKKLMhZqgKoXVEjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZENjqUB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d73352cf2so607735f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 02:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541670; x=1778146470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGpoI1aZ4hWunrNAuGb7QzS+oVWyQAHR2Jm1DddCfOY=;
        b=NZENjqUBKEUt9EE+HYL9e7mdnGSvUZ8+W2eQXPDYhG4iLJyvdy4yCmfnqo6v+z0cBH
         XfhbqITYDfjH1KPja2YlR3k+w+EQEHr1Z7qLVHqDoPbEwXOzFpAREmSrTmg7S/vaNX7s
         VeccxZPvEY5OuT4w8+ZAXFkDOnfs/8AYCRmfC3VPCSQmtHzV+F9JIpAAVBs+sgGOES1+
         +YaBAhkBZG1WF00/u5QPpY2yl3WhoC6udK4pdERpEwnTrKeAEvoapbWCG+efV6b3QOW7
         3NDv4eMQMTR6E6dKwlb+B2ov8B2YGOpid0KiRUBDVIytdcJmfgzH6w53YV0lG9x+8JfG
         hOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541670; x=1778146470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bGpoI1aZ4hWunrNAuGb7QzS+oVWyQAHR2Jm1DddCfOY=;
        b=kyp3oJS3X0nmZk+zfn+U0jskJGQ8+wtDEWSq+YSuyD6OT9WH61LS0XBKeyvgBrprel
         ALb1CNRZILCZlgbxAhJ3+k7AfvjqVlwG5Vv5eVZCnpcI1UW7+luHZ6dDgWzPQqYNp2of
         5MpHKUyN7gpbvi0ZcGKNJpnU+A41uQLGcKwI/RqMTDgiO3JAEVTe+ji4GqHNrKoRSWzU
         l6vC8fk8zqQMH8MgGFnt1lDEgytP9EtpQJ6sofp/49eQ2NfSq5Tus6vP9DT9jf7Hg1DM
         PbVzwWlGac+Mi5JtibFiwLco/aZ38YcgPItgIDbNMN8UAyzyR1A6/kUQAWv3XNfOgKSc
         ysWw==
X-Forwarded-Encrypted: i=1; AFNElJ/lFLi7cZRw8CZzuJ5nnWm2ooEcw1VpjjEYeT3Xcop0uWhp0zjTBBpRdMgaNiClIFtSX32Bc/OiRWtZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxHZXZeITMb34KHb/PCXPbdEHkEUdVCxoHF0wy9euU8idHZkNyz
	QFk/f3YR+pI0m34mvnh4qSBnEBjLY7B3xJGx89H39DmTv/xaIROquy2C
X-Gm-Gg: AeBDietrzObrVMawCE8+VhCd8ibJ/IQymywrPqmvKcuOOGcqM+nrDLXgYXNKpzVSYBF
	MLDDJBGOI3kInbvYZllfxyqp3vyiu9bVMuaoLJDlKIPvQzvxUoQ0H0PbldACWAAQbi6V19p5Vus
	hKhYz2jKlTOqb9ez7pvYbv7z9GAAQbpXP5LmelwP2V2hqvibQcWwhrKo4B/Y8b2Hn/uQlzME7u2
	FpwHBhB67jaGxkM2A0yBBCkIHzEhOMgV0ZqSUk1Vheia58POu62w3SUFGr4bflIcW+/5i4yQz/v
	8IAdOBQOdSPgEnAo97Pc0+6ca/d4c2cXrHPRRNH0XosMGF3zoSV9kxPNSfYk2aXMeRrvfiav0K1
	L+azstZTuLe00E4Wq4TAUtlnEoABZWtXZJgCTXyP3MqMu78JCX1mIKP/XyvL6u6PHEpjQG1VY8V
	OvoOdyhKGTrcZszFj6yAfjmOuOpz+B3Vu31NdbpXVoQdFop07W3f3i7/Gg
X-Received: by 2002:a5d:584b:0:b0:43f:df1b:9e07 with SMTP id ffacd0b85a97d-4493f03b2d1mr3377278f8f.42.1777541669905;
        Thu, 30 Apr 2026 02:34:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:29 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 4/7] pinctrl: renesas: rzg2l: Update OEN pin validation to use exact match
Date: Thu, 30 Apr 2026 10:34:09 +0100
Message-ID: <20260430093422.74812-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 79AE249FE27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35852-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L SoC uses pin 0 from a port for OEN while RZ/G3L uses pin 1. The
existing greater-than comparison against oen_max_pin in
rzg2l_pin_to_oen_bit() would incorrectly accept any pin below that value
rather than enforcing the single valid OEN pin for each SoC. Replace the
range check with an exact equality test so that only the designated OEN
pin is accepted.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 7b1bb66d4ff6..2a46ba7b3709 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1124,7 +1124,7 @@ static int rzg2l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 	u64 caps = FIELD_GET(PIN_CFG_MASK, *pin_data);
 	u8 pin = RZG2L_PIN_ID_TO_PIN(_pin);
 
-	if (pin > pctrl->data->hwcfg->oen_max_pin)
+	if (pin != pctrl->data->hwcfg->oen_max_pin)
 		return -EINVAL;
 
 	/*
-- 
2.43.0


