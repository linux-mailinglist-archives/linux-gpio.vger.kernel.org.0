Return-Path: <linux-gpio+bounces-39758-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t95zHgHaT2q2pAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39758-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:27:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C47FF733D20
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=dk3iUo6v;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39758-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39758-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3013303CD21
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 17:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DA2466B64;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8624839DBE5;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617885; cv=none; b=cAEfxKZvkxylM+wdE3tzsfuEOA4ik38wVK7EqYcRDetzHEwXlVybCQx+bOLqJXhL2v+hzI43KWVGpa8rZEZ/8R8nZ6/e9CV2tZId5wnao8weuR5F8ApbgcwTncyfwY9INxg+2dpcKwgEWFsPoCBhPpOSixG2DK6lh0Fl5xDY1/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617885; c=relaxed/simple;
	bh=oqo324D+x08yTMlxbQ9JZAmvzprnFd+aGHg0th0+FuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+wG5iEcN7B1EqWxmAkiNtJ0MhANzicWzhFlhR1XKD1ST/njrmwomBFuRbc6D0bY/kXXmhVbSuW1B7xFG1aaW0Sd5wTJ21s5p4JIGegBMcRiVuxIMR21raRJFV3PWAbHHjuDShaKgX8TsIDx1aL5HmP6WSO2321gk14Rhq8XLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dk3iUo6v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D42BC2BCC6;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783617885;
	bh=oqo324D+x08yTMlxbQ9JZAmvzprnFd+aGHg0th0+FuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dk3iUo6vMCGkbTLkxjdL+tGFTpfPvduhdZbAmE8o5bb9p2HpVz9WxDIVIIgdrW40Q
	 ofRENFzzbksDuDMSmekLtAGa/d22t03qyYwPHnHr7S3mSge0PspYL5nJDtk0yzsYPo
	 nDRBfvvj03zjyL3Fv/x31y/jyJB/GfmOOJ3oTgF7XMPhCumnymijH7E6haNdg3TC2T
	 0aBo77dxdrDWO6cwz4szIOZyI/LQRU4rsxaBdmDybFDYHxWxMxyMh9GyzpGwjCmUVw
	 3FGJImFfjnDO8T80v6Jp71674aqvdjdxQ7g73A3D7igoiYc1p5i2nzqj7HC6nrHEw5
	 RBoKfAfySJLMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F220DC44501;
	Thu,  9 Jul 2026 17:24:44 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 10 Jul 2026 01:24:17 +0800
Subject: [PATCH RFC v3 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
In-Reply-To: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=6DIyNM6vk8kNUgYv2UMACNnAgWrwjVEMmwrMrjQaG1w=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqT9laQoS/W1TgxTSN1SCglMJJtjwj2YT8MECtB
 oRP5hv9IeOJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak/ZWgAKCRCwMePKe/7Z
 blCUD/9pNvN8gSSS6a3VjlnLiQ8jP85Fe7Hb/JJFzVyUFgn96iGrh6fbAidCx4W7POD8znirXWd
 iyTd56KCOwMlZ3v113ZCLokJI3lAX/ANUIdFwLEXyvs/9XVyxASiMwt5kBorDzel5QzH2X3wsPT
 JkQstDtAN+A1LBywfj5FIv1PFWv1BbykR+xxd/p+kK25XiT9jyHnsv+F33x98JuJBO6nM8HLHrl
 rVIaDWPlDsAZNhPZbqeW/fiC7wjh2PdYFmWaS5RXqyrio+CPBuqPf/XSxAvcPEyXn2Af3LH4JaK
 VKlCjo2AZbcba+/TuuyQdysm5UlKhgoIT6OoFJirJFsodH/6iUjAlqObX4scH7Y1thsKuNrOFph
 zLQ4zSbPdnDyvI7t9cXKpzOa+cuC0w82fYHtoSfRoBzeKgkHZcKSwSSjn6KUFOv7Z4rc5rOAWkK
 Blruq/sWI5oLoJz5sTW1M1D2aJB4E7MfUCG36Tyw7xaOFJeU5/tFrp2FG17FVOdVTQ9VPz6XhI2
 F31khTacQxdP54yl4Dqg9BvMXs7a1dCKQ2dbw7D2qbkzWRJv8oozuLByjvyx5rh9ozafRSXbuHa
 1hnvmpwD3zCAxswr+FAENbawu32dtU8+Pxn4jIBYtXeOHss+BI5wzrwpqlngGn6k8Cd99MW8Diz
 oeLohfmqbib5YmA==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:openipmi-developer@lists.sourceforge.net,m:shankerwangmiao@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39758-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[xry111.site,xen0n.name,loongson.cn,flygoat.com,lists.linux.dev,vger.kernel.org,lists.sourceforge.net,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[shankerwangmiao@gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C47FF733D20

From: Miao Wang <shankerwangmiao@gmail.com>

When parsing the mode string from BMC, the string is manipulated
in-place with strsep(), preventing from parsing it again. Make a copy of
the original string and manipulate the copy instead to fix this.

Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 408056bfb2fe757a5bde43775a483a48352e706d..27f6e096404d67459038a0607378057ec7ef69ab 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -427,34 +427,54 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
  */
 static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
 {
-	char *mode;
+	/* Assume 64 bytes is enough for the resolution string */
+	char mode_buf[64], mode_buf_orig[64];
+	char *mode = mode_buf;
+	const void __iomem *mode_base;
 	int depth, ret;
 
 	/* The last 16M of PCI BAR0 is used to store the resolution string. */
-	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
-	if (!mode)
+	mode_base = ioremap(pci_resource_start(pdev, 0) + SZ_16M,
+			    sizeof(mode_buf));
+	if (!mode_base)
 		return -ENOMEM;
+	memcpy_fromio(mode_buf, mode_base, sizeof(mode_buf) - 1);
+	mode_buf[sizeof(mode_buf) - 1] = '\0';
+	iounmap((void __iomem *)mode_base);
+	memcpy(mode_buf_orig, mode_buf, sizeof(mode_buf_orig));
 
 	/* The resolution field starts with the flag "video=". */
 	if (!strncmp(mode, "video=", 6))
 		mode = mode + 6;
+	else
+		goto invalid_mode;
 
-	ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
+	ret = kstrtouint(strsep(&mode, "x"), 10, &pd->width);
 	if (ret)
 		return ret;
+	if (mode == NULL)
+		goto invalid_mode;
 
-	ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
+	ret = kstrtouint(strsep(&mode, "-"), 10, &pd->height);
 	if (ret)
 		return ret;
+	if (mode == NULL)
+		goto invalid_mode;
 
 	ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
 	if (ret)
 		return ret;
+	if (mode == NULL)
+		goto invalid_mode;
 
 	pd->stride = pd->width * depth / 8;
 	pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
 
 	return 0;
+
+invalid_mode:
+	dev_err(&pdev->dev, "Invalid resolution string: %s\n", mode_buf_orig);
+	return -EINVAL;
 }
 
 static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)

-- 
2.49.0



