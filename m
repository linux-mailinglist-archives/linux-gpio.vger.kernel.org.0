Return-Path: <linux-gpio+bounces-39380-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y9m3LXcTR2oLTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39380-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 03:42:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F56FDC1C
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 03:42:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Raei81j4;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39380-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39380-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA331302174F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 01:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FB923EAB4;
	Fri,  3 Jul 2026 01:42:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58B52367D9
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 01:42:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783042931; cv=none; b=hgHu4J9tY0y29r9vPCv+DuLZlDN/YbOtrIyLAAFlNQogxzJO+r2MednFT4i9jeimWOyFH+yFmerfNcWNXDEPhBvcafC1/N1QkYhwTSuCjwz9b8ezpwNKjkPrlEqM8KdlG0MmU83gPBAIDzfVLkm6ZiHLWA+LFUdf3+FeK2hBo78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783042931; c=relaxed/simple;
	bh=5v7r4afiWttDE5QEdQ0mFJ//RayoGtlyppLyHK96n1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h0gk1N77W2FtEtuzaYxJottzgoUlIOsNqL1SKQrV8ozAlR7U/pUjEtCM08Fx3mSMO0unApm3mmcQ1yvA/nCjoBmm9FDg9RO66kgvyvoFdUItjnQKsxk7Pe2/Ai9CFv4+lj/7liVPI342pAArEDhKQ+FjRrMqPdZ/TMVOJE5SXjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Raei81j4; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c9e9a8af98so235195ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 18:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783042930; x=1783647730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bdl/nI02rLhhr4XYsH9/1vppwU3vIyQAjQiCX5x8z48=;
        b=Raei81j4JEYlZ7xxMCI+CzbQ7lpzdQP4QGk+lYiNC+AExmxivRaN3Jv4HJXgi8okBy
         wINlPdL/5bX/XUsiREs6wbnLrGlLvjPKpg48Zf9gV1uT0zbbREXj1yz1TRKi1576s86Q
         Of4EwqLs+F7aProUsUQHCteP0VrOrWvaxiEHHzMXbuvcwWhoMB5NWdOT6Ut0tKxU3Mtg
         z3HYSzXFV3ILFa/8Y28eECq3u5jE7f7rmj+VWmCY8AFCoB1Fd2Xe9S+gsjG1JX7Bcgab
         GSYi+eszbExNGHDg5CVlQxt2QzpwDpXZxtQk2PDHCso0TwkIin/JgEqMTGVY1YJnpkKg
         Mmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783042930; x=1783647730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdl/nI02rLhhr4XYsH9/1vppwU3vIyQAjQiCX5x8z48=;
        b=P21pLRihMq8juLEnDu9rdMsGmQVZ9I26S4+jnyaDjsxKp6s8LHdPLSx+ZYlq6gwsHl
         NdBMWEibHMhxwVuUpXEjqrrvExwrHd64kVbJXSaKDEyvCeXu935RutDu23SqpwSSZjZK
         t6/NmoeQkZtlBV7LKsdKdbVuqkDlk5t0fYDJonyLou/z72vXydGSxC3hZfDwj3X3Z+9Z
         izkI6L7kkj0rUrIUAR790gdNS1raXGlZq54qFWbRpYR/OS0vgWXvhiyp98njrRtW37eK
         R6yd/s1qFstP7GPimct8SpSKsaIbhGNtuTkHwNENCn52WWs31ohAG33/VTeCiHbL80ZJ
         KIyg==
X-Forwarded-Encrypted: i=1; AHgh+RrPXX8qapmlIgQUvtuHISqKsRBkrZa+aPah6xS3a85faUbhVNMBrDguC4Dh/Hg4Li6/dxRbf0inJl6E@vger.kernel.org
X-Gm-Message-State: AOJu0YyLueARoWge71jMQOg+Cu1ie64lIQgcfP/TIPV6z5g0Dvu+N9X9
	RG/XfKrrYEoUQcSwukhVOSblMPa8gURnqO6nvSVOvz1vvzGmlhlCIRwBsLtQyg==
X-Gm-Gg: AfdE7cl2R6pROwjP8ASXPfkUgjnFWscq3Ah9TieDens6wmbiqhsT4OdIE4FHSQgJBam
	dbP39X8FWGJ+RDqw0hN9rg5QH+DW41c8qa0wkV40YF7N+PwPpZaDNZP2rUwvS097hXObesfF8sL
	OVvOtPbs8oboWyD2chltY9Xd5arz1FNjQ5+DzFOMkAmbMNqsDTHfGAXYl1dkIuSrlDpv4uBMsHd
	fDzJ2PUhK+sCchTAslK0Q709KaGxFblitN/H5m0tSHm+O0yrLDMA57zyXxbMxXd8omV6Aq8GlSS
	K8rbHyFfBK6hZBK34S+LrfcFna2cvogOJr3oazTcN2iztHzwrLdiqOe+GT/PMDJ95ozT4SBnpg8
	Q2AxJnMuCLb9NkBlh3131jVxixYN2/TG9CBDgGZjmiBoqSsuvgzM5gppU8lkQsWhzyGQYjQpEd0
	1dOIKanF6oW5rbKgszmNp7RwYO9rbl0OYWTzXU4ieqao/FAOlucri/wWgjMJk=
X-Received: by 2002:a17:902:ecc6:b0:2ca:ca48:c36a with SMTP id d9443c01a7336-2caca48d3ebmr24445935ad.18.1783042929874;
        Thu, 02 Jul 2026 18:42:09 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7140a13sm1250695ad.30.2026.07.02.18.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 18:42:09 -0700 (PDT)
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
Subject: [PATCH v2] leds: pca9532: Fix inverted GPIO output polarity
Date: Fri,  3 Jul 2026 09:42:01 +0800
Message-ID: <20260703014201.69829-1-chou.cosmo@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,quantatw.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-39380-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:riku.voipio@iki.fi,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-leds@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:chou.cosmo@gmail.com,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[choucosmo@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 539F56FDC1C

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

Fixes: 3c1ab50d0a31 ("drivers/leds/leds-pca9532.c: add gpio capability")
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
Changes in v2:
- Correct the format of "Fixes:" tag.

 drivers/leds/leds-pca9532.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index f3bf59495b68..2d37e00e459d 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -327,9 +327,9 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	struct pca9532_led *led = &data->leds[offset];
 
 	if (val)
-		led->state = PCA9532_ON;
-	else
 		led->state = PCA9532_OFF;
+	else
+		led->state = PCA9532_ON;
 
 	pca9532_setled(led);
 
@@ -349,7 +349,7 @@ static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	/* To use as input ensure pin is not driven */
-	pca9532_gpio_set_value(gc, offset, 0);
+	pca9532_gpio_set_value(gc, offset, 1);
 
 	return 0;
 }
-- 
2.43.0


