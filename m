Return-Path: <linux-gpio+bounces-40019-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WbwvIc3kVWqhuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40019-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:27:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9119751D58
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:27:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=IGRQ8DCy;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40019-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40019-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D98F304BB4F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A1B3F164C;
	Tue, 14 Jul 2026 07:25:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD9F331EB5
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013925; cv=none; b=b1hq+N/n26Te+Bt3IZqKrVTFuNXYwl5eA38GLsdS4WpEbHQPijTa/skV3u/LsFrg7CVgnGoOUeEcBADzuuh5Z/EeJmhXb5ieNVGKL6Fu/QnRp8pQjndJfD4uU3uhXps5wG+xFJlOLT3IP+Fq6mlFypfG4I+W0UcqOKLQWVoIlnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013925; c=relaxed/simple;
	bh=376ZZD+wPhduikubZ0bZXKk01b1uwRuv+srymK/ZiA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzHZXUyDM/1tWvdRyXYA4ukECgkQ2iqMz0U//tllez6CmwdCithiThrl/yIY3F9Bdy7Z7BZ1m36g3mXe8kP2PGfBS1W9U+GGPzfwg7q4Z0IvHMmSaGsE1X1wNIJqUOrLQD7HGcgWswBQhfQpXuvkg2jJZXCMQI8rMnNWp4kcmTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IGRQ8DCy; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so4296565e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013921; x=1784618721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D6nnvVJiFQQaLxlKEaOiAKRWl9WrJpxkHSZHxL5UxXc=;
        b=IGRQ8DCydTp+oCbLkl48BlfAhzFDUPoXjukHZY1bFNQ6/+ji9QaF2oPIos9EQInUD7
         qqsg7HMcWylVN2lvtidBr2C2TI5lAffqKUUUjA+stq1zK0yp2qIQOmjS/0/AP9l2oAt0
         k0ufTKh8UqVMAqqCl/IUe+QGdmcIHoaYGSfHvq5xXmQQaqE7GjUAHA561K9oGQ+Tvgfj
         jDx0jrQl/akqcwJDLLuPLGhErs4AyI3dK7eT1rAYNF1rUZiTQm7EHQGBb9p1lsZ6LOw5
         CHvrrCirmnPPf8/dT5HjUxdEGPlrQ4NbDfrXmvWekhtIZssPiNsSIEcrF/igPi3rFEaO
         UVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013921; x=1784618721;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6nnvVJiFQQaLxlKEaOiAKRWl9WrJpxkHSZHxL5UxXc=;
        b=KmkkJ3ZoJjR59HDWi8RXAFsRxl7Xx4S59tDomJBvYcOZ/gxlPUuIAZ3kxZXuHPI+N8
         ulY7U8QtE7WwlRak/xL+kkAQXgrCt4IFQe8EwADmR7ultnQz8TVW17YYZT+drSgdpoHb
         3af5HS61/N3ppuB/XZRy09fCsKcYd04rHsyQkKU6Jmd0RztK0QTDN2MQn9LReHBeVN9e
         VTUeTdkaF2DkFwtcUNhq6SaTff9mDMzAVqWatFFyHw053cv8Pa4aPDEUoLbMo/jtAMD4
         V3Qdvhmz3BJwDs+DNUJG0mm3MQx2c+FxB9bT6WU5Y1xzSUwh4GGchjhrxOE9u84DHcKK
         8Ghw==
X-Forwarded-Encrypted: i=1; AHgh+Rrg4mxnRKOmkGZGABbASWTGCEW9TkmN0PHskQSOfgGGHP2ilZk5odzOEzt/hsOssPUa4GQu/oVgGfHA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7M0sAX3+2H2yTUuf9c+fNuNKDrIHMi9bcfkB8/u1IxewsN++
	wA51dJWxUbf4qKI1lrR4Gb2XYK6mWFqb7hECusmBJ3a+5ojGdThSwfmJP7DvmqXz5Tg=
