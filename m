Return-Path: <linux-gpio+bounces-35631-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNkmJTPY72koGwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35631-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 23:42:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E574247AC19
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 23:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E33F305E990
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B6437C939;
	Mon, 27 Apr 2026 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ci+ImqOB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCD242D6A
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326090; cv=none; b=EYfj1tkEqWT0eAICchMr0U7EAA5NrvBwckBHxX2+4n5GsKgVSFA5yhRb3diGDP5tJmMRTfcGgzm1PsWLf6A1RxP4BgxHjBcQPNRRYDzkCh5Ets1NMgTePEWmJ+CKy46+wNUVLH9lYxyS6rfWb0z/XoJpgsSw7vmg/WGm5G6PPW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326090; c=relaxed/simple;
	bh=eZX3CDov/wKXGxHlMANg1Y9JRIPqVl+INQsMru3R7jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EYK91sGVw8Yjqm6upVYoZEosy4pXAhsCgqxvBxw/DVRv9vyf3HP1Ot0avuVdJFUVoAtmH/wjL5orXEUpShLo1kaqrYHLA4CjfOU6t/G6Pj5y0VUgSxC3jsoNSmbvzbd+x9I/qiUGcAa89QPyvSE3zFIoUKe0kmnqRgab2pWcKzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ci+ImqOB; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4094b31a037so6197075fac.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777326088; x=1777930888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XccsB8eYNsZqIBiFPfFrnn/DwDUI5DYyitE3KWf801U=;
        b=Ci+ImqOBhp/t+JVUKiQwYz7KgpcsAAuL4Q4WHtr/qhuzOwDErg9k93jmt781xwLLgz
         pJtjg+6UW8xIMsxbiQVxFhatvigiJuY7tpjQ4t4nTKkQqZ5JsYDfgxJTYOl9qUDAvw8b
         qtD9ge6atiF0SvrjhS/Y/XikiUkqp5uN1ZHyhdudsrDerZx5GdIaUQpG+0jkLwAuAy5z
         N/zxPGeZvFxj9UTWGWGW54YzxUaKaDnZZN3MMbASTDlT2gI+HygFl/jbrdXcKo9N0pVM
         11NT005yQvaJrkYQkw8xNn2xLm3DXvtxAZJ7ydaUEqaqM4Rq3iFVdmogV7TGr5Uz3fMR
         DRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326088; x=1777930888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XccsB8eYNsZqIBiFPfFrnn/DwDUI5DYyitE3KWf801U=;
        b=fqqGxxKSpVjEwP7rpjCluBXInrix27f32D6bhScTmVPzOwcGxR4ZulAm7kS94eqyJm
         wy2pghbv1WQE2su1wZgvzFKlN47pYOViEWHPxk86fP+lLg5IIueRUZ7aaxcICSosLrTj
         TngyS+ohappP/3ZZJK6iYnrp3dTV78Y/BOKNhFUuXFcMdPpti38gzjBq6usTHpqLLIgB
         8bTngbBGVZqLkSFP/XxflUySzb1yEwu419GKuY3sYtBD2yoYdrsCgWkZXSdLUb6Emkkw
         v5ps5ytqzZYh78edGZysSboIYivY1HFr/RqHSMum4CrnDody+crGBC2UB1ohgmB8RWz1
         g90A==
X-Gm-Message-State: AOJu0Yw1AIr/FzG30uXEi6KBMDQDJp9zRBaxkPhKR+5QPg5mPVjHQIy3
	LND0wdyaxsUBnYLfUt3a4JuphJlJHVgOw4AQ5jk1gjZK0ETXgZ2+vlFrKTBD2Q==
X-Gm-Gg: AeBDieueT14N7DvkKCpWO2TovPP2cadHCCkp3yWst9d44cM45Wo0Ci7uD6FbgytXeRZ
	RZvrj3Z458LMbebETbAKCDKb5hKTPCbB+OqA7RndjNY+jLTID/wsIVh/oSVutH5Co2nxaCSUZBy
	wrm9k3Mww/oBPId2Bh2GGpFg6axAHOrwPjQS90kjik2RQdCzrARA6pFI3tb7+AZlEmR2MMFqprl
	cMLdLO/2XSLHN2aJSQU+28bD1q9d0ma5HQDc5YPEcdF+Rtj+FY6RiYycLDBb4odgAr2mo5L4iQq
	b2zrWszx+wC8BKX7Kzlnty5UpeJ/3f6cVwsQ4SN7B/G5x3goFW1esWi6jW/C6Us8MP/JAcFNL9O
	M6+Yg3STcnq9HTOvDqMt575XFcjVkMYHIYNzELqHyBLFdPzuZIDUuGEMULo+9O9CbHC8OMuvgIL
	TNDEEMgGLhIugw8muAbS2Hw1WHkNlJlDRgq8rWec9o9axD5T36S8cYtC530jXvRqky8Iyv
