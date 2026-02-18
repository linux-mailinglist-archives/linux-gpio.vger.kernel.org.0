Return-Path: <linux-gpio+bounces-31796-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KILrLYvYlWmmVQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31796-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 16:19:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7021575A3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 16:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0431F30066A0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC83533FE2A;
	Wed, 18 Feb 2026 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BCCxKajL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E60733064C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427973; cv=none; b=c/ZWFICtzT84iCLCKCvN0wqwVpYGYb6XSoNELiuTDBITry0j6Y3OAc1HH0c/SzVXQLdYkJ/RaQacx0Shzg0MO4+yEWdfBnJzkqqcTe7+gB4++z/J//yXfyl1jT2KQ6zre7OulYU12K4Z8Fa4pGZ6zYdXI+7O3tcg2TYv9LqwOio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427973; c=relaxed/simple;
	bh=Z9t1qd7Zi142S/RDKbRfVBxzx0hO6FedD/Dj/TvtNNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBSj+uUDxy+qBB9nlLuFqDpetH7MfGbLQ7zsxCo2HWw366rm6Jy8qw7FX5NL4COYGPlN1vpt2zGyHHSYZ6nl35tCYgfpSpmtlZu3kMopf2pr2kjFWtXTbRaHmMyfKlKqJ0Jg7LVD2I9bLgYQIvooBwVg+pwCRn8D2qfRLr8UyuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BCCxKajL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so50928815e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 07:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1771427969; x=1772032769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOeSqkvPcCTeeZO2w2pgvx/aOnZebeGyV7yskHw842k=;
        b=BCCxKajLsFXKUYaMEkJAes2CtLX5CBkMwX0W22KayTse1B376Bzdi92DcNu73OtDen
         hhlFOVEt5pz3Kfo6MWyBm0ROGlwP5UxtSuCuhfuKA1A4vrIIkY62uoxcUJwEEW/QfqEV
         pQIh2XaRSM20HX5W0fCd/PrJwcLAtV8bsHRkhnWLDrAYPXcd8ZQmvJzjvtR4w1b/FfVP
         sXc+HxT/nkAS/mAQq4v5W0nV8z3ooujGVBXoNzczGdi2n1iCBNi9oxEtwfFhcN/IJlJq
         RDJVb2LUV/KEdwAgBzdf6+FJLz90JzXQvrA8k8o3OdlYEbYl2DsnskkXohhyUfFkfAl7
         xRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427969; x=1772032769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOeSqkvPcCTeeZO2w2pgvx/aOnZebeGyV7yskHw842k=;
        b=Da7+D+aD5l5WfU3RyDyI1UZvCMRcwHnvuC4lVsen9GxLvEO4IA5KWxraU/MXeFU+fj
         fxj17IHjL3CShXacT0ribTzyjml5XdqytjzGL9d0abLWngtvJrmmW6zYme11gui/sowk
         0JpGXQBL1GHDz5EEN0QAKLbH15W/MzVTRUrPgzYdscOE6+nqVD+7fhKbFUS9GMTM1ftc
         CT/r0VvmAHUV05mTPBxkVEW6NHe8DpSfWWEP4cMnBN1Fg4HOTyBRfEatxLLA/ba62Hqi
         /kKNrbP93YBS0s/TubVzShb41a4DYPt0SdNVN0Xzyzg54XG64OdM1mFp0xE0HPEjr5Mk
         VhLg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ahy/oiMWEIkW5Pedbo7jvNqQHOE6LYomRTh74rXJJpf7Uj7gmjw+fgoiTO6u/v8FDma2bivGQXcq@vger.kernel.org
X-Gm-Message-State: AOJu0YyLP3Qb2Er6xubheyaycTbb5quOxT51KS9hHd8QQcHFVTB3dnkM
	dX+pzYxVdlOHuKu1QZYkpF4ll83O9NHhPgxw/LwoRX+gLWoUSZmGIbKNPWDHT/07okc=
X-Gm-Gg: AZuq6aI7HGQtG/2IuiJQqMYSNOfAdYQvkIJB+ajNjENUY3itT5suqSlJIildC3T75NJ
	5nLcDeRzhSI17C96M5pArk+hmXryStfvC5axugsH+gzn9b4Pchoj+/Ls7Rg4f/c+dzqdGgpezaA
	yFV6AYorMSLjXk6LN4T7ZGMAsOFnKoLBDlh6s3co1NLXjXDgkEjgoVeBHd4p+TQWKjjlLAm4D4X
	aVrVLwZxUdWPLBWItC392tIejukJ471x2Hvlv2U+5bQBbVSMsckBHLu8L+YKH7xfyOdUQvYdJe1
	aKaX8LItoXPwr8rJVjt88bUVFrxV90Fm3IG/gQfbcJc9JYx+zXoPEEzNHbR30pnuz5Fl6zIk5JH
	oMGuuuK+LkEzpjfaYAl0pDutxXJ+l9CXBc5RDF34k0Lx+PwefyucWUR6hF06IJ3m4ok2Cs7jRnR
	W4S/VAlGRMWXmNrU8ozqzM03ls53D5+IfFB+abcP0FcKYp4zC0I0c=
X-Received: by 2002:a05:600c:8a0d:20b0:483:78c7:e1c1 with SMTP id 5b1f17b1804b1-4839baa7e29mr15702945e9.12.1771427969071;
        Wed, 18 Feb 2026 07:19:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b2d1sm45366347f8f.4.2026.02.18.07.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:19:28 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	brgl@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
Date: Wed, 18 Feb 2026 17:19:25 +0200
Message-ID: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31796-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email]
X-Rspamd-Queue-Id: 5F7021575A3
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add GPIO set_config to allow setting GPIO specific functionalities.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda02..641ae1adfd4a 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	rzg2l_gpio_direction_input(chip, offset);
 }
 
+static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				 unsigned long config)
+{
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_SLEW_RATE:
+	case PIN_CONFIG_DRIVE_STRENGTH:
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+	case PIN_CONFIG_POWER_SOURCE:
+		return pinctrl_gpio_set_config(chip, offset, config);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static const char * const rzg2l_gpio_names[] = {
 	"P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
 	"P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
@@ -2819,6 +2838,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	chip->direction_output = rzg2l_gpio_direction_output;
 	chip->get = rzg2l_gpio_get;
 	chip->set = rzg2l_gpio_set;
+	chip->set_config = rzg2l_gpio_set_config;
 	chip->label = name;
 	chip->parent = pctrl->dev;
 	chip->owner = THIS_MODULE;
-- 
2.43.0


