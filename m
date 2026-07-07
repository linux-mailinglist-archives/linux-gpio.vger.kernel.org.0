Return-Path: <linux-gpio+bounces-39597-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zx2ZIb9STWqFyQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39597-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 21:25:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC771F316
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 21:25:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=cVoUxcRP;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39597-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39597-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84A7230113A2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 19:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FF0385D75;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E4E2D978A;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452255; cv=none; b=GIYpdZRmOXVPXCE+HMHy9Xk6ytcaA1xq7m4TmUUNbNdYjw9xAynbuAT8hfOq7prQ2RtKVl5R5c4w9SFhKdxtvDEuObNrUy8yccNw1Ldyml/NVxcfUFyea3GYOjHoqCdn4rq4CREV5OZKNhuoCnY+c+kt/0JzUAM/peyGBm9ObD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452255; c=relaxed/simple;
	bh=o50sVtMB7LdmtYLOmm7CDhb/Pz/gS4soxIf+LumvGdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uA5FHKIdpjEpU3E/PzGww7Ph2MUov3F7o2ziSoPvfoxcIHCRrBkkJbTCUyOOB1+CPAgCPHA2d50ydokXCtY5M/nCygkm4c991NFXmDoIp3D7JHFX/Ib6DWax7LBpYjJiZSS4wEZanKXQ4F/xauGE4lI51BrJi+J7lQnb/8aur64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVoUxcRP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F250C2BCF4;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783452255;
	bh=o50sVtMB7LdmtYLOmm7CDhb/Pz/gS4soxIf+LumvGdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cVoUxcRPxhlkvZVtbuEYEYZdP/8o+oEC1L3hj025G/qjflH4PPsg/Ve0gq2ICAm8W
	 eocUMqFhW+j/zow9KOcJcMb2ypVoHBKG7Cjde+h0Uvhau/plABht3RE69IVxzHiHVf
	 gCai92HyRKzQ+Yq8LlAucUztHJNuQhzuZd7P5cgjXOm5vLA3FjCGEc65SR68PawHKn
	 0qvocLblVslWL8WZW7VzA1Iwfph8HA42gwYwpLW+6xBtPlEZnPJWzZmObqPtMZ8esl
	 BYWeoaraewR3rxDDV5hrP1it2tb67Qu3fIVz/ewpP4fJw7YDaoikTKpBDW64ERT71r
	 QvXuTGpZ2XBEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FC1C43602;
	Tue,  7 Jul 2026 19:24:14 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 08 Jul 2026 03:24:02 +0800
Subject: [PATCH RFC 1/5] mfd: ls2kbmc: make a copy when parsing mode string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls2kbmc-mod-v1-1-c344bf5defa3@gmail.com>
References: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
In-Reply-To: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=d6uhdZv7x5iOz3ifWFtBF4oUUkQDTINp64mnSnuoNJE=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqTVJb4QTwB1OpvJ4G88AI6IC3MNIFvGsmIJjKn
 sBXXUXy1bGJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak1SWwAKCRCwMePKe/7Z
 br5YD/9+RIERHl2TJwF1ydYg4FhOaUq2+oLu1kDgE7FYsi4GCjXO9tnc8R8tzEMrgNzOfg+WEx4
 DC/WHV933JiFJnH7Rmfwi2YPwwgP3/Tfu558v0QTGI7qsA+Cr4b/SPDmaD8R6GUsHSOXNbnx4dq
 IQC75Z4NauIVQ/royOtrMhDy2wUq3QfmDI7FB4+OgX5GTuNdfNnYtxICLC48H4wWyDsQydXWmrO
 lkCeqGF2545CsOSUC3s1oCaYCLt64ZeX3RY9Z0WDtloX4xqVYrSUYROTs4iMDLmN2fvhgXVewJz
 /hXWrM93uFydUUNZlGzYJ+TS422yWo+YY3rVeCGtKOtTo92HlcUHbgHZrZvDiuxXgB9F+gdTou5
 QoQI3lH5EoJxc55Sn/mO5zWF+9c32CPrjyDszN1R5FBCwwOcnsGqb8QSzq+nIMwe8xjOWZtsmZf
 +Z2nQ5DAiRhR1Fq6rCm3IKWRdcMGD8un1Terq5WCI8l3md9hvitg68eQbboNEKy2EAV3CyfTBAc
 Pkv7roh0BYPQ3e7/UgR5vIGh8a2M3dT1s6Uyu+ASDj9b344aZaM+b2eDPml4peg34w9MKXZljr1
 6wIhuIAuIZ6ZFJ+ivQvMgwCBYH5OXruI1RnOOP4x6N+R9UZNgWJdqYXweHAox4L0kOmYJYZhHNR
 62i+gDzCy23uSzA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:shankerwangmiao@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39597-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[shankerwangmiao@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[xry111.site,xen0n.name,loongson.cn,flygoat.com,lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BAC771F316

From: Miao Wang <shankerwangmiao@gmail.com>

When parsing the mode string from BMC, the string is manipulated
in-place with strsep(), preventing from parsing it again. Make a copy of
the original string and manipulate the copy instead to fix this.

Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 408056bfb2fe757a5bde43775a483a48352e706d..30b275bc48794a22249aeb8ba805ef78772d3466 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -427,34 +427,53 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
  */
 static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
 {
-	char *mode;
+	/* Assume 1024 bytes is enough for the resolution string */
+	char mode_buf[1024];
+	char *mode = mode_buf;
+	const void __iomem *mode_base;
 	int depth, ret;
 
 	/* The last 16M of PCI BAR0 is used to store the resolution string. */
-	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
-	if (!mode)
+	mode_base = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M,
+				 sizeof(mode_buf));
+	if (!mode_base)
 		return -ENOMEM;
+	memcpy(mode_buf, mode_base, sizeof(mode_buf) - 1);
+	mode_buf[sizeof(mode_buf) - 1] = '\0';
+	devm_iounmap(&pdev->dev, (void __iomem *)mode_base);
 
 	/* The resolution field starts with the flag "video=". */
 	if (!strncmp(mode, "video=", 6))
 		mode = mode + 6;
+	else
+		goto invalid_mode;
 
 	ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
 	if (ret)
 		return ret;
+	if (mode == NULL)
+		goto invalid_mode;
 
 	ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
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
+	dev_err(&pdev->dev, "Invalid resolution string: %s\n", mode_buf);
+	return -EINVAL;
 }
 
 static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)

-- 
2.49.0



