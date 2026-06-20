Return-Path: <linux-gpio+bounces-38732-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +hg9EECBNmqQAgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38732-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:02:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A15EC6A8D91
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:02:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UjFS8arF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38732-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38732-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED2F83018C37
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 12:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F771391E74;
	Sat, 20 Jun 2026 12:01:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88287379EC1
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 12:01:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781956912; cv=none; b=CL+kbmhzvnSMz90VbH67D983o+gF6CVGhYdtHgBGJO0EIc9t50bGPCtIz8kA0HhRcDRgFfSYGLJohnY/GFVM6apsJzJSe7wJ7XKMMU7k/0UkHYJld4/V7XFZxbCpmdR/rYVkEEdtrqC1PArIy3MM6bzIHzl8Ix6DENcqDgmShyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781956912; c=relaxed/simple;
	bh=EgVtl9oiNz4N+uamt98jWr6FuM31DBZw2P5NQnUA+bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3+Egv15qaluS+fvB44khfZe2fjWOi+8hXf4rSwEraNm/+r6ykfR8jk8Uq6AvtbCgCnEJW1bHoGb7orOeVemG4G0hM337wAdtajriydXc2SzJMQlHoObW6ATAC5PwE/qvSc9HmkuMzZ8TEl0ejljM8hfJ3QaK6lQ8cCorWBv+XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjFS8arF; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4908b92904fso38204875e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 05:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781956910; x=1782561710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXqerCMbT1UNvyRXwghkpTOawV/8Cn1T7WXFqflNChE=;
        b=UjFS8arF4v/tSegKGHTaTmYRDkJeEgfmHk7JBPWzYjye5yygmzh5aLKyrDZL2QpVBz
         XROn1IcKkmx3iUDQiibk+MHFDoVypojBSfkPasQwMMkJFJIKjI0bEnhXjz/O26ZpVBtI
         LHIPNkn4oNDbrUTC8SIB2sENExtK/1zy+tFwvwzIvArH3pzK6Llw+Bgs08OcWY28UWge
         jVtee00M0ldjYM34Ew2rNrYVB8OpqyIuGLkCnTC6r63uZxJiBRz9jIFRR9roB3gIB4/6
         UGNkUZ0YOCOiDuptR/qYy7S6xFHLYn7JnHTQETKoP/djUk8q6kVayyYdgx58XefCxUfB
         0Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781956910; x=1782561710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXqerCMbT1UNvyRXwghkpTOawV/8Cn1T7WXFqflNChE=;
        b=SZIlxj6RYbYzmv6Aua59PzHSGjUHf98+k/0rC1znxPYLaKpYqHEN/qoHFoIZXgz5ZI
         yMOWr8vWTIHUBWoQ2+jylr8pAWavCpaW3gPEK7Hwx2gN7rXBKomNf8fB9OUUj46vjwN1
         EMe+MCU9nAhm3AXMIrdT+TJ2m+qhu6qhIZy3T2OiJJcdS/nAZ8gmFfoMBgvShW5AXOSh
         XHAmjjoc7GDc7BhWbUlB8XyU7Q4hAT3SpKjFGUTx32RmR6XKQVDHzYHd2XxB6lNDqC2P
         yLQNpV0yJItdSW3DIltHjK/ThRop/FYkPML0yBkyrjYnOsCr/i6QBQw/U+0m3M65gEw6
         V9eg==
X-Gm-Message-State: AOJu0YwSSkUpJS2txP8eUWeUyA3bOnWeRHzjPdxIZN2eMoPjBWZE28MJ
	/R6NdqZxdc7YRCLMpQZd8Y4JH61dB9oxVmoFQ3p7Gc3FDxdt9WFiFJhy78abtg==
X-Gm-Gg: AfdE7clMSB3nyDgZOHedwqEuiYhGv0UPO971RQ5PPgtpaxKQSF4/0Z1sMb5q8/0RSSf
	YM8UM09IUwf4zCbEUAQ2qJuxtVz8bjJvQItP7JD4O0KsCHqFsdZT6KL8p1A3hRdSRCCAgPFN90E
	hicPVdRmJLIPji+GmYAO1vqwu7sR05QVa4IsAUC6VDpkB9mTdyNy+4MIzC03uFai2yiR8b2nOVC
	lXOuIrPNSOfyuN5ikkUD5rNPWX2T6vAFx4WNCL7L7XqquFWYat5b9sl86NFMJBfeLA5liWhG4LJ
	Si7wGCZhtdR9/wETF7ifvI9PRAEOq6SRd0XFTUG+w4D/2Vwz5HCzGcw8USYCSKDBkmdGRCnLzIe
	xnYxYMgtectmvo5/JoHeKxz82CveNboRS5reEJElsAie1zn8KxYU2gOjrYhUiZVT76lJtz5H+nV
	2zwnUg/iZFdsjc2Bq5Q/1gVrTxKdNbnivYyD6UblbHJp9AsnxlmsAyQM2uimcYCLuk7Md33w==
X-Received: by 2002:a05:600c:314f:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-492425706b9mr92064135e9.24.1781956909639;
        Sat, 20 Jun 2026 05:01:49 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240ee9bc2sm93161565e9.1.2026.06.20.05.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 05:01:48 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/4] gpio: mt7621: more robust management of IRQ domain teardown
Date: Sat, 20 Jun 2026 14:01:34 +0200
Message-ID: <20260620120136.2482872-3-sergio.paracuellos@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38732-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: A15EC6A8D91

The driver uses devm_gpiochip_add_data() to register the GPIO chips which
means the devres subsystem will unregister them only after the function
'mt7621_gpio_remove()' returns. During the window between domain destruction
and devres unregistering the GPIO chips, the chips are still fully active.
If a consumer or userspace invokes gpiod_to_irq() during this window,
'mt7621_gpio_to_irq()' can dereference the already-freed irq domain pointer.
Thus, manage the IRQ domain teardown using 'devm_add_action_or_reset()' to
guarantee it is destroyed strictly after the GPIO chips are removed.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index ceb99641baee..57384ef74703 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -272,9 +272,9 @@ static const struct irq_chip mt7621_irq_chip = {
 };
 
 static void
-mt7621_gpio_remove(struct platform_device *pdev)
+mt7621_gpio_remove(void *data)
 {
-	struct mtk *priv = platform_get_drvdata(pdev);
+	struct mtk *priv = data;
 	int offset, virq;
 
 	if (priv->gpio_irq > 0)
@@ -475,14 +475,14 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	if (mtk->gpio_irq > 0) {
 		ret = mt7621_gpio_irq_setup(pdev, mtk);
 		if (ret)
-			goto fail;
+			return ret;
 	}
 
-	return 0;
+	ret = devm_add_action_or_reset(dev, mt7621_gpio_remove, mtk);
+	if (ret)
+		return ret;
 
-fail:
-	mt7621_gpio_remove(pdev);
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id mediatek_gpio_match[] = {
@@ -493,7 +493,6 @@ MODULE_DEVICE_TABLE(of, mediatek_gpio_match);
 
 static struct platform_driver mediatek_gpio_driver = {
 	.probe = mediatek_gpio_probe,
-	.remove = mt7621_gpio_remove,
 	.driver = {
 		.name = "mt7621_gpio",
 		.of_match_table = mediatek_gpio_match,
-- 
2.43.0


