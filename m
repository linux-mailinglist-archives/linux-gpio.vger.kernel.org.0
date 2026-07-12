Return-Path: <linux-gpio+bounces-39924-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1U6XBRNfU2rxaAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39924-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 11:32:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F974441C
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 11:32:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=jUt1TQwl;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39924-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39924-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C498300A12F
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 09:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00113148D8;
	Sun, 12 Jul 2026 09:31:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC9A194A6C
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 09:31:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783848718; cv=none; b=tvOOb+qu/FQO4nIApFCodXayXC8Rzch4IUDSM8Qh4F3CDUTPi9NToul5WyAfKOA1TU0/iBN4ZsOCKXUY2VoepUL4TP/AruDQoaTW4nIBhMlYNqFH6XNF5rCtOCnm4cg8Y+hXPmEeBDgs1Bt3Qj4SojfxioKh+hrzuESzzEYGlTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783848718; c=relaxed/simple;
	bh=uOHV6GeWeJxMoeQVeCFfwBjwXBS8G4Vko/F0a3VyftI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LY6r/6BGJ5O2mimMZ+eEGoghPsWkem2YmxU/15mBa1mQWvhHeDsjfeE65/fHbeObu0T14oAPytjS9gIwuqEoEJTF7YH4X+GG+0kLSIcL9CjXxmVzCwEbqEizUSXX2/POayZ2rmq1/D4QM4p1Nt64Bb3VFyRQP1R+Huhj/U8f8NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jUt1TQwl; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=9dKe0bFkJgWBTt
	ums8uQV2GtI1zJa6OLV0ZzK7az+n4=; b=jUt1TQwlfiVUC4OOgHT9ygj5aLEsWx
	K2kl13ki180b5MAfAcyR/STJbM/Z2fj093J0go4OB7an6+ajijab1S7aw/W8eVyC
	ZsT3tnqGXTQEIu14yoqypWJoooI0WLJMOByjhmfGoWTy/+r3V9qdOZSs1k90vonY
	OnriMp/JroQ1zC1oXKhr0tLA4FRKeWabOK50l549xnIZHDru4Io2C1SgqTgYzFlM
	6K6IWMTqxBwHLPqvAX1bRj7wu0BsI54LZFfc5pVgDXLbQTSo8rzbjzXM74B1+Ib0
	gG37DFBbXF1itQD4UekWPhV0PL7bRseK54s4qaAFAgt9cFpXSEjjarCQ==
Received: (qmail 2179342 invoked from network); 12 Jul 2026 11:31:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2026 11:31:53 +0200
X-UD-Smtp-Session: l3s3148p1@/ifqpGZWnpAujnun
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the buffer init
Date: Sun, 12 Jul 2026 11:31:48 +0200
Message-ID: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:nihaal@cse.iitm.ac.in,m:wsa+renesas@sang-engineering.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39924-lists,linux-gpio=lfdr.de,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:from_mime,sang-engineering.com:email,sang-engineering.com:mid,sang-engineering.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 734F974441C

To avoid more false positive reports of "leaking memory" when
fops_buf_size_set() returns an error.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 2bbd308ca08e..6748ddce3c19 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -237,6 +237,7 @@ static int gpio_la_poll_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Initially allocate a buffer. It currently is NULL */
 	fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
 
 	priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);
-- 
2.47.3


