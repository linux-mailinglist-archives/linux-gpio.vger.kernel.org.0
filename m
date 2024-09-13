Return-Path: <linux-gpio+bounces-10041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01412977A38
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 09:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E3C288A92
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 07:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8B01D6C4C;
	Fri, 13 Sep 2024 07:43:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060C31D67A1;
	Fri, 13 Sep 2024 07:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726213436; cv=none; b=PPmYxpgtnlvAqHwb95bc8j+VPFS1SMPny2Ps+ayxBJPrky8KUAXGOadcPNjqAgHMkpxm4PXikOoiWFFyNwfcMOLvcTEEc5LIHpVo845e3tXluKKi3rxgrunZqRvwMBZIHLrFxQFReq3o0XOCruxSa0238ieeZPPPo6NskxbcmcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726213436; c=relaxed/simple;
	bh=mWSB1XMDhHeGBYjyYbgZbOwSOjdzslXPWRy2WhfYvXQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yn52X4V1NzV9gjvSlWtauSva2xE01dKMxAqQUGzKuEWbTA2sU64BBYbzhs7n3HuusNJrWHpHHoeoUfpfVCl7QrqwfUrjx6vmyBt1JtzmwaYN9XDmIWYzOXTYwgleSjOlRvAwICR+33FQxGYB/wStxK6gWRkqDx2xKEvD0Bn9t5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 13 Sep
 2024 15:43:26 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 13 Sep 2024 15:43:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>
Subject: [PATCH v3 6/6] gpio: aspeed: Add the flush write to ensure the write complete.
Date: Fri, 13 Sep 2024 15:43:25 +0800
Message-ID: <20240913074325.239390-7-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit

Performing a dummy read ensures that the register write operation is fully
completed, mitigating any potential bus delays that could otherwise impact
the frequency of bitbang usage. E.g., if the JTAG application uses GPIO to
control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the application
sets the TCK clock to 1 MHz, the GPIO’s high/low transitions will rely on
a delay function to ensure the clock frequency does not exceed 1 MHz.
However, this can lead to rapid toggling of the GPIO because the write
operation is POSTed and does not wait for a bus acknowledgment.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index d322c03481a8..d1e61ee48da2 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -406,6 +406,8 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	gpio->dcache[GPIO_BANK(offset)] = reg;
 
 	gpio->config->llops->reg_bits_set(gpio, offset, reg_val, val);
+	// flush write
+	gpio->config->llops->reg_bits_read(gpio, offset, reg_val);
 }
 
 static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
-- 
2.25.1


