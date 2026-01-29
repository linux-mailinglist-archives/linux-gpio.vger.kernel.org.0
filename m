Return-Path: <linux-gpio+bounces-31276-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD4gEqg0e2lJCQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31276-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:21:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5DFAE8E9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C550A3075946
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A03378D9C;
	Thu, 29 Jan 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZLyk8DX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8820B327C0F
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681819; cv=none; b=R6jr/B5eBqZ4e8a+xRuyKFc0xmoF/sBE16ijMUscX7eDUoWTwtl6lYao3lOaTB9CRyK+Gmk7kQkz+nclEXB0Y1ogsVZDuieGAl0xPeVwHCkXdSMaNNDEn0NwSSOPxhsNcYrbWjUwmAuiodWMJ+C9ZDom0awmw+PtoDHr9onB/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681819; c=relaxed/simple;
	bh=9736Q1c5UPkbPCgTxA+3Cri6nfDIyGp2aLifbmZ9cpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGKrM5013LFExnNr9ifyit4ndv5cUDoJxBEyyNsjkWMD49OeYmsaKiklGs83eTC/bDrImLqi9G+VGLQ3SlBuNChhJr5M0Ay4eWARQ3gieXyrEVhGM1SHRpHclLY9mGjwqyYxlIaIfm2UGihyRwkofKX+0t6B6I+NKdx4I1U5aJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZLyk8DX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso7751125e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681814; x=1770286614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNHC7BZwLEWIAkvOqNMf9oTfVeweCY3nyHbRwQRrLe0=;
        b=SZLyk8DX9IO/nGI0mmse6ZDGG46hiT9WDd9A4mbXEfxu3sjBUdRmstuWQj1WR+csgn
         g+HsMXoYpMNdMTVLxMJk/A5nsBUv5hwu+Prsghzr25Y7sKz5TAyASnPL0y+4mmifM6QY
         GIEkhSJbwoKfly55uIB14E9cKu7XnDtjCgwUYFZDHmmQxRPVB4KI+qOwGUVzqJ5u5907
         6iuvlA0/NtjJHFDyEo1K4hePachJBuo5q3a+yefPi1htJMTPoiw4i1QVsdZWvHXjHgPU
         MtD9ri4KdMWujWYsygoBulT5Rail6W/eA62M9nNFr0L+z+1TMGpnP4Q/oBqBBsaITpBF
         Y6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681814; x=1770286614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pNHC7BZwLEWIAkvOqNMf9oTfVeweCY3nyHbRwQRrLe0=;
        b=Ern0ed+Tsq4KR2Gp3sBCN6jNqD4dX406emKyX8elIQFhznzr4pqL8CRmEFugpRJA4I
         EGz4B/IEYQWknlFXn0cwBuKwQTesrPJUFQdEbE7NxDoHNhuOZnzl6ThEFd5TDgrF0oFx
         8GOMRnG+43ppdzenGytPHaxlwpJ/sikjP+ElG2c/jPqUMyFaSVpEeYtyhhWxOQK5eiIO
         j06nQ4uqomUnFRFfF/yXrtmkA6s2P//7sGw7CjPuEXm560q5nmrVG1/rwKUBdXOPXL78
         rSzZJ3bDMxeDeyREGiqOyf7lNIveoZLm2J1LMqDGlFTiPyzAH/bPS9+MqlybXMEfyD7O
         zVow==
X-Forwarded-Encrypted: i=1; AJvYcCUnl4EZNIvfovRMk0zZjFVDuP9WGkcdKF2YKLym+ljBchKdQF6qS9de5etx9a95VkLA0u8qR2J2GxQb@vger.kernel.org
X-Gm-Message-State: AOJu0YzjuaGMMcwRySuXbzrY+2aO1dDFQMLiw2hoqk4qxKi/0iZZ0Njm
	CVAOJNk3JgSHlAyVnKjNkcvWklq0iIxz6XK5DQT0rChbS2DMCjU7kefj
X-Gm-Gg: AZuq6aJySdlaf5cQe9wZNpyXINuG7hYzhYUnNBjwzfx23iOEfb3xD/ouJl6xQXMqVH4
	VfMxhmL+gFFpgd1sGD2dWBZ1iB9IzBB/1O0nf7Ld7nUJmpxOAvMz+Mr3BsIfe0yg4B9silgyZg8
	56IlavCYJrAD3KaENrT4oFEjgVTE35s1l9+AGUCgM9cB+EEECeyykVHHnlNgAMk838ZlT20znBS
	nh9E5pg+lv2l2Po+Zbag9ZcHyN3jKDv3ROi+MrNCXP6s10AE+n2IPRNQeQ5KM/LSq7y/hU+qNs3
	gEYo/F5FOZtNZqA6yr8DHsaYZfmXgo5uieWB09P29dOg4nnOnb4HjLyt/lL9IufETycTJZuGf05
	npZx6nFx4iO/K00DMOtE3jtqJWiGwEGJ+PSWGWOuC4Xn00gEtGsRwVWqIAWTBvRC7rDLMcI7aL0
	zFBTtzpEicWLIcylRl
X-Received: by 2002:a05:600c:c0dc:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-4806c00c0e0mr86656865e9.13.1769681813615;
        Thu, 29 Jan 2026 02:16:53 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 5/9] pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
Date: Thu, 29 Jan 2026 10:16:40 +0000
Message-ID: <03791e2cdc6b2da9a791b4a66b46b13d7c252bad.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31276-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA5DFAE8E9
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for configuring the ETH_MODE register on the RZ/G3L SoC to
enable output-enable control for specific pins. On this SoC, certain
pins such as P{B,E}1_ISO need to support switching between input and
output modes depending on the PHY interface mode (e.g., RMII vs RGMII).
This functionality maps to the 'output-enable' property in the device
tree and requires explicit control via the ETH_MODE register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index cf7f9c2e37f8..5e3e56e32cea 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1198,6 +1198,23 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	return 0;
 }
 
+static int rzg3l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+{
+	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
+	u8 port, pin;
+
+	if (*pin_data & RZG2L_SINGLE_PIN)
+		return -EINVAL;
+
+	pin = RZG2L_PIN_ID_TO_PIN(_pin);
+	if (pin != pctrl->data->hwcfg->oen_max_pin)
+		return -EINVAL;
+
+	port = RZG2L_PIN_ID_TO_PORT(_pin);
+
+	return (port == pctrl->data->hwcfg->oen_max_port) ? 1 : 0;
+}
+
 static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
-- 
2.43.0


