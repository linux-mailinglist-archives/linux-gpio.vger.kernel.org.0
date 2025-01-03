Return-Path: <linux-gpio+bounces-14451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621AA00301
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 04:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E53CE163140
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 03:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92831B4F25;
	Fri,  3 Jan 2025 03:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Kzgyafz4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62271B218D
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735873463; cv=none; b=HmuI6+F6qkDyyzVYExOrjJptcnV2eIbph0UGO1kor6iLMhxKLMagZWLPHTrtTs7QfojAVgnfruLrjWFMWfgMQjEHFYM0/8aU57aRkT5varTIU9w6sxtXvmvjRoRZ8I8lZWCBqGbUfDedm2Q6YIY4tUFUwlUJrgCna1bOrc5ow/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735873463; c=relaxed/simple;
	bh=cMG1/1MMnZC5j0tafg83V1P3/epd9tHHHNaDsyBmqgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUEOtF+Hs8m+7T8hW1MQnxjKgrLOi6bpdnveYcSBEbz6rb2jGdI19AyAR2ir47CHQjoVDNuY/WrHW8mSF7pCEgy4TB0GB7wSY/f2QXEhFn3O+Nwwgk1nGDUhXSn0aq2o3vdT5BFTq2omYgVGRE32vOZ37uwIJXgWvoma0zxPAYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Kzgyafz4; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A08623FADD
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735873459;
	bh=KnRRrmEz3ZlIIsMVIhLEqcdV5rbJka1OKmEC4NqPpMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Kzgyafz4DbtPFf7gB3fK0kIZCDTE8fGazVBLBO/pd78BF8sjhlj66wVpKfUVFbj2z
	 t8QWWoC4Bh8PHWUHMQlfVOhzQELjwIkWMWTSYqxZvXuhX2vZcx9F3GsRQByBu64oAI
	 /06vbxyktZxGSpLbZmM6IAShDNZ7Gq00OyYd4vZXrUKGXq5XCIywysVTcr5jliKoaf
	 Y6zVCSVMC1pozihVukmf5t075DBMTqltZyYxoIF3pRuottamrzv+zLp1/bJATh44Sw
	 r0UNmtOkYIY4iIL3S85M6/CqxPS9V7PRxJ2sAMiw+aitPpshOY2Pn695Cjr4wQQwK/
	 RKPck2JuCpi3g==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2161d5b3eb5so140423665ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 19:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735873458; x=1736478258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnRRrmEz3ZlIIsMVIhLEqcdV5rbJka1OKmEC4NqPpMo=;
        b=BDxzOib3FcD8jA2/njDFAmBiYn5W68XN1Y3qq8xTT/4tqPyTlq9Bm63hMNeX75eHIh
         SSd54NAak+k3b1jj+euSXrG7dXwOloaxIFTdImZayAguI40rYteurWeGeKbemLon2zS1
         jdeT1o+H1RZs1+VDNXdE5u6XkxFSzjaEVCpr2JxIBD8/AAcRJFDkvOaFAZLHkaCJoDwg
         pA78Tx2dWFQh1i1UgIRWA+4omujoV5Fa4DQdnALc+4xF1DBcMGyj29CbW+gACsX3WYsJ
         9/cEtcVk+qtoOM5AF0LA9SkVztWdaDscnGPQW4Nh6yI0Cm5BSby5Rwy2ECKirwfPY2pE
         u1Bw==
X-Gm-Message-State: AOJu0YxyyHOrYREMfcQpxSyrmxL7Cz966BcW0S71cVgm6/lez1InIBml
	v8Fn5NxnwqBf7hY8x/Wvn+nWc3vIbuGJHFGCjEKj9Q/8X6A67S6KfcDQ+3WWFyu958L6eX+objo
	YozNpA4B0dCBeKgF23KZO5BxUrNitOw4lAzREl1wKEwkUWmDDY+P7wS3h3VwcO9KCoRcyahQZ44
	L3+hZDrtM=
