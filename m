Return-Path: <linux-gpio+bounces-39329-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A8RrD09IRWod+AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39329-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 19:03:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF956F01EC
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 19:03:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=MPWi01YJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39329-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39329-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9571C3059E14
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 16:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4763E379C5E;
	Wed,  1 Jul 2026 16:57:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4D379973;
	Wed,  1 Jul 2026 16:57:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925026; cv=none; b=jzELGpGiCioYI+CxCeQcBgMCyfnk5zCnKCunjQCxKikU8N7HHy2alVvqvRVMoEY4oYkNoo7kyudUcDedTusmSsE+rlGVf/pVPpziErM+IEGQDwUfXkPV5H54uq9tkjud0xen5S0jEb5NCWQINWsGet3TXFI22Liv+NDnqOCNvyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925026; c=relaxed/simple;
	bh=ADwWwcVnrV8ObUT08vo3t/6SUomiEgdOjDvCi/KbaHE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t7V3DJOmIOJ6s3pjsL40jpd0rNexQOrfh4dscZW3XRpMDGHHbJuA9W7sj4ZlYXEKwlADW2ykjXyhc4/A//qrfkiFL8V/txG2uJDv0xwOPJB8nvouGtYzC6WrFynIzzIMM/NaSezTwc4PlgDnDHisjPCPkD5EAK6aBtD+/UZ0fpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MPWi01YJ; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4B9A81A0DC1;
	Wed,  1 Jul 2026 16:57:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B09B5FD9D;
	Wed,  1 Jul 2026 16:57:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98BE6104C948E;
	Wed,  1 Jul 2026 18:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925021; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qkCj0ssMPm11qG6AeK/H9md/QP+Ow5ktlfNd4bttAYU=;
	b=MPWi01YJ/a2z7k+SKa73J1razqKGCbFJjgW9wCVhWIoEpcZ1ohbb3OWPoms4pVfqMVxDAi
	h8Fc8spvRXuo9t00jWjYILUK7QMp2zlOe9AxtsFS1o+FFUe+OK2eM2/Uys5THU1C01JuRb
	fPdmys2wKVNo+uV8owlZu8nKEUdabBRvoy0LP6Vk+BXWniOc2pbffA8i/ltS1ebUrRz5gx
	zJCguZnHBNb6yveL8ABGuJqpUnVNxSilfFtoR7orrVEC247AEUo7B+Qy4OZfIiHOjH7wNJ
	nvqTQVn/JVU25Qk5TieiY1gwVTl+sdoPinwAulFpE/8DsQmoRAClamHIJpQxWw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 0/5] gpio: nomadik: silence boot log
Date: Wed, 01 Jul 2026 18:56:57 +0200
Message-Id: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrB1ILGjpVcRF1F87rSaS0VIQ7
 95ol9/ivZ0UUaD0yHaK+IhK8Ak2z6h7Oj+CpU+mwhSlqYzlcZHAPsyulzerTPArl9XdtQ6wuIF
 SuUQM8r2udfO3bu0L3Xqu6Dh+LRDl7HcAAAA=
X-Change-ID: 20260701-gpio-nomadik-silent-678abaee1e3e
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
	TAGGED_FROM(0.00)[bounces-39329-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 7FF956F01EC

Currently, on EyeQ5, we might get those error logs:

[    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -EPROBE_DEFER
[    0.544274] nomadik-gpio 1400000.gpio: could not populate nmk chip struct

Then on successful probe we get:

[    0.976838] nomadik-gpio 1400000.gpio: chip registered

First line is because we don't use the appropriate dev_err_probe()
helper. Second line is redundant to populate chip dev_err() calls and
shall be dropped. Third line should be dropped.

That's done in patches 3+4+5. Patches 1+2 prepare the terrain.

Have a nice day,
Théo

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Théo Lebrun (5):
      gpio: nomadik: convert nmk_gpio_populate_chip() to goto cleanup
      gpio: nomadik: add missing dev_err() call on chip populate failure
      gpio: nomadik: drop duplicate probe error line
      gpio: nomadik: use dev_err_probe()
      gpio: nomadik: drop "chip registered" log on probe success

 drivers/gpio/gpio-nomadik.c | 64 ++++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 32 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-gpio-nomadik-silent-678abaee1e3e

Best regards,
--  
Théo Lebrun <theo.lebrun@bootlin.com>


