Return-Path: <linux-gpio+bounces-33610-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH6/IiEquWkAtAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33610-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:17:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA082A7B07
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2D5F3011CA7
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC0B3A3E73;
	Tue, 17 Mar 2026 10:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1XL9iC3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5C3A5E63
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742598; cv=none; b=jfQfrncfXticDncxJHzYIZAq2ksdRE4hu2HdtytlBRlxvx2G1lm5ncgfNZj7SC5P4+rS4pOLoaIKDAECWzaA+qQsvx9Qp5+i+3vlFmjN2IUu3eyzS6+TxjTLzvZ0I6VW2NK9nVK/eiGafd7w2RzJ1DFD9/3s4jWCvYScxWCKJnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742598; c=relaxed/simple;
	bh=aLy4BYQIP63Q4zSdEbsZNx11fflS8iIoi0QToQl+O4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ry/jthIDLIpyRVL4osDqgzjVWFGvRjHxKl6TgyMIcF5cMRMFQAZ/tUsgb4g9qvyYwrOFKnlbtSXFO7tXhnNS4tC3rbuoPWN6XAqrFnXVqcW/tKRU40wkxWlvXCyYGFW+LbWLoSy0bxafTuKyI7JIAXjHt4DgaeiW8dcwSPi6A04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1XL9iC3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso50473545e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 03:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742596; x=1774347396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76nwZRfzqbWoxhYW9lhr3JLOZbPSRfqUV7stW3roFzQ=;
        b=m1XL9iC39x+J0O/d5l6Wev6UUJzzZxAQX2Tn5I7RkJsNNBYbcl/0CFPlrZMWICEjWh
         HwZXy56ZoCIhjV1Zqpb7S1ZXJ5Uh102Zz9nNAltD15JcXmbEU0yZJtpqlrc6WhkevQ90
         vBlkxLsjncgDygZ8q4+fh/RN5toi89ckPhHVDzuCs6Y1j+6mJVlJVQcxXyHelak3JSlA
         4DaY5PZAabpZrqxt6sl1nVFlkqM2/qoaR0pndBsDxyMWrI8kkteeaf9iU6DB6dqlC+HN
         mWULH41zfjl8mR+5AUZlh3QChjOMrj9bbw4G3MpKUThKC3/fE+Ng6/4VZf++WO7KlCnv
         OoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742596; x=1774347396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76nwZRfzqbWoxhYW9lhr3JLOZbPSRfqUV7stW3roFzQ=;
        b=mcSjY+Wk3AitgUTKJIjlVHFQBYu/DoCk17aQ+Y7faCZfD9a+RH2Wcsbxs9cso3t1QM
         uB9d4mk5gVMsS+IzS7Jix55OZjuIzMm/sZpfjWysVuSLoRWiQxApkqXoKHzqawAfvAJR
         WBlopXMK1Ogu+ZoKByaK6NLFp3YC7inD4ZZWjqwOvfBXUFaedqzjty+FUMdIIvxg+cz4
         RtcB3HN0L6Y/jo9MECibLV7oYJ+fYbhedgjoz8U47e+/1X9xdsp5nIKdGempByDKQJHg
         l6BeUiSwyWR7oWcglAvTsDZ4ATmojV46BsgGuv2IeFnhZX0EJqcx2aVT1q0gJSBe/P8y
         Vaww==
X-Forwarded-Encrypted: i=1; AJvYcCXoah++Tq9C3/adiyL5FDVCjbBGsvPQCyTtHyFYB4JFL2pkLkEcnP9UBF6SWKyDzCZk1HKaUybhGEL4@vger.kernel.org
X-Gm-Message-State: AOJu0YzAQkBrbaSYECnuhKgmjlUGgHFRO3xTJQZFwQwyzWKhvxGIB5ni
	EOrjzsqW8GJmQTd0bHJJIG9tjJiaNKfx6t4tJtfoeYJDvgq7gfP1UP+2
X-Gm-Gg: ATEYQzygeFse1SU0Qi7ZnzO+Lubwo0PJ2g4phcCNZiBGkXb2JkbZmS4ZMngFJuXw00b
	0PvKU8FXfPdd+vnFUJorgDNwToIUF6hmmzKz8oFYblgiIzkvAaDgq1v8wrqddCWhfQ33Pnei9pN
	Cckg7g3aY+uFY0lQ0ULjxKndXdp/iDHX5TgmJVdqWRxexPpCNs89Cpmk/eAhf4iaFn2ukzDLr17
	GiSGrcg06smKIc5tJVDjcA0FByQoCCfnTjS2GRCH0Y1tMcFjZ+thcNiaNOOAsUMJSUdQZjqAxZr
	cmn6zXI8ZOKSZFuu5jSGdNgG+nRkYa+o0vrTqzSFS82ji3HksNRJ0CKXKiyTjEDswhwLGbwMWvc
	Q6UMhOhQ7QX3MZh9srOP4BNEvDqCg9H2JI0y8pj91LQnRtL1fgReLT+fXY4pj0pm+unS929EWgK
	JVgmE4HC3IMaGnAzprDAyFipYJzEfYutiJg7yi3EYyG0fftPMf
X-Received: by 2002:a05:600c:1395:b0:485:2fc5:3a5 with SMTP id 5b1f17b1804b1-48556709d85mr263951195e9.26.1773742595809;
        Tue, 17 Mar 2026 03:16:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm53903275e9.14.2026.03.17.03.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:16:35 -0700 (PDT)
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
Subject: [PATCH v3 5/8] pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
Date: Tue, 17 Mar 2026 10:16:18 +0000
Message-ID: <20260317101627.174491-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33610-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 6CA082A7B07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for configuring the ETH_MODE register on the RZ/G3L SoC to
enable output-enable control for specific pins. On this SoC, certain
pins such as P{B,E}1_ISO need to support switching between input and
output modes depending on the PHY interface mode (e.g., RMII vs RGMII).
This functionality maps to the 'output-enable' property in the device
tree and requires explicit control via the ETH_MODE register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8163232a36dc..4ebcfee58a91 100644
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


