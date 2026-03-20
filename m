Return-Path: <linux-gpio+bounces-33937-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II4qE7N4vWmt9wIAu9opvQ
	(envelope-from <linux-gpio+bounces-33937-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 17:41:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AC2DD99E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 17:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA3BD30CC076
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 16:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF263CBE9D;
	Fri, 20 Mar 2026 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRBE1D62"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670E12641CA
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024422; cv=none; b=Gx8lRLcu8WvZlmy+GUt+RQbHmH0FrZN3gwuu2KGT5L7HcNOppPYDhtpWu3iD1iVQtYD34e3p4hI/qm+2Z3JLpp+1ouDDGlguPFo5j7voZBtmP9AaBF2LMovfRyb53qp/K9uY9HaD8nveYOoo6k78sQbfrHs5xVQc1pQoZZJGSwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024422; c=relaxed/simple;
	bh=aR+lmIyxdCmSGPLX8RZVLT5kQykRNGcPaMNJlitc93M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dJ/HatrwZ8DZYjTly3cQPzG87XqCvGmHvSL9DcjpGQCGVhzs6vTsTzOSTJogNE9u92VxK/tH7MjwiVUkfyLL2Wa8ZEL4OC58nS4BjB6OYvwbcUmNZPWtCtMq6w/1Z0+QFle5uDKIVJ5SxOCmpPvb5eztj9P/XdkaTH7iUcLTDGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRBE1D62; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aae4816912so5362415ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774024421; x=1774629221; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfmjJ6c8eGMhzWErFCRUQJ0ZlgQhdVdCn3Ze9qpx/ww=;
        b=DRBE1D62ykdoBPcTU0Hsmbf464lu8XGAeMttghjy9P0F4RTNyFFbCYueVPLHH/9jzJ
         cdlvC7kAdsUs8yHe/SNIk4Nzhi6t1RPyySDJi/9q3l/3ID/KlrY51jxu8pdCLbyNHd93
         IBu7uN3r9Pwa4CeClGRY+MbOj3WRnEE+ihH5DcoFZp66VXueoSU+SvbrU70w/Bd5mvYu
         JlijYHvs54kKRPnAsvvanf3tyT7+CrxV+MYJrly7QewzRXShvWwJO4utZKI+DdBQWv6Y
         kkrpb2OeN5OsTk5lZ+EpjwkD4SBU2GBEVvFjjCpkwuW6L5AmvB140oWJdznG4DBdwH49
         p7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774024421; x=1774629221;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfmjJ6c8eGMhzWErFCRUQJ0ZlgQhdVdCn3Ze9qpx/ww=;
        b=IwY2B/s8HtEY/C/ok3hcNDNFgkJB10bjV0C/3wPDXfKFBBwtQeYIYUpkn3bMqz3jVZ
         Kotgwgzu3dctQJ1teYICRk0hAMV6VeYfFAvFyS1+IlhqS3Mn5MjNUwltydSzQ/mnIXHz
         QdhFndOBvZR0drIUQSJEJ3VR9ZM7wAZT9E5kAQc09l21mKOmY3xhq97JNSzFkRX5pVEY
         ie8SjGOveI9E6UGp30TZGTRQXS0B9fAmii3vVqMI2H6nQa3HLBIMZ6HD+eLFAdbG0ykQ
         M+7F357oYrVaDSHMHmCY5YtBUPnYaiPN8p1iUaZBydvfbjKBSZUx/6prKIjW1ZhpIJFu
         LdtQ==
X-Gm-Message-State: AOJu0YyHqSHNwBfHS+gJ++tWlwH5OZCidnSEI2lTtjv2YjpkItp1MIzE
	wRyRiqJU4RB3hO5Bd/8mi23Q5QTUAGMmjw0jKPHEmKgx0x93DhB3N0Yk
X-Gm-Gg: ATEYQzwP1MXw5VTBjdsxxiEWEerw/b/Lt8MLaZNNmkg6Xg08FmojFCmF+VLmoyqFcAu
	olr7Xkacs64zICCC3rTSWJo+kQeA/doLCU6xyqnjyriZnil0ncCOVzpd925xwOE5Pm0XXZXwXWY
	8w+ZzIxbwTrRtPWNG2l8X3b2JcXzSopQlBesdyQLQSTSsd18OU8FRqZ/BV5XYRKVNWiZMtfpe60
	Ph9xv63dlw05WIUCDN7JLO/lUiAk8m+sGI+NaTnKYQm5hSPQCpS3h8/sXxlvinmpwna6/+O0WFX
	TCXLvVFKrYoe6/NmoTPA65Zhl0ujCCczPBC1/P1RCh18xtBX9CkDiejUVF9AfwymHab11DyGo/w
	UkpTdYSa9nQALeT7/GPXtoxx+denWl3ylJmFHbGqs2O0ZHhEPasfiLBHhd6EYqbcVa3uOeNx0KU
	tuQ9j7o1LQKZreUCCPzfci1ynnyWjhFT+wslNk
X-Received: by 2002:a17:903:3890:b0:2b0:6638:b357 with SMTP id d9443c01a7336-2b0826c751dmr38677055ad.11.1774024420634;
        Fri, 20 Mar 2026 09:33:40 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655718sm27803345ad.39.2026.03.20.09.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:33:40 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 21 Mar 2026 00:33:38 +0800
Subject: [PATCH] pinctrl: rtd: Fix error handling for
 devm_platform_ioremap_resource()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-rtd-v1-1-9c2022f73826@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOF2vWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyND3aKSFN3UNMukNMs0y+TURHMloMqCotS0zAqwKdGxtbUAyyHzO1U
 AAAA=
X-Change-ID: 20260321-rtd-ef9bf9f9cea7
To: Linus Walleij <linusw@kernel.org>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774024420; l=1164;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=aR+lmIyxdCmSGPLX8RZVLT5kQykRNGcPaMNJlitc93M=;
 b=it7pbsbghx0plHCQLPBz8e00h2FZ5zS35ZXSw+qkKY8sbh+QNUlSzGixvhqpQGMYm4sKDjcBx
 9+cez223GNqAySw3nxidxk4+ksCJbaj4+dA7vosVPWKJ9baR9MyOZy0
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33937-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C13AC2DD99E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

devm_platform_ioremap_resource() returns ERR_PTR() on failure,
not NULL. The incorrect NULL check would fail to detect actual
errors from the ioremap operation.

Fix by using IS_ERR() and PTR_ERR() as documented for this API.

Fixes: b7f698b22b8b ("pinctrl: realtek: Switch to use devm functions")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 60dfb39bc986..429c94b79c49 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -574,8 +574,8 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 		return -ENOMEM;
 
 	data->base = devm_platform_ioremap_resource(pdev, 0);
-	if (!data->base)
-		return -ENOMEM;
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
 
 	data->dev = &pdev->dev;
 	data->info = desc;

---
base-commit: b5d083a3ed1e2798396d5e491432e887da8d4a06
change-id: 20260321-rtd-ef9bf9f9cea7

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


