Return-Path: <linux-gpio+bounces-14448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D794AA002F8
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 04:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 462167A19BD
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 03:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3992019D8BB;
	Fri,  3 Jan 2025 03:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="GLFN9/qN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B994C62
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735873457; cv=none; b=pdy2PC1obf7InLKP2vE0eRoXi7pn3oIbrterY1QPZNTa27jHegmBzhHxdJNDqMXsOa1sI9OQdglbfiCOLxHMSLqDe+R4WREVDM2IPyppKMoSVSGnVcEO26Ia/3gIH11g0SqvLRiWyER+qdZ1GiGrNEcph+BGK/o3dXniWvxkuHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735873457; c=relaxed/simple;
	bh=HO08RPGJzed4ppqZ+jQm2FIefTr2FHu7Tv13x0myX08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IztY7mOxP7WTL7+UplonRt0c2e5FYixGK/un6KsDATT8akkN5W4tXgckEkZzlo/vS8JSldi2Fnly/c/6rFCJ0E+tSyxP/7N/3vARap5f6azWsQKo3Z8oa27+C/y7SFO8COYwB60cv/PROYFA1hE/Qd2Vhj+ljlOFcNSJUlZgR7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=GLFN9/qN; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3FA4E40FAD
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735873453;
	bh=cksCAqWYBujQdwWe5V+2vXqBxqUQWT0G6DdOeqkhr9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=GLFN9/qNHUFeUq9D3fSckxDWCb8jr8Pi8Lf+Qm+mpDfVSSpAuqqOLh176MQWGtQ3z
	 VBPX3ictp1ShjiB5/rTDyyAf5SBQZhptH9oMyYguM3GXwMIH6hsDjxx8p/N38+nNAW
	 uN3q3tId0jb5fI01GgYfQsdiiYD1A+mwqjwWAXTOn89VwNeNo7cJOGE6LQib52GWup
	 k9O6VpcdRzkwFyUn6Ne/QQQsJ4vX/SBR6ib4hjd6o0bHWld9colFV+uoT8/CmsBNnw
	 1aIgmgLtQXrfcXR8S2Ybm5SNyqOJaTrjFyvHMcB8eq10aZoFEecaqNZkGslbSs2muY
	 WzAa+5vv4kA9Q==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2161d185f04so119904345ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 19:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735873452; x=1736478252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cksCAqWYBujQdwWe5V+2vXqBxqUQWT0G6DdOeqkhr9I=;
        b=aYgC7c0R2oaTT5BLTybNnJEZb0lTCcxAnJDyngFWgoIr60KYkLANYcXSgr5506WBEP
         O6KQISxVMsBc4KE3QeCNpID8OtZi2mdukD8901QOoNabprzfLhwF54xnXH/N7XCEZm3S
         nA8oO/gLHBecvpxcthSIM4AVVv4dCNyZir/Z7paatoThtJ2pWqf+KPqEjhARc5AUqucq
         QtB6/4okl4Zv4+Mb2BwjYZnjLyKOlAwVIcyDLsLvfIr/vHeaCbO6tkAetd2KCjUW2Vep
         fJksCWfELqweRoBiRJkG9Sfhmfn3KmtY2/k8Eu790Xn6B4CF1HZ0SMVNuGsF4gDIcWdH
         qLRQ==
X-Gm-Message-State: AOJu0YwowV2c98MbCSSxBkHlghrn1Mv4R8wUov7AHhQbmN0FufzXLV2z
	ZGoV1UcM3RhGUV+K8EAi1eHgcY0/8oR9zt0Ep1EvNRrYK7Cv2ih7loYh0i+XG0KhE+eGZ+EG5GB
	BYVNwRUtDFaF/8e0E/yZOHEZUqMDgHH16m+71FCyixk1rAbFZaA56Nj/MHAigSl7l7nI5znJVxY
	RiFt+ceqU=
X-Gm-Gg: ASbGncsiQe4yWMe9njwo9e71mgf8be5b0BqIuTwV6180kRy3e+Ku/2a/dhg6FkUqLRH
	bVjYmTSxcUIwkRHhP9w/17e+lVEctum5468ObU/aqrpGVFVb2BCFBGd1DTohTlASmk40RYRpFqS
	xPcj+XLKL2BdRkWv9DI2IYLEZksM84PvOunxl6WjygV2tS6j/TVgxyiaqgzovjvc9f9NWqRX1lU
	wBfAICboKd8rfBaz2nK6jmuyIv5khvwteX+4exIjJ7jrRt+HZq1mSYOJA==
X-Received: by 2002:a17:902:ceca:b0:215:83e1:99ff with SMTP id d9443c01a7336-219e6eb3a33mr565079095ad.27.1735873451785;
        Thu, 02 Jan 2025 19:04:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGBER2IvdTscZDfzvf/elpBjJTjHsAhRcm73v7vt/2knmlf2lYW0VN6rGpYrctLrSfO1co+w==
X-Received: by 2002:a17:902:ceca:b0:215:83e1:99ff with SMTP id d9443c01a7336-219e6eb3a33mr565078855ad.27.1735873451426;
        Thu, 02 Jan 2025 19:04:11 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964e92sm234468215ad.18.2025.01.02.19.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 19:04:11 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] gpio: virtuser: fix missing lookup table cleanups
Date: Fri,  3 Jan 2025 12:03:59 +0900
Message-ID: <20250103030402.81954-2-koichiro.den@canonical.com>
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

When a virtuser device is created via configfs and the probe fails due
to an incorrect lookup table, the table is not removed. This prevents
subsequent probe attempts from succeeding, even if the issue is
corrected, unless the device is released. Additionally, cleanup is also
needed in the less likely case of platform_device_register_full()
failure.

Ensure the lookup table is removed whenever the device activation fails.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-virtuser.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 91b6352c957c..ec5abfebca3d 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1487,10 +1487,8 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 	pdevinfo.fwnode = swnode;
 
 	ret = gpio_virtuser_make_lookup_table(dev);
-	if (ret) {
-		fwnode_remove_software_node(swnode);
-		return ret;
-	}
+	if (ret)
+		goto err_remove_swnode;
 
 	reinit_completion(&dev->probe_completion);
 	dev->driver_bound = false;
@@ -1498,23 +1496,32 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 
 	pdev = platform_device_register_full(&pdevinfo);
 	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
 		bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
-		fwnode_remove_software_node(swnode);
-		return PTR_ERR(pdev);
+		goto err_remove_lookup_table;
 	}
 
 	wait_for_completion(&dev->probe_completion);
 	bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
 
 	if (!dev->driver_bound) {
-		platform_device_unregister(pdev);
-		fwnode_remove_software_node(swnode);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_unregister_pdev;
 	}
 
 	dev->pdev = pdev;
 
 	return 0;
+
+err_unregister_pdev:
+	platform_device_unregister(pdev);
+err_remove_lookup_table:
+	gpiod_remove_lookup_table(dev->lookup_table);
+	kfree(dev->lookup_table);
+err_remove_swnode:
+	fwnode_remove_software_node(swnode);
+
+	return ret;
 }
 
 static void
-- 
2.43.0


