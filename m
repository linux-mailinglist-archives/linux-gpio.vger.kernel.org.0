Return-Path: <linux-gpio+bounces-30684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3DD38E25
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 12:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A57ED3036CB3
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 11:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E21329E7D;
	Sat, 17 Jan 2026 11:17:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD273314DC;
	Sat, 17 Jan 2026 11:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648654; cv=none; b=qOKqynPtdYlZsyZVOkLWd2IytJ9kid73e8M/Irbcxv7rnfMw/s1o7gxoXOY3krpuYfdYpcuNTJdIr7dvNgkGnDB68z01ArdMW2ft5PxSvJGn7zC6yTznvBzQFhEvXHftKe3os4MOdIK7uYO/0kLA2ql/TzUoLvrSdhujHMn+Rp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648654; c=relaxed/simple;
	bh=SKQ0UCfpVZsXx1vqEVOZz/+nmvbJAsfFSAPsnOZxtWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=W+i/qesPFnrpf5kKlfqEzO0ROvlPFvy3+mwvK34uUMx4fEXjltetd/4RWC+OeMjqY0MDphG7qxnkKfjB7/er3RJd4a3dOjjMatuezbv91KFPCOLGToQlFYdCuNgJHKd1Q/LfLBM1ynGqynrTNL1zQEugEsed9MsXviKdHaTDxkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sat, 17 Jan
 2026 19:17:17 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sat, 17 Jan 2026 19:17:17 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Sat, 17 Jan 2026 19:17:09 +0800
Subject: [PATCH 2/5] gpio: aspeed-sgpio: Remove unused bank name field
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260117-upstream_sgpio-v1-2-850ef3ffb680@aspeedtech.com>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
In-Reply-To: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768648637; l=1279;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=SKQ0UCfpVZsXx1vqEVOZz/+nmvbJAsfFSAPsnOZxtWk=;
 b=k2LVCG2VagQD1eIDaRMgFRwUurzQ/Cu9gfgS0o7/bRo9EEg1cVDQLuXQVxNFVa9668aEDQGiM
 v1qVLcFLYU2A7S/oafjJLDbd7aJj7CZ/YNHfOOIZlxD/6wjXE3hp/RQ
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Drops the names array from the bank struct and its initializers, as it is
unused in the driver.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 318cd0e39741..a96ed6d8a55d 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -43,7 +43,6 @@ struct aspeed_sgpio_bank {
 	u16    rdata_reg;
 	u16    irq_regs;
 	u16    tolerance_regs;
-	const char  names[4][3];
 };
 
 /*
@@ -59,28 +58,24 @@ static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
 		.rdata_reg = 0x0070,
 		.irq_regs = 0x0004,
 		.tolerance_regs = 0x0018,
-		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x001C,
 		.rdata_reg = 0x0074,
 		.irq_regs = 0x0020,
 		.tolerance_regs = 0x0034,
-		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0038,
 		.rdata_reg = 0x0078,
 		.irq_regs = 0x003C,
 		.tolerance_regs = 0x0050,
-		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0090,
 		.rdata_reg = 0x007C,
 		.irq_regs = 0x0094,
 		.tolerance_regs = 0x00A8,
-		.names = { "M", "N", "O", "P" },
 	},
 };
 

-- 
2.34.1


