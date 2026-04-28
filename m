Return-Path: <linux-gpio+bounces-35695-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNyQAu2h8GkQWgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35695-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 14:02:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D54164847A7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 14:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA65F3052643
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A98364E93;
	Tue, 28 Apr 2026 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3J1KFvz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68D21D590
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375997; cv=none; b=ATHuzk+/rDPTWJieGkjlf/+JIPjd4yD34L+XIwvHKhCv9opXks6VOzr4yRt8iUrRBqfxlU2z+oIAJ4t+ZXYLW8gAm/Kl7r8jRIKfS7xW0f9TSqsY9nakB25/nRAofwTaOr4VhzkuscjetVovChbDPDzTEaLSxJ2CIENt2aiZPwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375997; c=relaxed/simple;
	bh=HfA2jm2PlyzEpeCPUBoKS49ADYLzApf6IHW140CSIEU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SRp4z5LbLrCH2Z0bCstjFDmR0iwSP5o/xqgAgCHj87gcBE0xVF7qkHE4M6QmdxaSKrA3jssnCsBCbStc8FbQrZ/oMr8IXcMWNOz76rcWSHsToZwoJkdJhXVJzqw3b9ZVBG1z4FyCK2KyopntMg9N5L8Es5hug19sXBUBHwVnNFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3J1KFvz; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7dbec19732eso9605287a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777375995; x=1777980795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=snUsLloMWiOv2ToYV4UGwd0LNmqsP/o20Ldn23wlG1A=;
        b=b3J1KFvzYRxaeRqoOXpKbfzyDlgSDJMJDO+VYhHEZKTLZ6RS5UF7ZMRTjvVDAnBFtp
         ms8yyDEv45WJNYCb3JZUUCutcmJmRb1mhgmsyZstY1YdjXp0RZs0yOGqfSALvNoWHa3l
         aAR9V1gSyeavQ/Tdvoicpa6Fgs2RotOsYbfpPd97iDpmm8kDNrexu4Oc940/lvoe5mXw
         IDqst+c8gIb2AcQuFSH1zmKvhL9GD4Q5bJ7nNdIVp+39gdgiWNQYvOEVepEHJMU2OVVa
         WXcGOpkKyzU3auFYG9fsJjJSpwOXrwDXM99k4CpozeG0TZWkp6E6pf2P30IHFHiGzt40
         aOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375995; x=1777980795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snUsLloMWiOv2ToYV4UGwd0LNmqsP/o20Ldn23wlG1A=;
        b=sWfbiZHXJehl5XZ/A5CHohc8kMHTK4aQBjEGPLxMLOBp6qzYwCGjvD+gWCeaSP946Z
         nvXgXGxtV0NjXRRHLDjOwpAxFry5+gApQGotsR0CVcxtdhEZwghAEL1qHrVfhhMF3w3t
         qoLTeo1pNnERTYTP3K00T+Do8pXAtJ60emEtVFCJN/NPTFo8cv/HVefg9bRKPnrHA/IW
         6+ddnunoecXmX8TKM8ZOcjgFbrxAdnzxxWqKD71bvl7mfFT2oW3PZWjxRHcjfRfFTwHQ
         r9vpq6zdvBh+91/Sn/K7/lkBrPvdhjjJ4PC2HIfrb08pyRvYhYGlDvDE0ECR/Yc2DTNO
         1M/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+gB57rzVSCBxm6X/Mhr+7Vucj9UKn10nwpfHwbi8A3o29qPRj9D8IUeKdsiewMQO3u170w+n4kisBq@vger.kernel.org
X-Gm-Message-State: AOJu0YySvf99Evo7MZrzo4LyrTrjTvDnesk8q3qsF1ngpbyoWUBh5NKS
	/DJX+J7XjK005t/Zki7vpQY3+7N1FBj1DowxHbmXL1H/0qe67U5HPSnnoJlLhg==
X-Gm-Gg: AeBDies4qr4CYRCu+NbADes+go+JD0jnaZvLUtye6PNdSKKWkSvpd5Bm94VJ6/GQknP
	PxI9dssiR0Ix9sE3QSOgO16ZhXIB+aT2z0tSqdqdmx8ePGSYiFfqWhGpnAKkg8hg6uttkRWxxiP
	fn/L6isr4e5fApVrtRBy6nZ3eovtM5Oc1aAsBsWwPk2qoBgRDabUsUc0u4AAUsVN9rMIOB6Oqj4
	XQVH+KbzuFWtb8eSM7e4WIgSnAgNqg79xlmo92pst2Y9hlaeM14BltBF9x9apAyq+xVsaDEPN0D
	cAzUw73xv4mkm3YmyZuxmnZuEBD1/yjRbwRkllvJoVGJnJY91yo1Uaeh1ngcLzSBTuDZ+pcVXTn
	KWz0SDC8pQTsVAafljmbwTYD20zy5bWLvJ7Sc1fadE1rxrgxehT9pjRELwiNY4j2j4C4/hmrTuK
	n42FXhoV3ZfvVjO0RTovkIlG6+tNHdppwwW6QAPtSEFOrdvYNIpbQ91JNnXUbfX/A4yBgC
X-Received: by 2002:a05:6830:64c9:b0:7d7:f15b:bdcf with SMTP id 46e09a7af769-7de9a185379mr1495830a34.28.1777375995058;
        Tue, 28 Apr 2026 04:33:15 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7de9866c62fsm1550989a34.13.2026.04.28.04.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:33:14 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] gpio: sim: Replace sprintf() with sysfs_emit()
Date: Tue, 28 Apr 2026 06:33:13 -0500
Message-ID: <20260428113313.9070-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D54164847A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35695-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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


