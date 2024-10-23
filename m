Return-Path: <linux-gpio+bounces-11853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB479AC81A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 12:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7A91C21D9C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2192A1A0BD8;
	Wed, 23 Oct 2024 10:44:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31495159209;
	Wed, 23 Oct 2024 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729680251; cv=none; b=NyTrKKSdJaHeN5gSnUUUEgs880KtXKrw1WEQKcj8qACaDBDsH7bdXBbLg9lUo3XZsKMGo1ceex1WGOGR0tgDAotBiwrZ3VgKGidqbL4VGIMUSvAqYTezy4H6DakAe0nOuLQSKTL13D21mvIRnwhtT7ndA6w/FyB6q08WLzgBGH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729680251; c=relaxed/simple;
	bh=FopyA5E0P0f61g8AtorronCudVPXzSX/6+0/eLKII7A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eFWr6w57GFOe0roTy5Xcklm8/Kv4q6uDK+NOO5j6roZ05GRO+uU8hHhlazTYGWpx9CIcYs33QsDVd4jYZIw3oDthS/rMJrwqrbQrPGdF3Sui+G1NEvOk6GFtaOZIrG7lTAqq3cxnGZbIRN71MPJy/rjo1N7tS/VUTUl/vyzDWo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 23 Oct
 2024 18:44:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 23 Oct 2024 18:44:06 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <linus.walleij@linaro.org>,
	<joel@jms.id.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl: aspeed-g6: Support drive-strength for GPIOF/G
Date: Wed, 23 Oct 2024 18:44:06 +0800
Message-ID: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add drive strength configuration support for GPIO F and G groups.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 6ecc656abc44..5a7cd0a88687 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2607,6 +2607,10 @@ static struct aspeed_pin_config aspeed_g6_configs[] = {
 	{ PIN_CONFIG_DRIVE_STRENGTH, { AB8, AB8 }, SCU454, GENMASK(27, 26)},
 	/* LAD0 */
 	{ PIN_CONFIG_DRIVE_STRENGTH, { AB7, AB7 }, SCU454, GENMASK(25, 24)},
+	/* GPIOF */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D22, A23 }, SCU458, GENMASK(9, 8)},
+	/* GPIOG */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E21, B21 }, SCU458, GENMASK(11, 10)},
 
 	/* MAC3 */
 	{ PIN_CONFIG_POWER_SOURCE,   { H24, E26 }, SCU458, BIT_MASK(4)},
-- 
2.25.1


