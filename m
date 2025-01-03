Return-Path: <linux-gpio+bounces-14449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8376A002FA
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 04:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 123083A37D4
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 03:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE0F1B0F39;
	Fri,  3 Jan 2025 03:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="qmx9h5n+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8B1AD3E1
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735873460; cv=none; b=jFGWIGLxn+MBwoygDAXIMgqnqcTKVR8dPF16sBeft3zYh1/t90c4IOPgFkIjCcAickzDTIaQAVQQxiGAD4wxMzAt1ZMnDK67HDQwMu4vVIF+XF1YXnYWpyIxc416q9q6KW+Dvi1ATjIrPuqE8x8CyqQDKRuJLi1H2sqrod+GGP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735873460; c=relaxed/simple;
	bh=8ChtnRZwJDC04xlfJouTjNvR/nV1ghrWuZERWwclicc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQ0e6/4dpO5s6PmB3aytkxO/FOuAyLEbDqnh7M1RaQqsPXa0opkvGtb4IOwB6x1Zxgx9cQR5BTkdZCLAfxiE1SAefxhjwd8+dRgkSNSL/vLerkfso5wqJNC1Atf77QqW39WKIpL0XrVUc1JeQrki+dDbjXDWFT+UahtYPtF6h1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=qmx9h5n+; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 83A2C3FA4F
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735873455;
	bh=e3wTN7GG0fZy/9Mvu4ekzfXCmbA/5cGr2RaVYo8MjsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=qmx9h5n+Se/gsoUn4hOFfakVhcQoeM1XTlE3XmKYmm2CAktxcIjcFyUOENuwevcZR
	 pTlYjcdBHrAxcwVdiOtKKEGLTkA/W4WM6Y8aiFNwLJJ0nwf4PgKv/VvljeMgQvZd+7
	 Mf3eVCYhk4L0h+gk8iJs/SNuWb1f76CaFfgQyksTDem/3pxvjH6jOAXX9JxMqaM91b
	 XzAGyg4qarPWeshsIMQHHfYTW/0MQGjfbgdCkFcUoNQEGDaqSsynjd6KYaKYBPEm9Q
	 pYuepw5R7WcIoG7ktW2kyzCyBllZEmdIx948iQZ2cXxRt4U2gDM1dY79G3vzXBTBv3
	 GGkcdc8J8TEig==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9e4c5343so26299700a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 19:04:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735873454; x=1736478254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3wTN7GG0fZy/9Mvu4ekzfXCmbA/5cGr2RaVYo8MjsI=;
        b=EVyS5x9Pv6T1d3ErvlscUJzy/c3PBa8DWOeAuzB0JS7ld5f1DJNc+rrcjeSwmkFR8A
         3Gy9u/mR2COtxDkZAT2a7bC0h1Yt/YiTtwzurcXdo4Kuo1dojYh7f9uauwMldh18z0P4
         kjYx3UD/y8DBWDRrfPCqEK9eF31sRDhT5IX3lSZrF6a9b5h8lKrV/bMmH8+uF3PPeuJ0
         Oh3w1fAbtUgRSP6fqn+TE27+UyE8xj+y1nzYCMjkiITZe2Z66WBeoXW7Vk41MptroTao
         04EBcouiP58/xjD1eZmcib5OLhVqkzM7NrwWC4AXszBkLUIGPmYmjuBDw8C+QU2zQSPb
         eqLQ==
X-Gm-Message-State: AOJu0YyY07rnntSyCg4xG41QtQnGK3naulMoO+cHSkzZH028CXzeodzR
	stqh5wHH0Y+9HQosbhj9/sdlZZwsfZafPmHXgkWzzK56O7pWnMGOQb7CrgU/BWw731xSGe7f92z
	25IxfCznDvPJ8Uj9j9RmxB980vZVvXkHMZ1uaBr9ib7YhThCpZTIapOE78SKRGlAOvAoQZAzxk/
	KENmXVmqc=
X-Gm-Gg: ASbGncs4Cq9KzAi9dvQ2Z9N5YNcMMOCAMkyh6apJc+1WNxasn5bcDkSp1iE9RlYHclQ
	yb0aJmqMQu+UK2vK73yjF0+ZJANByYffKscpClzX4UHbSzEFr5imdb85HjssVOb4n8rCso5tU0I
	sNLctDntNCy6eIVsb9Ssg7awPhuniE7RkERVEKy/MydLo1xPaLlsbNFH719D3bHY7kOPsLeJ3+M
	trHTH+cpZKqzhl9ERIWqhQhHG0v8LzbU+oG5kJ0aAkkiK341VTSfMynew==
X-Received: by 2002:a17:90b:2e4a:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f452e3db0bmr69946871a91.19.1735873453832;
        Thu, 02 Jan 2025 19:04:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1hiK2a5+CO233sG3Qpkn6XXVD3vSsm9fOlhx32heiyY6Mfxi9/aS5dOjiAQEQ/d/43Wr6UQ==
X-Received: by 2002:a17:90b:2e4a:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f452e3db0bmr69946849a91.19.1735873453546;
        Thu, 02 Jan 2025 19:04:13 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964e92sm234468215ad.18.2025.01.02.19.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 19:04:13 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] gpio: virtuser: fix handling of multiple conn_ids in lookup table
Date: Fri,  3 Jan 2025 12:04:00 +0900
Message-ID: <20250103030402.81954-3-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103030402.81954-1-koichiro.den@canonical.com>
References: <20250103030402.81954-1-koichiro.den@canonical.com>
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
index ec5abfebca3d..3ea00321225d 100644
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


