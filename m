Return-Path: <linux-gpio+bounces-38735-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id daAyNNOaNmrdBgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38735-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 15:51:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2638A6A8F6D
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 15:51:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=neuhJ0iI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38735-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38735-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDB203022FB1
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 13:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31704394E8A;
	Sat, 20 Jun 2026 13:51:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6643909B8
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 13:51:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781963472; cv=none; b=CnMmC72FNRBUoVnvekY3Bxk6OjpXc+LfdQI14Nol5gcc7ZeECEq3kKqyOcb3z/vNltdkJz2fPfDiBjC1h/6KTmgY8mefRrDxB05MFRbHrKNcvM9sdGUOqkDGt3oHsdtTuiPpU2qI29LPanDqURJQsV4wDY+B+S7kWbRVf5+HbK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781963472; c=relaxed/simple;
	bh=vsWvCjtfymrcmay0Rw3p1NHT7lXjUQgkmmFab6mM9xA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ecr4zxZnr6ZIRL2MvxD8mgh8+wE7qhoERcnhGirGxc9iQ/tBh8EFDD1vP03S6oCuQEavw16JlJU9S+KnZbKQXcYEzjf0z2SM9H5UvbcR1XP7220Mp5KfOFPMe9dlnhdSQzqrzQA75Hqhy2d7fLL4k1/mvnYMZ7j7i2IZHgyETYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=neuhJ0iI; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 142CE1A02DF;
	Sat, 20 Jun 2026 13:51:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6847601B7;
	Sat, 20 Jun 2026 13:51:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FE40106C8906;
	Sat, 20 Jun 2026 15:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781963460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=SJbxflrCbtXmtC7FblseEmveq5gYKr2WgYAzv782H3Y=;
	b=neuhJ0iIjELhNf9L+39YGI/qFNon86fpbtC0JGPFEClAImh5vPlGkZ4MaSQ7SZ4/RAl7F/
	P1D2ElBhRFWenrnoHI5LVqatuqLTEZT8azs0oYBsKwifbmvruOsyzWKbXXQrn7fTnkNExA
	oVlI2igUN0MOYXky3xMcbPPiLGjRyiG63fo0N6apcZctFU1AccM5fGvPL8A/0r56Tb1mo/
	hO4zlpvT1Ijn37FPXckwqPXSHYGrqAGQLu5qH/iLx+jw8X7rBMb+eBZ/1Lc7f4pdtopSV/
	wa9+mcs75vL54US88kD/NtcNjOR9hKhX2NOEmYhQ1X1sKYTcE03iS4MBcPhu2Q==
From: Diogo Ivo <diogo.ivo@bootlin.com>
Subject: [PATCH 0/2] ASoC: rt5677: add GPIO get_direction and enable
 standalone compilation
Date: Sat, 20 Jun 2026 15:50:57 +0200
Message-Id: <20260620-smaug-audio-v1-0-e318acdf5abd@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMD3eLcxNJ03cTSlMx8XWOTNAMjA8s0I6MkEyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgB+FGRPbwAAAA==
X-Change-ID: 20260620-smaug-audio-34f0209f22b4
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Diogo Ivo <diogo.ivo@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=diogo.ivo@bootlin.com;
 h=from:subject:message-id; bh=vsWvCjtfymrcmay0Rw3p1NHT7lXjUQgkmmFab6mM9xA=;
 b=owEBbQKS/ZANAwAKAQa+fFtWXslFAcsmYgBqNprNAeguCtj5+yJX3pkMkC0ctFR6DII9jZfie
 0cXXxCz4b2JAjMEAAEKAB0WIQTma35o1i1081e8B2UGvnxbVl7JRQUCajaazQAKCRAGvnxbVl7J
 Rf+kEACAgxgnrhDXfyJPZO6sS1D34Tz3BQvo5OA2N7x8tzIrJEDIFBe+Nx4//kLzxcA+hhU/rdx
 zfhND3y5Cndm9YbtjkJz69Vf5vY0Pf5kGbzN9Xwb1M+0BHqeJnnoSFR68aK8Hnzth70kW5PCWf+
 yChYZukMLK//jz5oksCIzNsYawlE19h1XwNX6fLQG6wRiSXYS+jGLtJca9mtsYTs5vs6kdDqNBx
 glmfy1yEz/r2/Xvd72Gz4z7RasH0fAlKEGQ9frzRzV0l+9COiwz++mHsIL3yGm7cUh1FZBGSIpR
 WFItHPv5BF7D0Kdp8a0dbm8N8/LabkwRCz6BGO8Kz/LSIBUB0OzRpEo898dYoQPM7fuC6iagMhy
 qzoyqeZ6tOyIfen0V2ICc/2RjBfGeSGKjD5jvyo8txyEolyUHb/e4HspsHkaXDZl7oagJjgcekw
 Lud5K7halR451ZqTx7CjzJnn2edPuDTQAoslVKA4BXtSPTlU/soSxEKQUaZ7ODrdyBbe+XtDjHr
 fDQhgqikGJ29yRCecyUmxjeyWQP1iInqirbVT07twckJ1dvyAmoL0MaVSTa65meJJGdy2HR+mVm
 PiCFmODFtQcc8i5TIAsG3hlyX6p/NvL+2glciGCfFVnVMujELcn5+DzbAWbhcTmG2nRafwkNlEX
 oKYyy9r+EMkYQIg==
X-Developer-Key: i=diogo.ivo@bootlin.com; a=openpgp;
 fpr=E66B7E68D62D74F357BC076506BE7C5B565EC945
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38735-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[realtek.com,gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oder_chiou@realtek.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:diogo.ivo@bootlin.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[diogo.ivo@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diogo.ivo@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2638A6A8F6D

This small series fixes two issues in the RT5677 ASoC codec driver:

- Patch 1 adds the missing GPIO .get_direction() callback, allowing
  the direction of GPIO pins to be queried.

- Patch 2 makes the Kconfig option user-visible so the driver can be
  built standalone for example when using generic audio-graph-card
  bindings, which do not pull in specific codec drivers via select/imply.

Signed-off-by: Diogo Ivo <diogo.ivo@bootlin.com>
---
Diogo Ivo (2):
      ASoC: rt5677: Add GPIO .get_direction() callback
      ASoC: rt5677: Enable standalone compilation for generic card use

 sound/soc/codecs/Kconfig  |  2 +-
 sound/soc/codecs/rt5677.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)
---
base-commit: 1a3746ccbb0a97bed3c06ccde6b880013b1dddc1
change-id: 20260620-smaug-audio-34f0209f22b4

Best regards,
--  
Diogo Ivo <diogo.ivo@bootlin.com>


