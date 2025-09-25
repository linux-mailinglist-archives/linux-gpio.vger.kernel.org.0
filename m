Return-Path: <linux-gpio+bounces-26604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFAABA0688
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 17:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668853AB991
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 15:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627D42EE611;
	Thu, 25 Sep 2025 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWWSpMr5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155181DE4E0;
	Thu, 25 Sep 2025 15:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814776; cv=none; b=M2ZAgbeKdGW9XyDh2RIrpsm4O5v2S1WCjo6Avd8Q3Y7uvyQgiNouYNKG/qZZ5wJbIlE7ht3qb2x5GiS1JICdW7ldYHV9VIFPIoa4u5QONXAVCI2eM5BX1CfmU7/SVPb13pTsVgXy4mh7XRZ4SLWDJxX69NRcBZJLXCMlizJRPMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814776; c=relaxed/simple;
	bh=dZRhNHNxNFhtpbWp27QAdHENoATT6mL3CMP8c8FltM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XUVMoGwXzwtsCcl0avPJMS6yxBARYuSCAl66gG8RSDk+jUqRv/TfqN3jIzyvGLahuelbpXNIGLHHIvB+qJU43/YiEcXoLUF+DFCi0dMrOHur5ck+mkJ2nFfzehVjYbOc5jz4HFbEYIcdMrenUEcfqLzEHfc5fSyC9bcHYx/zywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWWSpMr5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763C6C4CEF5;
	Thu, 25 Sep 2025 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758814775;
	bh=dZRhNHNxNFhtpbWp27QAdHENoATT6mL3CMP8c8FltM4=;
	h=From:To:Cc:Subject:Date:From;
	b=PWWSpMr5f/w1Si3kRyJGrnAS1F94otpxN5JkOgDwfcJEjZ14yqlCL5QEqE6PQX5Sd
	 irinU06/6m2qvZcXjXsfJtog9CsC8E6S+n2rBU2tLFHJW9J4lEZcBEN5YV77kWF0bM
	 Gegy6dv1L5I++2QstJXXooBRRSnARlbub6fN6nHmbxrntciHb8TWI6TUQbHvEmeKAK
	 E1kKud+hXxiQ7tVGiOV9KlQ3Bw408NFj9K2KymKzNArRwpNg+liwan/K7COwZn5MpY
	 vfiYoEdwOLF2BKTqYwTCsvuLJRLqTQoL2hgKYPGvssWAHGjF8fOwuNa/cqnLBCLZv3
	 czb7P2LpgjRxA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril.Jean@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] gpio: mpfs: fix setting gpio direction to output
Date: Thu, 25 Sep 2025 16:39:18 +0100
Message-ID: <20250925-boogieman-carrot-82989ff75d10@spud>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Uk9/PSe0f1tFDhEpYhJcambrnl6TtSKeGC2KKf0Zjeo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlXk1TFu1vZ79hunrCn7EZX1YFinvVXk3lNZws+YVefs tZhX3FZRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYyYQbD//LUXapT2mSO/pk7 M/7w3hfbdjCWtUmFbWQMS3I3+3TtRTojwxWe5YELFL49bXthGmWwUrZLKvCVuwX/NiNpFlG5yRt YmAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

mpfs_gpio_direction_output() actually sets the line to input mode.
Use the correct register settings for output mode so that this function
actually works as intended.

This was a copy-paste mistake made when converting to regmap during the
driver submission process. It went unnoticed because my test for output
mode is toggling LEDs on an Icicle kit which functions with the
incorrect code. The internal reporter has yet to test the patch, but on
their system the incorrect setting may be the reason for failures to
drive the GPIO lines on the BeagleV-fire board.

CC: stable@vger.kernel.org
Fixes: a987b78f3615e ("gpio: mpfs: add polarfire soc gpio support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Cyril.Jean@microchip.com
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpio-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 82d557a7e5d8d..9468795b96348 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -69,7 +69,7 @@ static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio_in
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
 
 	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
-			   MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_IN);
+			   MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
 	regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->offsets->outp, BIT(gpio_index),
 			   value << gpio_index);
 
-- 
2.47.3


