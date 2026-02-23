Return-Path: <linux-gpio+bounces-32082-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBR9O0+1nGkNKAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32082-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 21:15:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC917CC77
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 21:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 674EC300C576
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 20:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D74F376BD6;
	Mon, 23 Feb 2026 20:15:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220D770FE
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877707; cv=none; b=sYG7GzCLvYzlTavjU8glcZ4ckp645SKAu2CCvD8Kbai7NE7OfJ1OvwNDZFBtAQcMioN9/nGEpP7kc5YTsmcifs9HuuLprwLvkElyBi35HNWEs/ERtgOJi4qVJLaK0Ww3JTBLfDxE9bynIgn4KzLzxzQKBWPT3eODFm9HB7zI27w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877707; c=relaxed/simple;
	bh=yNGZODFRqec923/8NYKV0Le5vNL4tv5DssG4ay/hylw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eaiXEyigB1FhBK4Vyme2ZVLqyh9Fq63W1zuxU1vyTBtFjReWebk8yQJEpZvmVpgMALQlH5LZwMlnpBsB2jvPOUd9ThhCFOjZkVHi+T22WvOMh4qFjT/K/Y+m0UeQjEnZhws3xIXis98JgJUfO8ifsKKE1+GnFNgOl2Op9Z8/zYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.162.218) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 23 Feb
 2026 23:15:01 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<linux-gpio@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] pinctrl: rockchip: drop NULL check in rockchip_pinctrl_parse_groups()
Date: Mon, 23 Feb 2026 23:14:10 +0300
Message-ID: <20260223201412.20708-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32082-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-gpio@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxtesting.org:url,auroraos.dev:mid,auroraos.dev:email]
X-Rspamd-Queue-Id: 1ADC917CC77
X-Rspamd-Action: no action

In rockchip_pinctrl_parse_groups(), even if the "rockchip,pins" property
is absent in the DT node it parses and so of_get_property() returns NULL,
the phandle pointer is checked for NULL amidst the *for* loop after the
list pointer (from which it's copied) being already advanced (and even
dereferenced), so it can't be NULL anymore (unless we have a wraparound);
thus the NULL check seems pointless, and when we drop it, the variable
phandle itself becomes pretty useless -- let's get rid of it as well...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
The patch is against the for-next branch of Linus W.'s linux-pinctrl.git repo.

Here's the prior patch adding the NULL check where it really belonged but
eventually ignored by Linus:

https://lore.kernel.org/all/179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru/

 drivers/pinctrl/pinctrl-rockchip.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 816823403e97..8e195f951b9f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3863,7 +3863,6 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 		return -ENOMEM;
 
 	for (i = 0, j = 0; i < size; i += 4, j++) {
-		const __be32 *phandle;
 		struct device_node *np_config;
 
 		num = be32_to_cpu(*list++);
@@ -3874,11 +3873,7 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 		grp->pins[j] = bank->pin_base + be32_to_cpu(*list++);
 		grp->data[j].func = be32_to_cpu(*list++);
 
-		phandle = list++;
-		if (!phandle)
-			return -EINVAL;
-
-		np_config = of_find_node_by_phandle(be32_to_cpup(phandle));
+		np_config = of_find_node_by_phandle(be32_to_cpup(list++));
 		ret = pinconf_generic_parse_dt_config(np_config, NULL,
 				&grp->data[j].configs, &grp->data[j].nconfigs);
 		of_node_put(np_config);
-- 
2.53.0


