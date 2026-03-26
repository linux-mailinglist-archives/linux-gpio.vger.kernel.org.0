Return-Path: <linux-gpio+bounces-34217-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKzCILNexWlM9wQAu9opvQ
	(envelope-from <linux-gpio+bounces-34217-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 17:28:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71008338621
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 17:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A78053008995
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 16:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523E13BFE24;
	Thu, 26 Mar 2026 16:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wq03FqpE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120543FFAD5
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542306; cv=none; b=R9K9iB2Y0XbyJJ2KEufVVwRW9rUhBlg4DCDF9+CJxGcBmG785AsJ3v1MSppm22V4Sl1fqwVrBt2P+TenYEJLD+Ouza/hOqtkTS4VC840hSLbqEQpZYx98y2QqZdgs+lGoop5TGcffq8qj6xvMx0hf3gb7RrR327uD9hbFLcC41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542306; c=relaxed/simple;
	bh=yRn65xz5S6D3nAmmUq5pfrFoiqpW/Jk83rHf1vrztWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3QIt2RGk5ZpY2y3MrieVQxkG8Xw0W8BAWGepZeH++QytEZ4S4tTXa1H+CmeODYTweU4aqMjNquT6KRokR/UZ9LwV8RszuknpwNZPdcs9Y0/PRYGILydKGHlSkcfOEoop1UOpNeNxuQOnNKPeXCtmpTbBb9JNnECd2RJg0H7sgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wq03FqpE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b6d9c981so734184f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774542302; x=1775147102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2ce0HxX3/F0Io4jy/v+v+g0q9K7PyjffbJmK+am7Z8=;
        b=Wq03FqpEQPYzKKALhRbzEptoA2qmrXo8G4mBc41X89p1b7ioLim4uSAjC2kFs7wZVq
         BtMS7DaGJ25lCl2S0cpsN1Z46q3Uvre4gBTqy+/YTI15sODBzogdDEvx+3LuexL8vmsE
         uI6E1rYaFWG1tr6FYtnsRIqByzhlyA5LRlCZGNpyD9mfw2UETbcaTc/2K/fmljzDNYjd
         HeLpe6hOfvr9EEj3mIzDNfhk4r6c5YBVnzHh6QCoHNzENDPOLcRaH3okODBa5PgTP6Cb
         ml5TJKmLDB/8cYXYAH+o2rYXnjjJ2VkanZs+xl3sgH+rWjzrqH2r75GHhh7lSL0OYeuj
         O0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542302; x=1775147102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2ce0HxX3/F0Io4jy/v+v+g0q9K7PyjffbJmK+am7Z8=;
        b=SEi60EWKBmjS/xGh2EOVYMEwpPclMw2fBKef0jghs/FF2feP8A/E8XiWRPwBCebELT
         wYO1sUuqrKRpzukOtBbD5+m5CF3+5bUobetC9GJzYcFDoQzqhMTfdJlsgbawY2saJug6
         4ZjYszFqHHaEPpDG1e2hnfElj20Sdz26MBTWkO9nhL5T3e9XZlt18diDrXnHTk63SuuB
         UrHxfeulr+8lYcxsIk1/yYRsx0ACxYgwstANC93MzwaBAfYF6oKoO8p9lFfRh+cgrZna
         SvGcTjJVWIze1Q3hzpaCpUiS+7sIoqym46NwM2fOg9xWnHsotLLkEaicll1WmchgIea4
         Q7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUX+YOp8ZDDxnMceeLTuix+QxJf9PsYsVAfiA9Cc1HIJElWTae5zezNEEkdcYEF5lJB5jcwFgJJW3H9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzukcdt9HYQ+GKzZ/7WpRAFZ/aGfeiDrS83kLkzldlu9a+FHzSe
	6xn7xe4ed+HqVXl7KiQDMXuUHw/qSrKLwLYTMsCzGEp5chXUj9/+VZXN+exS4w==
X-Gm-Gg: ATEYQzwg2lqlvm50fzmcl6EpVd2l1P+1JqtoS5hoZXIH4qGsJcpZvKx+X4CU/Rb/f5s
	LhLlujGr8WG/dqYCTb7vGbvHw5MR6K2VmuNd7AiGXjqHGhSH9BCMjXF+ryNFkEuzn44xIrdzJCh
	xVwBWJzuQ4TMVM+cqfg7WdDoa/AeynDGMe/mz5gNS0r0g11YpkucQIH3Ci3aDgxztmv5HpLkWoM
	MJdZvgjo2puMJcx+hKT5Bhhac+5mxpUvbcPoec4ZJ5EWObONDR4G+C+u2+iN1UyuBEIyvR/gV9E
	qt43ws6IC3wV8dwwm3cAuFWZNec7j9HYrXnzcKJRkhp7TpqlmrTR6eQSCcdx0jraThHN95l6p8V
	/W1qmNIzRq3vH5fJ0BDCaTkV6p9oFQJ/h4u4yKuDl4eUXIumc8CM53RXJUcIO/0RRdveAtUU/Es
	ztVyw2d+wemJVnFNGIE2S/h7BnPvY++v1EYgeJQ6vnBhjoRSM4
X-Received: by 2002:adf:9cc1:0:b0:43b:3eef:acd9 with SMTP id ffacd0b85a97d-43b97a86605mr2884336f8f.27.1774542301944;
        Thu, 26 Mar 2026 09:25:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919588e6sm8460951f8f.16.2026.03.26.09.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:25:01 -0700 (PDT)
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
Subject: [PATCH v3] pinctrl: renesas: rzg2l: Fix save/restore of {IOLH,IEN,PUPD,SMT} registers
Date: Thu, 26 Mar 2026 16:24:51 +0000
Message-ID: <20260326162459.101414-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34217-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 71008338621
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
v2->v3:
 * Dropped pin_off, pin_desc, and pin_data local variables and
   instead used pctrl->desc.pins[pin + i].drv_data.
 * Started the loop at 0 so that it covers all the variable pins.
v1->v2:
 * Updated commit description
 * Improved the logic.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda02..55e35f63343c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3012,6 +3012,13 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
 		pincnt = hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg));
 
+		if (cfg & RZG2L_VARIABLE_CFG) {
+			unsigned int pin = port * RZG2L_PINS_PER_PORT;
+
+			for (unsigned int i = 0; i < RZG2L_PINS_PER_PORT; i++)
+				cfg |= *(u64 *)pctrl->desc.pins[pin + i].drv_data;
+		}
+
 		caps = FIELD_GET(PIN_CFG_MASK, cfg);
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
-- 
2.43.0


