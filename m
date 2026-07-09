Return-Path: <linux-gpio+bounces-39762-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7HpYJgfaT2q7pAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39762-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:27:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECBE733D2D
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:27:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="IzLJ3BF/";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39762-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39762-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 426E7303DAC9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 17:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63F6466B70;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9777E43803A;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617885; cv=none; b=sLJMPxpkV09vGHG9WdUzFEaoYQhVBRzv49l4ZNEcUoRIgZmJ7M9mytu741b2LSowBZfKhQoXzRJynsCocb6Yl8WzyQD7UWaqyl2+OqlU6vQDEjEsmeMEnZXjNsFT6458pvPcmreYDNYGMYJ2rH/Km3DKl50I8J/bytYJbHAJAUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617885; c=relaxed/simple;
	bh=hWrvd5fvZPyhEvtDoJ9K7KER8KzSL+2EJ6VgJ5EVToI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oF36mjBXdjBnuWZHHts7XtmpRYPczeIzLME1ntdVZ7DN8bZEdQHK7qb9I4CguThSgUIH6EHYky5T2WgJzwi6n00pikw7nCaAqTvRe7533YA0bxNWaGOOXFoCA3gbq3SD6sO+jMQx1zfkREavV96BYaIA92P0tPfGgOq+mZ3z0qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzLJ3BF/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 341EBC2BCF5;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783617885;
	bh=hWrvd5fvZPyhEvtDoJ9K7KER8KzSL+2EJ6VgJ5EVToI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IzLJ3BF/vPqrbOxMHKWa3E1pTnN7N4VfurajJbTPKl7IakuO264JP0XOns8REdS7w
	 5V5kVKxNB5h0CymarEUOpzOgNO/qhb7tStVwl55r+SZnPpRlfngPPsDDJt2ZiPWO3w
	 1OLFiNSVb96Y47IaCb8sLNk4swYCUCMTCt50mchnoohNfNcEUzvBSIka0iU8i+aSOB
	 U9c+Fz068oupw5mWk8EZ4OGlQYPBIIVCwE5D7O+s60xx4KGbvOzq0QZ8V4pEgJsFZK
	 IU0BcztoXAJ5TYZSoYQUHPW2YRKApQE2G3Cz7Hpdy4wKjI7NtIb9+oZYZAhk+7l41a
	 IznGVQbxMZI/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18262C44506;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 10 Jul 2026 01:24:19 +0800
Subject: [PATCH RFC v3 3/7] mfd: ls2kbmc: Redraw using exported functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-ls2kbmc-mod-v3-3-ef718636e78e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=OujIxIWqUrslWQYj9yXk01UV8a8eZbDNcLz7yiDWTA0=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqT9laS7rZjrVGRXVB+fmOUzlKL6aydQdsIqg97
 Jv/CvpO2WCJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak/ZWgAKCRCwMePKe/7Z
 bokXEACZIyWVsNdxahozVJUXJON3N1imfdQ393IkB2/oJIWEFzMscSRCzDAYMg4CFKKl/2PjbHY
 veUOuOVVSjJNaqVM4j3vFr1lYzFjZS2rugCOfrBH2fW07XjjKoMmc3bRrk5Dix/0s3n1OAf2lUo
 sNTOnhfKLxCbLmju6hzjd0NolojyqMGYiNbazRDpy8NinszZCBgyumqqFsfiz6ThHpWw3iOyKTs
 ugAt2A0PKUhQQqbSU+fxMe/tCpaEJlETzV3S6ocX593qD0Ubwyb171boQ9AnyUJX4QHA05eCorw
 VAyBizWmlrM/aUjVTbcPrvwt5n5gQsLixKZI/kaJwlRHfKnKtDjfYJDuZtSovo83EP89PEvYLsG
 nQzz3TP6i0dE8+6hKteH3D52h4kwb2uo7gDlOW0+gx9CPfW4H+gmMSpLGRm0MC0a2z9L/6LDuWJ
 lk8YuwfzSamc1ioJJY5IFz1G+6JCw5BTTH8O+RmJ/OVmafFCL5e23Hf1xMG6CzpW/5jLV2MqTZ9
 yiOvgJfkWMuUqiaBGWOCudrYoJlGO4vcqSj4TU0BIE8VYc74tTgdYvLh0EkkdJ+vgF25TKU/yI8
 M+AH9Fw51STcBsKgjYS8MZ+2tiYikjkwX2zasP86sOGJqRf0Z6SuYtqpeSv29kvAgInoxaSDj6M
 WKOSBOToZRaqnDA==
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
	TAGGED_FROM(0.00)[bounces-39762-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
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
X-Rspamd-Queue-Id: 2ECBE733D2D

From: Miao Wang <shankerwangmiao@gmail.com>

Use update_screen, i.e. redraw_screen() to trigger the redraw of the
current vt.

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index b02e4955e9b04f517892a18b2ef103b5e481a238..a5465c42a77b8b7b81e3ad787d6036679c6ba6df 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/stop_machine.h>
 #include <linux/vt_kern.h>
+#include <linux/console.h>
 
 /* LS2K BMC resources */
 #define LS2K_DISPLAY_RES_START		(SZ_16M + SZ_2M)
@@ -310,7 +311,9 @@ static void ls2k_bmc_events_fn(struct work_struct *work)
 
 	if (IS_ENABLED(CONFIG_VT)) {
 		/* Re-push the display due to previous PCI-E loss. */
-		set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
+		console_lock();
+		update_screen(vc_cons[fg_console].d);
+		console_unlock();
 	}
 }
 

-- 
2.49.0



