Return-Path: <linux-gpio+bounces-38617-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hlUzDC0zMmqbwgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38617-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 07:39:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35545696A14
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 07:39:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PMS4h1Lt;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38617-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38617-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D16B3008682
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 05:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFD3399036;
	Wed, 17 Jun 2026 05:39:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADA538F64E
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 05:39:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674788; cv=none; b=LpK1XXESyrQm2xJzAQhJkPpXLTcdUFnT47eFVfv2SYdLM+HdeisIojx6+1d5tH3QIQ7XYnTOqVKD5q9ZULJ8BTjzONAZrjTE6t1FeyRpx5GiE5cNBi7Q+/qIdqK7xzpCRKt2aHe8WaGcH41ijKhQI6IVd+SjEFf2MVXYOd/eke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674788; c=relaxed/simple;
	bh=UHZCVozcM2EcJKws2E/C7a5uOhbIOrIOnfe4myFgS98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gF0/lYaMuhkEYZhBYzBTbyZzr+1rkQpiPRz5s4CyFrr+NHAgTu0vEet/Tda/ocLGtFsHkZh3cbnzjUWYDhzGcZ21VwfqRfVO6O5tLMCnEpuJrqrQ4pK+QDi7BAO5zL8zcr7bRvY7mCOqKJQ0vbAFpC6UWkXjDf34KAAPOHUMgwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMS4h1Lt; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so33938745ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 22:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781674783; x=1782279583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rF2bDRyjtCAOETKbmKM190p1BI25Y2JTP/DKDl8RF0=;
        b=PMS4h1Lt0AnYpPLDW0/TLmIOuvZL6kjxrgU28kGOiSM1Wz7VPQII2efxhKfjpXZ9Tg
         Mv0mzYuSHN0nvQRQbbM344KFYCwdAqQ68PB9nBBzlYkqfcP9XK+1WWzI3WKHZIFBpyOJ
         iTJ8fYPa/tNuCuozIYaUyuNcizqmKQUNeaDnnvql8Qk2+NTozTkhaizP2g7ZCVgrf06i
         GHfJaUaetca8ta3zq5VRzGhEONbq1qBApcZK3RtM1LqtYDpOYu3mKRmsKt9etUpDdBBg
         BN1jKc7lc+rdWXhwArKzXD6J4dsvmaOQAp2qrKe+TvMpMKYFpOSUA6LJ4ipU3UZLpkfy
         Z1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781674783; x=1782279583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rF2bDRyjtCAOETKbmKM190p1BI25Y2JTP/DKDl8RF0=;
        b=h8tj6AJClkif8cQ6yNA2ozXikHVKbDBGaThANI/fXRinGqyaofa5Y44SL6dneITPLr
         Lk8RVbqCmoglkqGRpEIDA0JV6l5MSX1R1Z7KorgYQxiVG0J4VnvnpycyiCsJtk6TEGXj
         S5AAM6vdZ+WWwH9rF3VT19eNRTpXOYucKLxoKwyLEQp4g1WsybZ2xyHy3w9/42i5eRfK
         Hpum0ywQHXk7IgdKIhMmuo9uGoC0c6TQW8ngDrh51rtrEh3dtk+CBdgOxi0p/W+lO0m6
         u7nfboOgLeahaF7bkNaB38xygraDeuc5BJTcr792tdrDeycFpz4l9jjRyjK4aBVzvLrT
         XVDw==
X-Forwarded-Encrypted: i=1; AFNElJ9tzViJU65gf25rxVXcmblO5hN93APTQf27++YJvZRaeVz+luZLi48Q1k0PxGZNM3cmcmUS1uNW+IuB@vger.kernel.org
X-Gm-Message-State: AOJu0YxwiLsIexAUZpj1tEvI6oZ5+y6zhlKwE2sqs9xLoFxkvmxY9ylh
	nGKWypKbj7NxViB2M+w/8AKm0psGK40EYUzxT75h5pOjlF33Osqtgith
X-Gm-Gg: AfdE7cls5a/3LjY/K+0v0BGDZKUhunj/6oHm8j77Q+xztPnU9VRnUK8v4B51KoqxSZm
	aB9Fwhu06pR4Dg8HDej9Edxd17JWtHllp0AQEGjVctl7rX2YrU+VVtZ+8MHQKRMOpS7s95SYnir
	UoRMl08dvEBz4fuJZAZI9YmRDMMbt5ZEjQqOusQK5T92LNIPGjD0ceODTyC/tY5TwvOCBWORF7h
	51zINHEOciQXDuGqfPYbDYcymHOJlSwUE3gU4/gF2Y2BkY3GjCRcIwhqRoCbcW3bwUVrCczxQlX
	7emgdQp1CqnmG3+LON2y1rp6+GhTbGXvqMQUk+PJgUNfZXbjXLVor9IjrSskO3oMJktZ7I1cYgs
	nquJlrdZYom03fgv33ACINg8f22B9oQxRBqQG0Gwx6EDSNmXVgjcpzppKDO1xAuud86jhRlE4eO
	cVL9UOwQBXjF87h3mkJuLV5ZQl69xUtL8uRBFK3allltXUqiSWXSDKSfCxG1uuiN6ZNRg9Uw==
X-Received: by 2002:a17:903:46c6:b0:2c0:fa4e:91f6 with SMTP id d9443c01a7336-2c6bc0bdcbdmr23674865ad.13.1781674783146;
        Tue, 16 Jun 2026 22:39:43 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm30490435ad.52.2026.06.16.22.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 22:39:42 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: riku.voipio@iki.fi,
	lee@kernel.org,
	pavel@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH] leds: pca9532: Fix inverted GPIO output polarity
Date: Wed, 17 Jun 2026 13:39:34 +0800
Message-ID: <20260617053934.2122685-1-chou.cosmo@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,quantatw.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38617-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:riku.voipio@iki.fi,m:lee@kernel.org,m:pavel@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:cosmo.chou@quantatw.com,m:chou.cosmo@gmail.com,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[choucosmo@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35545696A14

The pca9532_gpio_set_value() function incorrectly mapped the requested
value to PCA9532_ON and PCA9532_OFF, inverting the GPIO output polarity.
A requested logical high (val=1) incorrectly enabled the LED output
driver, which on this open-drain device pulls the pin low, while a
requested logical low (val=0) released the pin.

Correct the mapping so that val=1 yields PCA9532_OFF (pin released /
high-impedance) and val=0 yields PCA9532_ON (pin driven low).

pca9532_gpio_direction_input() is also updated to pass val=1 to
pca9532_gpio_set_value() to align with the corrected polarity mapping,
ensuring the pin remains not driven when configured as an input.

Fixes: <3c1ab50d0a31b27bb4e55168f4901dd91e6e5ea4> ("drivers/leds/leds-pca9532.c: add gpio capability")
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/leds/leds-pca9532.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 0344189bb991..80bf94e699d4 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -325,9 +325,9 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	struct pca9532_led *led = &data->leds[offset];
 
 	if (val)
-		led->state = PCA9532_ON;
-	else
 		led->state = PCA9532_OFF;
+	else
+		led->state = PCA9532_ON;
 
 	pca9532_setled(led);
 
@@ -347,7 +347,7 @@ static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	/* To use as input ensure pin is not driven */
-	pca9532_gpio_set_value(gc, offset, 0);
+	pca9532_gpio_set_value(gc, offset, 1);
 
 	return 0;
 }
-- 
2.43.0


