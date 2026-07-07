Return-Path: <linux-gpio+bounces-39608-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yiaOARVtTWp3zwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39608-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 23:18:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA371FB7F
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 23:18:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=tUecOhik;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39608-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39608-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 471BC3054818
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 21:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506CA348C5E;
	Tue,  7 Jul 2026 21:16:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F7329C6D;
	Tue,  7 Jul 2026 21:16:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459001; cv=none; b=H/QwDgGVRUAPouJAjN/9GMEk+Rh1NF0CoDR+v78YuiHg9oeyZQFclyH4VRGNHZpUJ4mX1fcuTGba6xQ3ox6klTTcI/wMIkXQFrQlRkOVSCwtPUZ30sma6QnJpVb4vOQG04OfEb5VPJ3PxjpdokWWJb4tXDgSaTGoWxT8eB8kTsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459001; c=relaxed/simple;
	bh=VkGNt9rEV3O3iY0FLpHZ/h3Jdpc8VGtwm0p1C+EFawM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UhINNb3PcFJipjNwyTq8OxbIb7Wi5zNV4KiCk08DIijbca+Izupf/aQgUmPsqsSZYewCg7Y+HYoeCxnSr2G72JXAmjkGVt43hWRKsLT8XThHkYltu0KckHFAMscwGK8Y9R+L365z99b3Dyb2ZZIou4Btu0JZ5DrQ6PnS5NQ/G2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUecOhik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F70EC2BCFC;
	Tue,  7 Jul 2026 21:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783459001;
	bh=VkGNt9rEV3O3iY0FLpHZ/h3Jdpc8VGtwm0p1C+EFawM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tUecOhikn9fJGLafTlDNZLvahz/sqc8jn4hUa0vywRdY4ISsOUo8YfxEoaN2W2z0V
	 oqnl44H4Xf/uH0hnb7wgrpv5cS8kDdo0ZcOC1S653djDLLozeWs2vaBgFEd9xfMmdc
	 NyZb1cZSB0fI+QhXjkiwwmDnOt/wd62BjczOmHg7E1V5iSqSJa5np4atWZMyE+d9J0
	 17Lp4z9BeIZlUuOxJN7pDT0PpZqp/joR8XxBg395IkNQpcs+tequvI7MCaLdGgBeOI
	 Q0N55A9t5YSNKMFRcNEgDGW3jARQ+rg2fnaOQJwgOjgXniGj2YDC3hVwagBt//3jQI
	 jH2O8N7ls/+Zg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D934C43602;
	Tue,  7 Jul 2026 21:16:41 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 08 Jul 2026 05:16:28 +0800
Subject: [PATCH RFC v2 4/7] mfd: ls2kbmc: Cancel the work queue on removal
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls2kbmc-mod-v2-4-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
In-Reply-To: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=mntUM15kvZ5qHuhBJ5Gk7CAScyEYG01WrWkE9WJIf5U=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqTWy1krEPRRnT/H3otyGIGhIUHD0Mm+LAVg/ql
 PJvdFu5SWWJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak1stQAKCRCwMePKe/7Z
 bjwUEAC3WeBgthTssDKCJMjpBmHqP1cLuumVsXMoGAuCuZR4bRRWTd2sUuKbZ9qLvCZ8OhCWia2
 qjPnz4nDwGhTXUtrWCd7UxXUPgeVthzPgRGDbimRGBxoeRJq8TkFLL1uMe+t0tFqIOykiwJA7rW
 6z86ncz8nO5CvVSFQaiMOfqv5FDYEOC/7EUcQZxQfrgjZnapkTnJ+1BtdtsoszYfcVJ1Jhrcqzl
 LSEoTygOYic8J4WYD7AzPu1bgrpGS3sVGxB8t1ZcH6YYH3YMyT7NFwwtnfoDk+K9qnn/zY2go52
 Ma/9Vl9c/M56G67k7sRLYnb7ZHgqov1Gw7mdCAh758PU1lanOFnWvYKmjPMZSXXUj8MUcHbjk+A
 Bcz53rqkbMBO9+Ida+WELb31Mude3udQQ6OwA6Vqqb05xZfOFsPON9jrAj6xQhU1/PWPUvry4Yo
 nberd0LQYTn6DVEYbleYSrHzjgRIGpaa1ObgDxQt1aRrs+F60SPZZt9rHb7SW1iTdakDee7W7l8
 9zLeL9BcrWi1VF8cU4eev5v2KluzoFj7qdDUho2lTAByNGh0xcN/KByh0GE1n/7BHtesxEUJRMu
 BkwwfG6+DEC2sDyskhc4eGCQzEXI9mMeymGG4E97XWpQqh6yJoKAKSx1Z2fceLigKYSC2DfbGgf
 QsdzMFAWaE5f74Q==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:openipmi-developer@lists.sourceforge.net,m:shankerwangmiao@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39608-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DDA371FB7F

From: Miao Wang <shankerwangmiao@gmail.com>

When the device is being removeed, the work queue should be canceled to
avoid any pending work to be executed after the device is removed.

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index a5465c42a77b8b7b81e3ad787d6036679c6ba6df..f87224105b3720cca97dcef089dad63fe57bc8c2 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -375,6 +375,12 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc_ddata *
 	pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &ddata->bmc_pci_data.interrupt_line);
 }
 
+static void ls2k_bmc_cancel_wq(void *data)
+{
+	struct ls2k_bmc_ddata *ddata = data;
+	(void) cancel_work_sync(&ddata->bmc_reset_work);
+}
+
 static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 {
 	struct pci_dev *pdev = to_pci_dev(ddata->dev);
@@ -385,6 +391,8 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 
 	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
 
+	devm_add_action_or_reset(ddata->dev, ls2k_bmc_cancel_wq, ddata);
+
 	ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
 			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
 	if (ret) {

-- 
2.49.0



