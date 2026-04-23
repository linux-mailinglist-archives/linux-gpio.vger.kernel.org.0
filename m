Return-Path: <linux-gpio+bounces-35441-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDSAFw6e6mnF1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-35441-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:32:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE2458285
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8E5D3020A6D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 22:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E59377023;
	Thu, 23 Apr 2026 22:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FglnwS7R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FCB328B7A
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776983554; cv=none; b=XYSGLU+tJgwbU164B3/qX8ed4UAhmWQcNw7UEev12poUapu2uRhmc7FgdCG8Iv4jICJ1calkrza+Aw1/52GLOrxyHUP8Z6LUhHmdsy9ASWSiDbsftq7PzFWbOhEIxVJKmB1wObxYpCVGqbxbYrxY09S5NZkZwlwQQ6LZUfA23/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776983554; c=relaxed/simple;
	bh=/65LLKhf8fHmkiinSAqwH23iLQo4ufUYTqSFcN1S6EE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C6aDH/m/yUdMl3L3VfOXt0aij3ur51sXIs1eDK1v0MRBx87T4y9Ew9Eloi4Vz3TgoOuRqrp8zYIarrFcTzXHOag7+IGjvkaFO2uvItbnXp4jBPODBT2hoqNM801cHNAuJr0qNxEJCulSYtI87y4Wsd4ocEc8Hun/jMN3+uL9oZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FglnwS7R; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dbe07d3ec3so3691469a34.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776983552; x=1777588352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DG9zEpUh2A48NeB6NntsKd5rpo1+3n1vamCAhwseVcM=;
        b=FglnwS7RiNLFnARc4cVHTcv0fNt9NsUv/+WIzmn38cLWBnaD5lz1Prxb1lrl24NAOI
         zoeBopxOD+uxwJzGqWLTzPM94y/YP7bSBKuMbMib2jpGvo3ks+OTXaf2P2c3HildiJ2p
         plmir/CVghl3G7dcJgxxxoxZB9R13+HppPSkemXan2sO0XIEpD+37Y6d5yrcFwAAwM7l
         FhPtnpGL5INOQGzTm8xo2BlhsTXdxM4lVexjsRYJOFEG9B/4sNSu8VPYnsX5i3ekmb4V
         iJy+ZEZYbgyL5pjw0d/LaoKlkWe0dzT2nJo96e0fllXq4UFo3aCym68A0wHCzbGl8cfZ
         S8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776983552; x=1777588352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG9zEpUh2A48NeB6NntsKd5rpo1+3n1vamCAhwseVcM=;
        b=Y9mJCwZCxsVyXJZ86fQvOLIh0hh1eTmt3kOFfEO1cGobAwXrE5+iLby65Y1gdxyRJt
         r+tWR84m0SfmDJwJc8oy34vi4RE60jYCwXWU1nX0lzt1XxDfuF/+PTzRE+K/9yabyuYx
         LuEUICVnOR5uyHiInBYWW4Nes1SnLOCpm6kA0Dv8kQwtcdd/1LdXs1c2dSldfZw2mjMg
         XSnu9XJb+BSjd2lh1XjbLKcZj5mYDW0mme97xv6xpSjAJKOiQzMw4KjZ1miTb0vnxZBU
         Wv2lDWGgGG7rBuifTDKrkK5It8E62HldL9z/6sTO8cl/qpVEgmTyeTkZBAqdoM6kYIbW
         TIRA==
X-Gm-Message-State: AOJu0Yxu3ikt+sKwkuA8ct/I/uqzBwNOoj6P59JDTA8JIulSyYBWRTA0
	ZT6/VcD96End+VvOu3pzTWGzIadY2mgTLlnx9v1pVCnBA4+TVYmVA+EH
X-Gm-Gg: AeBDieuelESw5rhP1+5dM62iWBmZ/fkDwWNfIoH3+Mput4oWn8QAv00gtGh29AnlAD1
	Yg8v3gyqCySRPS+hn8m3i9c0FOLPipshrdv9h1a7WK/pvcr0vYR3Wukj8jpxKuSgdf0cX6AeS/Y
	4q1dIv/HjjkfaqJB4UJTnmPyt0Bao5n6/CQtqr3xj6CTmKOzu2moP8bXbU4viu5YqAFh5g4r7ev
	WasjJdcrWzq+X4nSdNB+APURSlA0+Revb3M2LkUPGyOPXxjMLFV3tCYHmXGJAt8ZNqq5ZOZiYsn
	bfQb6ulHDKSAGn2ohUr4eaAdKZVhhZsiJ4ThQl76LppZtDiqMyTWJlv4t2x/3b+GBQsF/XzXiGX
	hUzHFsqvDcUmS9Ba4SbB+aPA7m26O0O8LIc7y6aw1W4sZj33FtTtLsakIE1xgR8elkn92UuOod2
	hbtYQVCf65EpJOBCTio/v7W4loQLy6Z3+HdzeMsIqyu9qvURwFLY8gDXzo+vv0gZBLOiS+
X-Received: by 2002:a05:6820:81cf:b0:68e:3db1:bdb9 with SMTP id 006d021491bc7-69462e6450cmr16334071eaf.22.1776983552280;
        Thu, 23 Apr 2026 15:32:32 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42ff2b6b2cdsm2472021fac.1.2026.04.23.15.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:32:32 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: sim: Remove intermediate pointer variable and harden function
Date: Thu, 23 Apr 2026 17:32:30 -0500
Message-ID: <20260423223230.47001-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-35441-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3FE2458285
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the *pdev intermediate variable and directly dereference the
pointer. While at it, replace sprintf() calls with sysfs_emit() to
harden the driver.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/gpio/gpio-sim.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 13b87c8e6d0c..3c230f94eea2 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -691,15 +691,13 @@ static ssize_t gpio_sim_device_config_dev_name_show(struct config_item *item,
 						    char *page)
 {
 	struct gpio_sim_device *dev = to_gpio_sim_device(item);
-	struct platform_device *pdev;
 
 	guard(mutex)(&dev->lock);
 
-	pdev = dev->probe_data.pdev;
-	if (pdev)
-		return sprintf(page, "%s\n", dev_name(&pdev->dev));
+	if (dev->probe_data.pdev)
+		return sysfs_emit(page, "%s\n", dev_name(&dev->probe_data.pdev->dev));
 
-	return sprintf(page, "gpio-sim.%d\n", dev->id);
+	return sysfs_emit(page, "gpio-sim.%d\n", dev->id);
 }
 
 CONFIGFS_ATTR_RO(gpio_sim_device_config_, dev_name);
-- 
2.53.0


