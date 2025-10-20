Return-Path: <linux-gpio+bounces-27298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9058BBF0097
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C34D53BE5C9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8DC2EE263;
	Mon, 20 Oct 2025 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kte/KPZG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D422EA75C;
	Mon, 20 Oct 2025 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760950335; cv=none; b=YMab/UQ2YW5iNzMudhp/nXyfjkuu4aOjXM338VlYtz6Ka1dyBjvJjXUfYSibH8SqYLJmUsyD5qN4+w+Dgeh5bC/VncXo9ZjMUBjQ9qPA9cjRsMFuydbGRDRBFOrJ5tbGZR4acuRmrhcUnNYV9vBA5jQ/U3xeAjboZnKSzsla5AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760950335; c=relaxed/simple;
	bh=EoUVxeSptFcOjrgPFfQZEWOsyUwL1/hLMlc22Yj9G24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biocpHKKiQWXGIGRbNWDmwGL19B4pidsaUsA2m1Iz+8pIhYs3WsiSpPBO+Z1yY5zA7/Hl5wJlo/A+WebiAXKPbi+OB9EpbTs9QJZvhisMwQQUGs3WRIXGe0mT1ZLpJ9DwSPsWlxrm5ztsFyrWLTB5Aky7UOHVtOGcuY5DFSEs9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kte/KPZG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B5AC4CEF9;
	Mon, 20 Oct 2025 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760950334;
	bh=EoUVxeSptFcOjrgPFfQZEWOsyUwL1/hLMlc22Yj9G24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kte/KPZGk8PlzHP/nqp16ImYv56FvR2+OMTwexmHCbcrEDcMUn2NURupU9d/+Kkfz
	 oQW1ZWj78iwGusaJKI/AJvGiNHn+p3kTyNicSq0jyKOpZRdxUVVVqNi7WSfW3gJpCZ
	 xzyEk5nywWVK6yU/E9WSS532q6kpgDl52ojP5kERVy7qauwE05/O7ttaM2Akx6yWu3
	 pNeKt3Xiu5Wo9v7ogX2mE8mtTMMZuBmgQJ45piSPtGFV5f1A3sPd5dsP+Vd0+KwqqN
	 PupVON33uj6bVyyy12MMsqYyWJC5QCr2+ukYZO0U9sQE0Lvg2id2BEYN8C3AD+jVrK
	 tcEj2GseYg33w==
From: William Breathitt Gray <wbg@kernel.org>
Date: Mon, 20 Oct 2025 17:51:46 +0900
Subject: [PATCH v2 3/3] gpio: idio-16: Define fixed direction of the GPIO
 lines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-fix-gpio-idio-16-regmap-v2-3-ebeb50e93c33@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018; i=wbg@kernel.org;
 h=from:subject:message-id; bh=EoUVxeSptFcOjrgPFfQZEWOsyUwL1/hLMlc22Yj9G24=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDBlff1helOPOnmbtVvKsmaGpcPuW++6+LzP/Zi7btTbm5
 u/bZVP8O0pZGMS4GGTFFFl6zc/efXBJVePHi/nbYOawMoEMYeDiFICJ6Mxh+CtrNC/T7fPhilCL
 t5HGT5q/mE6t1Dj+XupQSEDGczfNEA5Ghpb/pb4Gd9+bbdTjeF51pmJWZMGcS2JyX18trn5cpHM
 wnQkA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

The direction of the IDIO-16 GPIO lines is fixed with the first 16 lines
as output and the remaining 16 lines as input. Set the gpio_config
fixed_direction_output member to represent the fixed direction of the
GPIO lines.

Fixes: db02247827ef ("gpio: idio-16: Migrate to the regmap API")
Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Closes: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
Suggested-by: Michael Walle <mwalle@kernel.org>
Cc: stable@vger.kernel.org # ae495810cffe: gpio: regmap: add the .fixed_direction_output configuration parameter
Cc: stable@vger.kernel.org
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 drivers/gpio/gpio-idio-16.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-idio-16.c b/drivers/gpio/gpio-idio-16.c
index 0103be977c66bb8d165c1c92123368be6832d120..4fbae6f6a49727df40f2793b42ca207d78ec272b 100644
--- a/drivers/gpio/gpio-idio-16.c
+++ b/drivers/gpio/gpio-idio-16.c
@@ -6,6 +6,7 @@
 
 #define DEFAULT_SYMBOL_NAMESPACE "GPIO_IDIO_16"
 
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -107,6 +108,7 @@ int devm_idio_16_regmap_register(struct device *const dev,
 	struct idio_16_data *data;
 	struct regmap_irq_chip *chip;
 	struct regmap_irq_chip_data *chip_data;
+	DECLARE_BITMAP(fixed_direction_output, IDIO_16_NGPIO);
 
 	if (!config->parent)
 		return -EINVAL;
@@ -164,6 +166,9 @@ int devm_idio_16_regmap_register(struct device *const dev,
 	gpio_config.irq_domain = regmap_irq_get_domain(chip_data);
 	gpio_config.reg_mask_xlate = idio_16_reg_mask_xlate;
 
+	bitmap_from_u64(fixed_direction_output, GENMASK_U64(15, 0));
+	gpio_config.fixed_direction_output = fixed_direction_output;
+
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
 }
 EXPORT_SYMBOL_GPL(devm_idio_16_regmap_register);

-- 
2.51.0


