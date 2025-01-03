Return-Path: <linux-gpio+bounces-14463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B89A00A63
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85D2E1635A7
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F9E1FAC3E;
	Fri,  3 Jan 2025 14:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="KOcgr2up"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BE1FA8C5
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735913929; cv=none; b=YikdJIBsXF22hAc2TeBGMaitxeqnJOtkaqFBIDEG+dprzcJxkeD3w3zzUkHej3YDPFnKQ3YB4IHzXLFbNtkJQ1TxSV65qFh7oDQyfs2cxi4po0VvtqHFMLIWQz+YifHDAycrlgILi8i8KgP3Vu3iVGFF/MUmSAcmVnY4oecL9Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735913929; c=relaxed/simple;
	bh=xhS0Z22ILzihE8+EF1GLpM5S8o9zaVB9Z8Ix+uBto78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViP1DRq8z1W1WnFTTL+kYBzk0v5XyMzG8KCr6c9+eFASmX+d4PUQfQ2da9UBnmG+tS7Q9OsQ6Juf/FDmWK9VHmEljSMDqbzcfWI888ylrMopvF7JBziZmL6PHgIrQpVpds4yacfsGgyATKK4SF384mNUtvjSjOYx+lFpF/qkEKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=KOcgr2up; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 529FF40FAA
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735913925;
	bh=oQRkhk2ers1PY8gk4vucPTfvdzK6lgBgnNx9ctUlNu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=KOcgr2upYvpYn3d5UxI0N+eOXwd8InmoEPIq12jVZHOa7Eccy8/hkgqUmR4qRWjMK
	 vRz7nzBsRg1lLcM+rHPADeWLybtbscFpxh6PQB1Iu+iIXCmrTv4XW3tsE2YmQkx2aq
	 gnd45zTw/CqYjg+WQ48G0PgvWmH0Qxqhkrgd0BACyauUxtXXM3vFni//6zg7zcfeBQ
	 OUw5YHxvdTeIGMD/gVyHXissf478WndQl1EPKtn51Okydu++QwiQPYHPVJf2Y/kmxE
	 vcs7XJqjZSn6beg+2WL8GhMXUdmuZvkQukz0fK8VQ9+FYvn9cG60n7cl78GPa/6bjK
	 xWHsxeRWFU66g==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee86953aeaso16475734a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 06:18:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913924; x=1736518724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQRkhk2ers1PY8gk4vucPTfvdzK6lgBgnNx9ctUlNu8=;
        b=pqtm1YPP+S8lxPt6VYpTyXfl1rjPdKFFVKEPLkhE5r7eJtgIrfC4CRSBU+sGD7NEtf
         9cnYtPikk5WoH7lFAt5Ac7HlJKlVqkAQw5WFC/pPxWzKywpg3ZI6CVBZNyMYIbujWZzB
         7J0Ykdsd9RCKj+bxMYzvoXhCtQ4LibDAyY+zmMjMURJqTD8xAZ9fvOmCrBA4V6JylCOm
         Wdy49G8RAaW9OU+rT3Td0zzhlrQ15LAMDcf4zQ1cqxIlcO6T6+h2UDIsObKkGlat/jJr
         Ze0YoSwaagJYaA+QkM947m8Jz5skZRpBhgtzEA2dT8oNn1sxOS/66CxI3zTCcfW70Nwd
         RUvA==
X-Gm-Message-State: AOJu0YxwKmCY5MPAg4xmhU9eIkXD/IpAoM1eYA0zVllzty9LFhzwHxCm
	s6x2wqfYeZ5j2k1OH7ja/ciYgeNN/VUhzYREWZ5K5kGXJIMHx2r4jGWIynEYb5ozMx939u1rhFp
	0yqMjuYJiWhAZD5wVPFax2AvRqQEmzmSAOpg0qZjPGg/M88+QxPWIgth+W4KJybzW07WYwkFOM6
	Vmlq3lq/s=
X-Gm-Gg: ASbGncuTYdpD+K0zYIP7Y3jhLGhIXwAjJ+5iJaXhKqYg1JgKqABJW/epD2yXP3KrJCw
	IRIp7Spa2bPmev/yyOCzfUQM0Q/VR1ZiLkB+ijF9NnzfT9jHFtiB7Q8B2ldiWxRPfphdxvRXfP+
	kFk/FBFo0AWgRFkjcKBqsJOVNaoEHsWbsj9ODiD9Ohs1CsFYvr8VK0g8PYjKTUUaa2UUMSvARCD
	xMb1Od4g/cCLehprbRchb/TPR/A+Z/NSzEMIYOOirpYez89vKsqghQ/Ng==
X-Received: by 2002:a05:6a20:12d5:b0:1e1:a6a6:848 with SMTP id adf61e73a8af0-1e5e04a2ea0mr84790432637.25.1735913923860;
        Fri, 03 Jan 2025 06:18:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfuLuntJGswpyZlgdgJtqQiNv5lyTRdKl2lvQlfrLGdmckhmZ8HvOlcs4HTDI0rd06bQdpNw==
X-Received: by 2002:a05:6a20:12d5:b0:1e1:a6a6:848 with SMTP id adf61e73a8af0-1e5e04a2ea0mr84790392637.25.1735913923515;
        Fri, 03 Jan 2025 06:18:43 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd7b0sm15502908b3a.139.2025.01.03.06.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:18:43 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] gpio: virtuser: lock up configfs that an instantiated device depends on
Date: Fri,  3 Jan 2025 23:18:28 +0900
Message-ID: <20250103141829.430662-4-koichiro.den@canonical.com>
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
index d6244f0d3bc7..e89f299f2140 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1546,6 +1546,30 @@ gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
 	dev->pdev = NULL;
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
@@ -1558,15 +1582,24 @@ gpio_virtuser_device_config_live_store(struct config_item *item,
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


