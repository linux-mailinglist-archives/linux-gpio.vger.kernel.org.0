Return-Path: <linux-gpio+bounces-39334-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bi4KHKhIRWoy+AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39334-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 19:04:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AB6F0228
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 19:04:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=int3NKhg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39334-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39334-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 905B231247D1
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 16:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23912386C13;
	Wed,  1 Jul 2026 16:57:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD768384CDE;
	Wed,  1 Jul 2026 16:57:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925030; cv=none; b=YIhLtNLksoOF3S3waQJ33HvZHNzeceC7DtVoP6zykuXVUoHmtnWs7wXLxsuozikSUkdHMylR6YxbmLWbvCiorjWS/T73lDmPyaoUSo2awZ58uO90SVgRj2Lr4Fw0Zx03CpTms4Rm0sr40mxDdajAXjv2Wa0Ct4/nSv394xruVgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925030; c=relaxed/simple;
	bh=6o4fDyhL7t/t4eKdNEMd2rEBBEx6ZGkhlu3TCQNGSio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9x5aEc4wdaMi3Ttxo3XcoKt3awWbY8sUSnyn4YFsOVeihgOkJqfRwPi21EoiHSHh0Z5hebdso593dTQ7rCtdNtcZvuMSwPoYUildg0+j3FWEyiDvYXp39dxaUgoxSTE1OEke92kPoDh21iuecc9xywI8F++DLZkwvkG8cEIMtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=int3NKhg; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8A925C4FECD;
	Wed,  1 Jul 2026 16:57:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 852AC5FD9D;
	Wed,  1 Jul 2026 16:57:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5BAB104C948E;
	Wed,  1 Jul 2026 18:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E0XjqYUV6uWOO/CR3IsfQubms5Qr7YsKpk3FucyopeU=;
	b=int3NKhg7SLAN8ZzlX+3Ualoffw+mXJvJgs8ByUX4Y5GG+8c3errKU+GrG/8yIZ42JkHc+
	yRz0T9LYqR46hIRad8KaaUOwDZr0kLYpN3lOF36iWZwGREZbyhxj2zu7pj1VQZVUycUrfv
	shaLBkjF3TaUhFbpspWM5bv33geNWiEEUozbB9tashUxRgqnljFSpQpUjBEuHpqGVFMuTv
	vTOuehDsG8CK0jzSCXQMA47Qu8qOrs0Cg49hAmvRvH0fA6bfWZZDC09nePKVXeo1xB7/C1
	5ZBxNEUcD3L2O6mjI2sBFF0KrVCBbfJcNb2ySATGpoRzkpIpqhrLn9gAlGBlFQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:57:02 +0200
Subject: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe
 success
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39334-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[theo.lebrun@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:p.zabel@pengutronix.de,m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:benoit.monin@bootlin.com,m:tawfik.bayouk@mobileye.com,m:thomas.petazzoni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:theo.lebrun@bootlin.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B29AB6F0228

Successful driver probing should be silent. Drop unconditional
dev_info() call that is done at nmk_gpio_probe() exit.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 1ee46f59d708..244331f468cc 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -712,8 +712,6 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, nmk_chip);
 
-	dev_info(dev, "chip registered\n");
-
 	return 0;
 }
 

-- 
2.55.0


