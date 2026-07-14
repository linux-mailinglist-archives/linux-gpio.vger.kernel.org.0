Return-Path: <linux-gpio+bounces-40032-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zBCTLlPlVWrtuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40032-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF3751DC1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=FAhGeoHH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40032-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40032-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 838C43031781
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADE03F5BC5;
	Tue, 14 Jul 2026 07:25:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DA73F8248
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013949; cv=none; b=Cbc7P1mb/W6640hFGVZQDK4a8O9C6sVy/X7JhYHci5s8rHOcIDWKnS6MXnr1ezSuFUS+jtc6v1ihzznMIALkCiZbDc7Bp1fIunDsPPL8gT2LH3ebEgvyGFDCWJuMajcRoY5N4sPxS8euY/a5VZMtx2jttNEHgMmM/cS9+FY6gWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013949; c=relaxed/simple;
	bh=RpIRMTWZ8MttlPK03fnuszXJ+wTnFZwAX9zeYPpcfuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrUwX7i1lHDvWQfa0HbnufQqELRWlXxNjQLy6/z2fqEW4eyLoFdIU7hI7g2AQKnLanv/hpqeHFMf6fks2wSsd0C47kuqSNr9FLbkvvm3QvqKHcWNMPSzac5lP/PsyccfdXiuaBYoy7YDS9SqW5TidUmY7UAY8W0cIXbmNYcT60o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FAhGeoHH; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f6de72faso3210665e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013944; x=1784618744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AHd9rAFKjbxYMiTiN956h6hY84nCbjYBspgrZSqw28w=;
        b=FAhGeoHHZfg3c83pLDkUN8eD5HwO0c3o7sL3fv5tNNQvv7ja26tu73fLyQ7DjfQRCy
         HU9eg/yWyFijaeGR0sKjLPa9JjMyyfb+/4Xd+WwD6+t3Nqe/GDpZnsgN+SFdWpH4wrhg
         lelXROknTnwerUCxbIMvFk64n+Rn2iDNldKUIDd9CjDTlJwI4u6hJKIwvIgTLkbBJV2a
         zHNSxD7NiFnGYtTzFUtaEYjcCu1ZIdkQrgvGwVzB3oyprXiDXNimNVn9TwsvJGpTUng/
         pYJkQqHGw2JT45Rgn2xIpVgHxDXxOt8pYWGLAMi/BDQE5hz0IDzMqCt+C04CAdierftn
         AYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013944; x=1784618744;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHd9rAFKjbxYMiTiN956h6hY84nCbjYBspgrZSqw28w=;
        b=b9n+x+H//iJ8kSHkes7Bm0Bu5TVhBQCJBbCpC7azmnwVG8zIbETHIwl5gabgFk49Qz
         2RyjvhTY82u8EigeA8WpLGyJhpfMxuSivyK4yiL7QX7jXore4inkWAj02DJeGEADsB05
         J0X8cUigpsXvWoiZNujT+PmKwV2SqHY67uTdx9vkzBnT7PeYEkHbSBj6VRhEAzBbeeOm
         e4n2wOs80E00JgPsoXkrYYw3iJlB5ou/J/BOOgbaKh80Y7+Yw4NnwJdGC+dtDnKRGy92
         wqUU47A0GHj5ms7LF2qC26Ekdb43PxA/kfcKVyzCc4BJyqbGrPToAuc/UTDn6twbCcpC
         sl4Q==
X-Gm-Message-State: AOJu0Yw++RllMiIGeB1v96X8MIV8QMJtc4OknGR1b2gtqBgHGryyU26z
	2cdgx/T3qkaWz9gYZEHRDYwLcX8PTRw5XyEMRTfFNZKGT5bcOehchI98aYvN6zhi69o=
X-Gm-Gg: AfdE7clfAeLWIAV4pEpKSKHPBH/Q4JSp0RDhn22Z6Nd9ZHwGZ05MqHY8ItPrxx8Sdqk
	7ZJc5DD0WfnmmzigT4ljoU64ybGBTCK7J+P5AqQNuc5XnNBhCNynU8S6KUr6ncAXQLXM1GbCnRc
	2T+nwgf6HKeqCQp2OjACVvfQmsjx0i6XOCwDev3DFezuVpbLs2rh1quch6hz+8hwL8+FrAvf3Ty
	D4y6obAceXKWOVgNX4DewVaSuWnozjW1gNaK8LLiuHhGtypGKeDZCHgjFRnG1ZiAM/X1zmftwIZ
	/Pbi5ni8Mm+vifjAtCPWldWU6vggr26ro15TV4O0cQEX/4k1ZsNYlWnlzRxEb4MWusmX1bH6GNL
	2X/WPgOCifO1FJTkOIsBpA2+FBYM8DLlNfNuJITGljkw5xUryLbm+DpN6J8GjGe583tVuyuehh9
	eLxci1Ek+vaZ/WM3IAl/qTc7oUEqKT47MjTqgfw1LQXxmzVu+AAZtahLJIh808r0+cj0U9al+BB
	Az6
X-Received: by 2002:a05:600c:6286:b0:493:f9ca:fa with SMTP id 5b1f17b1804b1-493f9ca0655mr118179105e9.3.1784013944036;
        Tue, 14 Jul 2026 00:25:44 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f2d97527sm370196645e9.2.2026.07.14.00.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 18/20] gpio: Unify style of spi_device_id arrays
Date: Tue, 14 Jul 2026 09:24:19 +0200
Message-ID:  <6c456124d46b1ad654413376bb7a8e17c9d5da84.1784013063.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RpIRMTWZ8MttlPK03fnuszXJ+wTnFZwAX9zeYPpcfuc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeRJz7pNFaHmT1nc7Rr7mmJW7plaHC+dHUTN2 k1hdKxc7qCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkSQAKCRCPgPtYfRL+ Thg+B/4jMUHvoM3nXaZVBpZtKhnixIQA+2mviYr97yAMM9tcJKfwr40LIrMqOH0NV9fVAvrSvKE xdDVi+QF98LQ9kyLZLgOw/fnptWr1aloamRT9rGppn4gCj2VxXxsRhgnqYT2xX3bZuqMxvJ4FYK zYEGvgUFUZ3TRzUuGprg5n0bngojcBJZbxSJkecMvPBNygmZEZTZE/zDajqNAv5k7jcSe7/+iLM qRvqNvNbTjCRpHHVWMVzudz6ZIKllk4mM1QQnx1Em8I1IP5v5e2buBwmnii0o49DnylqUFwkWxN MwyCtNaGvUg1ZQycpOW3bRj1VtPpWZCDzbo6mqHcmuiUrjoO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40032-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3AF3751DC1

Update the various spi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-74x164.c  | 2 +-
 drivers/gpio/gpio-xra1403.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index eeed612e7c80..acda26cc4cc8 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -182,7 +182,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 static const struct spi_device_id gen_74x164_spi_ids[] = {
 	{ .name = "74hc595" },
 	{ .name = "74lvc594" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 03c216d6d03f..5089377b67ff 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -186,7 +186,7 @@ static int xra1403_probe(struct spi_device *spi)
 
 static const struct spi_device_id xra1403_ids[] = {
 	{ .name = "xra1403" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
 
-- 
2.55.0.11.g153666a7d9bb


