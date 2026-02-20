Return-Path: <linux-gpio+bounces-31947-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDFxN2QrmGlqBwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31947-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:37:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D711664E6
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D78A13046530
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C68931E0FA;
	Fri, 20 Feb 2026 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="TcuQKQSJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C02E311957
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771580178; cv=none; b=BVgLUzZlvMTAd6GJHfLjn3p1T3z0urJZX+U49951gGbp4a50aT7+PasTOSpcKLhSB4j1lfSpqPHggjBnz2lt92k8gg4ZiYa4KnN5gN6S6hZaaBMEVI7aFJhg9A1b9IqkdJWGSzxqhD8XikpLEaQ7ZEldO3XEmZPejCLC36zx5AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771580178; c=relaxed/simple;
	bh=iGGpJYARvqIhwTBNLVTaPc+9u8qh6EY7nfLK9Y00NLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eLpp6fqymsE9SFH3Ke2LmFfeBQU3aa9OCFPCBNVcM7+7TaHis2IyUla1dhkcvZGHTzcMITgrT14zi27VHMpfNTpxpKvErTtwCaOqaF+KBQdh6/IhjYDetXfm+0vAjHhch0adnsUAHUtkR2xNd29Ho04iFgUfcKViWRKsEGAJPrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=TcuQKQSJ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c6dcdc955a1so647112a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 01:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1771580175; x=1772184975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H2oo4bOCAeaswCrxlLtuaY4ljZdJNnxRdqA4UPgDFes=;
        b=TcuQKQSJqot5ef4Kvtxc/R/LoBMy/GIlX0s1/5HKNephpvuW/G1UYKSvGFZMxDUe6K
         e2SeSim98dVhitCaqAs1Ll66hM/j3SaefRZdJk/O52G5KfVpOUhlj+RFTY+WzBlyV9GZ
         lURRQyleTx0tOlZIIrbVISr/AQKb6rbFbKmR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771580175; x=1772184975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2oo4bOCAeaswCrxlLtuaY4ljZdJNnxRdqA4UPgDFes=;
        b=MTqf7NG5zTrwmBIFqYu4yQjR8fQzAe2sb9R/T1TBT/liW/g9STaSJ+UWVWUjy4mhW5
         0gXve7GClg2QDjJ3UBKgYlorE3HZSHtp0Skyjec19dC8yQWzLFfkT0Gl9oaIZ2FnlE8U
         IiXHYB6GjZEEMz95EycnrHZroqPohJ+8AkyGRJPFtkTgqcpeiq2PnntJlyi1Au3JN3mT
         Yv6EbSPjlVy9Tbus0nYmpmZJwRkfTo33OZmssEM4hyjcv0bTkeh+bm2wM0m3QwpTRdmU
         XBsff+XQl1dj6/y6RNKG96Cft1UekKR4eQW2Gvo9fnu+SzLkHHZ3zjnbm1g1CxqMKsUg
         j4Vw==
X-Gm-Message-State: AOJu0YwEvWbhaFQmU9pjqzCgaTmsWrhZ7vVhNOlOlPKcCAE2mNthTexz
	9uRZDHxmB0XwIrvALh1RRqrIpBFRm61dU64T5OAA69pSFk4z3mc0if+ZVTZnGXmdolM=
X-Gm-Gg: AZuq6aK3orx+SipRtrgca7ndcYBzhVBOj0s6ZZ6TDMkKv7iZmuqcnGaMIN00S+0fw/i
	dekl4AL419mTSUxaKQ6kIfR3CM28lkumochfXNqyjx3wjy/omEJOesTE91SIGoiCFss0ChsQ7kC
	f/TtPkk7bqt+mFPnAz3EdJbbVlMP08CXZs/fh//gQBLU7IU18L5qy9ixNMATEASCp/Zwx6sI37d
	Tef1GOcfAVdDUxC3xZm7ughA8k0OVhHWe6x9bpyYhnfy/In6k+ZIvxoawPdWCLarvEW7sBIqeqb
	c+uuwJzYfT16NdrBqRup/2fdOCbPmNeGenpLYeRjoa9yyIoVX96elNX4NQMfrD9AFpwzn0a5Nxh
	VRStllgAq3NWhLbTf5Kb+Za8CNu+cwYN3bJdX2UIZr8Ge5ilCmLEwkT8eXvdsKEJVCJUNaDtYGw
	ikq7t4Jpmaaf/BpguwYCyqppd5+exS2DsU8MwOze8XRR+nyHi90YhiO5HvroAi+YUWzyntBZNcC
	e+67qpaCe9vrXMBaM1Bdrv0Gyew6aT4FMG6tu5A7noTm9YzjF8Cq92LSH/7iCd8yj3wM6R4cIfb
	+m8eXQAiqfwqjNF5mnXOy7dJq9U8anmu807/DW9P53p9QQGFkTsq6M21cIREhhk1