X-Received: by 2002:a05:6820:2005:b0:696:23ca:a8 with SMTP id 006d021491bc7-6965cbafc8emr180949eaf.54.1777326088256;
        Mon, 27 Apr 2026 14:41:28 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6965ba3686bsm348322eaf.9.2026.04.27.14.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:41:27 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpio: sim: Replace sprintf() with sysfs_emit()
Date: Mon, 27 Apr 2026 16:41:26 -0500
Message-ID: <20260427214126.17818-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E574247AC19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35631-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Replace sprintf() function calls with sysfs_emit() in the configfs show
callbacks. This will help harden the driver and will bring the driver
up-to-date with more modern functions.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
  v2:
 - Rebase commit onto tag 7.1-rc1.
 - No functional changes from v1.

 drivers/gpio/gpio-sim.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index e19701c2ed67..d1e5f0ad56ad 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -695,9 +695,9 @@ static ssize_t gpio_sim_device_config_dev_name_show(struct config_item *item,
 
 	pdev = dev->pdev;
 	if (pdev)
-		return sprintf(page, "%s\n", dev_name(&pdev->dev));
+		return sysfs_emit(page, "%s\n", dev_name(&pdev->dev));
 
-	return sprintf(page, "gpio-sim.%d\n", dev->id);
+	return sysfs_emit(page, "gpio-sim.%d\n", dev->id);
 }
 
 CONFIGFS_ATTR_RO(gpio_sim_device_config_, dev_name);
@@ -711,7 +711,7 @@ gpio_sim_device_config_live_show(struct config_item *item, char *page)
 	scoped_guard(mutex, &dev->lock)
 		live = gpio_sim_device_is_live(dev);
 
-	return sprintf(page, "%c\n", live ? '1' : '0');
+	return sysfs_emit(page, "%c\n", live ? '1' : '0');
 }
 
 static unsigned int gpio_sim_get_line_names_size(struct gpio_sim_bank *bank)
@@ -1056,7 +1056,7 @@ static int gpio_sim_emit_chip_name(struct device *dev, void *data)
 		return 0;
 
 	if (device_match_fwnode(dev, ctx->swnode))
-		return sprintf(ctx->page, "%s\n", dev_name(dev));
+		return sysfs_emit(ctx->page, "%s\n", dev_name(dev));
 
 	return 0;
 }
@@ -1074,7 +1074,7 @@ static ssize_t gpio_sim_bank_config_chip_name_show(struct config_item *item,
 		return device_for_each_child(&dev->pdev->dev, &ctx,
 					     gpio_sim_emit_chip_name);
 
-	return sprintf(page, "none\n");
+	return sysfs_emit(page, "none\n");
 }
 
 CONFIGFS_ATTR_RO(gpio_sim_bank_config_, chip_name);
@@ -1087,7 +1087,7 @@ gpio_sim_bank_config_label_show(struct config_item *item, char *page)
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%s\n", bank->label ?: "");
+	return sysfs_emit(page, "%s\n", bank->label ?: "");
 }
 
 static ssize_t gpio_sim_bank_config_label_store(struct config_item *item,
@@ -1122,7 +1122,7 @@ gpio_sim_bank_config_num_lines_show(struct config_item *item, char *page)
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%u\n", bank->num_lines);
+	return sysfs_emit(page, "%u\n", bank->num_lines);
 }
 
 static ssize_t
@@ -1168,7 +1168,7 @@ gpio_sim_line_config_name_show(struct config_item *item, char *page)
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%s\n", line->name ?: "");
+	return sysfs_emit(page, "%s\n", line->name ?: "");
 }
 
 static ssize_t gpio_sim_line_config_name_store(struct config_item *item,
@@ -1203,7 +1203,7 @@ gpio_sim_line_config_valid_show(struct config_item *item, char *page)
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%c\n", line->valid ? '1' : '0');
+	return sysfs_emit(page, "%c\n", line->valid ? '1' : '0');
 }
 
 static ssize_t gpio_sim_line_config_valid_store(struct config_item *item,
@@ -1241,7 +1241,7 @@ static ssize_t gpio_sim_hog_config_name_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%s\n", hog->name ?: "");
+	return sysfs_emit(page, "%s\n", hog->name ?: "");
 }
 
 static ssize_t gpio_sim_hog_config_name_store(struct config_item *item,
@@ -1295,7 +1295,7 @@ static ssize_t gpio_sim_hog_config_direction_show(struct config_item *item,
 		return -EINVAL;
 	}
 
-	return sprintf(page, "%s\n", repr);
+	return sysfs_emit(page, "%s\n", repr);
 }
 
 static ssize_t

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.53.0


