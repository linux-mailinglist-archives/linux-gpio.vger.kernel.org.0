Return-Path: <linux-gpio+bounces-34684-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ehXuKEt20ml8YAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34684-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 16:48:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1499B39EC34
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 16:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2C043007AF8
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 14:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00D429BD8C;
	Sun,  5 Apr 2026 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gapp-nthu-edu-tw.20251104.gappssmtp.com header.i=@gapp-nthu-edu-tw.20251104.gappssmtp.com header.b="JtJrgzF0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B53F1EF09B
	for <linux-gpio@vger.kernel.org>; Sun,  5 Apr 2026 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775400519; cv=none; b=MnL2GTuNOgFwa59i+hnqEka9DsKVO6iJO7+91tP+lF8XBzgvfKQQa3i2y5iotsFJK0jQDSO9TE7DHBuQCO7Cembclq6K8JDcrgFWRU2WOb0eBop41Pdbnd4GrlIQKwdqI0uBhkWGrlRFrkOpsUAQbRE8ACgjQ9PTdNCTStAsEcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775400519; c=relaxed/simple;
	bh=gwtzXr5sONBgqnAqNu4+/3CIMhQ+AeMVTmHchIT/SBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLAzuoJvL1avneNHRsn9Wucfma20YUyHi9I7tPefVOPpvvR1X+9+FQ+HfYspc5zFnUPxWtBIjUngHXaNsZ3O4RziOs/a0bCSodNkGfuO9lvOsTcx0L1z+V8eRZ48i6mE0c/pZo9jwQy4A2hFfdcKiRnhdDdMpS5NdFAKR1K+Qd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gapp.nthu.edu.tw; spf=pass smtp.mailfrom=gapp.nthu.edu.tw; dkim=pass (2048-bit key) header.d=gapp-nthu-edu-tw.20251104.gappssmtp.com header.i=@gapp-nthu-edu-tw.20251104.gappssmtp.com header.b=JtJrgzF0; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gapp.nthu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gapp.nthu.edu.tw
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so2089143a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gapp-nthu-edu-tw.20251104.gappssmtp.com; s=20251104; t=1775400515; x=1776005315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YWxgN07OZVOqO1Bvp7LxV7r6cRwAlkUDH9yP+maR0zM=;
        b=JtJrgzF0YBMSIGdMzCe4MgVTrtG1dfHp0vxMVfgn/CGGk8oxtJQasffsgN3t2j6oep
         6kFpHMzwFLShJhqqV5AU0aOMJudLYTdYgbqjOuXhTeRdNE+9mCBDQEUsgxJD7wvApOXn
         X3lLHrqUrOGYToe50l1Q/DIcA9K6l8b+7aR7LVlilSjuAAUVUDcuCb00BkYuJM/Vzcgs
         NDaUhUmYqwOFvXvL/Nm+zDpMKnwCiZ7SDdXNWm+GEZYCLw9Logrql3259cQUHHg3rrhM
         ITvRqjyk7MbH4HnybTn5D+nO9Wv8egCzqfdYmWJwj7fxeZMm205tJcZ/RBljoIgrUJAy
         nbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400515; x=1776005315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWxgN07OZVOqO1Bvp7LxV7r6cRwAlkUDH9yP+maR0zM=;
        b=QW7V5ta69w0DUc4+w1JJSUaAZZn5gapTimWBquN9a4A6njJJ75W6CRNHKm3pJnVUP1
         jzhgpDjkKPYmZ99f6J9GDYulF1W/n+xTrWhM5GlGThkt/lerjU8B8c889tBiNA3F+6Op
         c6HTJ7uNqvYy9JqcgSpyY04G0SaW6FnkaLcVrJOqVWjEv3B9OUZoD+9sQY3gbZnzjD2E
         AkN3eb40M7edXE62vwCxqfVIj3wp2Qyi7sw25+U3rX1OlvphFTd0W3fpjs9qh7KagBzI
         74jezP105LEgn4IsUoYyKomV35HS/tvQyASdfyJjoMKomhM6Fmta7tAXeAGUBziIIFTu
         rB9A==
X-Gm-Message-State: AOJu0YwF1SNdDAN4HpPskFRDXyOcXLJflCyN9t8YS5EOdfqyUMZe1teo
	mlP2CDiakpup6NMO7oebNdxSI3F2113aj0acJgNYSwSnWaL3GSC9V7V9TuC9wBufOZ0=
X-Gm-Gg: AeBDieu0Qcj2jNBWqQa0MeSLNzXls7yZEdivr1xuA7XMhEb7lp730Gj/NnHc4c0QYfo
	JhFZ3AiOZBpHidQ/4bQ2i3YT3kWGlnQsvTVIrLT73dyBGGhSA7sVIdrc/6bxg/R63LgkDkUe3XX
	DZGCxuqeyTmI6m6Ojf+iPdCySvub/0m/gwfjfzlXHxKkQ2KvPtyXnedFXrGZ8JEDvBSfpajOGdz
	DohzPXYxZCcxWGOkHIKxDiFJlELW2a9GXx88CFXn1DVQSIuAomsffGVi2M3oVRKHodXh8TLiR0m
	KUuElcE8vFJeGL01cD3ikTNl6YKXt1ALZkAUEbjD0C5qQZu42dy3rKfpyjAAXqUHj2InKaTs2VG
	r/YSKC66KxovUwq2MDAixwbaYNDp+yzJa0tKHShJNlvLZhQBc9eGaJ17jffW1OiE7cfewyZ5nc1
	UJuIri1PcYFp3u7A79BN4UT3/PXvjjr2qftn/RgGW7Mm2eX0ERabjXeWpX3yvRmc5t4hZVz9R/6
	8M1JsC0pfzzRlL2wXi6s8nDQyh82JkdF0QchCQFcLIqeCKdCQ==
X-Received: by 2002:a17:90b:3c0c:b0:35d:ac4d:3cb6 with SMTP id 98e67ed59e1d1-35de68417eamr8177597a91.5.1775400515423;
        Sun, 05 Apr 2026 07:48:35 -0700 (PDT)
Received: from tomato-cultivator-HP-ZBook-15-G6.. (2001-b400-e3d8-86cb-6841-8517-e166-bc96.emome-ip6.hinet.net. [2001:b400:e3d8:86cb:6841:8517:e166:bc96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9709b8sm15357742a91.16.2026.04.05.07.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:48:35 -0700 (PDT)
From: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
To: linusw@kernel.org,
	brgl@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Subject: [PATCH] gpio: aspeed: fix unsigned long int declaration
Date: Sun,  5 Apr 2026 22:48:03 +0800
Message-ID: <20260405144803.31358-1-ku.loong@gapp.nthu.edu.tw>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gapp-nthu-edu-tw.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nthu.edu.tw : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gapp-nthu-edu-tw.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34684-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ku.loong@gapp.nthu.edu.tw,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gapp.nthu.edu.tw:mid]
X-Rspamd-Queue-Id: 1499B39EC34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace "unsigned long int" with "unsigned long"
to follow Linux kernel coding style.
No functional change intended.

Signed-off-by: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9115e56a1626..e6af7f3fba5e 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -655,7 +655,7 @@ static void aspeed_init_irq_valid_mask(struct gpio_chip *gc,
 
 	while (!is_bank_props_sentinel(props)) {
 		unsigned int offset;
-		const unsigned long int input = props->input;
+		const unsigned long input = props->input;
 
 		/* Pretty crummy approach, but similar to GPIO core */
 		for_each_clear_bit(offset, &input, 32) {
-- 
2.43.0


