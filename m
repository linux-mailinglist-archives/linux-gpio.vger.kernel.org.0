Return-Path: <linux-gpio+bounces-10370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58EE97E962
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 12:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50526283206
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 10:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53921197A65;
	Mon, 23 Sep 2024 10:06:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA851196C9B;
	Mon, 23 Sep 2024 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085976; cv=none; b=jf9TiN9ocuGm6Dtzj136lSTG2NwA+t07uGgEG4MQjMyDTicG5lslBc/vuAzltAhWwSjUOEHG4L9j4BNrRIAZ2Mz3/enX3YYhtG/OdODgcoecE6zQMc5eVoLU8tNzVWO2UvolaO68vVWca1+WtelJZLkgTTXcwPWKXBYSbkm5hXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085976; c=relaxed/simple;
	bh=NHvEfgQZfIfWc1/sMoswXKYerhj5bPrXrFuu/jZyTTw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qZwpZuSY3FSWxe9g1UX4lK7/gCZrRkOceWw9FSdgldmOsYsdIEiCnYlk9/CdG/3YgMtmL6F477gbtQ1xxeZAHxP5VU+aIo29vf2neZtkcI+xsTnkbMYzUssDc28kA8FxuFyfsxnMZgRIBYlYK4pWIik2wQI2iyiiIt/dDoqVpUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 23 Sep
 2024 18:06:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 23 Sep 2024 18:06:11 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v5 0/6] Add Aspeed G7 gpio support 
Date: Mon, 23 Sep 2024 18:06:05 +0800
Message-ID: <20240923100611.1597113-1-billy_tsai@aspeedtech.com>
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

Billy Tsai (6):
  dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
  gpio: aspeed: Remove the name for bank array
  gpio: aspeed: Create llops to handle hardware access
  gpio: aspeed: Support G7 Aspeed gpio controller
  gpio: aspeed: Change the macro to support deferred probe
  gpio: aspeed: Add the flush write to ensure the write complete.

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |  19 +-
 drivers/gpio/gpio-aspeed.c                    | 589 +++++++++++-------
 2 files changed, 381 insertions(+), 227 deletions(-)

-- 
2.25.1


