Return-Path: <linux-gpio+bounces-35256-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDj5KkYG5mkIqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35256-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:56:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A6429A49
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BACD4300C6D0
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CEA39A7F8;
	Mon, 20 Apr 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2GApaAd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4463439A809
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682561; cv=none; b=MJXbAwBGanAB2SbivmfqHS0fwFCbuOrtbI31FMmxA7JFuGfnBdOsd/aRQw6RXWyJsgSLB2igwCP09P/v9GglYM3oTagU2XcIO8Jkyakeu0mFzRd8eQWYSWiRah5tHm3y+i68VEESEN/P+/I6NyvfUmwTOoST+meZqfs4qnsOG1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682561; c=relaxed/simple;
	bh=A1WSNvZBH7Gl27blE0SBf08sIf2c8iIjtoiwnzlc7uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fgHCqcbD6cEkpa8vBKwM+JzEZxOPCM2FwzA2wam5MQKgjUbo+rGB4Ibdn4GIPMYFYPEaLM/4IPshNCi9pqm19JwmgAgQKWV6nyCdNCsb9fv65PZjBxz0xWEX/PI6AEa08K7uacSfQyFlJ6fI41MLO8TUeEW/OtNQZJQ05FRzqmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2GApaAd; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f946efa38so1262364b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 03:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776682559; x=1777287359; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86QtRyfODNt78/15/vwrG7dKY8dGMsIZ3LKVUkBa3Dc=;
        b=C2GApaAdsHE7hO+QI7QaLC/4rKSN2OBn/3C3cmOQ/fffZy0NdG0dDnyHdIkuYyHGox
         v7PSppjq7MuPiB1sWepxOamDkZosu+uhls4qDhCx10bEYXzjxNXqfIOnjr+iLRUi4OfL
         JAd4BrAP3bt3jhwHi8dP0o/DqfkmQr+CflM9PZ5Vq8DODxfmjdNc6nf+U78UEkkDNNgm
         2QeCoku0INurif9YOJbzXzHN7yUywsJz2RcK4hty66vfso6haffGsbZpEGG1ZE422PQb
         exrRwC/v6L2uErWsB5C4GRivZdfhumqbVCThkUIq16mLQsmPhj2UA1Q54VO8LRp0GaI0
         /S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776682559; x=1777287359;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86QtRyfODNt78/15/vwrG7dKY8dGMsIZ3LKVUkBa3Dc=;
        b=ewTCb35TMGQxsyTi4I2sQpFvxFShVfjuiYw7aG8xMKubVfZYS1gX+ldN5WOKeAVLnX
         WXvjo6689CGmn0+Eft99zItRTbxWcP63DHuu3B8J2fm4ZqmWsQidsKxdyr8A/6dbZRux
         EpnFOZNWbEiD1RbpaSFy5mZVInDdKuGLJg1RehgDHqVG8RExh1Xr+4tNcNBb2GIbIhbY
         n4P9GtKPo8YhHiZO5mNpS1nfzdbpHux1Yi5afIja1osfks4tMYKtMqGEWVk5W5ZAQOxU
         nkapz4vdb9NRmZgF211sYujFOk9u+42GJmfY0WeCXqmTA++lu591sFJJfONOvYiNOY7r
         q2IQ==
X-Gm-Message-State: AOJu0Yx8VAl/zXqMUpMiYIsnERfQyW5x2GkOE06xsQW4n4Fgie4uGSwC
	sdJNeiddqtRFlKAoW2Dos1r64O/Fx/6XwS9kibaGKCl+KXqdhVCzI+2WbzeoYRDt
X-Gm-Gg: AeBDietfU3vFG7LFwp1yTboxwiGDXMOS5ODuu35ps1rmWDYWyGFbKhrah1ywp8VZvxd
	aOgHMPkypu3V8kBhG8UGf++A9/atMva0oateVzlhM+pI2Sm8hYy1Rh+tnnTWxK4G8vZ5wBSPLZo
	lmbRiktziDWd3smvOBsS4EIQki38TvRm6YPxtsdmEE8lBZdalBZ62MGmOz7KaH5I1iKxGC3GdWb
	n1ch+8+909hJu9WFvY+k9VQLluKUlOrKXnrv1ca7UsIbMCTGxavpYOL6BmtIZj69A5GpZSs1n7R
	zvrxAGSibY/QSOnHhpt+9SWB3Bpi1ftFl+/VAGuj1NMJhupp5zk623sbClIwKveRfpuQWeuSDQn
	08QKx/jzh+2tpVa3eRAALFi+NnheX0e3U5M321e3wffE6ohzrUc78q2cGilHAE20W4eDS1uSKVv
	k9zCA9wmocCCcV07+xO8jN991p5ilB5ElOCqMzqdE4UCU9melFLajzDGl0SvD7oWNstqS6ubdzP
	JWDrzGweJXf0JbpLdjWwt3/ZeMajB8=
X-Received: by 2002:a05:6a00:181b:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82f8b389d04mr12288256b3a.8.1776682559260;
        Mon, 20 Apr 2026 03:55:59 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm12227889b3a.58.2026.04.20.03.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:55:58 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 20 Apr 2026 18:55:55 +0800
Subject: [PATCH] pinctrl: pinconf-generic: fix properties bitmap leak in
 parse_fw_cfg()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-pinconf-v1-1-82f8276d8aec@gmail.com>
X-B4-Tracking: v=1; b=H4sIADoG5mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMD3YLMvOT8vDTdtFRDC0uTxGQDo8RkJaDqgqLUtMwKsEnRsbW1AOW
 jILdZAAAA
X-Change-ID: 20260420-pinconf-fe1894ac02ac
To: Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776682557; l=1640;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=A1WSNvZBH7Gl27blE0SBf08sIf2c8iIjtoiwnzlc7uU=;
 b=4KG3p0Phbq/joYNJzNNSAXc7vV/V3sEXN3+vnu2zRTfQmR2eDxVA4yNT4p/ETdVhM12Xwlmww
 PhEA3EdTXZ8AvyBc47tS9XL/nhySJYHqz7zo+yMuXlKamMJK2eGgLgF
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-35256-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: AE2A6429A49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In parse_fw_cfg(), if fwnode_property_match_property_string() fails with
-ENOENT, the code returns directly and leaks the bitmap.

Use __free(bitmap) for automatic cleanup to fix the leak.

Fixes: 9c105255108b ("pinctrl: pinconf-generic: perform basic checks on pincfg properties")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/pinconf-generic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 64ed28309788..077149121628 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -225,10 +225,9 @@ static int parse_fw_cfg(struct fwnode_handle *fwnode,
 			unsigned int count, unsigned long *cfg,
 			unsigned int *ncfg)
 {
-	unsigned long *properties;
 	int i, test;
 
-	properties = bitmap_zalloc(count, GFP_KERNEL);
+	unsigned long *properties __free(bitmap) = bitmap_zalloc(count, GFP_KERNEL);
 
 	for (i = 0; i < count; i++) {
 		u32 val;
@@ -263,7 +262,6 @@ static int parse_fw_cfg(struct fwnode_handle *fwnode,
 			if (ret) {
 				pr_err("%pfw: conflicting setting detected for %s\n",
 				       fwnode, par->property);
-				bitmap_free(properties);
 				return -EINVAL;
 			}
 		}
@@ -295,7 +293,6 @@ static int parse_fw_cfg(struct fwnode_handle *fwnode,
 		pr_err("%pfw: cannot have multiple drive configurations\n",
 		       fwnode);
 
-	bitmap_free(properties);
 	return 0;
 }
 

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260420-pinconf-fe1894ac02ac

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


