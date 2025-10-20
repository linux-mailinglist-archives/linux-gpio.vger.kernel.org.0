Return-Path: <linux-gpio+bounces-27297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8F1BF0076
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AB031898784
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB97D2EDD45;
	Mon, 20 Oct 2025 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qG5hTlwX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A339B2ED85D;
	Mon, 20 Oct 2025 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760950334; cv=none; b=EKeP/hHI0Q8wVOnEP4quW4NRPsvEEziS0/tXjSdJZUJhY04Drlh0dzhMpb7rHHs2opuQguhoTsfTkcnJ3CaoObDNKlOIrBkaBVmdEjRwyR6q1WnP1dLcrOoYhAdoFMF7dTpYT9+0LjOk2/jBAc36ZeSPosGb1sZQUsY4EoG2lrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760950334; c=relaxed/simple;
	bh=KH/2eJBrnrJKkAQLjlIxYoFdFIMreqzV2jotQA78V5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NALirDyLJF1pqKqEDbLhTstZFruoDi9dYJIZnU4xFxi9V5EOa0yTLFypJ/1SxUKxK7Nr60QX4mgZMLNNNRWFDZot4Z/7yBWBKLOqq+P2dbRLmMTaU6ZtFrqR5yq5dUBZKCpbnoJdhVYOYWmLZev4GMgSPv1/3ju0GdhaULINLKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qG5hTlwX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215DAC113D0;
	Mon, 20 Oct 2025 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760950333;
	bh=KH/2eJBrnrJKkAQLjlIxYoFdFIMreqzV2jotQA78V5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qG5hTlwXNHMmaeDno1wSZ9unCLsdXO1ZB519d7D0PlSOvZz4qy5inaAa6cZWSgTvc
	 aQXi4YajRLX5gZxgqWPOY0Q4kQ9XW/kpuPOqrOWWOEg6k6M8czA8Oo+ZsNKSpA9tE3
	 U7O5eYllyobvfgpBLL5d7MPWe4jvMbJFsrneeIMg3qiTTwfQbo/RWZ3ZbRsIXcaS7E
	 Dif2t8J0hZ/GwT6oGyHIFk9dMgFTAnzcb8TD0QwRw+81jfB64or/CwyKXaOLxatZx+
	 wPJCTzXdmYYGUsRZLpNdmQVyLyzwxeWmnZNZ2cDXJpPf+KD+oY274yQjHw7GP3E6A9
	 a3tApMXITCUbA==
From: William Breathitt Gray <wbg@kernel.org>
Date: Mon, 20 Oct 2025 17:51:45 +0900
Subject: [PATCH v2 2/3] gpio: pci-idio-16: Define maximum valid register
 address offset
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-fix-gpio-idio-16-regmap-v2-2-ebeb50e93c33@kernel.org>
References: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
In-Reply-To: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Michael Walle <mwalle@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>, 
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=wbg@kernel.org;
 h=from:subject:message-id; bh=KH/2eJBrnrJKkAQLjlIxYoFdFIMreqzV2jotQA78V5g=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDBlff1g6Xiz9tcC68vD/rIrFwc8z5FQXWT/bM9HExTb3Y
 lCXDcu+jlIWBjEuBlkxRZZe87N3H1xS1fjxYv42mDmsTCBDGLg4BWAia7MY/tcY/DI9Hp0ucHXq
 rP2lnjcU4j+fcZinfW1LuO5tzYCp65Yz/A9V/WgrLHPpuPLPpS4TZu9P0w5n7nn99Z2rnMG1COb
 vMewA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

Attempting to load the pci-idio-16 module fails during regmap
initialization with a return error -EINVAL. This is a result of the
regmap cache failing initialization. Set the idio_16_regmap_config
max_register member to fix this failure.

Fixes: 73d8f3efc5c2 ("gpio: pci-idio-16: Migrate to the regmap API")
Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Closes: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
Suggested-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: stable@vger.kernel.org
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 drivers/gpio/gpio-pci-idio-16.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 476cea1b5ed774d18511aaf71d8ca2d71bcc9ff0..9d28ca8e1d6fac4bdc105b850583607b5e5a87ea 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -41,6 +41,7 @@ static const struct regmap_config idio_16_regmap_config = {
 	.reg_stride = 1,
 	.val_bits = 8,
 	.io_port = true,
+	.max_register = 0x7,
 	.wr_table = &idio_16_wr_table,
 	.rd_table = &idio_16_rd_table,
 	.volatile_table = &idio_16_rd_table,

-- 
2.51.0


