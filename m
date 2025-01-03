Return-Path: <linux-gpio+bounces-14450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632BA002FE
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 04:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C749B16315C
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 03:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C675D1B2EEB;
	Fri,  3 Jan 2025 03:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kVENGoKc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9721B0F3C
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735873462; cv=none; b=cFUNUZtBQsqTJVjliHMRUTsxQvO0y9PzsSEc71PwCjYk3oqkM6+cliQPPE1wAkBneapjwmDjwOh5LAMlToaEZQ/HO+BGd240EsQUvZallg8G1Q7gvpC80I4xQMFGz/ynYAOdoptdWoAXWJ/Skmq+TfY1r2E534bCCSBnaWdv1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735873462; c=relaxed/simple;
	bh=JunSkXQS/WrxUltD0lGrTV1bGckYdkmYNn3tEKfXHBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fd1RjT39thzm19u8ssElvBC94u8nU68hTbve6/E+uUfe7MH9Y4t0MFaCII1VXNh/VfGE7tYVCAkWBmiZ+3v2xaBETdCj6daVNJ1yzurtmgXFgUAIxXhzStrg9ZJqRl4+l5xNYm0E7K7lSlsUcOMqnvZlKNc/insFGNoOwijK4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kVENGoKc; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E71973FAA4
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735873458;
	bh=5OyXQEUStRad/LSx/VEF0lCffTMLCTZxVZyqOqZw17k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=kVENGoKcU51x7/ReBDqMWd8Y6sAPnjfLHIWltn3cEUcMYxiVbsF/E0dSNzDQheQvT
	 uXufKG846JR4nCrzindrf5tCfcZ9EarBwCD1q4bPnkdofCCvQOVzI8QMLGbTgdw5SH
	 Sqr8bQBFlyWKtKvF1JtYvA7V7hAdt+Z71jYdHnJba3YYQ8CYz6CzdAY6heXRU4N3vJ
	 lYltAHlmXG5H3o7aARFRQZ2Khqda7rKu2lFT+wffOMhiEyTuPGdXPkG3yjZCwcBOLb
	 eSLxyamxoBDLcP2n5na7YQVqYI3Qy/kN6yZnu2gGe12fcgSM3ykAA5rRFoPPxXw760
	 NbrhAeLAmk3fg==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9e38b0cfso15868781a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 19:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735873456; x=1736478256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OyXQEUStRad/LSx/VEF0lCffTMLCTZxVZyqOqZw17k=;
        b=RwoWwFgZtpMETqMTDDnUJoL/l6aSCx51i+wA+wPy3wPLmv3Y29NV+lt0Q5alrK7/03
         ia1geCTYAgAvofAd45r9oNK/wudR1u0HV09gf3sgicFunqHxeTIghIgbObOjbXFdohBr
         FI+9qEjmIGxGJ9ze2EhRl+qQiMSyX4EfQ3wTw5uwYxt/dnjixV3H3TNqh2k7HcDS4zd+
         wmjHbsCtITRblYrqs2oupzQaH8oaGaSwxZwaBMjvCjfjmmthcJXY3Yqq9FyICUWnYVjv
         ktYqvYFZhJmn6LgrlXlI6otNWR8PfRqungz+Ou3unG7zul3qWrvlYr2Yoqm1V+y6YxbN
         Sp/w==
X-Gm-Message-State: AOJu0Yzu3nLu5YxTNvq/cMAhilV8/23vk7THtINqv6rsUamErZcczSP/
	BmHY89pUj+xb8r2w1CEgpXFMJJMQ51+UywfveScV/nMjGSdT2lWAyaPI0G49y6h84FwFPaSPBoC
	ntdTibUPZcv1p2UKJs+x/f1dkes2LLKVWZbXWpvksBcedCLKV1ibEa4WdU+2iQRqBM5pJ5s4jKC
	CYGGWgedk=
