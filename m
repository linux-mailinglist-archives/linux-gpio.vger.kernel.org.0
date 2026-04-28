Return-Path: <linux-gpio+bounces-35696-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP3QCBOd8GkRWQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35696-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:42:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4994840FD
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00442305392C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78553F20FB;
	Tue, 28 Apr 2026 11:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPL4z6k7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96863EB7F0
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376084; cv=none; b=lvXiL/RBLP/DYZSx19UI67d9X1wSmobIw43KBLBJuQiGZGk3JCyq1RSRjWgrJhuaHpLlA7cOe47Du2gmh0UI/zQQBnsE+sadBC/r0g/vONb+0TYmXrYGQBkuW+Skw8qJNxXgQkAocSCAJfY/70gmbo4VGYhAODAYKdTeP3wGZE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376084; c=relaxed/simple;
	bh=HfA2jm2PlyzEpeCPUBoKS49ADYLzApf6IHW140CSIEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUPa0XfyOQVTwFPkCm4eupo74w7CcPlD6z/FdcdwG3UxbMGMQdTn5S8F6MADQnw1WRBc95FdxE2Y4pWo2JcIXE3XP6EOgXtz6Y5dWV/1tlXVIUSf1czpgxk+QSXIIvUwmcA2uj47Z8XE5KsirMCT6lkcUD6lErSxVoSf0MSbqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPL4z6k7; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-415b23dd6e5so3956232fac.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 04:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376082; x=1777980882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=snUsLloMWiOv2ToYV4UGwd0LNmqsP/o20Ldn23wlG1A=;
        b=SPL4z6k7zIqz2UyzrVS9PpObtfB/JHD4xsXt7Sm7/ND7bvi50M4TluEx0EOathnGjx
         2trvdBw/mUJdyShaAxZO1wBdlJIkmkxq7mX4fpnKTf6dlg7fUOxE9sWZN6Y2l+iKf0i0
         NBa5HjBx9DFzMN6M5OVOdxxv7+SMkHhXOL4AKB7p5+2cCBFaTBYImmOWwzMqPTitCO9W
         PxjrlKUPDIrLbHMSZzOBYryX3GGW44qJk4mCdAiZ2ztqEPlF7XlEt9bbekS1p3RJF+de
         Q91wZz6rTgsmngrJS3rflTXC1zvip8ZEjRy415u8N912Ir3+ZThit0jhe1aqg3h41Cfx
         IOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376082; x=1777980882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snUsLloMWiOv2ToYV4UGwd0LNmqsP/o20Ldn23wlG1A=;
        b=iExaR+KDW6u2Odp66JZnCYi8GeWNsad31zaxQ0n6EGN071aHAwaENneZaxZSlB9Pbk
         0k7VYEoKSxNROHGq38vSCd2HZk1yDFBV/opUJlNkr/ie8mYMSEnwnJz0FyUsVWfbozXc
         /R+AOUTS0YFMWk75+8ycHGvJWjGuBbLJAsBDVr3C10OYHHq3moxceQdTjHqhdJr3uy+i
         aGcJQM7q4qC+AyGWwmjfeO1QWGGBSZ+fCLLYV+uRn/f43JyKUPHuzPbzpUm9suzyeeJ0
         r2AHjOE64JNN+hPwdJrRzfEFS9CxFWpX/jPlfmxa1KMIyJ0VYzSEBVjirFVWLy/aGJrs
         OZEA==
X-Gm-Message-State: AOJu0YzpCOVxJlvbw4qZ165YKeQesGjp6sggX5BbE8pb4SqAtsp3kuPC
	esZXxnGZPVd/gFKp2z+P8PyRtxWOijkq5HQZqcgfA/OlOSpbUNJhshwgiMtbxA==
X-Gm-Gg: AeBDieuxh6DG31RaUzcLXk956VtChzhVNMp2rK9sEd6+ZxE6iy+YLIRQE572Sgc11ZP
	W+LIaTDnwL6fK1F+b4WOXDDaVaEMdd7WQ0IIIstBnU/FjwJOQWVMTsOazD2gG3QyHOz0RXNtvUm
	/tqV3KLcwcZCUE0xlanW5oII/bQ67WDQ55tCoezU7Mhf1vlkeMcAvXzzAxlNPdUBl/aOS0YzeoT
	BoAAFI87uuXlH4VUbRSu6/nIl+ws/CGTskS7sxsbWA5VqmNtCO3Z8mcNzrUtcsDdJCzIrsX9YZY
	Tyhrxk/r0n23E0whpvB9wprN79JWD5vJ+tPivYZrtiV6LHROLKnMQCgzcdscZm/R4QG9sfSeviL
	W0z3qIQ2ovKylJZmdHuyu3UaINnKPdJsxLEQ7Q0XpJaAgo1rqdZ8hNHEZzRNV6MgpA0PB5rqWyZ
	bF9dXsjs0LeJV+GpEpRwUqJ71pRoKgrtyjKbLC1+YdNf2+CdQ9zA2Ln9ybeFFKUTAsa9T/
X-Received: by 2002:a05:6871:551:b0:41c:fdd7:5b4d with SMTP id 586e51a60fabf-433f3a85dddmr1188578fac.19.1777376081661;
        Tue, 28 Apr 2026 04:34:41 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-433efb816e4sm1697344fac.1.2026.04.28.04.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:34:40 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] gpio: sim: Replace sprintf() with sysfs_emit()
Date: Tue, 28 Apr 2026 06:34:39 -0500
Message-ID: <20260428113439.9783-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AD4994840FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35696-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Replace sprintf() function calls with sysfs_emit() in the configfs show
callbacks. This will help harden the driver and will bring the driver
up-to-date with more modern functions.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 v2:
 - Rebase commit onto tag 7.1-rc1.
 - No functional changes from v1.
 v3:
 - Add missing sysfs_emit(), caught by Bartosz Golaszewski.

 drivers/gpio/gpio-sim.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index e19701c2ed67..b1f31861f40d 100644
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
@@ -1335,7 +1335,7 @@ static ssize_t gpio_sim_hog_config_active_low_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%c\n", hog->active_low ? '1' : '0');
+	return sysfs_emit(page, "%c\n", hog->active_low ? '1' : '0');
 }
 
 static ssize_t
-- 
2.53.0