X-Received: by 2002:a17:903:2b0d:b0:2aa:d7a7:8091 with SMTP id d9443c01a7336-2ad5aed3fcemr48911885ad.12.1771580175423;
        Fri, 20 Feb 2026 01:36:15 -0800 (PST)
Received: from aegis ([2001:fd8:f657:5202:3e11:bbb5:18b7:bbbb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a741e5bsm184240445ad.40.2026.02.20.01.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:36:14 -0800 (PST)
From: Daniel J Blueman <daniel@quora.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] gpiolib: Fix shared GPIO memory leaks
Date: Fri, 20 Feb 2026 17:34:51 +0800
Message-ID: <20260220093452.101655-1-daniel@quora.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31947-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[quora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 61D711664E6
X-Rspamd-Action: no action

On a Snapdragon X1 Elite laptop (Lenovo Yoga Slim 7x), kmemleak reports
three sets of:

unreferenced object 0xffff00080187f400 (size 1024):
  comm "swapper/0", pid 1, jiffies 4294667327
  hex dump (first 32 bytes):
    58 bd 70 01 08 00 ff ff 58 bd 70 01 08 00 ff ff  X.p.....X.p.....
    00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  ................
  backtrace (crc 1665d1f8):
    kmemleak_alloc+0xf4/0x12c
    __kmalloc_cache_noprof+0x370/0x49c
    gpio_shared_make_ref+0x70/0x16c
    gpio_shared_of_traverse+0x4e8/0x5f4
    gpio_shared_of_traverse+0x200/0x5f4
    gpio_shared_of_traverse+0x200/0x5f4
    gpio_shared_of_traverse+0x200/0x5f4
    gpio_shared_of_traverse+0x200/0x5f4
    gpio_shared_init+0x34/0x1c4
    do_one_initcall+0x50/0x280
    kernel_init_freeable+0x290/0x33c
    kernel_init+0x28/0x14c
    ret_from_fork+0x10/0x20

unreferenced object 0xffff00080170c140 (size 8):
  comm "swapper/0", pid 1, jiffies 4294667327
  hex dump (first 8 bytes):
    72 65 73 65 74 00 00 00                          reset...
  backtrace (crc fc24536):
    kmemleak_alloc+0xf4/0x12c
    __kmalloc_node_track_caller_noprof+0x3c4/0x584
    kstrdup+0x4c/0xcc
    gpio_shared_make_ref+0x8c/0x16c
    gpio_shared_of_traverse+0x4e8/0x5f4
    gpio_shared_of_traverse+0x200/0x5f4
    gpio_shared_of_traverse+0x200/0x5f4
    gpio_shared_of_traverse+0x200/0x5f4
    gpio_shared_of_traverse+0x200/0x5f4
    gpio_shared_init+0x34/0x1c4
    do_one_initcall+0x50/0x280
    kernel_init_freeable+0x290/0x33c
    kernel_init+0x28/0x14c
    ret_from_fork+0x10/0x20

Fix this by decrementing the reference count of each list entry rather than
only the first.

Fix verified on the same laptop.

Fixes: a060b8c511abb gpiolib: implement low-level, shared GPIO support
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/gpio/gpiolib-shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 9e6544203439..e16f467b72e7 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -753,14 +753,14 @@ static bool gpio_shared_entry_is_really_shared(struct gpio_shared_entry *entry)
 static void gpio_shared_free_exclusive(void)
 {
 	struct gpio_shared_entry *entry, *epos;
+	struct gpio_shared_ref *ref, *rpos;
 
 	list_for_each_entry_safe(entry, epos, &gpio_shared_list, list) {
 		if (gpio_shared_entry_is_really_shared(entry))
 			continue;
 
-		gpio_shared_drop_ref(list_first_entry(&entry->refs,
-						      struct gpio_shared_ref,
-						      list));
+		list_for_each_entry_safe(ref, rpos, &entry->refs, list)
+			gpio_shared_drop_ref(ref);
 		gpio_shared_drop_entry(entry);
 	}
 }
-- 
2.51.0


