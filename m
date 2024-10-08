Return-Path: <linux-gpio+bounces-11018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAFD994255
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D1CA1C21059
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 08:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854D01DE2A2;
	Tue,  8 Oct 2024 08:15:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A159F1F8938;
	Tue,  8 Oct 2024 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375305; cv=none; b=q+oWrumUPSYi2AedfSFv5vuYLQHEFRHOxSVDPBOGvn4ww/5JGgaLviNqXYRprc09UGGquCZYr+9RnYVb7fBkQKgqctzWxtKqRQzI8hdF/5wCd2kHU1758lmY774InzgmXYBE7p29wx1flTMVI7hVW9mRMzWgBoqDhVBomjUx/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375305; c=relaxed/simple;
	bh=6Dr/X4w9qdVFF3gLGFajc59wpqOKOzQWhgmVCb9iV8w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXxbJt2AZ6UxlmtgZXd6pwE8TzAq59PCtaxoTLQZAzCkxOrGxy/eHj022wvcly/qx0J+IW78uWNU2wb5ruSxKSJ6xcClQ28rWBVV6yYpWqHE40rrHYUqivHDU978t+1sAAHDS8jIniR5r+VCEl0WwKoZwtCWEMCoqgWupV7iouI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 8 Oct
 2024 16:14:51 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 8 Oct 2024 16:14:51 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v7 1/7] gpio: aspeed: Add the flush write to ensure the write complete.
Date: Tue, 8 Oct 2024 16:14:44 +0800
Message-ID: <20241008081450.1490955-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Performing a dummy read ensures that the register write operation is fully
completed, mitigating any potential bus delays that could otherwise impact
the frequency of bitbang usage. E.g., if the JTAG application uses GPIO to
control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the application
sets the TCK clock to 1 MHz, the GPIO's high/low transitions will rely on
a delay function to ensure the clock frequency does not exceed 1 MHz.
However, this can lead to rapid toggling of the GPIO because the write
operation is POSTed and does not wait for a bus acknowledgment.

Fixes: 361b79119a4b ("gpio: Add Aspeed driver")
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 04c03402db6d..98551b7f6de2 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -406,6 +406,8 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	gpio->dcache[GPIO_BANK(offset)] = reg;
 
 	iowrite32(reg, addr);
+	/* Flush write */
+	ioread32(addr);
 }
 
 static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
-- 
2.25.1


