Return-Path: <linux-gpio+bounces-36745-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKfxJUBmBGqXIAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36745-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:53:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9DD53295E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 547AF30402F5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DF7402435;
	Wed, 13 May 2026 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPnVuhjB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993BB3F9F41
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673202; cv=none; b=pY4pQN+HfbeVDVrFGjvIc49QNARbRbZu1Fl4tmxXrV9SkCX+fqBr8bLyq3ZfbbSiicKXvqhZSN1olPctn2f4YSZgaHmyvO+BixbYRA87MVX5w6U3CVehZRLwVF8uFCUqQ67BlVa1hcadrTEufAeFBjpYsNxC5rkLYWBNGYzOJU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673202; c=relaxed/simple;
	bh=t64FkIjt8YPPd0Kv+ZYgqe/PVj+DMiY4kKfszshbsso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b35voBIK9jxDb88dJugsHcab/WpqFKWtlm5dHYW2zRlKXTfesYDwmXjUgC6VAIYZAGtNkmXEREMvAtqenvCb9tsBF2xlmeia3CS8j4n9qlHDryf64WQDv73DudT5rTYXBgEDEowp8Vy5/EkK2XmKubkF8eOF9dBw41wTRXfqMPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPnVuhjB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-448528f4e69so3925390f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 04:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778673198; x=1779277998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4+4FKRbGi0weZRueGf69BctThyZfUOKTtJTR9Y3Oog=;
        b=PPnVuhjBgziUQ5Ye2/2J7RQGT0zy11UyD4dEiWn0jaNngTGtcHoEQE660H7YWWSHCU
         gfyBo+ElX9LFonQzuHG3WDb/e5clvc9fh4IdUcF/XnXk+u9PIL1jd7NN7ZAGp+j9XtED
         RqzKNEnJZcCYgweQVAN/xCTBwUEGa8pLTYBj0qc2DvYQOcKqCbujCEpHipMc2I9m6ayx
         JQrK3+v8Pg1SHJjDasrr+Y70kcx7BonCL8ZtHRTybXik5efuGgjXN3NxBO/EOYEY5WeJ
         LCi2/1KKsUiVQ6cRSbMSY0M17p4pJP9/sMU8RtA+VjxKK1FdruWIdfuwv7rhN3oBKYXo
         oLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673198; x=1779277998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4+4FKRbGi0weZRueGf69BctThyZfUOKTtJTR9Y3Oog=;
        b=VlHFqXSdTcTG0pOjlggoiBIObZnLrf7fpblJmL0BZl7yNHtfFg89Dub+syCKD6v+Vc
         SKmEXkMMu3UL6hYMbzYkBPcYno1T+PbnobKyp68MnXkl01nbF2Ktjec6+/Tf10v0tdke
         cKFspnRTJKVJdsOzlvwZiS3t5R7JMd8rEogoyYudsliHCJeUdj3SD7977G97H2wq347K
         oqU9CF1x2S2VqI29h/WLb6v/v3vh4U/oYX3nRiOZXdfR//GTHBgRW135XJq/V3APPLhB
         Tt/zyxaDYJDV8CSqfFhGJCnz0W4HhRpA1iqhJ8w33RMwml8k8SLQTebnF+ePGUpzleL0
         RbMw==
X-Forwarded-Encrypted: i=1; AFNElJ+hnmV+tDnYKCBs8J5hMn5SCKacAqWcGS6bBW9NTb1/xE3HJMu9zQuxLpcLQb0lCXuUHmB62uB6L2qu@vger.kernel.org
X-Gm-Message-State: AOJu0YwOV8oc0ft4ekBGhmwgLhRT1e/rLl7cL1qy3XRyTz98ryJGEzn8
	Zx1DS2WBeWPrUGdsunbVpxAQzGI1W1hYyRavP2CzkN1cg5eh0Fk6b8aP
X-Gm-Gg: Acq92OHiUoRwTZNKislE4cTsBpDqcQcq6O2yN3WRT+5UENKoqif92CF4iazkH0sU4m7
	tRNkVdL2YCfSNmUdL0ArtZN9gnooXey1KlqdKxP+vqfihbH4rFBqCYTTkH2P/P6GLhwVamFw+g/
	ChXXWl+hIu7G0kgLHy71aDIO2Ux3QaArpPsetw22QzQhww7C/qiw2QFxBBkJcoWMSG4pHvLexZY
	b/y2fu4nggkaNktNGCs0Bf+RphH5BlLj95KPq+PxM9FneeszlhIjiv6af5uZkpIJuUest2Y9PWg
	047tU9FPl2qOLKExTvUlFv6LXYZVHlGTGRsI3l1yY4oftHZZERQo8lWUtJpe0gEIavNigXKSZed
	mO0zhoxb9XliQQ8m2sSr3Bzg5Hdb8sT1EGTvZKD6jGMxq8LRIm6liIzBfd2O9qzOHH3T52LOyYf
	3/D/hgXGO353fhSSg2KN1kNA+ohLyjgSkPq3QD0vZA8W+1bcum1E2D1yy9GQXAKYxJgDkExefwE
	AVAV6Y/yDR5K+2ZefYqkzHuuqyEiExLCV2yeQ==
X-Received: by 2002:a05:6000:1847:b0:441:2aee:d561 with SMTP id ffacd0b85a97d-45c59cd2d7amr4822718f8f.28.1778673198018;
        Wed, 13 May 2026 04:53:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3e5f:9005:e5d2:460e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6aea4sm46402603f8f.10.2026.05.13.04.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:53:17 -0700 (PDT)
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
Subject: [PATCH 1/2] pinctrl: renesas: rzt2h: Remove unused variable 'j'
Date: Wed, 13 May 2026 12:53:11 +0100
Message-ID: <20260513115312.1574367-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6E9DD53295E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36745-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Variable 'j' in rzt2h_pinctrl_register() is incremented during pin
descriptor initialization but never used afterwards.

Remove the unused variable and the associated dead code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 4ba11a83b604..4b790fa72b49 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -1140,7 +1140,7 @@ static int rzt2h_pinctrl_register(struct rzt2h_pinctrl *pctrl)
 	struct pinctrl_desc *desc = &pctrl->desc;
 	struct device *dev = pctrl->dev;
 	struct pinctrl_pin_desc *pins;
-	unsigned int i, j;
+	unsigned int i;
 	int ret;
 
 	desc->name = DRV_NAME;
@@ -1157,11 +1157,9 @@ static int rzt2h_pinctrl_register(struct rzt2h_pinctrl *pctrl)
 	pctrl->pins = pins;
 	desc->pins = pins;
 
-	for (i = 0, j = 0; i < pctrl->data->n_port_pins; i++) {
+	for (i = 0; i < pctrl->data->n_port_pins; i++) {
 		pins[i].number = i;
 		pins[i].name = rzt2h_gpio_names[i];
-		if (i && !(i % RZT2H_PINS_PER_PORT))
-			j++;
 	}
 
 	ret = devm_pinctrl_register_and_init(dev, desc, pctrl, &pctrl->pctl);
-- 
2.54.0


