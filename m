Return-Path: <linux-gpio+bounces-38860-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id anS1GUbZO2qZeAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38860-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 15:19:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8826BE85E
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 15:19:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38860-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38860-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B2D03024452
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 13:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A28363C45;
	Wed, 24 Jun 2026 13:16:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A5239E80;
	Wed, 24 Jun 2026 13:16:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307019; cv=none; b=mCLc6ZbCxTjsCyxdJ0lasCwSD7Zu23h79GfzVBRh1OVg0T/mHhyxXhdMOpeN27+MiI7WW3Mgl3x87xwEKA14w9YXi75wQJQuDkNEyv1oALVFaTHqOCWcwoBDVWSn7O9rKIcVJ9tTW/lBcEMgLxrggLwDiFMfGaSWTD3ZbLX/2FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307019; c=relaxed/simple;
	bh=fcTbC0r9qUN36I5JNbp2WewtVLI87BrwaynA7itj2QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZRfgb6cY7d3SzdFcJp7ag3OSR6Ti3XCYhDs5xkbvZVZlZ+C8yK4x6fxhp1yIp+bWE/QIVC/JJcPyr9XxsIewgi2vC3OD1WRW2VRTwMtiEqT7URZLMyHRSEZkATmqfatWgj3oUNBUz6MPbDn/Ai6SntQtSIaD6ILHnz383j6v+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAndci_2DtqLpkEFQ--.12710S2;
	Wed, 24 Jun 2026 21:16:47 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3] gpio: mvebu: fail probe if gpiochip registration fails
Date: Wed, 24 Jun 2026 21:16:45 +0800
Message-ID: <20260624131645.86884-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAndci_2DtqLpkEFQ--.12710S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4DZw1rtry7Wr4UCFW8Crg_yoW8Gr18pF
	4DWF1ftw45Gw4xtrWDAFn7Za4F9w13trW2kFy8Kw4vvF1YyFWDXFWFyayxZr4UWrykKw43
	tF4DWFyxWF1qvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUf8nOUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38860-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:thomas.petazzoni@free-electrons.com,m:jason@lakedaemon.net,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE8826BE85E

mvebu_gpio_probe() registers the GPIO chip with
devm_gpiochip_add_data() but ignores the return value. If registration
fails, probe continues and leaves later code operating on a GPIO chip
that was never published to gpiolib.

Return the registration error so the device fails probe cleanly.

Fixes: fefe7b092345 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v2:
https://lore.kernel.org/all/20260622153137.69065-1-pengpeng@iscas.ac.cn/
- Add the Fixes tag requested by Bartosz Golaszewski.

 drivers/gpio/gpio-mvebu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index c030d1f00abc..689dc6354c2d 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1221,7 +1221,10 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		BUG();
 	}
 
-	devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip);
+	err = devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to register gpiochip\n");
 
 	/* Some MVEBU SoCs have simple PWM support for GPIO lines */
 	if (IS_REACHABLE(CONFIG_PWM)) {
-- 
2.50.1 (Apple Git-155)


