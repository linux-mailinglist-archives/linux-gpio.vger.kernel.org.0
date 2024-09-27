Return-Path: <linux-gpio+bounces-10496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB4A988320
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 13:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BCA41F2293C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 11:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF5618B499;
	Fri, 27 Sep 2024 11:19:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD818A95F;
	Fri, 27 Sep 2024 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727435944; cv=none; b=iEqAZ087njqOuU7zlDnO22Dy722dmsX+mJxbLM1D67+ww7qo5n2SU5ji/2ICShthXgdhFFre5NbrO5Q3v62K3ftEq/isJrHpuMmuwo5oioGpKAZ1adJQUrP9pjI/i9tTThheBiFyQmtlTmkJ9MofRE7xci97zUHKNkK86X3h7T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727435944; c=relaxed/simple;
	bh=e2OKrOlf/2rqbrxQ3xbvRsNubIXFFZxFd9YpKRep9a0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sD3eTRJJ42ymorleL+d6amfjwUdFLALjB7xIwznnh2cuM8PzIzvtNBZMvLWQqU1EPBPLbxEu5oRcNBme0t35HMRPrZtgXO4vu20uRnoiDZMcmmVpKtngdQfahfkRgHWkvEu93fba0I4x+ZyfPyBhcgxQkPYUwRWLIYeQh6Hh7UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 19:17:45 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 19:17:45 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v6 7/7] gpio: aspeed: Use devm_clk api to manage clock source
Date: Fri, 27 Sep 2024 19:17:44 +0800
Message-ID: <20240927111744.3511373-8-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Replace of_clk_get with devm_clk_get_enabled to manage the clock source.

Fixes: 5ae4cb94b313 ("gpio: aspeed: Add debounce support")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 7cea3c5ba696..5443129e0820 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1339,7 +1339,7 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 	if (!gpio_id)
 		return -EINVAL;
 
-	gpio->clk = of_clk_get(pdev->dev.of_node, 0);
+	gpio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(gpio->clk)) {
 		dev_warn(&pdev->dev,
 				"Failed to get clock from devicetree, debouncing disabled\n");
-- 
2.25.1


