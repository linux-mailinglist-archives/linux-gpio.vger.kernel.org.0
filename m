Return-Path: <linux-gpio+bounces-15545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A18BA2C6B0
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABBAA16B96C
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BFA1EB195;
	Fri,  7 Feb 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPVUQb9i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB78238D58;
	Fri,  7 Feb 2025 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941512; cv=none; b=WJxKocXaMC1JEu+FFc6pmeYTmxmPNn/Ll3MvCkmw8i7FyNZCz4Ir2snDbOpEy0qEE6Cne4EQuiqbefrm6FmEq3k3XuNDpntPfMI0RabkFJ3KTe78VeiAiBLsw0TnARORMODNGByJSMQ626dYMwXVtCQO9xhn/Qow2v8x48iqVVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941512; c=relaxed/simple;
	bh=MprMiMuV+6PSWzh5qcNiBjouyTdWbepTzVpCMiEoexc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FksCTGLUDqzs5BJ8t6XrANgCPfWEQ5b/6C7tKJJxZOZRs+DL6T+wI7/X4dnelTcvzEp6D4Mkbr4BuP4P0NfeP2diKMv1Rb2CpCpi9P1Gy7NeLgccBTvXCl8pe6kvoRfKm1tVPouCAxUrFNjBy2346io5s33WzPX0JInhgKwC16A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPVUQb9i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941511; x=1770477511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MprMiMuV+6PSWzh5qcNiBjouyTdWbepTzVpCMiEoexc=;
  b=HPVUQb9iyebAe94yXz6yhRqyPqgk75KgnZx6BwcFsAhVJTpe7yA9W0Ep
   8AFygC4SI1N6Kr1F9MFsqWkfE73CPt1YYZfJ/cEcQU0XWjwBsItIG9i1X
   SmUO6E6U9dYqL+H/RFB3+/vM5xY87X2CiMEmodHgvUFLyYdvyqsg0JCcK
   PyF+FrzCQGo2Z7pMgdOk1RPsqcZumVPAjiBTE8tsb2E7Nl5E/bCa+crSA
   ACi78WiYJLUBnMM6DCPuAnCI3wQhtVHmcoNA0CbEmd+TGH8rHqcDXXuYS
   x0pl33CRUBJPzG9vTMMLLlXldkdXKI+vVgDEOnku5xCuUa0NMlzDeC/ee
   A==;
X-CSE-ConnectionGUID: Fh7RfJLuS96ejanzLUZU6A==
X-CSE-MsgGUID: d7E1tk1oRwOGY0yaKfeUsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38815609"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="38815609"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:18:30 -0800
X-CSE-ConnectionGUID: nkcY8q7tR4alKYqFWIgdIQ==
X-CSE-MsgGUID: SofFb9WSQj6+qh13Aet7QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116599312"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 07 Feb 2025 07:18:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A286F428; Fri, 07 Feb 2025 17:18:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH v2 3/7] gpio: 74x164: Annotate buffer with __counted_by()
Date: Fri,  7 Feb 2025 17:17:10 +0200
Message-ID: <20250207151825.2122419-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the __counted_by() compiler attribute to the flexible array member
volumes to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
CONFIG_FORTIFY_SOURCE.

Use struct_size() instead of manually calculating the number of bytes to
allocate the private structure with a buffer.

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-74x164.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 70c662bbca7b..7844f8a58834 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -30,7 +30,7 @@ struct gen_74x164_chip {
 	 * register at the end of the transfer. So, to have a logical
 	 * numbering, store the bytes in reverse order.
 	 */
-	u8			buffer[];
+	u8			buffer[] __counted_by(registers);
 };
 
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
@@ -97,6 +97,7 @@ static int gen_74x164_direction_output(struct gpio_chip *gc,
 
 static int gen_74x164_probe(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
 	struct gen_74x164_chip *chip;
 	u32 nregs;
 	int ret;
@@ -116,10 +117,12 @@ static int gen_74x164_probe(struct spi_device *spi)
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(&spi->dev, sizeof(*chip) + nregs, GFP_KERNEL);
+	chip = devm_kzalloc(dev, struct_size(chip, buffer, nregs), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
+	chip->registers = nregs;
+
 	chip->gpiod_oe = devm_gpiod_get_optional(&spi->dev, "enable",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(chip->gpiod_oe))
@@ -133,10 +136,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.set = gen_74x164_set_value;
 	chip->gpio_chip.set_multiple = gen_74x164_set_multiple;
 	chip->gpio_chip.base = -1;
-
-	chip->registers = nregs;
 	chip->gpio_chip.ngpio = GEN_74X164_NUMBER_GPIOS * chip->registers;
-
 	chip->gpio_chip.can_sleep = true;
 	chip->gpio_chip.parent = &spi->dev;
 	chip->gpio_chip.owner = THIS_MODULE;
-- 
2.43.0.rc1.1336.g36b5255a03ac


