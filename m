Return-Path: <linux-gpio+bounces-30959-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mId+FkDvcmlCrQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30959-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 04:47:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 004B270305
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 04:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6138E3005990
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 03:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B60638A9C8;
	Fri, 23 Jan 2026 03:47:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5937638A71F;
	Fri, 23 Jan 2026 03:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769140025; cv=none; b=Lm80k1LnGImgO08FGTV7MjrlDxb9dWSGB8yeAUTNdNTy0et3l0EFLvYJih4NKFXdzB+h3LfVNrY6w6VIhUMv/5tCyez7upV2cMte4AmQUASPDs7k/jlbLjLrj9V/GmR6xftwQ7rN4DzChBxhd6fhzYLZT0+8z3xDIHCLLDEQBGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769140025; c=relaxed/simple;
	bh=9aHMGO/anwtWi10C7W8Ai9OrN9GsPC2DEymoczNF6rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mmaN1U40bNRXcwQNvdPtaNg5HCFLi24o5BCBEizRQG/smvYWHoan1sE/u8m9vo4hn0TqeKiH8jfsyl7ZF/LuKHC1baSIcZErDU3yFUdFahw2X9Wf3FmvpaITTAip4ftlr5/DqqBCbRUG93h8NJmHt2oM9Oc/SLG7P19FQPviTMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 11:41:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 11:41:23 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 11:41:24 +0800
Subject: [PATCH v2 2/3] pinctrl: single: Allow probe to continue if mem
 region busy
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_pinctrl_single-v2-2-40f8063cc5a2@aspeedtech.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
In-Reply-To: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769139683; l=1297;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=9aHMGO/anwtWi10C7W8Ai9OrN9GsPC2DEymoczNF6rQ=;
 b=aC26hM/5lK5cZSG9V/1e7i3Y0dO21BHJzfl10I20XP7hc0ehyPeSZt/1D/st4qqOUGDNQWeMq
 /oGQrN5J3Z5C+IVl3NQ2gKiShy7VO6IaH+Mw0O9EP/TyyyV5QxTUJLB
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:mid,aspeedtech.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-30959-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 004B270305
X-Rspamd-Action: no action

Skip exclusive memory region reservation failure during probe and
continue initialization with a warning. This enables support for
systems where the memory region may already be reserved, improving
probe robustness.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/pinctrl-single.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 757c22cc09f3..e65ae737b4c5 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1910,13 +1910,13 @@ static int pcs_probe(struct platform_device *pdev)
 
 	pcs->res = devm_request_mem_region(pcs->dev, res->start,
 			resource_size(res), DRIVER_NAME);
-	if (!pcs->res) {
-		dev_err(pcs->dev, "could not get mem_region\n");
-		return -EBUSY;
-	}
+	if (!pcs->res)
+		dev_warn(pcs->dev, "mem_region busy, continuing without reservation\n");
+	else
+		res = pcs->res;
 
-	pcs->size = resource_size(pcs->res);
-	pcs->base = devm_ioremap(pcs->dev, pcs->res->start, pcs->size);
+	pcs->size = resource_size(res);
+	pcs->base = devm_ioremap(pcs->dev, res->start, pcs->size);
 	if (!pcs->base) {
 		dev_err(pcs->dev, "could not ioremap\n");
 		return -ENODEV;

-- 
2.34.1


