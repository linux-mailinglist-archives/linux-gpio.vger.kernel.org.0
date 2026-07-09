Return-Path: <linux-gpio+bounces-39761-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NN36NAPaT2q5pAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39761-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:27:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A64733D28
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:27:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="EAVZohe/";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39761-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39761-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19592303D110
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 17:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9FD466B68;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD7A42E8F1;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617885; cv=none; b=KAwRNGOeVvNJx4wDbyaOLh/bUaZSyrG8jivJprVdn6MfveNr2Rl/cnLcLPKCmJsgfAeeYjkuSRYGZXmIp54dYKeGcM4cKzaUjrpHH7+PNjLFQ17BDLVtDf3QszFn66eKjKamjBJy5SEhUazsdV4NbyBJgEavupTV3Xq8oE7XZRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617885; c=relaxed/simple;
	bh=OjHpqlAg5MF1Iiyza2/YLamBBIPis/Er/709OxC7A+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NqAlURGVnPqFKYBI6Cpi84InKggDvZZeF+m0U3Jep9EqFRTLJRSn3Dnqjp4vumQveIbnVi2WNOZQMtjwyW5o+NzfDU8VY7zH+vlu7y/4VlY7idXJXETAE23fhy/6wooDCDIWFNy3gKn+tmK63fq19EZEOsFSIBtfrRbgqD0L4NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAVZohe/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45705C4AF09;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783617885;
	bh=OjHpqlAg5MF1Iiyza2/YLamBBIPis/Er/709OxC7A+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EAVZohe/q7B37qw8Kz/eY2wuRfWu+pCXjvNAob6ymrSyZ+e/Qy1GCWohaEQW9fadY
	 LuQlYT9TiMCnzjzDimT7usLKK4h40iYWP5q8j/t8m27uVhbeWIFRTezCwNlb9xen2H
	 SgjybY3Sgq4Jl/5XtFpeho7ko+ChhlFFMMesG8iV5EdHfOVM29kiblGckFriZlskER
	 ZqmkGu8P7bxM+g/x3BoKWW4WrQtAoptRI0EOYezhKivsrGk6JVHQ+M5nSkt6A0eZlO
	 wt5b7WJt8LaV9FO738q3k43k2Ut3BAkgPtKpHNBgADLq0KJjBnkM2Bv2ir9DqmPqTq
	 1riehh1uAsBNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B6FC44508;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 10 Jul 2026 01:24:21 +0800
Subject: [PATCH RFC v3 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-ls2kbmc-mod-v3-5-ef718636e78e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=DqOdU6W3FkZ9wJNJOs/NgLGl94jX8Hgep53VmIhV2nQ=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqT9laVpLfK6V/x0Vbe6h8iLQEGWKb5mPZ/H2oM
 2hM1IPKnzeJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak/ZWgAKCRCwMePKe/7Z
 bjX6D/92DGwclTpn8JEIqWvvqivT/xsqa59lGjX8RgaQtQgAieCsMOp+NDj1uaGbrtKeEG7XJv4
 u7AVCPaNIaBRUHu8XwmgLKQbJ5qVaoU96lS2XgQJPY/wlZfjkZDJwoWGz4e7lUtcwK454PlvIXp
 VW2D+TApygU86FNUU4ov6hhuSsz1tr/BSw4hX5PGRNFcBzZUP7eCFeYlyUuwIKQvVpYqKcx8ACc
 QIvfpJdh2lzDjtDeT38UlK4cBlUGU6hKAYDeoyWCQrkNZOUhFIS6CVPCD2stTCGAmKMi2lwT5Wa
 CpyU6cBm3SMR0CpMXvkdWPMwLqwup9CPVRHKizQJcO5yxT0vLZaaGGVl9QxnItxZvAIQmkGbRZd
 InvGttxmzRAx+Nx9XIdVQ79gKAcucKnXqVrXagEZ0P/ZsLpOt4wDhAg+ogSN/aA+keh1dGWdFOX
 HqTFhQILIiMvYCcMQoFKpOnWBbsjbHf0yQ8HGE2FCFuL6kAU5XSSQa1wQo/N+qJ4aIvSoRl99iX
 QAP2ULVzMuhzIiDJcoKpUJ5h2JomZ/H696tXwZjGwf0s/HEFJZrM01DbsVl7Mbv89vGbW4oKesy
 Sy5p9OeFKfEnHTRxbQLB9dk0b5uk3Tg5httLDmhN9EAqHOvoHqZ1DSyaakCNiIJqK5N5xEe+TF8
 kI9rrTkwPVTBv3A==
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
	TAGGED_FROM(0.00)[bounces-39761-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
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
X-Rspamd-Queue-Id: 77A64733D28

From: Miao Wang <shankerwangmiao@gmail.com>

There is no strong dependency between the IPMI driver and its mfd
driver. Although the IPMI driver will not work without the mfd driver,
it is not a hard dependency. The IPMI driver can actually be compiled
without the mfd driver, and it will just fail to probe. When the mfd
driver is loaded, the IPMI driver will probe successfully. Therefore,
the dependency of the IPMI driver on its mfd driver should be relaxed
to "imply" from "select". This will allow the mfd driver to be compiled
as a module and the IPMI driver to be compiled as a part of the ipmi_si
module.

Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/char/ipmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 669f7600019747bcd2b37563477cf336f19a0407..f456e3e89416932f0d21bb742153a503aeb24267 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -87,7 +87,7 @@ config IPMI_IPMB
 config IPMI_LS2K
 	bool 'Loongson-2K IPMI interface'
 	depends on LOONGARCH
-	select MFD_LS2K_BMC_CORE
+	imply MFD_LS2K_BMC_CORE
 	help
 	  Provides a driver for Loongson-2K IPMI interfaces.
 

-- 
2.49.0



