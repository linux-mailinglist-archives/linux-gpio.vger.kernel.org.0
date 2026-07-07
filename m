Return-Path: <linux-gpio+bounces-39601-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9dOZFcNSTWqJyQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39601-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 21:25:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616A71F31A
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 21:25:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="AnR/E3X0";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39601-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39601-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCF813012CC4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 19:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7ED53876BD;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E4D367B9E;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452255; cv=none; b=jDwIlRI0XdufwO8b6D8MBfDStLIFth6YWOsymWMB6NHbsyenSq1fYMPKOUIZ8Sz4f07MIINRx1RUnUocTD7LEaY7Bhcs0smrrICDvB7YVtGoy6pO0ZEVsxHbiB7hUU6mUbAoZtYJbeJ7zvDtWsQgvBXYPkuUrx83pLMbRI6LHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452255; c=relaxed/simple;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVRMuigf8Hk+tc1T237Av2FTKkMm/LTFvlqetzyVoWLATnYPWO4/jDHsr/3dMVltDPl8fUj0HYz1X/EJlfBRzXCmrXVN36lnvFncND4BQEkKV7yHHXDpXSX0+7FZCtRNlYbT2ZLZ7qoEytaeiQj4vhOOefZ68WyzUWoOGXTUpyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnR/E3X0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40BA1C2BCFC;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783452255;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AnR/E3X0W1Yzs3cS04qd3OqB5uhlvswtTxmdopGQUqRu5EdOme1Lr5lmlDSFBPp08
	 rsyGqavbgwz5bjBB4U1Auz6sWRjB28l3Ze0OkG/Hx7V4epE5usLKjv7L9u+5Dtnv+5
	 28unZv1eunbFXMAmtl/EfeXg3espWLHTp6hlQImL24iwOGM03pogiMpZdkfnt99Pt8
	 5pF25/PQ4g34v9XKu/0VcDEkJ8Zi0Wn7r914HK9HDZgJuwMf/hXbLBZeR86cR7BGWS
	 lvr5IQ5SZvd1t7p8CZmRNa37HEzSTVcCY10dQv3B05c7MKqFm40P6xrGMqDsTF+tRt
	 idLIFUjR2R1TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAB5C44501;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 08 Jul 2026 03:24:05 +0800
Subject: [PATCH RFC 4/5] mfd: ls2kbmc: able to compile as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls2kbmc-mod-v1-4-c344bf5defa3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=726;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=4cYoUAWfr6lC2eTeoh29c5JZOLqOi/IiHDJf/iiky6g=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqTVJcD6gGVO19zp22QalNg3kYFTI65qqdenkl/
 4gffUKG/WGJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak1SXAAKCRCwMePKe/7Z
 bujuD/9e+pw37MQ1Ut4nArqo1WnTYudvEnOf3F01zpsQEuZgotjmmNzoUrcWstURnBp4Gs34Awn
 T+Jzyb7F6TvGuUrsjY1ouyQs09YinguulPLVlnq9WmnTAL1q5AHFf/E8uGIwWWpnWhO1V7GURae
 j4mCX37YToVd0m1gJ00737uo2TxD3WIu8kA2SmtkYy6Aj6ZcVpHJXBDqHJ1pHZ3HKIc0Wt2zM35
 Dd6KY4pyiLsHjqvdXot2X37y2fMh05hUskbacaopZvCCXsIHNUOfkCZGzA0oVeyRCPKDlrrCuAq
 WuplFDQ9SDlxlDKDYzTgGSG12LYJEEY64+YHa/QxZqiF+JpfTMwkGRNoHXb97yzNihwD9HeSeHL
 z7nkv1WmM4+LC9u56q7skFZKXmYS+c/7YbDiToFBL+ioDbHCic08pnB0ipjA5QT1cl4Gx20ixlG
 a4igooveqoW8X6ttHrnSyFyilF4TKfD4wHgnAzWEtgTq7QIWK3J5CQdz4Yi47gK/MaBDufdQU9h
 9QjFIx/fCh+HbYF08NNvdJbp/0ib73hGmbEMikWMWUgEelBOy7UsEJJ/xKCiha1neR8idTgh/DU
 oDtT1voZvJTNTWamSdd1G0EG4vnn4wJk+V7IrjF9t0Bp0lP9wYz+6zjm5qxa9BwycD7MMILC230
 6T0UMn2RTf8Vcbw==
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:shankerwangmiao@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39601-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[xry111.site,xen0n.name,loongson.cn,flygoat.com,lists.linux.dev,vger.kernel.org,gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8616A71F31A

From: Miao Wang <shankerwangmiao@gmail.com>

Make ls2kmc able to be compiled as a module

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782bdd5d2b1a4d840c75b040092d83e..a7a9f97af248c88489dc1203a1ba05f2ce4827df 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2494,7 +2494,7 @@ config MFD_LOONGSON_SE
 	  which will forward them to the corresponding engine.
 
 config MFD_LS2K_BMC_CORE
-	bool "Loongson-2K Board Management Controller Support"
+	tristate "Loongson-2K Board Management Controller Support"
 	depends on PCI && ACPI_GENERIC_GSI
 	select MFD_CORE
 	help

-- 
2.49.0



