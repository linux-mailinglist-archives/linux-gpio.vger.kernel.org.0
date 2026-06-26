Return-Path: <linux-gpio+bounces-39015-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EE4eGh4WPmq2/ggAu9opvQ
	(envelope-from <linux-gpio+bounces-39015-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:03:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6D96CA8B1
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:03:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hEu0MBbR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39015-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39015-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3702E30AADCF
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 06:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E912633F8A5;
	Fri, 26 Jun 2026 06:01:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E293D3CEC
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:01:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453683; cv=none; b=K0yyHXoI+A1J1j1PRTaHVWZGSbgCxsCv3BLH4O+N17PmvtYT0xNFPG+wSZLHXzvU+lgHwZKsCbzIhhx9ZPsb0WJVSQM1WYQylQZ9z/Ueq7DN0sfF0Ft0M4zx9jjCxq/miJfAmgM81yW0/ZIGzulfP9Z3F7H5CFfD4CjUoPp5aAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453683; c=relaxed/simple;
	bh=m+LYu4JehDqB5qW0PDlMYvYoWovIUAqNI1Hb+p8fYAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/UquG/YtK+WpxOvjO9zCjkS0rg3qX53q0cVXcwpwHqgU011NvNGrrJaFGb8Cs5PqhvIk/CNfzwJB1zAOPRKb/0wPHW5fxJjxgSVSov1zMHxbtUx1fO9unY3WovXxv9F0XOEl8OqS2J3Ym4L84r8/LEnPZPxlKwEahkuptbgWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEu0MBbR; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4627adcf4d6so294173f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 23:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782453681; x=1783058481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BomNSlobdw16KsyTDdkpLrFE3caPS+V2Wnh8kZXiEc=;
        b=hEu0MBbRzZRgdimmdYGFKnQjBtsdcD7lTnyFEBvx+6Sq1uK5LanbQlxtbRWUfw+IcC
         XhIRpZqrHNp9mHibbnQR7wsUacIA8VRYPLJwN1AEQUBTWBzlyK581iUu6ZowiEG8k68O
         49maZfxZL64wsj5eBzS9KRrX+Y8RQhWGJ2xNIoLgiV2G5yPOrEFD+L04JOE5EThLp4Of
         G4hqd0wkDcFfWXOtBSRh+7snwIBPgepPobEE4KiP/3Yc8YgVwwVQtxNpWYEi05G4/0o2
         1chrDGBN+L84KLg3SjtMIqqI7mCnPqXT/uVLeMSVYCmlNRCbFvZGS27/dV8XTsJ6ozBd
         zpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782453681; x=1783058481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/BomNSlobdw16KsyTDdkpLrFE3caPS+V2Wnh8kZXiEc=;
        b=Xdi2OSaOf1vTows/0SMeB8LbfWB2o61XgVSWmtcxkM14JhGx7kTRvaKiOVkG0IWiKS
         Z3jRreTjttgJ6OL2NrODCusE+Xey0K165CgjlxKOkUPqJPPQiYwQi66ofCf/7lQZ9MpY
         UJmn0QlUzlG2SWIaBTZUOzWJxkkd2+clJrRBaPGRe9x5xT0KgXXRUvQf5uLY7I8xuc1r
         5HG2PAZ0Kab+GTG39BYFfL0AwBmm2SEteddlboNnQnBfQMtqQ1Q7NgA0hIKxpteWk/ag
         KMwILKVb9pABnzGou7207/zSqHJg0ygsFvv2RFYQgC8Ap2WGtiSaz6gMEPolSxepFbPp
         k8Hg==
X-Gm-Message-State: AOJu0YxmBV7LNZxeM7wn8Ub14wSc95HI7jggJ/Y4pXXBFqEpr3NnwJQP
	MzReq3bYtuv2cpB2VHBpswfQfgfaEsinQRf3JH+lq5lRyW7RxNY0VsGVEZ3kZw==
X-Gm-Gg: AfdE7cnbmTXOBrNjTN73Nm9PDeuTrc1yX1cDdfglzYeREAOts5ljIc2nj0whdNbwHqQ
	Z4PidxCOmUndLRfIJQZXGsO5nzOCuVbYflY+rAtyprvGTeL/CVKcazgeIMmrpG+x827ICJDnwni
	Sn1uWiq5qIVqbJ5jrYulen2afueX6d7V0zpTboO0fQGcosNGYzMmXVHv7OJ2HRjCImqQD/3B3y8
	rmagHefQ5fLbcLLF1mlkSB8WtnzckZb+sv8vOMivA5tCJ/qOlWfROcuqCGd3SM+JRyufcQDpC7d
	C/vTaxzLKoA5MyVRiA73rsr7bR2n7XxOti+jE9aTj6z2PCLIcNf2Pjtu4CvwMyTPky73GWLq+kj
	SL7rel5pIB3+RCw+QBgyuQuA51Pt3IUhnMT1rQ//MFMYuxreyNhjOv9ACSRQUdznEbhQkHuMOQu
	4pPo1k4owkrm8+DXh4FHED5YHhnCciSOb7dp0rqG/3KcmMB/M4LdRvamI2qwo=
X-Received: by 2002:a05:6000:24c2:b0:464:28e3:a09b with SMTP id ffacd0b85a97d-46dc18a5a2dmr8936974f8f.37.1782453680405;
        Thu, 25 Jun 2026 23:01:20 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f0db007b3sm2767936f8f.2.2026.06.25.23.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:01:19 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 3/4] gpio: mt7621: be sure IRQ domain is created before exposing GPIO chips
Date: Fri, 26 Jun 2026 08:01:11 +0200
Message-ID: <20260626060112.2498324-4-sergio.paracuellos@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-39015-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 0E6D96CA8B1

Function 'mediatek_gpio_bank_probe()' registers three GPIO chips using
'devm_gpiochip_add_data()'. At this point, the chips become live and visible
to consumers. However, the IRQ domain isn't allocated and set up until
'mt7621_gpio_irq_setup()' is called after the GPIO chips setup finishes.
If a consumer requests a GPIO IRQ concurrently 'mt7621_gpio_to_irq()' can
be called and pass a NULL irq domain pointer irq_create_mapping(), that can
corrupt the mappings or cause a crash. Fix this possible problem seting up
irq domain before GPIO chips setup is performed.

Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: a46f2e5720f5 ("gpio: mt7621: fix interrupt banks mapping on gpio chips")
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 57384ef74703..1b0b5247d3c9 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -466,12 +466,6 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	mtk->num_gpios = MTK_BANK_WIDTH * MTK_BANK_CNT;
 	platform_set_drvdata(pdev, mtk);
 
-	for (i = 0; i < MTK_BANK_CNT; i++) {
-		ret = mediatek_gpio_bank_probe(dev, i);
-		if (ret)
-			return ret;
-	}
-
 	if (mtk->gpio_irq > 0) {
 		ret = mt7621_gpio_irq_setup(pdev, mtk);
 		if (ret)
@@ -482,6 +476,12 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	for (i = 0; i < MTK_BANK_CNT; i++) {
+		ret = mediatek_gpio_bank_probe(dev, i);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


