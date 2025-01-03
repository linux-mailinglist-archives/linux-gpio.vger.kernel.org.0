Return-Path: <linux-gpio+bounces-14464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B21FA00A66
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19A9D16367D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66281FA838;
	Fri,  3 Jan 2025 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="db69reB7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0EF1494B2
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735913932; cv=none; b=ptqjqMh0KWSBrfCvGxhO8eJGgXcWogab2kapvaV3eX/uDaktaGWCX4Yx5hn6lv4fsEHvPXtRg1z01wQNHDD4jigbvrbWgM2bMx2Ik/EUsQ3wxZxAHEb9q40lvkLzzBM4DuNmNU8W8H0RnFPsH8BzrvknKMz7B2Ikzo7MCQ6QRm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735913932; c=relaxed/simple;
	bh=cMG1/1MMnZC5j0tafg83V1P3/epd9tHHHNaDsyBmqgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGUmKRPmijjUJFdRIwn6BWjeeoad71EBOmTQVtsWnMPJlLUnwdpMVtZIfhL0sHsTsDwVMN7Wyl4MOy3/pwhGQc0Y7Hi2k4ZwtGTkmwjuW+nr2gMyt4Z9PYOyT2S7c1QT3E3n40RswvQ9OoH0hdm8a9gaxrMsCizb/LuFwtiZqdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=db69reB7; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5D8CC3FAA4
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735913928;
	bh=KnRRrmEz3ZlIIsMVIhLEqcdV5rbJka1OKmEC4NqPpMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=db69reB7u9ioH1WH+sENpsbvmEmrFV4VQjO0gWmVw8/nAEnWLi9oWVTCg2WJ1lu7O
	 5z2pilh6p3jbmMhhWUNnLEWNXBNYMTio2bPDCW+TiqRCJiEZYfFN3oPRc/PMqy6+RJ
	 xoopsDMjDs+CGbXO+svjXt5spfiIpWQJ+CHIqE7TGlaqtcIUiPzE10LIN95VLDHltH
	 BZRoydzGoEwhJYZuuwecDsZeWxBKoaHVI6gIFJzmDeJmAL9c7SpRQX9dcIuHR3kp9u
	 7oHbBiLW5iOXxgKhhTrp8CS+mqVUQJ3Yxa6GtdPVLanAKkOT+0/gK+IPQIVY6m+y2Y
	 lnhFs/pcH+jqQ==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so16737135a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 06:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913926; x=1736518726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnRRrmEz3ZlIIsMVIhLEqcdV5rbJka1OKmEC4NqPpMo=;
        b=WCBhoI/CP6S8MYMbtZFtRfRGPznSSVo++Kqa+PfABH53GhRXVcvllvaFkEph+/JFJM
         AEnkykt0PVOajakIdcOeIxOmwdSv1BifT29WadJm3iOrDDX2PtuXjU5kTew6kA8hyeB7
         S4mK0oc5Flzjld383e3VChOnSdrLQFjA4WPaQJB2gbkHTR/ANJBUaNI7I7MsSlBJ3/ae
         0s69VrQty+DVLr1T1waODQvaqQHjXa7ZaoXUGNg4pPpTUeYGrBH1Wor/EaXOJDo+hti5
         kxrAt+yTjBCPhHkOmJp5qSv3vY1E1J+/ZaiMCqvdUcXyhZvHjVEa6zwLS6N1baL63mxL
         L+ig==
X-Gm-Message-State: AOJu0YwjkGEgDbhO1xnI3BbUpArdwViq9M6U+YFjPo2GLwQPXaIEewqQ
	lkjy4ntg53LZ3q4plYVyMKoAuZzcseceLPc6Ju5zgAnh1o2S85jEfE1nLkxiWSmgGniFJ1n29e+
	hM4U0kp5Zj6S1Uk/GF8h3PlBuKBMpHhtdM0nguPbIjXUIGlgptiU+pt1iCoVHc8XT5g/u6zVNLm
	oeC4LFwBY=
X-Gm-Gg: ASbGncuQ4nJmr8qhiAwMm8/ybnj/w3v/S7f35+8W6HyzJWP+b88i0sMlLOA1K+4mK3v
	HKu6yDNNNzBSlcBdXTMf9siBL5j4y/gdyOA5RYcX3mMjI5yqr9pI3O9tbB+pYp2swOZCL0nncwh
	lVMheXL6XaWzxzaJEeCx6xMYYj8tGThhPqDiS/eVih4PWeg73ex9MIxdXFX0cWuKADPI9YDvTR6
	/PU2IVhuTq0xPztszYo4yljMEDqsVT7RCz9DyO329g8lBQ8xMl3xHRQpw==
X-Received: by 2002:a05:6a00:ac5:b0:726:41e:b310 with SMTP id d2e1a72fcca58-72abdec84b4mr60827623b3a.12.1735913925732;
        Fri, 03 Jan 2025 06:18:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv7U382CtqgSsXMIMAYCsMVFfbR/QUYppP1lRrSvlMvPwHSv7X7/iZbJAG/Su+h6fW2JOd6g==
X-Received: by 2002:a05:6a00:ac5:b0:726:41e:b310 with SMTP id d2e1a72fcca58-72abdec84b4mr60827591b3a.12.1735913925377;
        Fri, 03 Jan 2025 06:18:45 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd7b0sm15502908b3a.139.2025.01.03.06.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:18:45 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] gpio: sim: lock up configfs that an instantiated device depends on
Date: Fri,  3 Jan 2025 23:18:29 +0900
Message-ID: <20250103141829.430662-5-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103141829.430662-1-koichiro.den@canonical.com>
References: <20250103141829.430662-1-koichiro.den@canonical.com>
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


