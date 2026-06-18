Return-Path: <linux-gpio+bounces-38688-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SbNqAwoXNGrvOAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38688-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:04:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8866E6A174B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:04:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eSuLXf9R;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38688-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38688-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B1403151D87
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C203931E844;
	Thu, 18 Jun 2026 15:56:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49C13438B3
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 15:56:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798213; cv=none; b=jpvMW4/SYBV5xZIKNeU60SF0JcNPvLllmOQ8OX4uXUMBan51NbI1b3uEqcVFdWki0Uw2iLf0KcaB8SSedco0mn6W6BQLGQ70g3VLKAgw8ISYzMaXENzDOKN1XiOSzC3R3Lhm4ILt6r3DFmlDJ+BSB3FCSImuRwv1eje4RzpgBYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798213; c=relaxed/simple;
	bh=hdYYxiC7Jb9gGQW2i4fD6vQeo0dsTo7SyP1h0B5NZRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=itHZL1KjCjVp7ErZQJ2gM45X57CJ++R/XhgR2+a/+FR6bwo5oqfMlbuUaDcIfDua5rvK4FItM1QJkIosg0NPoVZaX+iLlf6hktHI37ux0c+o4kska5PzXG3uyhifZja+DdEPdl3H3ZXsTjUIyLBclMZs+aFQctoSEYotO0+Gt+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSuLXf9R; arc=none smtp.client-ip=209.85.167.46
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ad522bddceso680051e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781798210; x=1782403010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ommdRM+1YGnowlRMn1MkEDpytWOEfkBSapu+NiFj3J0=;
        b=eSuLXf9RRpkJVTuhLXhqdPBDGyofzzGPyhU3KqGiXwcNt60OD2smQx1OmbaqAPe0aP
         5HiI9qOyaml4VBIdtH+5lU/a9Spodb75wp2CvxZWSMR5ld35notvVQDU7eUrbCRVf9Bp
         16okLwzJD6TV1QmE7vQuWmVG1xC5Bta9RO1M2yubLl/WblUPPlNRHCPKUDn1G/MnhmfS
         1rYNCKTJTDqz5JHC0BCH+V87b8bdIb0nF0qYqST0RqKaP5FhhDSUWaUFmyF2NO1f11wA
         3xxFkMSzaFVzGN3lto6Ss3xluwsQAEFWxX1ckb2uGbm/A4v9ygNdM1n+rmaXOJrkdry1
         zz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798210; x=1782403010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ommdRM+1YGnowlRMn1MkEDpytWOEfkBSapu+NiFj3J0=;
        b=AWRqM4Km8veKoJ46BBA117iELwkwx2DSRnVK9v99uZ98uILuZmDyen5xV0AnqV7Ra3
         FeLvhAJN6ePs7oEptfd7XrJ3+LiLsYuqD7RKVem76agrH++t1YuzDBnM9D21tqvkqizb
         VV8jHELf+Q04SL+/0amKQGykZRHp3TTbDQcGKWtRTECWqZf5ywnp80ed/IIWUgrNgRZg
         cof2KytBY6ld++Wg4Apos6a+DhRxoIRG3s/Regx8RK/Dls6lBTjg1wiWEjl3y3QHKQXv
         eLceyapGHqZsVqUXlbSB9Zce/xhSadW4Why7BzUOSjDK2g52z4Yfo+olq4DhcWSmXFxV
         97qQ==
X-Gm-Message-State: AOJu0YwVHVS4LpJsCeXTmx+znZTXZpMo0UkkHN7IbgwmaHBYZ2Sg+dKe
	aa3/QBwbdP9HcyIFInkfvzptockbQ7R4D3Tj78Qb/M6bWzob9+BdtDIY
X-Gm-Gg: AfdE7clJXnJQIpP1QBE0wjjLCtY3UiTZpnl2o5fH59eLuFO4Ae8+5QgQNRuQA1b9IqI
	KDe98+ypADm3PuUifwjLiBoQ0dB6MrUCJJjlO39zwlqjOA4TuVuYoeRMT1LIQhEZdJqf5tPBxdn
	vTpxNYd/5W9cb9E8i2UsjOEGVkk0NHocVb/nqbLNFGrjsisITFMLh9FDxAMuVuAI6K9guRIdElC
	7H+zl9IZHUOJO27P7SI3trEFPJ7XEqMqt3s42EaPT9OV0KZ0fH4oPVSf5By9sxKgboITJ4/bL9k
	hsTXeU+m0ycKdLUH5RVRZCoGZZbwpNnwYy+a8mXAHwWu8pQw+ck0XblOsJvMVjAdT2XTTAXqIDv
	kjhIEsuldqL6RtB8arr8UtmbF9y7r+BvBhb1QYMv8vU71D0/hQC8vDJ/CtknfsT2Og+y5wL3UCQ
	vBx6OyQumYELOGNFBa2nUxwAwc+lLbe3UkNZzwPmuTLB0Ome+NNOxAutuhlwMk+e6uHMcvUG/Vn
	x5KqBrRS2M=
X-Received: by 2002:a05:6512:628e:b0:5aa:6cd6:a7f0 with SMTP id 2adb3069b0e04-5ad562dd626mr44491e87.44.1781798209842;
        Thu, 18 Jun 2026 08:56:49 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad56375f38sm13217e87.17.2026.06.18.08.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:48 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH 3/3] gpio: tb10x: remove unnecessary braces
Date: Thu, 18 Jun 2026 18:56:26 +0300
Message-Id: <20260618155626.18751-4-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618155626.18751-3-igorpetindev@gmail.com>
References: <20260618155626.18751-1-igorpetindev@gmail.com>
 <20260618155626.18751-2-igorpetindev@gmail.com>
 <20260618155626.18751-3-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38688-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:igorpetindev@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[igorpetindev@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igorpetindev@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8866E6A174B

Fix the checkpatch.pl warning by removing unnecessary braces from
a single-statement if-block in tb10x_gpio_probe().

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/gpio/gpio-tb10x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index d30524dbc841..7fb8e6223bd1 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -167,9 +167,8 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 		tb10x_gpio->domain = irq_domain_create_linear(dev_fwnode(dev),
 							      tb10x_gpio->chip.gc.ngpio,
 							      &irq_generic_chip_ops, NULL);
-		if (!tb10x_gpio->domain) {
+		if (!tb10x_gpio->domain)
 			return -ENOMEM;
-		}
 
 		ret = irq_alloc_domain_generic_chips(tb10x_gpio->domain,
 				tb10x_gpio->chip.gc.ngpio, 1, tb10x_gpio->chip.gc.label,
-- 
2.34.1


