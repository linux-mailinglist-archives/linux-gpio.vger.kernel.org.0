Return-Path: <linux-gpio+bounces-38824-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SmnrNgXwOWq0zAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38824-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 04:31:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF86B38C9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 04:31:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=R5SfRqwH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38824-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38824-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 456443027B45
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 02:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EF230E853;
	Tue, 23 Jun 2026 02:31:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2D63FBA7;
	Tue, 23 Jun 2026 02:31:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782181890; cv=none; b=r6mMh1y7lcdCFm7tjOztGrrS0nBvh202RkaiOwBx15JjAjOqo/XCsnlyXmdC4f9ZCpA0nsE82eRoNp14mR4qhcDoB9+fgJjAwPJmCdeEezvnwT4Ne/ef0U6d4jZP75cxwZZ8pNbQF5F9MC0X41Dk6CKqLGaMCKVohTEcfsqSVDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782181890; c=relaxed/simple;
	bh=hkRMpuSN6I1eZGusONc5HQWkaf+G6SvfelKfwFyQmlk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pp2vOz74vWGNjFcukmVWzm853yLIqekEL6cIju7Nc6D+0jv/ddFeDZgCdmGz+Hqw+0juSd/NPtYc50nET5pH+eW06BlXMv6eo8B+KtlEp8NwhyO571vuDrMUp3t4S6H2qIEh2fVkwnnCpRnvB6sl782oN15ZjzKzrPRGJEj0e/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=R5SfRqwH; arc=none smtp.client-ip=220.197.31.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=i5
	Ewf7MuI3qiU3DcpcF/NumyI1REpGyWSLVifhCuXCE=; b=R5SfRqwHymalblZIIP
	7XKnwj8LH9aznpBvd4yaqlbn21yTbHRAHojvmzKLxY6cOQgiVB+J3ZPvj5DDfKqu
	YGjr92B/xrCGIJM6uUoSfs00p4ELabcj5mQm4Pscc8aG+x96KnD1AmHt3TwXZy6D
	NSVFVthWE9NmnDweBgVNcRAMo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAHQWvs7zlqy3r4Ew--.668S2;
	Tue, 23 Jun 2026 10:31:09 +0800 (CST)
From: fffsqian@163.com
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH 1/1] gpio: davinci: fix IRQ domain leak on devm_kzalloc failure
Date: Tue, 23 Jun 2026 10:31:06 +0800
Message-Id: <20260623023106.117229-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHQWvs7zlqy3r4Ew--.668S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4rCry5tw1xtrW3Jw4Utwb_yoW8Jw4xpF
	srG34Y9rWUJw42qF18Ca15Za4aka4UtrW2yFyjgwn29r15twsYyr4Yva4qvFyqvrWrJw4a
	qan7X3WUXa4DuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jO9N3UUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbCwg0g6mo57+29fwAA3W
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:j-keerthy@ti.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:fuqingshuang@kylinos.cn,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[fffsqian@163.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38824-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fffsqian@163.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1AF86B38C9

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

In davinci_gpio_irq_setup(), after successfully creating an IRQ domain
with irq_domain_create_legacy(), a subsequent devm_kzalloc() failure
in the bank loop causes the function to return -ENOMEM without
removing the IRQ domain.

Unlike devm-managed resources, irq_domain_create_legacy() does not
auto-clean up on probe failure, so the domain is leaked.

Fix by calling irq_domain_remove() before returning on allocation
failure.

Fixes: b5cf3fd827d2 ("gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 drivers/gpio/gpio-davinci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 97780f27ce5b..270cd7c88812 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -568,8 +568,10 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 				       sizeof(struct
 					      davinci_gpio_irq_data),
 					      GFP_KERNEL);
-		if (!irqdata)
+		if (!irqdata) {
+			irq_domain_remove(chips->irq_domain);
 			return -ENOMEM;
+		}
 
 		irqdata->regs = g;
 		irqdata->bank_num = bank;

base-commit: 4708cac0e22cfd217f48f7cec3c35e5922efcccd
-- 
2.25.1


