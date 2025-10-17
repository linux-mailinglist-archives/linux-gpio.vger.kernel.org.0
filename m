Return-Path: <linux-gpio+bounces-27230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EE1BE6017
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 02:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A02FC5E807E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 00:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820D82288F7;
	Fri, 17 Oct 2025 00:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYCGZ0Sz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373CF288D0;
	Fri, 17 Oct 2025 00:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760662702; cv=none; b=MoTd4jm3VFBFNq/m73Eys+7chiy1V/jZJVTkBdN50a+sFJgH2d1J/bIXRmPKAuDF+LLP4PJLA2w8JQU5fjc7yB4eIaEQ5134a8g8jDM0FeVHEsQTZPSJU+foVWTENmSbbkHw66VrOYxmHuc4LM/Upb2Bs6S4YaveZK1MVBjy0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760662702; c=relaxed/simple;
	bh=S5rom8T8Si5vrxdDOz5QNiI8IhDt40D4bxi/66ykDjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPL49nshc+lkCVpQnsCoVDWog0gKEJKCv4BO4ByPVy1s2yCPgfTlOlF7E9nXiFpUv8iIJkYrx1UqqrkHkTzrzjUI/QSvkZLDqL5CFtoquhb3+FCqwwCDcqSGCU/agmfJskZR9c5X8Tyyf31ZoNdGXy4tvPpMqwk/TKbXj0y1Kys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYCGZ0Sz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7064C113D0;
	Fri, 17 Oct 2025 00:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760662701;
	bh=S5rom8T8Si5vrxdDOz5QNiI8IhDt40D4bxi/66ykDjs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FYCGZ0SzpaIKU/pLiaDF0PWhxKOlKpCW4zNvBIF4GUx1t93bZWoSAmFDkM9d/ktag
	 zfgqWehbOEYZtcmn3c3J5JGxBjRvMtRxlyD8mfm9rI+94EiPaiNf5/W97OeuAS9ddt
	 PtnTVMSSiMwj8fcijHe8yQ1sIPVdEb7j1QbUgvz1hyCkZ8rONmtOtxzoygCD72pR56
	 x9xB9QRVa5uuUahvbr9mDtpD5lQFYkOXCqfH8MjTN3NSfScitOISvUzoHOvgPlukUA
	 VxBMLBMzzeHPqz+YmTzguqmEtLeOTSjOuGI3rDOYa3gz9Nc7wERVppX/AVGcTkpmX2
	 UZkan1cXrg2wA==
From: William Breathitt Gray <wbg@kernel.org>
Date: Fri, 17 Oct 2025 09:58:03 +0900
Subject: [PATCH 3/3] gpio: idio-16: Define fixed direction of the GPIO
 lines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-fix-gpio-idio-16-regmap-v1-3-a7c71080f740@kernel.org>
References: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
In-Reply-To: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>, 
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950; i=wbg@kernel.org;
 h=from:subject:message-id; bh=S5rom8T8Si5vrxdDOz5QNiI8IhDt40D4bxi/66ykDjs=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDBkfp6y0rxB5J3327TmhJzqHBS6ff5fU9/fPDIeZ5RcZZ
 7bd0xR27ihlYRDjYpAVU2TpNT9798ElVY0fL+Zvg5nDygQyhIGLUwAmovqfkaF3muHeN+HWQieO
 ut+zlNbb3H1pjcO/eI7zRfP6bsVelqhlZPg4J7q8sDujoTvPJ+ZeDEPplSUtVtvv3vYqvJpf1nU
 8jRcA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

The direction of the IDIO-16 GPIO lines is fixed with the first 16 lines
as output and the remaining 16 lines as input. Set the gpio_config
fixed_direction_output member to represent the fixed direction of the
GPIO lines.

Fixes: db02247827ef ("gpio: idio-16: Migrate to the regmap API")
Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Link: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
Suggested-by: Michael Walle <mwalle@kernel.org>
Cc: stable@vger.kernel.org # ae495810cffe: gpio: regmap: add the .fixed_direction_output configuration parameter
Cc: stable@vger.kernel.org
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


