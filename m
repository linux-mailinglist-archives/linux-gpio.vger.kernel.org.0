Return-Path: <linux-gpio+bounces-31799-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBB8MBbulWlTWwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31799-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 17:51:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668C157E5B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 17:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B41F430075FD
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 16:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1FF33FE2A;
	Wed, 18 Feb 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gjg2CntO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA84B3090C2
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771433490; cv=none; b=NdT/+dNTtg9hm3x98c+l+yiS9eQwyZUc7MecA1sEjufP1KKubAIb4GzflWhkrdjKZOJhAWJ71trt7swOF2t451yqHqTgy0ZBbUCMndldC3vZawvS2nBNUarhy3Vv7j1tS+QRU6cnJSVQdBnAIXrD57VdP4tCYQTd/p59DhFVkmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771433490; c=relaxed/simple;
	bh=T+ddj9uth8B1FutWkYbruKcbeWNS950unthpcpOU8Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=poG+cqiKhwbb8ubld7nxA/3gLA9s1SaaQGFWJz54m0JE/AhlXfAHApobm5hqBv+uvT2V9o4nQdmjzoLGSJXbVPZ6KNgE09+eiK6odDYaVF6bNZqA5nNDXoXxQ1VaOGoLhFC7jTocLvdGgDJ7E2TuKj+ygLBmI/siCwYyKBRkGM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gjg2CntO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aaf43014d0so39793595ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771433489; x=1772038289; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uxHzVkbJVuUf9PPiRw/JbF+frY9YqFQFTwH6XtexsFQ=;
        b=Gjg2CntOtpi9QBPoe+xCpItVxsVDN9QCLphCVTKSsEK+0AROCaMslZPWoae4cOiA+a
         eIDrLuxKbMHxxHWHQQP0gn7dYU/jLEarSSfCuvgUtnn+4hqEfWJZ3eikV5GUF2piI7bv
         GAJHm18MSpbQY4lWy15AN6ioSqIF8t/58OKWzQDg01Gy+haNcUI7bBhMuwvc9VWlrIX4
         G4wb+PupIlUf+NQu5gQ1relHQlouB0A2mEU9e79oPXBklm+fdG0y9caJ/n+0qUPpQOQ3
         wHV47+yn+wyz4YPJF03GcxXwkBgxXC4w64n/0jYdQAsXwCL4WORuTxktfxrmlZGEI7hm
         QsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771433489; x=1772038289;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxHzVkbJVuUf9PPiRw/JbF+frY9YqFQFTwH6XtexsFQ=;
        b=Yxxw/+/hRWz8JR17XOLva4ylkp8CEQqr0vDyHSh+gp4IVuVQKVIaj40cJIj0o48/Ey
         KWzz8BndxSQl65WYZN+7GWC2cn2SohBp4nqefgjQD6OCQYDWpr1pjSbVRzdfSHWl0dpY
         GR5X6se2MRy8HtttKzFOyfCKWSKHodek9ItnTvNotD4sVhuYxSVrvDjB9CDLnI942HWs
         XyjQVjNpN28V3cTwNlw+BNwqckXlx/jg783+xwl3ruHxQts+Tzizu/QZohczXCh5SUrW
         ui2Vf7WwihVPxtuHCcXCcotdqEs6KFOoW+OR36MZAiAdpCd6d39wJOR5Ij0o8A+yocMY
         bD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU99ABh5J9n5G9XiUsOh1yRmTs9CsP/IQ7y3CNVF4YitACf0wbjo/Ly4BIfrZQ2ftJzWZ5MCdqAb4n5@vger.kernel.org
X-Gm-Message-State: AOJu0YwZA1RkFyG6LmN+0oAWnL7MHZ6ZyNPtyGEoyFMW3IVOSNCS7W9F
	xks7j2VZXrAuhtKzlTDoUiwqcSBue1iP09h1rQj/gniOHDHzgvE0nNcf
X-Gm-Gg: AZuq6aI0xL2yhEY2oWXw3ZmS9a2z0A98qFz/hnhXomVY2Ye2s06hdNRuQiilmSt1+Cv
	u1vzU4+LiH0qsfQoGrFwWErVFf54DqclpKDdNU9IPJnhcpoGzQKx6vB8oWyCsBq3f1v1xTM36l3
	xWocxidW6yXfPlac0pS3MDV2b8PqNTvVafAp/hUSlxr61j5O6Bk4tXi7ZC26Fc407curRF0hC9u
	GjATCwcRxheG6CQewpNO7MMdjev6ppJ/QqE8hOULgjjhFxdlJz8i+2zj3NhtHv/jWyLduuD3rAY
	FfdhphBQQrRiN8UCegT7y4Ty655DyNLGydXz8iGabIgooJvW0IJKhDnrS+ads5NhC42g7Yu8H3p
	jp7Ejraor7lZJ1JsA97id+AoUuO27b4oxlG1t6Gow1Ma6UFJvcS1Jil6tj2pSq2QezQMUg4oYhn
	0mKAZwjOcvairqu3ch6LiGc+GZsXaeIDL6vEGR
X-Received: by 2002:a17:903:244a:b0:2ab:3cba:42fa with SMTP id d9443c01a7336-2ab4d06157dmr192384245ad.46.1771433489047;
        Wed, 18 Feb 2026 08:51:29 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:403:e988:3f54:236b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa5cbsm176996885ad.9.2026.02.18.08.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 08:51:28 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 19 Feb 2026 00:51:22 +0800
Subject: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference leak
 in aml_dt_node_to_map_pinmux()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAnulWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ML3UQTXWNzC6MUsyQDS5NkUyWgwoKi1LTMCrAh0bG1tQBDzA8VVAA
 AAA==
X-Change-ID: 20260218-a4-3782d6b094c5
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771433485; l=1449;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=T+ddj9uth8B1FutWkYbruKcbeWNS950unthpcpOU8Mc=;
 b=j/cNO7oUv8KJAFH9hBKE9Q7aZLY1Mc9Wed+OTyOZmsNOTm2f+C274WzqExLijzSUROkMgdDav
 o4mMxRI63ByAnFOh6LcG2J0gZRy7RUaJv0GeXAc9vcUSRSY7hbUR4BM
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31799-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amlogic.com,kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2668C157E5B
X-Rspamd-Action: no action

The of_get_parent() function returns a device_node with an incremented
reference count.

Use the __free(device_node) cleanup attribute to ensure of_node_put()
is automatically called when pnode goes out of scope, fixing a
reference leak.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index dfa32b11555c..e2293a872dcb 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -679,7 +679,6 @@ static int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
 				     unsigned int *num_maps)
 {
 	struct device *dev = pctldev->dev;
-	struct device_node *pnode;
 	unsigned long *configs = NULL;
 	unsigned int num_configs = 0;
 	struct property *prop;
@@ -693,7 +692,7 @@ static int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
 		return -ENOENT;
 	}
 
-	pnode = of_get_parent(np);
+	struct device_node *pnode __free(device_node) = of_get_parent(np);
 	if (!pnode) {
 		dev_info(dev, "Missing function node\n");
 		return -EINVAL;

---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260218-a4-3782d6b094c5

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


