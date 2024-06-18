Return-Path: <linux-gpio+bounces-7545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ED190D63A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 16:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D084E2873CE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 14:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E78C768E1;
	Tue, 18 Jun 2024 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b="lytISdkA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024E2139DB;
	Tue, 18 Jun 2024 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.34.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721939; cv=none; b=B8IB8fIUDEdVTG7wGbOhXX/udVvzQOYk19s2f+OximddBBPapY/gCo9j1ERuS/z13X5Te+BU66eX1FkTp47uowfh7WTAsQ2pA3fYFmHGnYzqsFQzZpq7nKxTQtDPf8+30XkRJP2fZHgZpvZdlgDD0bRNBlxPnY6qNg/0ee+AxCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721939; c=relaxed/simple;
	bh=4yMZjbqyortOGO62oRy9tFToIlzpFEbqV+s8Ppu12O4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FxF89Y13TkY+k6SE9M2ElQdF+aYDMIzElF4PjmmZOgAKcK2/BNCmERaIdXfNzMBGSiurJMFzue+HoNTitI6L8/a5relYzzJIJjJm0NxLUIEwG0euJqn4D4kcwWQP3rQ1CxmDLgr8xVgFeo9EL4sA5TFw/LgAjAk9gl4QF+uWmac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru; spf=pass smtp.mailfrom=t-argos.ru; dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b=lytISdkA; arc=none smtp.client-ip=109.73.34.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-argos.ru
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id 9412D100002;
	Tue, 18 Jun 2024 17:45:08 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1718721908; bh=SoquFa1edqrv14w1JgAqEyQzfSLztJhALwMOpgTEqNo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lytISdkAjnCC/VvV6yIOTeaF8FvWWus8tQxADwXqKXlXoC9KgJb8W7ZhY7xkn03F2
	 +nDm6zCBxL2xniDITldHn36O3gygOyec/mT0JieGqgYTb6l36AeoE9Mp2+LeXbWOlX
	 YdwV3vc9qDKdxoD1gipjO4QOOfzEUpIjZ4KeGliJi9WPcI83PklZWaiw7pVTh9ocrS
	 HAubFNdf+b3QNwOxhimKjWe/D5/fJtmwBJE0yCnG1hlMGcL7VMQHedojImS19xpWKG
	 3Vu1qxGPBD2iRKM+MYnZCaAf0vDA6iTuNvErqnj2KwXqgXLjhTRN088ufj9Tx4rDdi
	 ilyf/0zL90YoA==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Tue, 18 Jun 2024 17:44:24 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.5) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 17:44:04 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Keerthy <j-keerthy@ti.com>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Grygorii
 Strashko <grygorii.strashko@ti.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] gpio: davinci: Validate the obtained number of IRQs
Date: Tue, 18 Jun 2024 17:43:44 +0300
Message-ID: <20240618144344.16943-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185989 [Jun 18 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;mx1.t-argos.ru.ru:7.1.1;t-argos.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/18 13:19:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2024/06/18 13:21:00 #25648410
X-KSMG-AntiVirus-Status: Clean, skipped

Value of pdata->gpio_unbanked is taken from Device Tree. In case of broken
DT due to any error this value can be any. Without this value validation
there can be out of chips->irqs array boundaries access in
davinci_gpio_probe().

Validate the obtained nirq value so that it won't exceed the maximum
number of IRQs per bank.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: eb3744a2dd01 ("gpio: davinci: Do not assume continuous IRQ numbering")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
 drivers/gpio/gpio-davinci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index bb499e362912..1d0175d6350b 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -225,6 +225,11 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	else
 		nirq = DIV_ROUND_UP(ngpio, 16);
 
+	if (nirq > MAX_INT_PER_BANK) {
+		dev_err(dev, "Too many IRQs!\n");
+		return -EINVAL;
+	}
+
 	chips = devm_kzalloc(dev, sizeof(*chips), GFP_KERNEL);
 	if (!chips)
 		return -ENOMEM;
-- 
2.30.2