X-Gm-Gg: AfdE7clnbWifJCStZ0dc16m1CkoWoBewm34zbsiPs7C1f8R1Sg3og3K7or/QXR4wLA+
	hfbiJVA3hGvZ9FK+JosBzDQm15U93OI42TSXCoq0NI04flKQes/shjV20SK89OqG/AJnYt7mR3j
	oxJgk/PI6JP1w5600NLnvPt7b49RVujMDHWKQiBd77r8NcU4+nFuU9cxFOos63xniNvkwfzZq6s
	D/tnn7EiVplloNQqw6LVY12MGYG+k8FnbAZIBIXWPNBC3Pe8SbvaSB/oZWfvEvUxjT7WE5P3TdE
	axK/W2Xj9WouGTrTsVKx5s2GQMwbwN1/vy46VZb5lVrF9lh5AmiEM6K2bQO0yVVRcjIZPG7je58
	Zs5yoZFUe3ECBNfwG3zQsuhvLPS0zDrE5E8oBw61ZLVWj64Tz00xSuwUw42cmVwSxuveX2P/xu+
	fJnCgBcnSxsUO/NaNxeD2t6B2nBu7Qf+VXFFJMFikTVJaQQPizYGqeDje+bFFUVVeGOeJ/Qb1oz
	oi7
X-Received: by 2002:a05:600c:828c:b0:493:b8dd:9d68 with SMTP id 5b1f17b1804b1-493f87e6c8dmr120216495e9.10.1784013921419;
        Tue, 14 Jul 2026 00:25:21 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49508728019sm50216125e9.5.2026.07.14.00.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/20] gpio: Add missing ACPI module annotations
Date: Tue, 14 Jul 2026 09:24:06 +0200
Message-ID:  <bd2df79002b55c3caa2d3266c698cb355ef3f25c.1784013063.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=376ZZD+wPhduikubZ0bZXKk01b1uwRuv+srymK/ZiA4=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQolzbdXWVqxfSy9EoF6PpCJK2n4VIKpVC25 hesf/ktSLeJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkKAAKCRCPgPtYfRL+ TshbB/iW2OpBKyDciFbZVKISCy+u1WlLs6Rk5Ixdj6rcUZ6TeHSGTya/iyxP1xTX/1rUpSr3YN5 1K1liGV0gvypRgEeEbc4g3LZKPgm6G1BgLdo7V9xUtpckMlgN47BNPjmDPUVQ0r1Hkhz8pmUEms ikpQwIuirjtuqow6JChGAdhgrO4UuLBu6nUNBaVK2oLxVe5DDOdC8JvD4FMCHaM62zmJ1LoLlNs dPXS4OI3aDwKQW+QcFBc0gtBWRTP3zBNSwyxl1N4E9tVYyEHe5BHabZ89MgMPQcN27JAdKB1pq7 g1qta5UEcPSLEd8HqTFhygWbfp9Vud+cbA2DLRadSGnXZ0A=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:israel.a.cepeda.lopez@intel.com,m:hansg@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-40019-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9119751D58

A driver module matching devices using an ACPI device id table is
supposed to declare that in the module's metadata. Add this information
for two drivers that failed to declare these.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-usbio.c | 1 +
 drivers/gpio/gpio-xgene.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
index 489c8ac6299e..614523d461fe 100644
--- a/drivers/gpio/gpio-usbio.c
+++ b/drivers/gpio/gpio-usbio.c
@@ -34,6 +34,7 @@ static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
 	{ "INTC1116" }, /* NVL */
 	{ }
 };
+MODULE_DEVICE_TABLE(acpi, usbio_gpio_acpi_hids);
 
 static void usbio_gpio_get_bank_and_pin(struct gpio_chip *gc, unsigned int offset,
 					struct usbio_gpio_bank **bank_ret,
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 22d22962963b..ad0f1551c271 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -197,6 +197,7 @@ static const struct acpi_device_id xgene_gpio_acpi_match[] = {
 	{ "APMC0D14" },
 	{ },
 };
+MODULE_DEVICE_TABLE(acpi, xgene_gpio_acpi_match);
 #endif
 
 static struct platform_driver xgene_gpio_driver = {
-- 
2.55.0.11.g153666a7d9bb


