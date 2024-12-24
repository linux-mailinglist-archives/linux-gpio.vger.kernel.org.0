Return-Path: <linux-gpio+bounces-14183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A3D9FB9A9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 07:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CA561884E1B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 06:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A22C16F0E8;
	Tue, 24 Dec 2024 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kF8sOVHs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C74414EC46
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735020515; cv=none; b=f/kkBWojh26iddHh8ZNps0pZitR5Cw7k6leH0Vn2ERRYCvXcP1wro6PP5nCrDFe5nztqsL55i0b+s5IPbxJfs09KN+CfUgNatf5uE2MO9+lecDkkPKNaUjVjpSTD2qsE1ys8wUtCJE0AXZEUz3NQ3YoJEsBltkusSFhSOb/zjek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735020515; c=relaxed/simple;
	bh=jjODd6E2sPP2H56rJvCjdNTs3EWlZ5GLaJEVp5Rahvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9PEUhP9fT7XRSMmSCQ47+k08DtrxL53lMLv26IxYxe6PPlPqGTIm94zS9gBzvZQaTfTPlY23OX98vkkD5R17C4B0WdnbuzLleyUpa0VYfLUpZISfs3Hjc1lCDF020+o2NzWObeBZKbaGR2pI5Zv67dIQRAglEHZl9d0CKc4sx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kF8sOVHs; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5FCF640F34
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735020511;
	bh=5ZW/PEFng4FvP68UML2UsRGI1J55AyoUOdPTFqJICxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=kF8sOVHs1BMxPjkGcZVmjz+Hz7WckZOD/SFknZIM0fq+EN5eYkKnhoWZH8+OocUcr
	 2O7TR2fkV5k9jUjG7g1ShHqf6XRy3XoDbzGB/gGhA9Zl8NiVCInZKtj3Wio4wcWURS
	 psHP220cOQxQ4Ew+sshLbXfEw6Nb1DbvZdomT39rAdIbEhID5v/X4bmAiCRawidA6p
	 c9BqfL9UsNUavUhOV34q83uT/LhmTMDbfKWZl21n3GgkBN9MzQRJ9OH1DPWhMJo163
	 onK18BTp2hw3tUm7FEec46joOKjzVjKEZIQ/OZlLGLviTCtsvFYAHHMJ1J0iPbNK4r
	 NwXGalTr5mGNw==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163c2f32fdso78148165ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Dec 2024 22:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735020510; x=1735625310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZW/PEFng4FvP68UML2UsRGI1J55AyoUOdPTFqJICxQ=;
        b=ORa6YFhNREMPY832wnFQy88kaHFQItKoQREhntjFZIHoboUj3POBwfIVB24N5I7T/w
         zsLmRzG72jdR0BfOQKc83+ZOyRfqWdmF739KmSD0vp38oappqVzCOpzrD5UCrD00x04Q
         8felkY+HnUqlBaQ4B2+mHVMtLDH8n6iNrFMSXRvmKo3XPbPDNC9ZbEwkA01E+AeoPKSx
         jjkozzXmeh3dYeAoK5EF81Cwr40zaSyn84BCTxzWZzRedgUjLFnTq4SIjE34kSozsOSM
         Wup6FCj3jbHyQZM8uxD417tzqzRnIrsozwo8KAptScPsVNRNfuf0j9XLu9lLiojlWUJT
         2xZw==
X-Gm-Message-State: AOJu0Yw0Q91nsVw4oDJJD3tAvhUQcgkeF4SJTD39iZMUR3tn0CXGke0q
	4zCjzPhyj74i2LA5q4UV71mdi7SM/ScS2S+mBtbderLOcG/V14mFh2BHCfN5FOGnslHOVUB+/Fg
	cPEN1qgFwXXrB7EjWD4I++cFcGEWG/jf5eqxvruuIZQSH59MDhKTR7F44LSULwclxnqs27vBiEG
	O14QI8K7o=
X-Gm-Gg: ASbGncsR1bvHicKbDJE8JbypS4uDuwDtWm7oXTF24A/eWwgVCqJfUrdNMBTgOysUoVl
	djJWtJZm3klHVniBoP2w1hyMnttWbqnJZuFD6J37T6Gx2WH2CQLtQbgR/WHMSyKuukLv8ymf3Qf
	NSuPzYexrLX2qg7UK76S6SmByqV+yQu7NaG0eJruX9sxnGBfgrJdRUEcI5g/9Trko51nt4ovGe6
	QvTBe142NEBkPsTmMK0YbkkQhFZCPa3U096OFzpTO5JsTc18tRTOjTQLw==
X-Received: by 2002:a17:903:24e:b0:215:5625:885b with SMTP id d9443c01a7336-219e6f28552mr222598315ad.52.1735020509990;
        Mon, 23 Dec 2024 22:08:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRFfC2tCT/DKU5w4xQITd/O1aq7SCBrIByFjq8+m/b55ZwwD1PTlzcCJJEDwXI5t8nIy4sBg==
X-Received: by 2002:a17:903:24e:b0:215:5625:885b with SMTP id d9443c01a7336-219e6f28552mr222598135ad.52.1735020509727;
        Mon, 23 Dec 2024 22:08:29 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:7315:8eec:aecb:29a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02a8csm82262235ad.269.2024.12.23.22.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 22:08:29 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] gpio: virtuser: fix handling of multiple conn_ids in lookup table
Date: Tue, 24 Dec 2024 15:08:17 +0900
Message-ID: <20241224060819.1492472-3-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241224060819.1492472-1-koichiro.den@canonical.com>
References: <20241224060819.1492472-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Creating a virtuser device via configfs with multiple conn_ids fails due
to incorrect indexing of lookup entries. Correct the indexing logic to
ensure proper functionality when multiple gpio_virtuser_lookup are
created.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-virtuser.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index a81e15a4b807..c9700c1e4126 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1410,7 +1410,7 @@ gpio_virtuser_make_lookup_table(struct gpio_virtuser_device *dev)
 	size_t num_entries = gpio_virtuser_get_lookup_count(dev);
 	struct gpio_virtuser_lookup_entry *entry;
 	struct gpio_virtuser_lookup *lookup;
-	unsigned int i = 0;
+	unsigned int i = 0, idx;
 
 	lockdep_assert_held(&dev->lock);
 
@@ -1424,12 +1424,12 @@ gpio_virtuser_make_lookup_table(struct gpio_virtuser_device *dev)
 		return -ENOMEM;
 
 	list_for_each_entry(lookup, &dev->lookup_list, siblings) {
+		idx = 0;
 		list_for_each_entry(entry, &lookup->entry_list, siblings) {
-			table->table[i] =
+			table->table[i++] =
 				GPIO_LOOKUP_IDX(entry->key,
 						entry->offset < 0 ? U16_MAX : entry->offset,
-						lookup->con_id, i, entry->flags);
-			i++;
+						lookup->con_id, idx++, entry->flags);
 		}
 	}
 
-- 
2.43.0


