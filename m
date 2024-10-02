Return-Path: <linux-gpio+bounces-10668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF998CDAA
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 09:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 779911C2163D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 07:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB061885AD;
	Wed,  2 Oct 2024 07:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QFATwWVU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6021754B;
	Wed,  2 Oct 2024 07:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727853572; cv=none; b=oJI3b6B/OckG0P7WMKKE9y4IG3lg3dQLcAia8C8y4TsW96XMBVA4/z4EKXuJ/BsCy5+yzzqVoeyXe/6dE1XyImkrUgdcYngRFUBju6zQZ7dIu1jkquFVrOXVQVBpEVey+F0nLzmyUS6jvDdDTHfgIa7SAzMaUtfDpgTVVRX14fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727853572; c=relaxed/simple;
	bh=fxt/zKhNUiK68kHzx28NCFPh6vi8XPtLLQFCr+ETTTw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fg6gDTCrNoP550T2cAz4eY7oAFfHLt4TDFkhQx5H0MxlWe4CHdtGV0ajLMmJGwrDRZiJTZTxVHwKomV840uvL1hhtTdK1Pc2ZOUf1EoQo9xgolF4Y/ZmZrvQjMCRvKwT6p9afYpL9MmxGUgBJH+tFi7oBV8GCcYZYSJmYQr9m10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QFATwWVU; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4927JMoX109590;
	Wed, 2 Oct 2024 02:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727853562;
	bh=Y1BYUFdL9LXI9Zs7NApf3N2eDJem7pxZ/psQbpY6dic=;
	h=From:To:CC:Subject:Date;
	b=QFATwWVUexB0tB+tQdfdXgXeuwVQZ0t0wngdnATkqmpUnIqhC0p2G7d14dD/BnLTH
	 Dt+BzswgDJb7hS6DTKW9jVrbStjniGEi+3LvgKauOWTHfWBLhcEnqAvp4RfMn87wDs
	 GuESshbotmNrTVtOjEjrku3m9tTJ8p5RQLS1anKY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4927JMG6011123;
	Wed, 2 Oct 2024 02:19:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Oct 2024 02:19:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Oct 2024 02:19:22 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4927JJkP056939;
	Wed, 2 Oct 2024 02:19:20 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Sabeeh
 Khan <sabeeh-khan@ti.com>
Subject: [PATCH] gpio: gpio-davinci: Fix condition for irqchip registration
Date: Wed, 2 Oct 2024 12:49:01 +0530
Message-ID: <20241002071901.2752757-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Since commit d29e741cad3f ("gpio: davinci: drop platform data support"),
irqchip is no longer being registered on platforms what don't use
unbanked gpios. Fix this.

Reported-by: Sabeeh Khan <sabeeh-khan@ti.com>
Fixes: d29e741cad3f ("gpio: davinci: drop platform data support")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/gpio/gpio-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 790595f3b949..76b58c70b257 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -472,7 +472,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		return PTR_ERR(clk);
 	}
 
-	if (chips->gpio_unbanked) {
+	if (!chips->gpio_unbanked) {
 		irq = devm_irq_alloc_descs(dev, -1, 0, ngpio, 0);
 		if (irq < 0) {
 			dev_err(dev, "Couldn't allocate IRQ numbers\n");
-- 
2.46.2


