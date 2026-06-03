Return-Path: <linux-gpio+bounces-37901-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1d5+EAlRIGqd0wAAu9opvQ
	(envelope-from <linux-gpio+bounces-37901-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:06:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA616398E4
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:06:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kMlO9bSg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37901-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37901-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 325EC3208625
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 15:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5CD3CE0A7;
	Wed,  3 Jun 2026 15:17:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528E532F748;
	Wed,  3 Jun 2026 15:17:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499822; cv=none; b=AJxUqkXfnFJMWEbpexi8S0bPSF4GbIFiwY/8gIvFbCHBa2tI0g4N9s3QCjxfAlXz4MgXNZy5ly4X9jG8tUalKcpsI4XoU4ANW1zF8urr/FRJN/w4+NiH6Z2Y0swJL83EX5SsvnmQFa0XRVrY80B0uUk0rbJYeUBV4txu5E6wIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499822; c=relaxed/simple;
	bh=NyFiUec/36k2DOCc1WPXAm3C8qjmJZtAAuF0gZHzpEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aAS5j88CwRrQFhQ1wsRQPjTZGCVH/WkmT8L+Gim+fSTzxTLAyzlvSAF/HESROuVgkJtu9V+MbhpHS/wGQx9Zr6okSGBh1eOeEhaqJGtJrBBOOGiUW7jlSwYi6yC12oBTig6cufYT4C4eRrGxuDWEf2MnQnQEAtYbSULYMOjoyBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMlO9bSg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916801F00898;
	Wed,  3 Jun 2026 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499821;
	bh=XDIwh/usRBAV/ZKdp5/gXu5Q82igijMkQ+3odZ715bY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kMlO9bSgDDfK9IaZgh+oRNmQjjS/tJpX6hT3IQt6mzIreMrATDG6ZWsJetANdEjmB
	 A1dLXsBLbq+UzyaTb3i83jVIHAuqkhXi4k9xhoOOmoq5ByXgXzcsib3Kf5/OhNH5Gi
	 tImJKhswvL1dJvPT4vNbQBFGJC5wZ6LvbWMSx+wMf1uttB5K0OPqm2FbPuFnFuhLP7
	 khN/yUTotX0EwfIA0YZ/sdU8TlVXqvpo+NxnmJiP6YnHzf//KXkr7Rgw73Ts81XVUY
	 5vvmGAX+1SpNUF8imXG4gSH6uArIHR5ma8cXlZSvskg9YDF9PgQ9uSxkwM8y+XPXMP
	 e2iXMhVi20U+A==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update
Date: Wed,  3 Jun 2026 18:16:37 +0300
Message-ID: <20260603151642.4075678-2-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37901-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea@kernel.org,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DA616398E4

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rest of the driver uses
raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() for locking. To
avoid concurrency issues or deadlocks, use raw_spinlock_irqsave() via
the scoped_guard() helper for power source updates as well.

Fixes: bbe2277dedbe ("pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 83c61dcb24b1..be52d47d77ae 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1137,7 +1137,7 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 		return pwr_reg;
 
 	if (pwr_reg == OTHER_POC) {
-		scoped_guard(raw_spinlock, &pctrl->lock) {
+		scoped_guard(raw_spinlock_irqsave, &pctrl->lock) {
 			val = readb(pctrl->base + pwr_reg);
 			if (poc_val)
 				val |= mask;
-- 
2.43.0


