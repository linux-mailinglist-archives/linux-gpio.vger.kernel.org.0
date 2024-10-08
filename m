Return-Path: <linux-gpio+bounces-11017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1607994256
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A76BB2948E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 08:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901311DF241;
	Tue,  8 Oct 2024 08:15:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D103A537E9;
	Tue,  8 Oct 2024 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375301; cv=none; b=tARRCYLXDCX9rvImDLE0zBXvwC6daoe0UOVXZYSkZALG1Vr3hRzFXzc3jRyEb+NHIM7iBtYsyg7ZrKg/fic/rN5XPKEDyqQ+fQM5MBPL00K6HfbfY/TgpUvsVgcxYs8SfvXi7rKWMhthQLlTIvD60zONn5hXJWYqhkrsSvzYN9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375301; c=relaxed/simple;
	bh=JdxHNMFWG0t/GN8GLGX0Zmj9OlvMB5Yd+plXD9mXfX4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j9t7bKRCn5/WJ69q4iYSaYpWIbPVoKl4FYO5taQZ7dVBWwHUYLO3g0ZCULvnXD+enqd7CVZ3/RV2gGiDCGDXNnx1PylalEsf9Yc1zVjj2kJDqvGs4s9N30enX/+Z0g6yzTAw9NPprVQkHkgvs+LfxAZR1OfZzJ226nExnh8+hos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 8 Oct
 2024 16:14:50 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 8 Oct 2024 16:14:50 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v7 0/7] Add Aspeed G7 gpio support 
Date: Tue, 8 Oct 2024 16:14:43 +0800
Message-ID: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The Aspeed 7th generation SoC features two GPIO controllers: one with 12
GPIO pins and another with 216 GPIO pins. The main difference from the
previous generation is that the control logic has been updated to support
per-pin control, allowing each pin to have its own 32-bit register for
configuring value, direction, interrupt type, and more.
This patch serial also add low-level operations (llops) to abstract the
register access for GPIO registers and the coprocessor request/release in
gpio-aspeed.c making it easier to extend the driver to support different
hardware register layouts.

Change since v6:
- Reorder the patch.
- Reoder the llops assignments in the same order as the member declarations.
- Add a comment explaining the logic used for the debounce timer array.

Change since v5:
- Reorder the aspeed_gpio_llops api
- Add aspeed_gpio prefix for all of the api
- Add mask value check before field_get and field_prep
- Separate the devm_clk_get_enabled modification into a new patch.

Change since v4:
- Add `reg_bank_get` callback
- `reg_bits_get` -> `reg_bit_get
- `dcache_require` -> `require_dcache`
- Use `devm_clk_get_enabled` to get the clock source
- g4 specific api doesn't need to use the callback function 

Change since v3:
- Add `privilege_ctrl` and `privilege_init` callback
- Use `bool aspeed_gpio_support_copro()` api to replace the
`cmd_source_supoort` flag
- Add the `dcache_require` flag and move the dcache usage into the
reg_bit_set callback
- `reg_bits_set` -> `reg_bit_set` and `reg_bits_read` -> `reg_bits_get`
- `bool copro = 0` -> `bool copro = false`
- `if (!gpio->config->llops->reg_bit_set || 
!gpio->config->llops->reg_bits_get) return -EINVAL;`
- Correct the access of reg_irq_status
- Remove __init attribute to fix the compiler warning

Change since v2:
- Correct minItems for gpio-line names
- Remove the example for ast2700, because it's the same as the AST2600
- Fix the sparse warning which is reported by the test robot
- Remove the version and use the match data to replace it.
- Add another two patches one for deferred probe one for flush write.

Changes since v1:
- Merge the gpio-aspeed-g7.c into the gpio-aspeed.c.
- Create the llops in gpio-aspeed.c for flexibility.

Billy Tsai (7):
  gpio: aspeed: Add the flush write to ensure the write complete.
  gpio: aspeed: Use devm_clk api to manage clock source
  gpio: aspeed: Change the macro to support deferred probe
  gpio: aspeed: Remove the name for bank array
  gpio: aspeed: Create llops to handle hardware access
  dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
  gpio: aspeed: Support G7 Aspeed gpio controller

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |  19 +-
 drivers/gpio/gpio-aspeed.c                    | 620 +++++++++++-------
 2 files changed, 408 insertions(+), 231 deletions(-)

-- 
2.25.1


