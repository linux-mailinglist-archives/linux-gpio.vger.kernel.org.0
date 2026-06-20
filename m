Return-Path: <linux-gpio+bounces-38731-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jiZ1DT6BNmqPAgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38731-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:02:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F3D6A8D8C
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:02:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GBaOX6ks;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38731-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38731-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CE6C3017FB4
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 12:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38702389459;
	Sat, 20 Jun 2026 12:01:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A99379EC1
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 12:01:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781956910; cv=none; b=bxGo6OPTZD5jRV9+VqD6aO745c5UigMzfSEEGLB4mSdG0375VZ5YAZPMWepCnO/7fHlHYPwneg7ifS/luy+42iHdjDajSxAIWzei+t9NAcMG0M08mJngejKBfu3IdlhTAKx6xYPabmxCnGtZyVBTW0kwjBxkP0QVAcHD4pgX/GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781956910; c=relaxed/simple;
	bh=kS5pcNt/vY5gNiRg/sttruEhmDQy6pjscW7MjrckjQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxBE95Yq5G8aYPAtQzFWgIwwY2p+EMVPaPUqYUv9S4lvVM9rBAfr6ZEeL5cHl+0QUtSi/LMAHmU5JKoizDfEbV6cW7MTYjLlwrMT2/np7MXzjvtd5+GevETC/yHxSQXkFiB5xZhZXzQWye96PlhOGPf0S+2gYKWwGko1RBzgUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBaOX6ks; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46255b269c2so2177323f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781956907; x=1782561707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoUdv95J4bJxz2Gn9Lb1NNztjkNqpS6kvv/4h1UTTes=;
        b=GBaOX6ks+3vSIjGWKClk0PWFEvFRLyJN5+a93geQJzTcZPjqxlEvLTsqSyCHh+fiD8
         VU8M8Y9jnc/OqBlpcg+FgM4Aos65YhYhwEhyh79Uh0fyr+93xsY50zl9yKSbWLGhzjgo
         cKjv2Lm42cNO34yO6sQCkI5QQCQpAbdCrjOMDVh94zgflaNq5xO0OnaDhzy/BJkZ5+39
         EtsZSWPkIVKMV+rfKYqMBRkSSxpK8xjSn4sy/DgqHINOSnnNFMiJXd8nagWyLkFCoNVd
         AmneQdSafaWLE5dE9x2239MkBWo86LGq/uCpkqjKkPoeiME0pM+yztIS4cd4OTfdXpNH
         zOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781956907; x=1782561707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UoUdv95J4bJxz2Gn9Lb1NNztjkNqpS6kvv/4h1UTTes=;
        b=N1UBg1NRGiJSNIxfNbCC8KR8o2fQGS90CgpLK+tSwhD+9KZrvufn10bIRsT39ThHwa
         82MeIHIu/u3xQl4NgjJyVydK2i8v4CEybshGKWtc7lAd6Eqarewl6Ifa2dr7RQ3cUImO
         2jZlfuo1humwKwR+Uu5yi1a5dFciFl4EX2KKPWrV2xTpdvsXTBBVH+8EdQrDoRzn7iut
         TRo0kBYLIDZnn8XnYyC0c/HoWQUaSYi0dtiUVYrxmX45vLd88fxh2/OpKzLPuldMWfFI
         WYyU/rQF12pL3TVeH7lnxNa7KWfnhz5JUoc62g3z4wB2KTaK5YrM3z54BceDg5oo0b8h
         skAg==
X-Gm-Message-State: AOJu0Yxgii/DB5dFZe76vNQYxvlDtUGBYFmRHYYkkeHsGksQdonDwXKx
	It7rX8o8tIHLOEvr51ef3GTSjVnaDVg3EBYg9OyDp5iZ/mInqkAQbRwrQV50cQ==
X-Gm-Gg: AfdE7cmTxY5H46ZKQKsRLwUvk9EBj2CTrc4lqRmXd3uKJFPWQmL2yLo51WxXyZjsfzw
	fBpL/eLpIcPUNB/vxFsys4NIQwrlGp4EWzgxg7rnhq8hBP1hCtO9/Cy6LXLhMZtcoq9bcF54kIc
	UViWbxA6bSzld89AE0AlFXUvPJthE+ZUyDUSMQyINYMtFJu/q16W5wCCGL0rhElnFPWWhQ7yg/e
	01aiddsQsY3Aq1sV9rWJCeNHYRGMw1JY5MOr+c/bduvQ/Zj4GO01B34zPPOMpjTo12tAm8wnivE
	PzmeY2hrMoTTxLs19bNnOXwP3h1QkqJFbJa4mCAEGwKdY6miLckc91gclqWbY5PZFh/Y4d3ZRW0
	3jO/MQZwLR+ShxVNMJg3eaZtjeAsHTnhif3G/Y7FnBs9au5DBaW+tt++mFL7iX9TSH7BfuLYOc/
	wqUo+BFO7GDydeA3/7/syWlZj/xcF/vkLmM6FSXxue6jrnvbo6BIJ8B+gOrNg=
X-Received: by 2002:a05:600c:c4a3:b0:492:4c2e:9610 with SMTP id 5b1f17b1804b1-4924c2e96c7mr25313295e9.11.1781956906817;
        Sat, 20 Jun 2026 05:01:46 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240ee9bc2sm93161565e9.1.2026.06.20.05.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 05:01:44 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/4] gpio: mt7621: avoid corruption of shared interrupt trigger state
Date: Sat, 20 Jun 2026 14:01:33 +0200
Message-ID: <20260620120136.2482872-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620120136.2482872-1-sergio.paracuellos@gmail.com>
References: <20260620120136.2482872-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38731-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:sashiko-bot@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95F3D6A8D8C

The bank-shared fields like 'rising' and 'falling' are modified using
non-atomic read-modify-write operations. Since every gpio chip instance
represents an entire bank of 32 pins, if 'mediatek_gpio_irq_type()' is
called concurrently for different IRQs on the same bank a possible overwrite
of each other's configuration is possible. Thus, protect this state with
'gpio_generic_lock_irqsave' lock in the same way it is handled in irp_chip
'mediatek_gpio_irq_mask()' and 'mediatek_gpio_irq_unmask()' callbacks.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index a814885ccd5d..ceb99641baee 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -187,6 +187,8 @@ mediatek_gpio_irq_type(struct irq_data *d, unsigned int type)
 	struct mtk_gc *rg = gpiochip_get_data(gc);
 	u32 mask = BIT(mt7621_gpio_hwirq_to_offset(d->hwirq, rg));
 
+	guard(gpio_generic_lock_irqsave)(&rg->chip);
+
 	if (type == IRQ_TYPE_PROBE) {
 		if ((rg->rising | rg->falling |
 		     rg->hlevel | rg->llevel) & mask)
-- 
2.43.0


