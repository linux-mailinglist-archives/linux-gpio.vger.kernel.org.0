Return-Path: <linux-gpio+bounces-14184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6B49FB9BA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 07:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4448D7A1E2E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 06:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1131816132F;
	Tue, 24 Dec 2024 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="thUAqVfL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3926016DEB1
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735020904; cv=none; b=laBG0BswzruNDQjG72zP0X4GAyaZIeFxzyNCmMdJ1LF/Z2rBoRpfjWeY3ti954OUca44FBACOsoA9z7dgxtHWnlD9heMBGPydtv+0uq+RdkOfM44naPNVV7KEitM4JH9hbPSw0qe/HXyxAIYS6Vs21j7KCfFfIz4x6nN7HuCFN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735020904; c=relaxed/simple;
	bh=kHy7+BUJB1e02uClmhERH9WN1YkLqPbGi5wICVhX5vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KES2fqp2fS1ot/jp2RCiAQkoKV/TqZpVDecrnaDtj1q8D4M7wJHlguP9JHldQJvZPI9A/xeSmS7kZut+EByU58Iu2lIE3BD2yqQdhc9G5i+0oV8eTkYzTw45Jv4NTWyXecXwGRPS7PePvU+8oZm+h9rUO1Pi5gRSni1iuw6GnZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=thUAqVfL; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C90193FA64
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735020515;
	bh=XGiVUUuPl1PuSOqM5OdpjxECLZKle/lzbsG6Q9QvzFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=thUAqVfLfKiLdzcGGslSjKWQ06Fob3eZa4NWWE1xUs4v4+hLFhzqvM/pTMHk4/yo9
	 AHQpFZs7HN7LgaKXvywkes2VA+rV7xMLuBMDz5rs1ZV5+YodMXIvPDUBhtgFs4K4P+
	 PMh5T+ycFeeNPAHteuAQiB1qDZM6vqN77wnvVHQDQIwHc4np7ZOnYGHhVDIeRJtQOk
	 pTlpcyjqtxsOHkElpOWj1VXfTSZbo2O6ZlD8Ml0W0zC/JePQd7otm+nrFOHgH8+x2J
	 s8rSw1FnsOwH4GuZbByxSdvrLAVwS0CL4iW9tHrfSQg/dDo47sHct4q++IumWdhqns
	 eUAQYaOi6dV5g==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21655569152so44033505ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Dec 2024 22:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735020514; x=1735625314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGiVUUuPl1PuSOqM5OdpjxECLZKle/lzbsG6Q9QvzFw=;
        b=ratu9hLJjiQlkSwPHQcflCL85IZ+DJimCHwS45zRHXmNOyHZU3zg/nGKmhn847GhRj
         KJHjI/ieryxzRpsupMqgTLNP424NBWo0IYMdMxluYut1uyf5+wO3dR5qGgnGVmWVJyv8
         8hpEdbZZr3APU0apImPh1KwGykuQU5U6DdkUB/uy66mmmvrvYhd9cHsfAbX1HwjqWJBw
         0Sgnfs6dZ3NO7U8rRbuaj5wqjs3xIU6Ny1ILDP1MxoNSJZ01Zhl4Ok8pVvdO0dCParIn
         E3BxTNTWiLiOcJM19W5Gyw2e7t8f5WpIwBsNZzL2HdS9kkCEnFVzCp7CBcLMlhgRnKWE
         dVMA==
X-Gm-Message-State: AOJu0YxjTwelaCpNotUTiDlDPKQKvbWWCiNS/uEtPpPKKZzrpNk5mGvc
	X+14JVqHNey4eVyusypvGJ9B4sw52Ht8pTD2Z6Fr6OKw1V5AcILCpXHdYHrqq4DGCj6b41h/kn4
	fD6lk6xDhHXK5BctsxCAtZFeGBltiJLf4sLZUGScgk28lr4WOetv+kNx+jbWioruWf90F4nUcG2
	SyT9qbOkw=
X-Gm-Gg: ASbGncuJVOBCTCxEQf8FPXlsqO/jZwQQzdWex+GVdocaDAWPWKDwxnnhTv2Cs8NMFYs
	BKc3VJMIF+hCxEUDpaaxZUpFUKNFJj0kP2dVL5Q1hniiCLS+yOzF3bitwIGV1UVS5XDpsWcALGq
	I1QheQN5W6bcmftftDZuMN9YHkDFQwOa2CrFIoiwHZHlTmAGBKMvSEL5p1Olr+grgYb5XYgm2rx
	+brg0eN0dmm/rYF0uasD76CoV0TkxjMbGMyh9+K3U/0tJzna758N/1Tcw==
X-Received: by 2002:a17:903:2442:b0:211:7156:4283 with SMTP id d9443c01a7336-219e70c0085mr229534045ad.43.1735020514126;
        Mon, 23 Dec 2024 22:08:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkIdhAHeoj3acO0zFnRMN64v6XmMJRufdO3WywSQS/7mHeIObHyUz54Bte8ccY6fbgkqFqnA==
X-Received: by 2002:a17:903:2442:b0:211:7156:4283 with SMTP id d9443c01a7336-219e70c0085mr229533855ad.43.1735020513818;
        Mon, 23 Dec 2024 22:08:33 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:7315:8eec:aecb:29a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02a8csm82262235ad.269.2024.12.23.22.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 22:08:33 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] gpio: sim: lock up configfs that an instantiated device depends on
Date: Tue, 24 Dec 2024 15:08:19 +0900
Message-ID: <20241224060819.1492472-5-koichiro.den@canonical.com>
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

Once a sim device is instantiated and actively used, allowing rmdir for
its configfs serves no purpose and can be confusing. Effectively,
arbitrary users start depending on its existence.

Make the subsystem itself depend on the configfs entry for a sim device while
it is in active use.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-sim.c | 50 +++++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index f387dad81f29..2bd9552c4e1f 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1027,6 +1027,32 @@ static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
 	dev->pdev = NULL;
 }
 
+static void
+gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
+{
+	struct configfs_subsystem *subsys;
+	struct gpio_sim_bank *bank;
+	struct gpio_sim_line *line;
+
+	subsys = dev->group.cg_subsys;
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
@@ -1039,14 +1065,24 @@ gpio_sim_device_config_live_store(struct config_item *item,
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


