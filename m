Return-Path: <linux-gpio+bounces-32329-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPrOGaP8oWl4yAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32329-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 21:20:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F91BD89E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 21:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5715D30A66EF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 20:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED023472780;
	Fri, 27 Feb 2026 20:16:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246E238551C;
	Fri, 27 Feb 2026 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772223362; cv=none; b=hz/VFzpSG2Dsgg0spzI6PywhTCIKiAf4PAMKHIOFWatSS8dbDadMlafQNT1KcBzciXMDK/2P4STmyr1loqMOzrDlQiK3KPKms3cNQXUJDdjLqdBgFpbpnOlcXSsB1S8apQq8V05dakQfG5ZGA7OoBhCzdTtMUa7Ua4N0Wx1Atyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772223362; c=relaxed/simple;
	bh=EHJ9XQ04srkNeONNe7ib67kFaOrFrBC+JF4zaQrbBFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=azjRPxGbkvamPePm9jOAc+rNEPTDG1Nqlz5fW24rUEOE2ojgE2dxI6rLwTj/Jq+ctl7g021QGiN/wwMwPr6lHXK3dq+XPIJS9nef0XoRwiK/Kg88xKCzhay/CO9KgfrGtJT8gsUf7VCHI6fRkwxYZV/nPlLQxuZP7xW9l8aBWf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.156.129) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 27 Feb
 2026 23:15:47 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] pinctrl: single: drop useless assignment in pcs_irq_set()
Date: Fri, 27 Feb 2026 23:15:14 +0300
Message-ID: <20260227201515.22577-1-s.shtylyov@auroraos.dev>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32329-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-gpio@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.810];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,auroraos.dev:mid,auroraos.dev:email,linuxtesting.org:url]
X-Rspamd-Queue-Id: 0E1F91BD89E
X-Rspamd-Action: no action

In pcs_irq_set(), the 2nd pcs->read() call is only done to flush a posted
write -- the actually read value is ignored.  Drop the useless assignment.

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
The patch is against the for-next branch of Linus W.'s linux-pinctrl.git repo.

 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 288c9c9bce9a..d50122c694b9 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1423,7 +1423,7 @@ static inline void pcs_irq_set(struct pcs_soc_data *pcs_soc,
 		pcs->write(mask, pcswi->reg);
 
 		/* flush posted write */
-		mask = pcs->read(pcswi->reg);
+		pcs->read(pcswi->reg);
 		raw_spin_unlock(&pcs->lock);
 	}
 
-- 
2.53.0