X-Gm-Gg: ASbGnct+6D5aaUVWP7UvIpzzpTKtJXvpjhpofT4Zf1KaWaoo0i7+q/oNJ8NXj992sBv
	VMi576B4rjOXVyDzsf9s8gvdBu9tHjw7b8TkZYfwJqqY4+5umW0Dbo+14Ash5f1ae+JCq9Di4Vr
	/mtZY9GmjBp7kyr8Qr/7ian8dBVzwy75p5cUjzMRu6mkuAa52J+gcHGhaYdR5yOJfEaYaD6dyAH
	gDiXoQO5T/0y/glQo6w10FGtRbbYmbKLRM3YZvrdC0phjL/dz90GG/3lw==
X-Received: by 2002:a17:902:ec82:b0:215:827e:3a6 with SMTP id d9443c01a7336-219e6f1447fmr669964315ad.40.1735873457818;
        Thu, 02 Jan 2025 19:04:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9RNUp94jEV9P+9MrJZxWB37Wjl05/hcGuQKUx1SF53mS16El8k6M6J16/Z4u8N3wsbGWoQw==
X-Received: by 2002:a17:902:ec82:b0:215:827e:3a6 with SMTP id d9443c01a7336-219e6f1447fmr669964005ad.40.1735873457444;
        Thu, 02 Jan 2025 19:04:17 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964e92sm234468215ad.18.2025.01.02.19.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 19:04:17 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] gpio: sim: lock up configfs that an instantiated device depends on
Date: Fri,  3 Jan 2025 12:04:02 +0900
Message-ID: <20250103030402.81954-5-koichiro.den@canonical.com>
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

Once a sim device is instantiated and actively used, allowing rmdir for
its configfs serves no purpose and can be confusing. Effectively,
arbitrary users start depending on its existence.

Make the subsystem itself depend on the configfs entry for a sim device
while it is in active use.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-sim.c | 48 +++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index f387dad81f29..686ae3d11ba3 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1027,6 +1027,30 @@ static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
 	dev->pdev = NULL;
 }
 
+static void
+gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
+{
+	struct configfs_subsystem *subsys = dev->group.cg_subsys;
+	struct gpio_sim_bank *bank;
+	struct gpio_sim_line *line;
+
+	/*
+	 * The device only needs to depend on leaf line entries. This is
+	 * sufficient to lock up all the configfs entries that the
+	 * instantiated, alive device depends on.
+	 */
+	list_for_each_entry(bank, &dev->bank_list, siblings) {
+		list_for_each_entry(line, &bank->line_list, siblings) {
+			if (lock)
+				WARN_ON(configfs_depend_item_unlocked(
+						subsys, &line->group.cg_item));
+			else
+				configfs_undepend_item_unlocked(
+						&line->group.cg_item);
+		}
+	}
+}
+
 static ssize_t
 gpio_sim_device_config_live_store(struct config_item *item,
 				  const char *page, size_t count)
@@ -1039,14 +1063,24 @@ gpio_sim_device_config_live_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	guard(mutex)(&dev->lock);
+	if (live)
+		gpio_sim_device_lockup_configfs(dev, true);
 
-	if (live == gpio_sim_device_is_live(dev))
-		ret = -EPERM;
-	else if (live)
-		ret = gpio_sim_device_activate(dev);
-	else
-		gpio_sim_device_deactivate(dev);
+	scoped_guard(mutex, &dev->lock) {
+		if (live == gpio_sim_device_is_live(dev))
+			ret = -EPERM;
+		else if (live)
+			ret = gpio_sim_device_activate(dev);
+		else
+			gpio_sim_device_deactivate(dev);
+	}
+
+	/*
+	 * Undepend is required only if device disablement (live == 0)
+	 * succeeds or if device enablement (live == 1) fails.
+	 */
+	if (live == !!ret)
+		gpio_sim_device_lockup_configfs(dev, false);
 
 	return ret ?: count;
 }
-- 
2.43.0


