Return-Path: <linux-gpio+bounces-40025-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /KYvAD3lVWrhuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40025-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD00751DAB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=Ha2Hz8YS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40025-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40025-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57F05305344D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2844D3F44C5;
	Tue, 14 Jul 2026 07:25:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177CE3F1AA2
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013935; cv=none; b=D7d+5+ybfKbLeb98RkR0kWthwu4U95BjUGO362p45UX19DrQNdadPjaSMKk2G9M+9CA1rntE4iyeSD2ZDIzv5oGF6SGoRk/uMxlijyCwyBtFkXSEtyMr2J3arRjJv0aYiYm5WHnycpFwuLVvhViPH8d60bt7TmF+TUa5bZc6G9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013935; c=relaxed/simple;
	bh=A1SjcAd3WHHAX/QXJ975pfrAgfiuKdbesg5JZhWjIlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F61pyh+Cl8unuT/uyueDmaQhZDMPcCJnOPPyWlHbiTRXR5LYeR5qUDkhPUHxUfJi0BWrEEik/FFeesDU8Gi3xNSEsmCKObqmb/XYfGxLdc075u1BZyKUzmyw/WSkrn1WFXaFX70HGmg7/T0FSP53AmdvDSZzNDYtHLIIlAziFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ha2Hz8YS; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476d8e647e9so3945110f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013932; x=1784618732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDWmvxxbYStX+Phf5LJnoi8LIpVbtOl/EEuga7Ikacg=;
        b=Ha2Hz8YS8hFI54NW4tRbmr6R091mJFZ/kF1RixMVKZOsjTneFae8t81Nlt6eJ1OSM0
         3HBcEpP/c1MAWL8N2ZzNcfXWNsfrtBcZOqh4zjvCe/JmLkG332+uPvCguj6tBNEs3T9T
         sYxoJgY7DQK3W1cAqgqNDuA3lMS0BohoWqYSZZGHiSUG903oqM7oURYc8I4+5gr6dqMC
         N1KPn8PsW6TtzHzIq0FyvI4DtoR2ycuIi1zG1oSipOyP+nZQ78Oq5rkKJJpFG2wOs0Ed
         EOYye9yKoZOvPQcMnqMESVLJ13ncclWdvOpAdx2nTD/3WtDMmO8Oev5OsCerrsPPiiK2
         uwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013932; x=1784618732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDWmvxxbYStX+Phf5LJnoi8LIpVbtOl/EEuga7Ikacg=;
        b=ZwY31UTkfHc9AYm97VVh1qsqIObGdbsEqbuUAYSoRO3eH13/43xMJcJ6sNM95IVbsd
         U1+A/HxGF7apGDpq4MgpHNH7A3I6nMqGM3w9DXnatBSeRpNpXCpv8xevgiymZwqE2eGB
         5ZMVYasJKe63We3nV3Q6UqGv+PcnRzhOCQW4w4JqNVZjLM4nq81KOEIEBN5AsfVdHZX9
         T716qbUmxO1K14CwlN4qz4bMgKanHbeuGxcmY9WNN3DfPg+dHlhlB7U+Wwkuu4qNhbh1
         1JTBFBOrKW/hkkwi/VDG40WfbGYlhSqKOteUn2m6dPrWBCr6QLBBkYWJD1xgmt/QmAqs
         MAlw==
X-Forwarded-Encrypted: i=1; AHgh+Ros4BYuJByykewiHSJpB3eL9GwAQ20d3B96EWPqxtqAzzLXkh1rUJOTXnWu1m7QE+ojnn+tDtUcYFzw@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIk4WiLp/4lpDsq/h+4tgW2gvYqNBFMdUKLIuElOYw09SLYTp
	MHwypdff2flXL0JYA+oo0c+rOdS0XSxDxF3ul3FzMcvocGI+wKnQS+y9qS1Lm31ggP0uygj9kOG
	Lqcv6
