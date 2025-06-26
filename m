Return-Path: <linux-gpio+bounces-22262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EEFAE9E54
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 15:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01F611C4187A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 13:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3F32E540C;
	Thu, 26 Jun 2025 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="sg3hSkEe";
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="DwpE1x7J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailhub11-fb.kaspersky-labs.com (mailhub11-fb.kaspersky-labs.com [81.19.104.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C3BA53;
	Thu, 26 Jun 2025 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.104.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943574; cv=none; b=u+bZ/vzbKpmZmSpY9TD7ueajzZiEnEudIu9TT3ZWtrQ6iZ9awt5VlM6n1pzJdQNRNXrPWzJwW+5RfNftOL8misYoFDCWQ6ZVXhvU8rVrkUJjhk1dVdC8cQdtCgixIHfv1q3+8jSQ5GNSaRKigXxCkDB0FVMQfPwXGPPBn6MPjoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943574; c=relaxed/simple;
	bh=Lpiun+e9hghwKOdC+LoX+vFUp0uDxWgQNx2ZIGK2jyk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uAkXGRvz+9ZX2AWNTr2ZZoBf1YeDEcPBPSfXadKq+cGd4GepeHDi83HUy8kPa6uRmKKzN6TsCesPsuihQ4D89nkJDJlfkliVTOJlCDUekKYYhKNpdpTc6eL3sci6AE5vf58q5aXrx3WSyapQkcoqEgcOvlHeXKeHb7U2n6FZVbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=sg3hSkEe; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=DwpE1x7J; arc=none smtp.client-ip=81.19.104.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1750942966;
	bh=KwM5ykq3ZGPECVovJGENXdxG2avNxU0cDbAyYbVt4F4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sg3hSkEeCbmFwzz2UblXUxdicySLu/nhUuejBixKIACIp/7f/nr31AEIrdSbixe6x
	 ETbYxhLTL/IWrH6SXulI26yWWP7lIg9fOFaMleFiJYtwavZHJ17zPpX9/ICXFeadS/
	 MvPKvp2AtqjDSdjNaUuHmvq5PI8R1kIPFZdxcV4KEt1JdLxw+lA5A4SYvkkGqlpAKx
	 gN2yEzwkRIG7VWTp8wQ2cmEiOE9bco11k/Wa7LUkGXG2nK+5x+DzAJ2DJnzO5+1rZ7
	 xtKyXqS4ZzzQA9tr6WGhdxAYBhOA3FB1Pd7eT/glyhny9wHFCzilTirPrZ9TZZlXrU
	 WgO9nkezotxBg==
Received: from mailhub11-fb.kaspersky-labs.com (localhost [127.0.0.1])
	by mailhub11-fb.kaspersky-labs.com (Postfix) with ESMTP id 98EC2E8EAF0;
	Thu, 26 Jun 2025 16:02:46 +0300 (MSK)
Received: from mx12.kaspersky-labs.com (mx12.kaspersky-labs.com [91.103.66.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "mx12.kaspersky-labs.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub11-fb.kaspersky-labs.com (Postfix) with ESMTPS id 73803E8EADE;
	Thu, 26 Jun 2025 16:02:46 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1750942957;
	bh=KwM5ykq3ZGPECVovJGENXdxG2avNxU0cDbAyYbVt4F4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DwpE1x7JamPzdSwaU/Mj/ZGZVYmT9AUCjLLsD+BTS2O8/GjkAn1mTFyAEy9qVpmwC
	 e6OBcYqHU+YCeYUKVNsugMvP7L0xjxFQTJFzckNfRgdyXxHrn/i0Aa9Qr9k5PQ4Tu0
	 vx7jJZeLIsvY+DPGCxmVya+U0RS2Vzn8DeUWWng9AIBNH11y75Al0XOVgdBtmZFyhw
	 fj8T18pd+XMyNst2NVPp59J8sPL2MdaFKX1hhIqCWVOpBdYF+GkVEUH3+nXtAVhyx2
	 60Bp4xm220Itp+Qbw5EY1C/hCuVt/ulbgAO2tPZFQZ4CJDuIYXUMSm4UVjHSMQ1SL2
	 4yWMy0rJF70IA==
Received: from relay12.kaspersky-labs.com (localhost [127.0.0.1])
	by relay12.kaspersky-labs.com (Postfix) with ESMTP id B67265A2083;
	Thu, 26 Jun 2025 16:02:37 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub12.kaspersky-labs.com (Postfix) with ESMTPS id 3C3755A258D;
	Thu, 26 Jun 2025 16:02:37 +0300 (MSK)
Received: from moskovkin-pc.avp.ru (10.16.49.191) by HQMAILSRV1.avp.ru
 (10.64.57.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 16:02:36 +0300
From: Vladimir Moskovkin <Vladimir.Moskovkin@kaspersky.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Vladimir Moskovkin <Vladimir.Moskovkin@kaspersky.com>, Bartosz Golaszewski
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] gpio: kempld: Remove redundant check in kempld_gpio_probe()
Date: Thu, 26 Jun 2025 16:02:18 +0300
Message-ID: <20250626130219.676866-1-Vladimir.Moskovkin@kaspersky.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HQMAILSRV3.avp.ru (10.64.57.53) To HQMAILSRV1.avp.ru
 (10.64.57.51)
X-KSE-ServerInfo: HQMAILSRV1.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 06/26/2025 12:50:36
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 194364 [Jun 26 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: Vladimir.Moskovkin@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 62 0.3.62
 e2af3448995f5f8a7fe71abf21bb23519d0f38c3
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;kaspersky.com:5.0.1,7.1.1;moskovkin-pc.avp.ru:5.0.1,7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/26/2025 12:52:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/26/2025 11:01:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/06/26 11:20:00 #27592830
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52

In kempld_gpio_probe() function 'pdata' pointer is compared to NULL.
But in subsequent call to kempld_gpio_pincount() it is dereferenced inside
kempld_get_mutex() function. kempld-core module ensures that
kempld_platform_data is not NULL for corresponding device, see
kempld_acpi_table[]. So 'if (pdata)' check looks illogical and worsens
code readability.

Remove this check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Vladimir Moskovkin <Vladimir.Moskovkin@kaspersky.com>
---
 drivers/gpio/gpio-kempld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index e38e604baa22..61c4a53865b9 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -161,7 +161,7 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 	chip->owner = THIS_MODULE;
 	chip->parent = dev;
 	chip->can_sleep = true;
-	if (pdata && pdata->gpio_base)
+	if (pdata->gpio_base)
 		chip->base = pdata->gpio_base;
 	else
 		chip->base = -1;
-- 
2.34.1


