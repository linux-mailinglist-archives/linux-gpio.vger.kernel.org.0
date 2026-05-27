Return-Path: <linux-gpio+bounces-37590-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGTOCUkRF2o12wcAu9opvQ
	(envelope-from <linux-gpio+bounces-37590-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:44:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1C5E712C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98DA6304CF1A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205BB426D2B;
	Wed, 27 May 2026 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CqqXXxIq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D3D3AA507
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896595; cv=none; b=A6FA5iUJ2/8YkrMmN5eAXEiyJhUDINiSi3D6EArUJHdALdwAYY6Tmd8RG2O5VNQX/4QGpugTLeClDXI6C9whB+gqPywqUZgwLtFGgEq5Ts2eBqCA5KC1DQKWg2hUfkXKwdMdz+03ePx20oiSWkjEDGKp3mGs70DW4qic5P06Aq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896595; c=relaxed/simple;
	bh=zxufOePm3m/cQ1BwD/YssYqOfmlKAwWXvB70GTTrgYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jcNB7nvmbku2hVDtnqZnMU+M+J+xbb894rtm7uA8CHR00s9vOHWoqwyxIdSAC26GmEDrvfIXVWlmao3ufeMT3FjTrYNZ0ru/7g+Qb9YoaFNmQS8rmMD4FTdJSQE7VjG8nlf/xgAh9rDFHM4ekg1YQ2dDvIEvj0ZMtgv0CH5mvI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CqqXXxIq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe608cb92so7290929f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779896592; x=1780501392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCLmj3BbnBpGyiyDXMBpXkRGxE8TpMpj8vapNuYlif4=;
        b=CqqXXxIqWKwLVSxTuGT/ihkckvXDmh/iRW+u8Rek0vMhWlySC+8xoY1KYzc2y5a8rK
         JHrIBpI6hi5YOF6GLuv9wWt6QUJMI3k0fOULpdwRmnpYvuKx8GqGsPi2HSF6vYVr2lgH
         K5RcFQcUbtnftkeKeexN4xzF9H2Km5Thj/FT9rNkSFi8/YVqkBvTo+7+CiD1ZX/nPmCB
         FPSPKY478F5eEKxgvpon7bxHtUDWDRNnhGb3fBn303UNUlSPXmu+WmDviRmIwM3S+mvj
         cgph/FrnqlkZbYtGL/NAs5kna2vMVeL1WXjnIA6+96aFg93OZiEdiMvgUnIUfQKvgRPo
         NV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896592; x=1780501392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OCLmj3BbnBpGyiyDXMBpXkRGxE8TpMpj8vapNuYlif4=;
        b=Z1qsL9jBBpyBE+hhsLJT3bXNMWgiUrJB/BgA2GETEGPD8ClhoZZoZHcly6fqv0Lh2D
         GIl7YWAAXUtDYHSYFW2lbkhApmzkbmyYI4vySkVBvVTgG5OhsvSa3wcLId3rTWDVZfnC
         dWoKNhGjx6d0tySC9vgB5/JjZSPXJc8KfgC8upJU8u/pHBh9n/s+3yNDvSd6GqfpYWen
         ACdbpIZg10ywu93NCQG7vTzyxo+NcQu7x36+pVqOQFSBrcd1bLKjvnhQClO8q2p0GPb5
         tApSG6fU7cGu0gemi0WdbKOg0gXc+Y8DGbT8KRdS40mdnjFuzwcg27nVxpfMMxkvED/n
         0WCw==
X-Forwarded-Encrypted: i=1; AFNElJ/J/rrlL/brv/xDpGIAtX2sKjGzCMsQAiuIMhDyPlceqr3nt8e8aEo1djjf9bZ7SS+vONJBf2+GnCWS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9poxW/2K+5xgzcM89gIWQ+s58v5C1jtInnpaJnKOvY0i31b0/
	wCVLQuU0U5P9DihHE87tvB3/I1tWekP+B0Xb0s2IqvYE43iVFne92uQyICyXxW9Inho=
X-Gm-Gg: Acq92OG0hd+1IVQCY//py+b0wDAjnkgGUVHiMTchecRZsKX6xPgab7ZdllapoahZ9EE
	W+yrq4XaTZPCvdfYAg8g12itygIRXREhFtu/oPBV/iRf/Xd3M5YUef/LEo4rCI9q8xdjdA0h6sI
	sM9Dc48C2OzVzzZlVtltyYvVXSYo6dxyqwkbKVM0bHflUDIw3ZtlzJt52bA7LLwbYJOnHb/fhmO
	/7KUNilMgfdD9giGLb/sjygflUwy3KM3SPvMpbvGJSltJvN12RZ1OyA7WvUxRogI1sCl2ednjhp
	b1MIUtEGxuA5sgVKCz10N/s4luv3j/ti+KPGVNrzu+0PexS7Si2PstVShHIFQfpy813Z6bSb8+8
	3nd32JyBPlcNBbdCCWprKpcNtFXM/7WA/UQi+Qm+6hiHxH8VeE5Zc0PqvwguPDXqiC2vsatT2IC
	EnbafRGVtiFGzZEnUDjcjmLm26kEKBSLYxt0abgtC1UPN9grRyl85rAapoM4NmWZkP0F/NAsmSt
	tllVZj/p5DkTZ8=
X-Received: by 2002:a05:600c:6207:b0:490:538a:9c0b with SMTP id 5b1f17b1804b1-4907dae371fmr87011865e9.2.1779896591782;
        Wed, 27 May 2026 08:43:11 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490454ac6a6sm416474495e9.12.2026.05.27.08.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:43:11 -0700 (PDT)
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
Subject: [PATCH v1 1/2] pinctrl: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 17:43:00 +0200
Message-ID:  <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
References: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5807; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zxufOePm3m/cQ1BwD/YssYqOfmlKAwWXvB70GTTrgYs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhixxQfaSLSfuKi1yjX10d+9BCe/OIwcscrl2G7mExPM5a VqqmnJ0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCR24fZ/xdtXOD3eG/t4jcM 22W1NI7JKT0vfv9OUteufWnNm55oHovVx+bINetsqzF/83j19Zg83rt2h1LfV62L0tjz+DJbeHT b9elRa+JFn2Q3rL/DmvK68YNFr5II22EL/TKRw6H/fvq2sv1/xRcZbreXT8tr+RG2lcGmNkUctl eebf8bf3pRa50kd1IHS2Msc91WloehiyzkU+bN6ZAOb+It9MypbSpTSVQ67/Kb0zpPU8hoft/3s +faXxl6aPKXL9ix5XcV/8mI0qjZRVcvPos7t6rk+662vTevfphZupRbo0cxVWy5/v6fsU3PF3c7 BtSLnzkmnzqVmz9Ay/vgrsJPfvy17+vsV/XEzdxabnEUAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37590-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C0D1C5E712C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous unit.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c  |  4 ++--
 drivers/pinctrl/intel/pinctrl-broxton.c   |  4 ++--
 drivers/pinctrl/intel/pinctrl-denverton.c |  2 +-
 drivers/pinctrl/pinctrl-tps6594.c         |  4 ++--
 drivers/pinctrl/renesas/core.c            | 24 +++++++++++------------
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 227c37c360e1..d9d3d1d3263d 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -604,8 +604,8 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cs42l43_pin_id_table[] = {
-	{ "cs42l43-pinctrl", },
-	{}
+	{ .name = "cs42l43-pinctrl" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cs42l43_pin_id_table);
 
diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 3d3c1706928a..a33100f28488 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -995,8 +995,8 @@ static const struct acpi_device_id bxt_pinctrl_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, bxt_pinctrl_acpi_match);
 
 static const struct platform_device_id bxt_pinctrl_platform_ids[] = {
-	{ "apollolake-pinctrl", (kernel_ulong_t)apl_pinctrl_soc_data },
-	{ "broxton-pinctrl", (kernel_ulong_t)bxt_pinctrl_soc_data },
+	{ .name = "apollolake-pinctrl", .driver_data = (kernel_ulong_t)apl_pinctrl_soc_data },
+	{ .name = "broxton-pinctrl", .driver_data = (kernel_ulong_t)bxt_pinctrl_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bxt_pinctrl_platform_ids);
diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
index 4a1d346fb30c..09aee90dee82 100644
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -250,7 +250,7 @@ static const struct acpi_device_id dnv_pinctrl_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, dnv_pinctrl_acpi_match);
 
 static const struct platform_device_id dnv_pinctrl_platform_ids[] = {
-	{ "denverton-pinctrl", (kernel_ulong_t)&dnv_soc_data },
+	{ .name = "denverton-pinctrl", .driver_data = (kernel_ulong_t)&dnv_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, dnv_pinctrl_platform_ids);
diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-tps6594.c
index 6726853110d1..55dfa843e35e 100644
--- a/drivers/pinctrl/pinctrl-tps6594.c
+++ b/drivers/pinctrl/pinctrl-tps6594.c
@@ -562,8 +562,8 @@ static int tps6594_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps6594_pinctrl_id_table[] = {
-	{ "tps6594-pinctrl", },
-	{}
+	{ .name = "tps6594-pinctrl" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, tps6594_pinctrl_id_table);
 
diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 0840668638d9..a466ebf99593 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1380,40 +1380,40 @@ static int sh_pfc_probe(struct platform_device *pdev)
 
 static const struct platform_device_id sh_pfc_id_table[] = {
 #ifdef CONFIG_PINCTRL_PFC_SH7203
-	{ "pfc-sh7203", (kernel_ulong_t)&sh7203_pinmux_info },
+	{ .name = "pfc-sh7203", .driver_data = (kernel_ulong_t)&sh7203_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7264
-	{ "pfc-sh7264", (kernel_ulong_t)&sh7264_pinmux_info },
+	{ .name = "pfc-sh7264", .driver_data = (kernel_ulong_t)&sh7264_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7269
-	{ "pfc-sh7269", (kernel_ulong_t)&sh7269_pinmux_info },
+	{ .name = "pfc-sh7269", .driver_data = (kernel_ulong_t)&sh7269_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7720
-	{ "pfc-sh7720", (kernel_ulong_t)&sh7720_pinmux_info },
+	{ .name = "pfc-sh7720", .driver_data = (kernel_ulong_t)&sh7720_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7722
-	{ "pfc-sh7722", (kernel_ulong_t)&sh7722_pinmux_info },
+	{ .name = "pfc-sh7722", .driver_data = (kernel_ulong_t)&sh7722_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7723
-	{ "pfc-sh7723", (kernel_ulong_t)&sh7723_pinmux_info },
+	{ .name = "pfc-sh7723", .driver_data = (kernel_ulong_t)&sh7723_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7724
-	{ "pfc-sh7724", (kernel_ulong_t)&sh7724_pinmux_info },
+	{ .name = "pfc-sh7724", .driver_data = (kernel_ulong_t)&sh7724_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7734
-	{ "pfc-sh7734", (kernel_ulong_t)&sh7734_pinmux_info },
+	{ .name = "pfc-sh7734", .driver_data = (kernel_ulong_t)&sh7734_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7757
-	{ "pfc-sh7757", (kernel_ulong_t)&sh7757_pinmux_info },
+	{ .name = "pfc-sh7757", .driver_data = (kernel_ulong_t)&sh7757_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7785
-	{ "pfc-sh7785", (kernel_ulong_t)&sh7785_pinmux_info },
+	{ .name = "pfc-sh7785", .driver_data = (kernel_ulong_t)&sh7785_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7786
-	{ "pfc-sh7786", (kernel_ulong_t)&sh7786_pinmux_info },
+	{ .name = "pfc-sh7786", .driver_data = (kernel_ulong_t)&sh7786_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SHX3
-	{ "pfc-shx3", (kernel_ulong_t)&shx3_pinmux_info },
+	{ .name = "pfc-shx3", .driver_data = (kernel_ulong_t)&shx3_pinmux_info },
 #endif
 	{ /* sentinel */ }
 };
-- 
2.47.3


