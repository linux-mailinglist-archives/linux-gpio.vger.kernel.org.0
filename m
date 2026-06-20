Return-Path: <linux-gpio+bounces-38733-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eiXWKV6BNmqVAgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38733-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:02:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 506266A8DA1
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:02:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hlzGJxBv;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38733-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38733-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D81B1301303D
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 12:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79713939A9;
	Sat, 20 Jun 2026 12:01:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369F33932C8
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 12:01:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781956916; cv=none; b=eion5ibHVruUW6CHX1H4Y9F4Jmyxisi7UgyPF1tKODiUfDE4QKpQ8Zp3MMD1gnu4b1qGuWkQX7gv6rcKj0/DJ6ceyiQxDS9Gc6Ctz0M9S9O8qjxvHXgjZ+erE7nUL2Y4fU4h5s5L5F0ieqToDugtFxtHYjRkSudLwseeQ0s3pPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781956916; c=relaxed/simple;
	bh=PdvuwhYVmWUR2K4LcgogElxvtRRBFJ3oK/IwKUVLJ4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2n8ghCPAZhqM3fbU9uueSMQRbIANH5hSd7QaQtOLqkGUI1D94oIpu6nx37Xcz6FtN6JKdywdsbBF8N4IuEIwkDDE4n+nYFar05wQolx9aaV7/6LnfKhts6NCV5MpALVEJT41w8lZE+kkrvQZg8xr9cthFlBgfMOjfL5kdUf1lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlzGJxBv; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4924e6fda5dso473235e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781956914; x=1782561714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUQ4LG0DQZhHJvVSbEZjANRodokQ0klSuZa4Io54u4A=;
        b=hlzGJxBv0OMBik7r3mPRrcwqUJ5NYvPUR/AyDjyDCDg/a7Lm7pZKXoEHR1mF9+fY6c
         IqzrtTJGwGMMRISoQXMcZaN4cJmz08l4nWQaYa9itILkIaatHAxBx52naq4mkba4w8hG
         dhX4A1mlAPuEowzEwk9ACOFttvqUwE4KwlKi+ARSMgQkSPqFQC9Ode+mLpZPrn5hPqaJ
         +vzdA+QLeub2ZsEssvbw87l26yU07LKBnRWdjulWo0qXHJT2sA4G1nrGi/GaaWtz3XCP
         Rn6uOVI4fTCE6atbDjd+inzwVoFgOENzYyVPB5jl1gIR10oRG/xhH5dn200MvqEQD3s5
         paMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781956914; x=1782561714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bUQ4LG0DQZhHJvVSbEZjANRodokQ0klSuZa4Io54u4A=;
        b=UeYuqkM/a3hjGOTCw5WHk+MnoD5iJDLzllwRDW2yRsce+JNvvHg8PNHHetXXXLz43E
         dl046tubFYLc6e9/eZSMd60Py09KYkVHv4hqao5JUkgyHX46wt/EpmLZJImqrXeZLOnf
         tr2dwsjAlieU35CC1sl2HMfsQ8IWpHMcP6EKZVgnMGefAPJbKIc+D3mloO1duopXvHIf
         JcNLVc63NIcJFeemMds1r4NC9NY9c0iLMMY5CSnT1XTQcORHmlJICxzlXOu+VH4rjY0F
         IUOZVJvHk8lUt5TN/eRFr+Mwa7z/oAwZ+auHxUuvhr7E3RJLsyLkVgdeQ8EiRJy0f86T
         JUsw==
X-Gm-Message-State: AOJu0YyF8AhPslp50ObeEWQp33tHu9lXS1rOUwunW8UmqA+SkXcDUrcc
	sTbu6XoPbJLTKgevIcPD6pZ7RzoN7MX1VQ2P3M1AvJU0CPFoicWQzrJ5MDZdgQ==
X-Gm-Gg: AfdE7clN/YUvb9vq+TkxwDu2jFigI4aUDZUgxbIPMYXoq1vFrXkyOTOxGY3ufso69Hu
	ckoBqbTNVMu2hSoKhYkI3b37RnIpHtAa5qFIUue0P7SjHSvmtrdBp+kIoQoFtEU8DXWUlEfgGb8
	jkFKMZm2CBJ3MloWggLLcYZpy7gmDs+i4PzjJdE1S2eT+mepjJbuBxDxY5X1GPLS5QXkcjPP9cD
	TFjOoq3WMOWCxJYiYd70a6P/s/53UNB4UQwuGAMmsoKRrySaGRc8s0/jRb00fRBZhQyxX+r+9H+
	YsmWSOKjbp13NZzK5zXCayjwtwij0pyY/hWqzFkvXBmuUueiVrOefjfY//R38iHkiqrTzih9Tyh
	7XO2OIygASUxaUhfxfth1LK/CD/4/lf6AX1hKB3ssF3Cc18FOAUSLT55Lh8gwqHRK2oXJ1U2sTy
	+ULQG6MsY28K9zMZC5GucpD45PlwZV//G0fuA3KaAtoFHuM7PFdX+XaLJ27co=
X-Received: by 2002:a05:600c:4703:b0:490:ea8a:32d0 with SMTP id 5b1f17b1804b1-492490a770fmr35905225e9.20.1781956913379;
        Sat, 20 Jun 2026 05:01:53 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240ee9bc2sm93161565e9.1.2026.06.20.05.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 05:01:51 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 3/4] gpio: mt7621: be sure IRQ domain is created before exposing GPIO chips
Date: Sat, 20 Jun 2026 14:01:35 +0200
Message-ID: <20260620120136.2482872-4-sergio.paracuellos@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38733-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 506266A8DA1

Function 'mediatek_gpio_bank_probe()' registers three GPIO chips using
'devm_gpiochip_add_data()'. At this point, the chips become live and visible
to consumers. However, the IRQ domain isn't allocated and set up until
'mt7621_gpio_irq_setup()' is called after the GPIO chips setup finishes.
If a consumer requests a GPIO IRQ concurrently 'mt7621_gpio_to_irq()' can
be called and pass a NULL irq domain pointer irq_create_mapping(), that can
corrupt the mappings or cause a crash. Fix this possible problem seting up
irq domain before GPIO chips setup is performed.

Reported-by: Sashiko <sashiko-bot@kernel.org>
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


