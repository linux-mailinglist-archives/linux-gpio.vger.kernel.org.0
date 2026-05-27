Return-Path: <linux-gpio+bounces-37589-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGA+HDETF2pf3QcAu9opvQ
	(envelope-from <linux-gpio+bounces-37589-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:52:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 976885E735B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 613EC31C4731
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350273EF0C2;
	Wed, 27 May 2026 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CXlXoDI2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF1F3E833D
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896594; cv=none; b=GQcgv2g834pwA/kA4f63DHh+gnySspsaUdZLDNxH33UmBkZ19HMWXkkIyrrCxro9joFriM+zbRMZUq9W5p2z9tLVIZjKhCZAZmIEGVCSISfAeqRoI/4olvoFZRKnUPWWgLWsfBmSbQxki66WMFvxwWw9dS/mQqiiWkGB3tOfCl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896594; c=relaxed/simple;
	bh=NEvo9srNxTxhIHlxLN6WeMfqW5408ZvuIuQfa4PJF4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hRTliQ5LOcGPA2pJiRR5OFh1YRcmwAxUiE5gFTepRO+dkXozcLIpHyr1uAK+luetw8/VnhF7XdRru0MNCNcX65ZzgAfaH9sXZSqZdoaRN+vIIy5iCgehgfQV0cktI7azSORq8TUgZB5fMiJ/fkN7VrOrmgl+1j0qQnNLsnE1kX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CXlXoDI2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3653154f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779896590; x=1780501390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qi46yHkvfmukOKQbzqY7TqFdznU5LSQJQVW7BZjgfWk=;
        b=CXlXoDI2wFfRgbVA4GbNuM33Z8SJq1ueSo8mX5KVUyIUja0mrcvSCL1sJtqryQZIoT
         5GM2McfGcxmayIuPP1+Aelrp138s6Iorg/7Or9A8V54rne+QmZ6f2lHiWzRm0S6tEbif
         eR8G3af7UoOU7YS6wLMsnc/TtYiQwhB9/24vqkm+MP9HrngMb6PzISwAIsUi/ipTMXXD
         n8M+iuRkdpdGrIl9CRlKQF49u7Nc8qrEQUM5rAk0FqE+/9wL2ot1r/jBSjUE3480qWL8
         izY14Q1waKZNMubf7eSdLQzq7KfO8MQwwtxtOpCGfD10tcgQoyJdacKjPnx1GxS7u2hb
         Em/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896590; x=1780501390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi46yHkvfmukOKQbzqY7TqFdznU5LSQJQVW7BZjgfWk=;
        b=LHj6CRNVy3/2U/cklyOAaf080TDm/QbVllb91y/j8jHPBSmQlHR/RJbrrEUh7cMbZY
         q3BRDkm/9s66bRjSZOiHpGai8LDlTuSvE9oiq2Ge2HDb1d0Bg4WzC39vfq6RWvwEyBrX
         emkINvVTLd7e3Qx4OUL+Ken6HBKaOxtMAMnTJkCHeVmJHG4z6GPRrfdt0eUQKdsYq0Kd
         Y5sVBHHP2vhVH9Vm/6X5aDKKWmPIJHozxC+HQnveZtOcZdSkYoYPS3kGKGQTh8POde0F
         OHbt1hqbjV7JIeVQOCmm5VixYg79qobPw+0BjbNbUme5zVrwZ1EYNhwN6A7cO1sGwKKo
         yVMg==
X-Forwarded-Encrypted: i=1; AFNElJ9RIPL4nf4xoa75VVL8QbH5hVKOttelNemXrtpKEN6gSW0/WvR3xY0vfYcwib41nx7Vmum85QKeCHZV@vger.kernel.org
X-Gm-Message-State: AOJu0YwfJr5zOA+4+uUjkCG3/50snhsCR38XR3XMWl3g0zyzBNtepYHc
	ypVLtQa6huKDphZ/gb0aPefVhA6iPeuJSQGmRF+6xUVnfRW1A2+f6mXmq2tfwR2r6vg=
X-Gm-Gg: Acq92OHd8s4pESV1ljMm3h0V8z4tvWhpusOz8/iKmpU1DeYc761toJ11JIKxI3P9SAk
	hswJ3ZNAwVOUFL/Et7i6Pwjr4YMr9NebvF/02A6t7ZoIfXO4jZJdKKZqqMDNmeDkIU3pF2AOgkS
	q5/DPOxtqv5n3j7JuoOFAFyZUKp40jsl5aerrbwKBIX8oB08rPdfrCn7PPaUMiAImk6Gn7qkm6z
	unBh2CSfDRYaDcAjIe9HTPz8U8pEiaLdjW07n2x8UBaz8O5t0fNhhUkXLpScrEROXGGxzu8Rxzf
	yG9eKgLeYksB/GF4D16A+/4DOM1++i1VdMDq3cF5z8gZQrgkj52yNjpMj2NMpka6dky1qrDelXF
	0t95uTq7wnQ43qLHV+sxS1QiT/P0vkL/L7dwEanc7CMPfcXudgF2JOQTAXXbwAdBODkphKraMk4
	KZuaUJB+wx9QanAqAU5EXpV4j/bCVmezsVzRnNJv2zOK99K2mb/h4BRhnnKFehZ9O6R/ItxxOcx
	ZdOL0Y6gM63HulVfb9JWDgwKw==
X-Received: by 2002:a05:600c:3e0d:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-4904e3eb5abmr336461945e9.22.1779896590465;
        Wed, 27 May 2026 08:43:10 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4904527dbf3sm381382495e9.6.2026.05.27.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:43:10 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 0/2] pinctrl: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 17:42:59 +0200
