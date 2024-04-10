Return-Path: <linux-gpio+bounces-5269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FC989EB11
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 08:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1DC1B23AB0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 06:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E1812E73;
	Wed, 10 Apr 2024 06:42:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15792BAFB
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 06:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712731322; cv=none; b=dnU9cjUswpYbreA50NXVCfrjNnhw95WcMi0bQ6MehtYb/ZsQ86CMQdQNx+RCGmnBoDcYUOGWTLLEVb3BFnnlFbqpb2P5MEfd+y3IQbz0L0+agtxnSXLfn/p9Vq8WrALXgp+meLqVozKjofU7+/+dq1TDuuqMdIU+T3foinqEMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712731322; c=relaxed/simple;
	bh=xxEOl0qZbmAWfxl2RnlJnJ/GRhE5ZxBQtOVBcv//8kY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=an90zS2O7p9pG8vZnK7dAz5H4JgKINwuTihB+69E7ec9WXJ2GnTqg+kRNXaMemlW+HNUTqesuyxlrT5fn6h9kZLCHJf7BlA6G1CVNaQYw3H6vtXjABhJeOQfDn2eXWMgUy70SnAbi0ND3Bzv0gsRflR/4VBjXdTuEVPgkZGpn2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 6d769ccf-f705-11ee-b972-005056bdfda7;
	Wed, 10 Apr 2024 09:41:58 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	William Breathitt Gray <william.gray@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: William Breathitt Gray <wbg@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] gpio: pcie-idio-24: Use -ENOTSUPP consistently
Date: Wed, 10 Apr 2024 09:41:56 +0300
Message-ID: <20240410064156.1199493-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO library expects the drivers to return -ENOTSUPP in some cases
and not using analogue POSIX code. Make the driver to follow this.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-pcie-idio-24.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 2efd1b1a0805f..7f7f95ad4343d 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -267,7 +267,7 @@ static int idio_24_reg_mask_xlate(struct gpio_regmap *const gpio, const unsigned
 	case IDIO_24_CONTROL_REG:
 		/* We can only set direction for TTL/CMOS lines */
 		if (offset < 48)
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 
 		*reg = IDIO_24_CONTROL_REG;
 		*mask = CONTROL_REG_OUT_MODE;
-- 
2.44.0


