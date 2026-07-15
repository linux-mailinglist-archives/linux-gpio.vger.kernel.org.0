Return-Path: <linux-gpio+bounces-40096-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3QuxCuc/V2poIAEAu9opvQ
	(envelope-from <linux-gpio+bounces-40096-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:08:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C07EB75BB8A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:08:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ma0jEcyb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40096-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40096-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB7A130134B7
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF893C3BE5;
	Wed, 15 Jul 2026 08:07:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B263C5857
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:07:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102873; cv=none; b=APg+Fy3egLDAejJRX8n5FGIuJcbbaFhQvTZ8GnEnuj5Apc9MpurOb6SfEbtHolv1cZrKgjZK/MgPlrhh07GeQ/oHxjp55qHukJ7EioKMKgoWBvgS5skuJeus8xmPq7BCaTjjHcMphnxIX9uE2dhJkIj4RgunYf/CfptiImGLX8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102873; c=relaxed/simple;
	bh=Pw6j39/mGuQVfHy5bFeWSsKM0mU8C68IcHYtfdldUg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sweC5nwlDJ1Ko1rnEZStHG3j2sUwF1l/h1WjIenzcesHJGogxROCNGE1whr6s9uFJldZfdjQC5DIyvs/7fN/2QvpGcnsyxvY3Jt4ibW58MjrlsSmoSRK3YeCz0+kBCnT03wOL7dEQzLzyjXuxdNxpuRyQ6U7O3TAsieEN+ciKDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ma0jEcyb; arc=none smtp.client-ip=209.85.215.173
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-caf45fc5202so2718851a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 01:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784102871; x=1784707671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wHnh3usvn1WTvDIeVgeKjEVDyBZJfczrk0jzjtv/mDE=;
        b=Ma0jEcybKMC93WTAthR3ZpK3CK9FXegEd0msjK6YbLsiLW8324uxwl65PnZpKDkjj5
         Wy+CWcQdJZAKMROTG+ZQqNMj/kuaeaYCoFfASbEViVWWnhNuLygYq2l//yTJzLA+9Vy/
         IMwTOMJovvMrlIGY+f/1XHl9u/1HCNtarbShmCkaBTl+2tvUKdQ5KtZIze/ZoM2C7xCI
         Ap33hNPUQji8kIHaFEpLRDcdlMaOST6VP5LzYD5Po088qzviIbPAKzaD1st0Div96+AU
         7mF7XfsBgAiQpD0jxk5Sk/hb3iOCKAiHrsNkjcHOfOlrQmFA62oQCrNSXLXJ5I38TtcW
         ID1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102871; x=1784707671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wHnh3usvn1WTvDIeVgeKjEVDyBZJfczrk0jzjtv/mDE=;
        b=is5NlXuHd7nIITIRLRqH21ZX1e3jvevovFft6feglLFR611+B6Q2rcugcOyXjI6POZ
         RsVPMlyt7u4gHQs29lEZEU4lB6h28caVyh/WlVX0VXJXItAjKBh8JhGInBbp6cSQD/5h
         URkjpvDC9+kO00tYfBHMXnN1wqNDpLmXW4ZFRpLpQcqdReR0kKSSsXvca3sfq05XbtPQ
         AYmw3dIL7w6zIcIJoTUJEiUiXWaLuqsLg56YCim4BX7P8EVgAqs7rbvD+f05J2exiBWc
         nJp+/dFz8mnqVTZu50Q3jV6iQjOlBVuh1jjT4Lu+A+UvjIdaNGUQnBsjpy7Dz4dvC5oY
         dJLQ==
X-Forwarded-Encrypted: i=1; AHgh+RocRwn6zfVP35j30W1Ew8JkaFdC8oAbaQLpG0K2CoWru33S8DPhBuwLOd63+7P+ncnp+CzB4L6h8NBE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt7aFqyKFloaOMuVx8T91kVQqQDcdjz8ZM8YjSyedPSyEaBSPM
	NAf6lo4ZvNprmoWTDjjqK1yXiwCeaZek0GQMeElq3/OYSCTGV6WpSowF
X-Gm-Gg: AfdE7cnUbJWKB4+8E6wXSHfGs9tBZUVTIzl7USo5eVYkECHYmP6Mude5QZ8QiqSXD5e
	2OiS2a3RTVk4zNsr96MxRxnzqG+VhiDimx5CZrgAdszMCc447tFFnOg8Xc/Pn2kbxPEFByCebr/
	sfVdxJD/ySR7iJ4IQ16qgbRCIhfl9dONEwJMOFGbbIzG0Li5LXh9JWMcyMdupIX/PT48z7uicTb
	lxxXotn9m1JCZY8nTdh/6dRUBPeU+s4aBLCBqo/Sg598D8R4n4p13gISKwDx7+w7mg0qRh4dYUg
	HnrIlzAyTF+7w8FcyTalaOghiX808picSwi15VjAMWUq9fDe1/bA5YUaJ8q693NnyYyPCQGyOGs
	LJRddwUirO//LusW8Pp/eKgZjGZQ8Ry3pTNMVU+l1CVHi919shWgCuOuNNN/eoTU54GAD0M4CsZ
	iuNzx097/57kdkcGg3NPEfh+MDNE5VGO/DuAKTFIrh9M9x1QwcPZreKrOD0do=
X-Received: by 2002:a05:6a20:918a:b0:3c0:9c18:d5ac with SMTP id adf61e73a8af0-3c3572a7b78mr6354153637.73.1784102870893;
        Wed, 15 Jul 2026 01:07:50 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79ac0e269sm9151431a12.3.2026.07.15.01.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:07:50 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	riku.voipio@iki.fi
Cc: linusw@kernel.org,
	brgl@kernel.org,
	linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH] leds: pca9532: Fix phantom device registration on missing hardware
Date: Wed, 15 Jul 2026 16:07:47 +0800
Message-ID: <20260715080747.1638097-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,quantatw.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-40096-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:riku.voipio@iki.fi,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-leds@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:chou.cosmo@gmail.com,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[choucosmo@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[choucosmo@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C07EB75BB8A

The initial PWM and PSC register writes in pca9532_configure() do not
check the return values of i2c_smbus_write_byte_data(). If the I2C
device is physically absent from the bus, the write fails with -ENXIO.
However, the driver ignores this error and allows probe() to complete
successfully.

This results in the registration of phantom LED class devices and
gpiochips backed by non-existent hardware. Subsequent GPIO reads from
these phantom chips return bogus values (due to -ENXIO being truncated
to an unsigned char in pca9532_gpio_get_value()), silently corrupting
hardware state tracking in userspace.

Propagate the I2C write failures back to probe() so the driver core
can gracefully abort binding and release devres-managed resources.

Fixes: e14fa82439d3 ("leds: Add pca9532 led driver")
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/leds/leds-pca9532.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index f3bf59495b68..9606c5b294ed 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -397,10 +397,14 @@ static int pca9532_configure(struct i2c_client *client,
 	for (i = 0; i < 2; i++)	{
 		data->pwm[i] = pdata->pwm[i];
 		data->psc[i] = pdata->psc[i];
-		i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
-			data->pwm[i]);
-		i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
-			data->psc[i]);
+		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
+						data->pwm[i]);
+		if (err < 0)
+			return err;
+		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
+						data->psc[i]);
+		if (err < 0)
+			return err;
 	}
 
 	data->hw_blink = true;
-- 
2.43.0