X-Gm-Gg: AfdE7cmaTq+82wAhGLRd230+H3E05G5d7GTNQ0W7bgvUVHz3nYzK6DwiVetMXGS1kg7
	qPtszbVc74K71cLtzDTbZA0KBXLkr8Q1031yO2boLilY4HsD8QbrA7rBAthJGk5StmbhUZ38yXS
	BOCZz6ZhX93gA+u3cFHUXc+/1fCEEB7pUhsng5uMlOReuL28UQKBJdtp/1GaqXfxJleXfMAm29D
	lSLdoAvPrrqmJWIGqTvVv/T4V7c+jw6ZiZ7Xb9vBj3hOp69jsQSOFgymU+bNC7r3w1t5OTKVnOa
	GfKEGYF0mjOpH/DPl+GlgGX5rf5ukr5FoRK+bQIdOjP7ntD6fcPHJm6tMdW6Flm8M2CHuNy2iWI
	Yi69OoRRt6JJ94iJzvo7pFXTw+LBRA9ZI0pZgpi+4nK9JbrpPsU8QRLIQeLaKEDjlD6Rh6OQd17
	6z1sW6PECWv+Ts9FmSK5oktoslnEPv4Eeefw8cQ4KqA/+k7CU0oS7G1OIAo4M9uTL1Sh0czt6hJ
	qZg
X-Received: by 2002:a05:6000:2dc6:b0:474:18d9:8371 with SMTP id ffacd0b85a97d-47f48891ebbmr1294220f8f.28.1784013932321;
        Tue, 14 Jul 2026 00:25:32 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464b7f84sm5609689f8f.27.2026.07.14.00.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yang Shen <shenyang39@huawei.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/20] gpio: Use named initializers for acpi_device_id array