X-Gm-Gg: ASbGncugHrvky9WL47ugAs9dQpOUmVtSWvGF9Pp0JHHm7oDQjuW4YgEEhXJGyQ5MKtg
	1cNWBzQLRQzQJFMWy6B/bvM62Y+aJsEPqfvN75hPer/6T6CDB6HORD0bhBcbTWu3B58Riu7paWE
	NssO3XeM9VFwSQ02LGLhQ1uL3rbchPAjWivAUnwn/X5blTtB8j4M+3Zi/3r8m2MeDQjPz0rWQDX
	KPLr4BvKuyI+s0c/JnTFvZpu/y/b6Y4ReMqbd3IbvMVLKbiaFaT8Mic3w==
X-Received: by 2002:a17:90b:3cc6:b0:2ee:aa95:6de9 with SMTP id 98e67ed59e1d1-2f452eed7e1mr71974689a91.33.1735873455906;
        Thu, 02 Jan 2025 19:04:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCS7Cz0YzMku+ZSoXJyoGSH4F1gRWtl6eRLFX03egQucKA/MTOE24CB9WUoB0rI8QyM/3gmA==
X-Received: by 2002:a17:90b:3cc6:b0:2ee:aa95:6de9 with SMTP id 98e67ed59e1d1-2f452eed7e1mr71974666a91.33.1735873455643;
        Thu, 02 Jan 2025 19:04:15 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964e92sm234468215ad.18.2025.01.02.19.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 19:04:15 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] gpio: virtuser: lock up configfs that an instantiated device depends on
Date: Fri,  3 Jan 2025 12:04:01 +0900
Message-ID: <20250103030402.81954-4-koichiro.den@canonical.com>
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

Once a virtuser device is instantiated and actively used, allowing rmdir
for its configfs serves no purpose and can be confusing. Userspace
interacts with the virtual consumer at arbitrary times, meaning it
depends on its existence.

Make the subsystem itself depend on the configfs entry for a virtuser
device while it is in active use.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-virtuser.c | 47 ++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 3ea00321225d..f41dde330bb7 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1539,6 +1539,30 @@ gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
 	kfree(dev->lookup_table);
 }
 
+static void
+gpio_virtuser_device_lockup_configfs(struct gpio_virtuser_device *dev, bool lock)
+{
+	struct configfs_subsystem *subsys = dev->group.cg_subsys;
+	struct gpio_virtuser_lookup_entry *entry;
+	struct gpio_virtuser_lookup *lookup;
+
+	/*
+	 * The device only needs to depend on leaf lookup entries. This is
+	 * sufficient to lock up all the configfs entries that the
+	 * instantiated, alive device depends on.
+	 */
+	list_for_each_entry(lookup, &dev->lookup_list, siblings) {
+		list_for_each_entry(entry, &lookup->entry_list, siblings) {
+			if (lock)
+				WARN_ON(configfs_depend_item_unlocked(
+						subsys, &entry->group.cg_item));
+			else
+				configfs_undepend_item_unlocked(
+						&entry->group.cg_item);
+		}
+	}
+}
+
 static ssize_t
 gpio_virtuser_device_config_live_store(struct config_item *item,
 				       const char *page, size_t count)
@@ -1551,15 +1575,24 @@ gpio_virtuser_device_config_live_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	guard(mutex)(&dev->lock);
+	if (live)
+		gpio_virtuser_device_lockup_configfs(dev, true);
 
-	if (live == gpio_virtuser_device_is_live(dev))
-		return -EPERM;
+	scoped_guard(mutex, &dev->lock) {
+		if (live == gpio_virtuser_device_is_live(dev))
+			ret = -EPERM;
+		else if (live)
+			ret = gpio_virtuser_device_activate(dev);
+		else
+			gpio_virtuser_device_deactivate(dev);
+	}
 
-	if (live)
-		ret = gpio_virtuser_device_activate(dev);
-	else
-		gpio_virtuser_device_deactivate(dev);
+	/*
+	 * Undepend is required only if device disablement (live == 0)
+	 * succeeds or if device enablement (live == 1) fails.
+	 */
+	if (live == !!ret)
+		gpio_virtuser_device_lockup_configfs(dev, false);
 
 	return ret ?: count;
 }
-- 
2.43.0