Message-ID: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4724; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NEvo9srNxTxhIHlxLN6WeMfqW5408ZvuIuQfa4PJF4c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFxEERcYmgRQY8M4uEJy5mqM1EIjeHD857KGAe si4HVHiQ0GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcRBAAKCRCPgPtYfRL+ ThcsB/40PWfiypiJgKcXubrgSjYceGujVJ0NzCjvamhpf/bANVl517+khc/at2Kd3ED6LL36/R0 2xf4wVmFREFPa9qTHtTQcPcTt9wCnXh3vb9TU3hnVEF9EM5viPzj48JrUrh90gBm8M4OI5v2yXD 7IJoJE3BxhLUeD6yrpnWzOTxUvmmWsp1WdQaeqzxKznwP0ChXKPfbKEfAH97QlI/f0GeRWEQN6D papM/hYNkmIclCDT8mBnvxWqVQAPZr9Yj54+ZiZW2QH6f5eLdLNv/v3+xj+eEyP5uQza8SDts8F Pepp6OrX0ATrzxJ13bl+fSZgYxe0GiCXxDWCF2/wssKWtw9w
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37589-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Queue-Id: 976885E735B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

	diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
	index a466ebf99593..5bb1c1205352 100644
	--- a/drivers/pinctrl/renesas/core.c
	+++ b/drivers/pinctrl/renesas/core.c
	@@ -1313,7 +1313,7 @@ static int sh_pfc_probe(struct platform_device *pdev)
		if (pdev->dev.of_node)
			info = of_device_get_match_data(&pdev->dev);
		else
	-		info = (const void *)platform_get_device_id(pdev)->driver_data;
	+		info = platform_get_device_id(pdev)->driver_data_ptr;
	 
		pfc = devm_kzalloc(&pdev->dev, sizeof(*pfc), GFP_KERNEL);
		if (pfc == NULL)
	@@ -1380,40 +1380,40 @@ static int sh_pfc_probe(struct platform_device *pdev)
	 
	 static const struct platform_device_id sh_pfc_id_table[] = {
	 #ifdef CONFIG_PINCTRL_PFC_SH7203
	-	{ .name = "pfc-sh7203", .driver_data = (kernel_ulong_t)&sh7203_pinmux_info },
	+	{ .name = "pfc-sh7203", .driver_data_ptr = &sh7203_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7264
	-	{ .name = "pfc-sh7264", .driver_data = (kernel_ulong_t)&sh7264_pinmux_info },
	+	{ .name = "pfc-sh7264", .driver_data_ptr = &sh7264_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7269
	-	{ .name = "pfc-sh7269", .driver_data = (kernel_ulong_t)&sh7269_pinmux_info },
	+	{ .name = "pfc-sh7269", .driver_data_ptr = &sh7269_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7720
	-	{ .name = "pfc-sh7720", .driver_data = (kernel_ulong_t)&sh7720_pinmux_info },
	+	{ .name = "pfc-sh7720", .driver_data_ptr = &sh7720_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7722
	-	{ .name = "pfc-sh7722", .driver_data = (kernel_ulong_t)&sh7722_pinmux_info },
	+	{ .name = "pfc-sh7722", .driver_data_ptr = &sh7722_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7723
	-	{ .name = "pfc-sh7723", .driver_data = (kernel_ulong_t)&sh7723_pinmux_info },
	+	{ .name = "pfc-sh7723", .driver_data_ptr = &sh7723_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7724
	-	{ .name = "pfc-sh7724", .driver_data = (kernel_ulong_t)&sh7724_pinmux_info },
	+	{ .name = "pfc-sh7724", .driver_data_ptr = &sh7724_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7734
	-	{ .name = "pfc-sh7734", .driver_data = (kernel_ulong_t)&sh7734_pinmux_info },
	+	{ .name = "pfc-sh7734", .driver_data_ptr = &sh7734_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7757
	-	{ .name = "pfc-sh7757", .driver_data = (kernel_ulong_t)&sh7757_pinmux_info },
	+	{ .name = "pfc-sh7757", .driver_data_ptr = &sh7757_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7785
	-	{ .name = "pfc-sh7785", .driver_data = (kernel_ulong_t)&sh7785_pinmux_info },
	+	{ .name = "pfc-sh7785", .driver_data_ptr = &sh7785_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SH7786
	-	{ .name = "pfc-sh7786", .driver_data = (kernel_ulong_t)&sh7786_pinmux_info },
	+	{ .name = "pfc-sh7786", .driver_data_ptr = &sh7786_pinmux_info },
	 #endif
	 #ifdef CONFIG_PINCTRL_PFC_SHX3
	-	{ .name = "pfc-shx3", .driver_data = (kernel_ulong_t)&shx3_pinmux_info },
	+	{ .name = "pfc-shx3", .driver_data_ptr = &shx3_pinmux_info },
	 #endif
		{ /* sentinel */ }
	 };

increasing readability due to less casting which also improves type safety.

If you consider the 2nd patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  pinctrl: Use named initializers for platform_device_id arrays
  pinctrl: max77620: Unify usage of space and comma in
    platform_device_id array

 drivers/pinctrl/cirrus/pinctrl-cs42l43.c  |  4 ++--
 drivers/pinctrl/intel/pinctrl-broxton.c   |  4 ++--
 drivers/pinctrl/intel/pinctrl-denverton.c |  2 +-
 drivers/pinctrl/pinctrl-max77620.c        |  6 +++---
 drivers/pinctrl/pinctrl-tps6594.c         |  4 ++--
 drivers/pinctrl/renesas/core.c            | 24 +++++++++++------------
 6 files changed, 22 insertions(+), 22 deletions(-)


base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3


