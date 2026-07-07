Return-Path: <linux-gpio+bounces-39595-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mh1eDdQiTWqgvgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39595-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 18:01:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C046371D9A0
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 18:01:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G3Q2CJzr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39595-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39595-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF59E300E035
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 16:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDFE4314A4;
	Tue,  7 Jul 2026 16:01:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE947431497
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 16:01:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440073; cv=none; b=s8sw4lr45KhkRVcDw+9oMFHpKrpJ/FIvlvMX5BaB/jqzwvtyuO6Aq/qtlIINyiOHJtQsF2rC39Fv8Ajh6ORSmybBGi5twSMfGE2IKcxn2Mce9ujbQkz4HhicSWAJK6i53xtEbuo0wTEQNtIByIXMQhHjZq+3OMnwO0cl+oppHlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440073; c=relaxed/simple;
	bh=f+JX6iChBmsd5rzGamlrD+Pmwf0e9Nv2moeL5RjGoTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Efl3jsU1ibzOj6WimYuraOFbGfRofHyvP9SU2+rDeYWyVxn0Pgc40q8nhcJo+8cD7RmzDA16oLlNj0Wej7jGUBYzqOQJ5TDkiVZ/Csunt3sgEvi74tlK5vLr3UdkM9h1aZdDmpJRm6KId9jQ86QSJ6vxjDFFtBYgdnSGQlP1Wsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3Q2CJzr; arc=none smtp.client-ip=209.85.160.172
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c04bf4711so42236531cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783440071; x=1784044871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/PPs4NT4cwHfM8BPThtIIIxetUqnZ0DOvkOSnLEJlWo=;
        b=G3Q2CJzrL4FnO/4a79FgdfzcDZpQVryMZ+Pormj/PZ9T8WeZqHL8ggx1wPfx6EGbKI
         wSUBflWHp6m2kdVc9Hz7Gk3YDXkryFrqnV2GYtiqESWXbzELx1w3/pAzkN3gPZTLc/0p
         EZus+jjctOBfUFRRNXfT9SjmdTQQIs3lyqnV422l2EWD+b4GNWBFN4YS/AVsLHVolBW1
         xsvmXpOeTk6NTblXwGWA0fnostuJEgd5LSgOz2qNB30b5bgL5Ak5b/Kvd/0BH3Fc3mPP
         zx3GhHmLLiLLNIPqZhX+E2i/dWfItTiNMNu7/zBvEDsd6gy4Vst7jE4sYuFH4YTPNc+U
         tKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783440071; x=1784044871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PPs4NT4cwHfM8BPThtIIIxetUqnZ0DOvkOSnLEJlWo=;
        b=AbD7duqv8e3Dgs6fPU+WhpNyapwX3oega0uQRDJujtSycVnVktiEZ6SiLiWJA5DqLA
         JnOb/igsIQ3ZaNBSmWIo2kVX7vukoCpj/E/Ps9MvCUjijkkbj9lBPSR4PS6o8kR9/J8q
         Iuq5xWL1MLp6m1tvm4jZNeroBU9EtwboknhizMacGRZO5gz8jezeR+nFo8hNfnvR9kkl
         9MD7VtDvz5U2M0vpfeNDf5hg4gd9tFpyrFVrqGBxzZ6W8Scwv1JAszw4h7ysnWzyyeU5
         U3wCWyC11AK/L3WuDLSBZLwiXCQWdmkHXKi+K99hGXdgygC2tFMyVoTYiSFoVJz9ckrO
         Pk1A==
X-Gm-Message-State: AOJu0Yxv+0R2jGtTfKnLOWAnNVL9VtCLi3uPia/tdP81aGZuOwFlrXTp
	zFAvH2/J1EBJFOKVHtoMN1HKyGPlBmkqo17XmgIAoyN/AYDsdCpv7aya
X-Gm-Gg: AfdE7cmF1+rmprWtybS0oSSgzvy0xhIvqr7W4+4cEf7arI705NQGPp9cVg/6TGkQ8bL
	Nb0df8K1HlPte0Dy7UAf3jfnvNW8bVFjw5njyyg/OsPY0ibU5Q1GMte/7zUmkcbMXnC6upPx2iV
	mLqWb5aHIVQcSJCm3VXIqlM2nW7WyrYti5ywx0RbbsO97ay7p7pthN8Ksu3QfLpUPRNauY0Geag
	wdrC7C5M7jD2HtavsTFJ+Ot4/iYM4UGpQV9ruBhz0N+G9yB8osH+OwAstK8y9r/C4y44oALfot8
	9R1VVDfKIqbkOprmsOwRFEGy99bq/8IGiYn9A3BTiyyjOtgBkkaU3rx62NsF8Rtf5y6xidMp7QL
	a55LDU7/mM2ORuSs32OB9ldySQoevqIdYL2lNQZ1T9WbfJjEVyRiEUaFNwx5AYIaYCalyIZo+az
	1otx0dOfUYtynTB9nQjJKLuvyYw3AbRnNnVVnkAga/5TreCerBT1sOYfjxhxTHcSD8Nb2c5jHtN
	LPYa6fxx88YWPLvFFqeUhmMjw==
X-Received: by 2002:ac8:7fc9:0:b0:51c:981:94a6 with SMTP id d75a77b69052e-51c747d0696mr60451471cf.23.1783440069849;
        Tue, 07 Jul 2026 09:01:09 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c42038c4bsm114733861cf.31.2026.07.07.09.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:01:08 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] gpio: mvebu: Fix optional clock enable handling
Date: Tue,  7 Jul 2026 12:00:30 -0400
Message-ID: <20260707160030.385137-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39595-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dbgh9129@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dbgh9129@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C046371D9A0

mvebu_gpio_probe() ignores clk_prepare_enable() failures and has no
matching disable path for later probe failures.

Use devm_clk_get_optional_enabled() so clock lookup and enable failures
are reported, and so devres disables the clock on cleanup. Reject PWM
setup when the optional clock is absent.

Fixes: de88747f514a ("gpio: mvebu: Add clk support to prevent lockup")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index c030d1f00abc..c63cdaa78ac1 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1152,10 +1152,10 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		return id;
 	}
 
-	mvchip->clk = devm_clk_get(&pdev->dev, NULL);
+	mvchip->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	/* Not all SoCs require a clock.*/
-	if (!IS_ERR(mvchip->clk))
-		clk_prepare_enable(mvchip->clk);
+	if (IS_ERR(mvchip->clk))
+		return PTR_ERR(mvchip->clk);
 
 	mvchip->soc_variant = soc_variant;
 	mvchip->chip.label = dev_name(&pdev->dev);
-- 
2.43.0


