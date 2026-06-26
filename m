Return-Path: <linux-gpio+bounces-39014-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vhn9I/kVPmqy/ggAu9opvQ
	(envelope-from <linux-gpio+bounces-39014-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:02:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E17136CA8A6
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:02:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Agc00TWD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39014-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39014-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51FA43089D52
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 06:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704283D1CBE;
	Fri, 26 Jun 2026 06:01:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC013D301F
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:01:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453682; cv=none; b=X0Y1YnABJX3Yn1jxnfvDH7Rf7MiNDZC2e4byzkph4nKLq7QT/TPX1dcq3ivjWTWrCpi6LDfXznM/BkYwn+ZqYa7hKMsnnfZMke5b6Mz1h4zi39fCnY7Gd3DhfRjt9jcvL7r9hpZ2xrRqtoGqWvQqlQf3qPugMoIJ2O+pkFKmmC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453682; c=relaxed/simple;
	bh=7L0JJKkBkRDuegs9xTZqxl2sH5BEOplN9Sw0ybDh2QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2IILFT/xpCszFYX/CXoLth8OFiydCHssEVogp+mT9SSVpoTivBlKOaqIzAVA1fOgTnUpScJLAk1SNtGK1IRn5uKMdG/4FPzg3RfOTbNZ1Yk5i46gmONPi0YymNscqo/kP7UFJ7gauRZXhXqaK54lcBY5CHZnCF/pG6YWhqV4aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agc00TWD; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46e30429b10so283504f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 23:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782453679; x=1783058479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IdsNMSUNjjiL5bhyJQItc/JX8qMKncxtCJvcADiPv4=;
        b=Agc00TWDbqUWZek+FeRAGCjt3bMdh7HdS4clsMhVMEO+ZqsQ0GD+YOAKKZBI3rFCDj
         A3vZO8QtXTN9R3NlpDkuoJopTfnIouaAFsSoeO6twVFqq62DL4BB5zRS5rkNFSsEK5Xc
         I98W+0TYPVvYH9jOEnbemr8Fmfld0uNInB6Fn3McgqC9g6/NAjTqyiQdgyXUqeDnF2XK
         vcpw+Rz0OSwkWfyuiO+Y5+518ZKeYK9Fmv2gztlokcWcElJiPHPjwAS5+fCQPDxAS2RE
         bvGrtriKc6BDA53HlvxsRYB2j8zqcPwh0uFR3y0IwQGUSCbZHpR1PfmQF2UN4QthmMoH
         akyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782453679; x=1783058479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/IdsNMSUNjjiL5bhyJQItc/JX8qMKncxtCJvcADiPv4=;
        b=LkenWtX2yXSmw9cj+5GU7GWg/gwY7JqqixtSsx1wWfddr4eE3N4qhBP7K7Frt+pHYj
         3l2wL3eY4xOpBT3vAhAUf4QqCRVjK83N1oHMN2mujjL+rJX+lNlvkliR9GPkgF9r1dfr
         r4BcRk0+oPVk0aPUDSlxeRg6jw6WE9iNIqL4NcZWsZa6CQ2VKIlMxJaCAk1Q9ZKpDVmE
         hBIc+4rmjYbf0mNe7P+RI/rt/fVW2ng28i3LIpC/MpBQ7r4xkO/yRsLMLHH1Fxd9LZx2
         njVVnLxvqjqY+B3KXZHx3Z+HBLeJlfcNiQgg1WaXn3uE203uqisezL0b1U60TpF/rwOQ
         TQMw==
X-Gm-Message-State: AOJu0YzY3XgpDvypIk2sr2E32u2vFSQz30Uqp26u/8E0DX3YrY3PcQQ4
	Q4ZFVZ16RDpQviww9RME2zVNNNKarumZ0v9qUjF2H+gdVBREdmzo96szdvqgMQ==
X-Gm-Gg: AfdE7cnndXtM8DJLwnXdszp/+BS5E6Asl4PpCT4fOM7h96bTYinO+QBVqsd9J6zQCt6
	5hoda6huReLisTYov81Dd00Pr04ISlnG5UJRxWQWimipWRABiAUXw/UraSJ6B2z15gMkf/EFy0r
	L8Y9rLm/i+RyXWg0t5GUESB0jwmKzx0tgKfkfmZ9DaO2+8arwfdFM6h1MyS/GwjZ6XO8tEcFFeV
	95VrTooe9GqMkZkRQNyiIqiQ6FZLyyMbq9tSOiLzwqToqRnBgOye0z3gxxYByrxvQvtgHVZSy9k
	xGpoDNzmfwYKh33cUNoNBXKm0plFk31OWkt80+J5CA+iBqwKgaUh9Ts0NXLt0OA6vjY2OwV2wwv
	vPaF+bfGRFW/wy26KzkwXDv9Hpbqdn9Nzrq0qTKXZw6ANJNyGzvJBrvEDR1jVwAwz7ELtdZqVIb
	a3A8SXb6u9KLNECzGJ4x1e4dyliLslQMKx4CwZII5iW9NdD3hg0KaUtOUQbNk=
X-Received: by 2002:a05:6000:2581:b0:46e:7a27:98cf with SMTP id ffacd0b85a97d-46e7a279bc8mr5287263f8f.25.1782453679003;
        Thu, 25 Jun 2026 23:01:19 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f0db007b3sm2767936f8f.2.2026.06.25.23.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:01:18 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/4] gpio: mt7621: more robust management of IRQ domain teardown
Date: Fri, 26 Jun 2026 08:01:10 +0200
Message-ID: <20260626060112.2498324-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39014-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:sashiko-bot@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E17136CA8A6

The driver uses devm_gpiochip_add_data() to register the GPIO chips which
means the devres subsystem will unregister them only after the function
'mt7621_gpio_remove()' returns. During the window between domain destruction
and devres unregistering the GPIO chips, the chips are still fully active.
If a consumer or userspace invokes gpiod_to_irq() during this window,
'mt7621_gpio_to_irq()' can dereference the already-freed irq domain pointer.
Thus, manage the IRQ domain teardown using 'devm_add_action_or_reset()' to
guarantee it is destroyed strictly after the GPIO chips are removed.

Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: a46f2e5720f5 ("gpio: mt7621: fix interrupt banks mapping on gpio chips")
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