Date: Tue, 14 Jul 2026 09:24:12 +0200
Message-ID:  <b0d21017a30fa40dd737695140a08397c07dae88.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7732; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=A1SjcAd3WHHAX/QXJ975pfrAgfiuKdbesg5JZhWjIlE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQ3SGZ4XVffYgmhJ5TLl1YbJ/nlXFNn3cQq3 dUlAjQVyWyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkNwAKCRCPgPtYfRL+ TkoiB/46M4tZJrqIgbjIC2BwPlaZku+VN8ukf6uwh2jfdZIX6mn0jAN7nDzSGg6mabGxwrF4cYW 84i1CwZUj4o7xO+GQjeb4Qgd51u2Vjf04L+OjobTl8OVrmS9/Co2Tj4r7YZKsBZjBSc5R8Wo1rn mhP8oHCg8huLlJTe+f9ckF6Xb9Lf8xNSgZgT3etEFKV6rH4cQdEVrP4sdvMC/QtCYH0eg1zvcIA u0qQUYfEeCNIp7JwE+8Lpn0zPRR0Rtm/mqDcdtJ+OKqf8cIOsA4IAWQUnHi16CmM1XpOdUAuMZK wdLGX4LkoYVfhGwY5YeYVafg+LM7QPU96MFJERkXq2hdrOH2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:hoan@os.amperecomputing.com,m:andy@kernel.org,m:shenyang39@huawei.com,m:alan.borzeszkowski@linux.intel.com,m:westeri@kernel.org,m:israel.a.cepeda.lopez@intel.com,m:hansg@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-40025-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FD00751DAB

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
acpi_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-amdpt.c           |  6 +++---
 drivers/gpio/gpio-dwapb.c           | 10 +++++-----
 drivers/gpio/gpio-graniterapids.c   |  2 +-
 drivers/gpio/gpio-hisi.c            |  2 +-
 drivers/gpio/gpio-mb86s7x.c         |  2 +-
 drivers/gpio/gpio-mlxbf3.c          |  2 +-
 drivers/gpio/gpio-mpc8xxx.c         |  2 +-
 drivers/gpio/gpio-novalake-events.c |  2 +-
 drivers/gpio/gpio-usbio.c           | 12 ++++++------
 drivers/gpio/gpio-xgene-sb.c        |  2 +-
 drivers/gpio/gpio-xgene.c           |  2 +-
 drivers/gpio/gpio-xlp.c             |  4 ++--
 12 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index 8458a6949c65..32c4d0ee8101 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -125,9 +125,9 @@ static int pt_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id pt_gpio_acpi_match[] = {
-	{ "AMDF030", PT_TOTAL_GPIO },
-	{ "AMDIF030", PT_TOTAL_GPIO },
-	{ "AMDIF031", PT_TOTAL_GPIO_EX },
+	{ .id = "AMDF030", .driver_data = PT_TOTAL_GPIO },
+	{ .id = "AMDIF030", .driver_data = PT_TOTAL_GPIO },
+	{ .id = "AMDIF031", .driver_data = PT_TOTAL_GPIO_EX },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, pt_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index aa7c08e60707..e159c3f98f1c 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -720,11 +720,11 @@ static const struct of_device_id dwapb_of_match[] = {
 MODULE_DEVICE_TABLE(of, dwapb_of_match);
 
 static const struct acpi_device_id dwapb_acpi_match[] = {
-	{"HISI0181", GPIO_REG_OFFSET_V1},
-	{"APMC0D07", GPIO_REG_OFFSET_V1},
-	{"APMC0D81", GPIO_REG_OFFSET_V2},
-	{"FUJI200A", GPIO_REG_OFFSET_V1},
-	{"LECA0001", GPIO_REG_OFFSET_V1},
+	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
+	{ .id = "APMC0D07", .driver_data = GPIO_REG_OFFSET_V1 },
+	{ .id = "APMC0D81", .driver_data = GPIO_REG_OFFSET_V2 },
+	{ .id = "FUJI200A", .driver_data = GPIO_REG_OFFSET_V1 },
+	{ .id = "LECA0001", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index 2d0fe3abd5e0..6a77a5864d09 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -394,7 +394,7 @@ static int gnr_gpio_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(gnr_gpio_pm_ops, gnr_gpio_suspend, gnr_gpio_resume);
 
 static const struct acpi_device_id gnr_gpio_acpi_match[] = {
-	{ "INTC1109" },
+	{ .id = "INTC1109" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, gnr_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 3b65ed4592ee..1a89695ce515 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -222,7 +222,7 @@ static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 }
 
 static const struct acpi_device_id hisi_gpio_acpi_match[] = {
-	{ "HISI0184" },
+	{ .id = "HISI0184" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 78bcae130e0e..58915ffb4bfe 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -213,7 +213,7 @@ MODULE_DEVICE_TABLE(of, mb86s70_gpio_dt_ids);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mb86s70_gpio_acpi_ids[] = {
-	{ "SCX0007" },
+	{ .id = "SCX0007" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(acpi, mb86s70_gpio_acpi_ids);
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 7d747958f2bc..99b880596330 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -271,7 +271,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id mlxbf3_gpio_acpi_match[] = {
-	{ "MLNXBF33" },
+	{ .id = "MLNXBF33" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf3_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index ee35da06cbc7..e79312a7d5a4 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -486,7 +486,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id gpio_acpi_ids[] = {
-	{"NXP0031",},
+	{ .id = "NXP0031" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
diff --git a/drivers/gpio/gpio-novalake-events.c b/drivers/gpio/gpio-novalake-events.c
index b3bf0038f84a..d5a3bd48bed3 100644
--- a/drivers/gpio/gpio-novalake-events.c
+++ b/drivers/gpio/gpio-novalake-events.c
@@ -304,7 +304,7 @@ static int nvl_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id nvl_gpio_acpi_match[] = {
-	{ "INTC1114" },
+	{ .id = "INTC1114" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, nvl_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
index 614523d461fe..3a34b9ac3248 100644
--- a/drivers/gpio/gpio-usbio.c
+++ b/drivers/gpio/gpio-usbio.c
@@ -26,12 +26,12 @@ struct usbio_gpio {
 };
 
 static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
-	{ "INTC1007" }, /* MTL */
-	{ "INTC10B2" }, /* ARL */
-	{ "INTC10B5" }, /* LNL */
-	{ "INTC10D1" }, /* MTL-CVF */
-	{ "INTC10E2" }, /* PTL */
-	{ "INTC1116" }, /* NVL */
+	{ .id = "INTC1007" }, /* MTL */
+	{ .id = "INTC10B2" }, /* ARL */
+	{ .id = "INTC10B5" }, /* LNL */
+	{ .id = "INTC10D1" }, /* MTL-CVF */
+	{ .id = "INTC10E2" }, /* PTL */
+	{ .id = "INTC1116" }, /* NVL */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, usbio_gpio_acpi_hids);
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 3675456b1e9b..6f2907468507 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -339,7 +339,7 @@ static const struct of_device_id xgene_gpio_sb_of_match[] = {
 MODULE_DEVICE_TABLE(of, xgene_gpio_sb_of_match);
 
 static const struct acpi_device_id xgene_gpio_sb_acpi_match[] = {
-	{ "APMC0D15" },
+	{ .id = "APMC0D15" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_sb_acpi_match);
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index b34b0c58b67c..84c1cc165024 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -195,7 +195,7 @@ MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
-	{ "APMC0D14" },
+	{ .id = "APMC0D14" },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index aede6324387f..50625f98f8e2 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -304,8 +304,8 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xlp_gpio_acpi_match[] = {
-	{ "BRCM9006" },
-	{ "CAV9006" },
+	{ .id = "BRCM9006" },
+	{ .id = "CAV9006" },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
-- 
2.55.0.11.g153666a7d9bb


