Return-Path: <linux-gpio+bounces-38861-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +n5TBGTZO2qeeAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38861-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 15:19:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C36BE867
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 15:19:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38861-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38861-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B646301F7BC
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 13:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6117A3B19D1;
	Wed, 24 Jun 2026 13:18:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC51371D11;
	Wed, 24 Jun 2026 13:18:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307114; cv=none; b=JmJQX8RdRhPyKfpXh5O8MJ/11vjbIIScrsbrxxzbpvmxiOfjm5BU/3vfp+Mc9x6t86OoTFTiGAUlTDeJkDgI6nQRB0eyeGqA/A6odMEXZ8TAeiNfn9pdnBeoze2yasHsQS4umxWF95xb87XzTF2g01V+kigxN0eAtKhL2H5KkKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307114; c=relaxed/simple;
	bh=QsrXBlhglbPN/7WKOixT3lJPVIk3i2nqrwb2DmiWaP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kVSfr6kncasrC3sQ474Qvg58uLGizpEKU+lEf7B0s2hCcrld1G6YT9s6BIEaBlOL6HghN0OnwkwWnTeBpBcTGJHqgOSJ941lEI4oAichPsFFwyoPWHP6fKRtacPJbSyAyDxGogzsC000zDTqvbY6VOCPqci895hSd/1DTxq/ue4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACX7hEl2TtqVKoEFQ--.2996S2;
	Wed, 24 Jun 2026 21:18:29 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>,
	Philipp Zabel <philipp.zabel@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3] gpio: htc-egpio: use managed gpiochip registration
Date: Wed, 24 Jun 2026 21:18:28 +0800
Message-ID: <20260624131828.94139-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACX7hEl2TtqVKoEFQ--.2996S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw45ArW8ur15tr1kury5twb_yoW8Aw17pa
	y8WayrKrWjgw4xGrWUZan5Ca4Yk3W7tr42yrykKw40vr1Yg34DtFWrAayUXrWUtrWkCF43
	tr4qvrWUZF4DZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUvXd8UUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38861-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FREEMAIL_CC(0.00)[arm.linux.org.uk,gmail.com,vger.kernel.org,iscas.ac.cn];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-gpio@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:rmk+kernel@arm.linux.org.uk,m:philipp.zabel@gmail.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,m:rmk@arm.linux.org.uk,m:philippzabel@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 714C36BE867

egpio_probe() registers each nested gpio_chip with gpiochip_add_data()
but ignores the return value. If one registration fails, probe still
returns success even though one of the chips was not published to
gpiolib.

Use devm_gpiochip_add_data() and fail probe if any chip registration
fails. This lets devres unwind already registered chips and prevents
the driver from publishing a partially initialized device.

Fixes: a1635b8fe59d ("[ARM] 4947/1: htc-egpio, a driver for GPIO/IRQ expanders with fixed input/output pins")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v2:
https://lore.kernel.org/all/20260622153204.72071-1-pengpeng@iscas.ac.cn/
- Add the Fixes tag requested by Bartosz Golaszewski.

 drivers/gpio/gpio-htc-egpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index d15423c718d0..25a4d4494f3c 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -268,6 +268,7 @@ static int __init egpio_probe(struct platform_device *pdev)
 	struct gpio_chip  *chip;
 	unsigned int      irq, irq_end;
 	int               i;
+	int               ret;
 
 	/* Initialize ei data structure. */
 	ei = devm_kzalloc(&pdev->dev, struct_size(ei, chip, pdata->num_chips), GFP_KERNEL);
@@ -326,7 +327,10 @@ static int __init egpio_probe(struct platform_device *pdev)
 		chip->base            = pdata->chip[i].gpio_base;
 		chip->ngpio           = pdata->chip[i].num_gpios;
 
-		gpiochip_add_data(chip, &ei->chip[i]);
+		ret = devm_gpiochip_add_data(&pdev->dev, chip, &ei->chip[i]);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to register gpiochip %d\n", i);
 	}
 
 	/* Set initial pin values */
-- 
2.50.1 (Apple Git-155)


