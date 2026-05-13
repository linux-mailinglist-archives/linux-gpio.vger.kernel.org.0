Return-Path: <linux-gpio+bounces-36744-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAWBLFNmBGqXIAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36744-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:53:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32472532985
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E66C3045ECC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BF03FFACE;
	Wed, 13 May 2026 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sacaO8BL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEE83FFAB0
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673201; cv=none; b=lHFfT9qL6pTipj08+HxrAtf1nVwMKdudVy74si4Kpj1OZuuNehbM4Wghs8YE6trEKWcJQBtiCfuA/8lgd7fP9Hy/x9S0pIgW2uAfmQolObU1PnbuQmZP1Laj4hxIaVWk16ke+0yK/G0dG1sPbSNMIm4I1LMBssmTwBOnHvxbaBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673201; c=relaxed/simple;
	bh=wd7K+rVMSTZERWCQyiRXKMRy+tlsG+IybU2O7dvOLz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxuwwdTaUbf2BDIfIdfB/lA5A/GzB2Gy5pGufheJ7DYz6MHnVAO0XfQuImzsil/uw1qUwZTjo747954hmIqqKkL4DNK4VRmDF2xDiGlW0VQp/fBseO2BJ087GPUUXvH3nHfULWAr8rezbOOR2RnJSXCoy0ExuCyDhrIIuDURv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sacaO8BL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso5477554f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778673199; x=1779277999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0epLdr6Sz9bYkE7idxtlbU5atEv15BhKtp2tZA62k9s=;
        b=sacaO8BLnL2OKTW6tnv3yx9+A3z58+26xN6bjTXmSXwfuLRD88W8KS52u6+sJz6fkO
         P+ftIi4oORBkiJEZEEDF7JzYEqhx11N0z6gvx+wEydbKOw3VToJiUGMoBvmj4o0/Wknx
         KbwAwL370PysVgDRks1N30PgKU+QYcPOzweWDHMk6kCHgwfLrK2V0heXynqS1JhaIoK0
         eyWeKVqGkzrp+Zg+ld3lvALoDADiBMqnhcmOy4OSy5TOUlw4lPJcEuNOH5ZPIVIp3mE3
         8r9wjnT5YoQymqsEokYq8MwyKF77Oa0YKPImPg06rJNO9Ov4vqaqHz8Mrc5MKoqhShDW
         Y4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673199; x=1779277999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0epLdr6Sz9bYkE7idxtlbU5atEv15BhKtp2tZA62k9s=;
        b=YtftdXnpUUjJ3JalQnmtBm5yh6w1PAS4O6e60bB1RrN4r3dIuqKb6H0rvQAkACodS/
         K2kWyu7kztMv62AcKlbhtM8O8RSAR4ouJDLokuqEv05DspIhxjRRNHHWSJtS6L+vo1if
         aNHSFi/GKSRmjhrBCLg+k2TfjjNp8uYKQ6ok9RCdMsyg2eNMMmnXkktRwdz+3EXrVyXN
         KQiJw/06IiaE6IXXtscO5HN5kiaXYxQgoU6faFclDkHeLG299UNwC097yokduJIFwBeX
         k29wO32TwWN6D+qPDY5/t8QjgZ+a+tmeW4MILZnW11WnV8j/2yaqAoxeUwO3fqfhxfy3
         Eh/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/aaL8op9Afdj04tuRfCmcej+bqDlh5Sd20FCdLIx0O9TPz5o2Xzj6kb5neFgOGjuB4GlqpXyrRaJqd@vger.kernel.org
X-Gm-Message-State: AOJu0YweGi3VxyiWBZyeuEMBzfZt6E1dhEGNjzZKNaEzzQye3/anQhst
	V24gEykHRLM0HoRBK8wpmaDesY4E5EBY1vZ2QfQdFxqjWyl8p8v1eQwd
X-Gm-Gg: Acq92OGnsQ8VFLow9CkOUEiP/3cFRGlvYhdQCdNZziz1HbdbhJJBxrsopXx780HR33X
	d6w3p9F+KTjvD6PSzmL0+WV62YhvxsZqxVm6VJu6O5dlfbNBik0n0dZnyahW8RzTvgd2Ak0twpj
	Ggj98WzK4PY5JAz39WADrEb6v11QkiBYvy20Ggpum+ekHF6CluaLrP1x3gu2ZtZrqVfu2XQ+I3U
	SKAYPmuQHJCWDi+OPR3N8/mOqM1YC6ZXWboJ72wY2XYGJGbfvJR0urzlz4QgUgQJrapERqDXx2e
	CBUcJt5+Wfc263wfAFJWyjETTuew/sLloHJ4YHSjItr7X4p5+3YNybayRVxczzrkcuNG3/3WlRH
	5QP0+G+re69rOpr9j8kUv6X/Q9itCZiId7m0TEnyS3l4EcF0Ih0GU+pa1AgX2YTZdxzP9cLbh8c
	Ml1m7vSUjXFtyaTES4QhF9tUvcfpFH/sAp3mAHBFQFs/ltdPc5oppmUE62z8OqWy+S8UJGUxrSH
	HAodchlYe0bzA1h2WQu+DnDONt6GZ+BtFCgag==
X-Received: by 2002:a05:6000:1a8a:b0:452:c246:ab6a with SMTP id ffacd0b85a97d-45c79f29761mr4062284f8f.26.1778673198667;
        Wed, 13 May 2026 04:53:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3e5f:9005:e5d2:460e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6aea4sm46402603f8f.10.2026.05.13.04.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:53:18 -0700 (PDT)
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
Subject: [PATCH 2/2] pinctrl: renesas: rzt2h: Skip PFC mode configuration if already set
Date: Wed, 13 May 2026 12:53:12 +0100
Message-ID: <20260513115312.1574367-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
X-Rspamd-Queue-Id: 32472532985
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36744-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rzt2h_pinctrl_set_pfc_mode(), read the PMC and PFC registers upfront
and skip the pin function configuration if the pin is already in
peripheral mode with the desired function.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 4b790fa72b49..3945c891248b 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -188,8 +188,18 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 {
 	u64 reg64;
 	u16 reg16;
+	u8 pmc;
 
 	guard(raw_spinlock_irqsave)(&pctrl->lock);
+	reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
+	pmc = rzt2h_pinctrl_readb(pctrl, port, PMC(port));
+	/* Check if pin is already configured to the desired function */
+	if (pmc & BIT(pin)) {
+		u8 current_func = field_get(PFC_PIN_MASK(pin), reg64);
+
+		if (current_func == func)
+			return;
+	}
 
 	/* Set pin to 'Non-use (Hi-Z input protection)'  */
 	reg16 = rzt2h_pinctrl_readw(pctrl, port, PM(port));
@@ -200,7 +210,6 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 	rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
 
 	/* Select Pin function mode with PFC register */
-	reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
 	reg64 &= ~PFC_PIN_MASK(pin);
 	rzt2h_pinctrl_writeq(pctrl, port, reg64 | ((u64)func << (pin * 8)), PFC(port));
 
-- 
2.54.0


