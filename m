Return-Path: <linux-gpio+bounces-10258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0D997C768
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 11:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D922C1F2A568
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 09:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109F619FA89;
	Thu, 19 Sep 2024 09:44:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1639119F461;
	Thu, 19 Sep 2024 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726739041; cv=none; b=QuGL5xir52v79WgqjWXDzrGj2bB9qVsQ86vYqtTZmg3ikB92j/aHOOydXtWyddDwf6KQLdEtSm22jk5Flj2KGYVC0TsezyUN5o2LRVGnl36iZ+grlwdmi1P5JoYKAAqa5YcLavltSRQOEP5W1R307SWdWUGQ3OwIcWtpID8VQ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726739041; c=relaxed/simple;
	bh=S49vfkJmepgw4/K5gJ/DB3VAwfYwce2UjdL/lciOtnQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j6hJj6JePfVareCx0cPe8p6y8kKGUccWjOXkXiJ9RMR0T2wxTSpAhE1bN1y7Gfyd6TyYFFOg8t8YJ4AUdZ5EtECnQlwOrmK71DDEi/sSsi7qfh86hPPR+CuuQ/A/SjEOBqdnQXiF+ThAix//vZMXFbokSut8mA9t7gB5N9kESYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 19 Sep
 2024 17:43:39 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 19 Sep 2024 17:43:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v4 2/6] gpio: aspeed: Remove the name for bank array
Date: Thu, 19 Sep 2024 17:43:35 +0800
Message-ID: <20240919094339.2407641-3-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The bank array name is only used to determine if the GPIO offset is valid,
and this condition can be replaced by checking if the offset exceeds the
ngpio property.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 04c03402db6d..d20e15b2079d 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -77,7 +77,6 @@ struct aspeed_gpio_bank {
 	uint16_t	debounce_regs;
 	uint16_t	tolerance_regs;
 	uint16_t	cmdsrc_regs;
-	const char	names[4][3];
 };
 
 /*
@@ -104,7 +103,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0040,
 		.tolerance_regs = 0x001c,
 		.cmdsrc_regs = 0x0060,
-		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x0020,
@@ -113,7 +111,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0048,
 		.tolerance_regs = 0x003c,
 		.cmdsrc_regs = 0x0068,
-		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0070,
@@ -122,7 +119,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x00b0,
 		.tolerance_regs = 0x00ac,
 		.cmdsrc_regs = 0x0090,
-		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0078,
@@ -131,7 +127,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0100,
 		.tolerance_regs = 0x00fc,
 		.cmdsrc_regs = 0x00e0,
-		.names = { "M", "N", "O", "P" },
 	},
 	{
 		.val_regs = 0x0080,
@@ -140,7 +135,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0130,
 		.tolerance_regs = 0x012c,
 		.cmdsrc_regs = 0x0110,
-		.names = { "Q", "R", "S", "T" },
 	},
 	{
 		.val_regs = 0x0088,
@@ -149,7 +143,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0160,
 		.tolerance_regs = 0x015c,
 		.cmdsrc_regs = 0x0140,
-		.names = { "U", "V", "W", "X" },
 	},
 	{
 		.val_regs = 0x01E0,
@@ -158,7 +151,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0190,
 		.tolerance_regs = 0x018c,
 		.cmdsrc_regs = 0x0170,
-		.names = { "Y", "Z", "AA", "AB" },
 	},
 	{
 		.val_regs = 0x01e8,
@@ -167,7 +159,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x01c0,
 		.tolerance_regs = 0x01bc,
 		.cmdsrc_regs = 0x01a0,
-		.names = { "AC", "", "", "" },
 	},
 };
 
@@ -280,11 +271,11 @@ static inline const struct aspeed_bank_props *find_bank_props(
 static inline bool have_gpio(struct aspeed_gpio *gpio, unsigned int offset)
 {
 	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
-	unsigned int group = GPIO_OFFSET(offset) / 8;
 
-	return bank->names[group][0] != '\0' &&
-		(!props || ((props->input | props->output) & GPIO_BIT(offset)));
+	if (offset >= gpio->chip.ngpio)
+		return false;
+
+	return (!props || ((props->input | props->output) & GPIO_BIT(offset)));
 }
 
 static inline bool have_input(struct aspeed_gpio *gpio, unsigned int offset)
-- 
2.25.1


