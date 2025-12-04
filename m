Return-Path: <linux-gpio+bounces-29247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAFCA332C
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 11:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F9FF3009B42
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 10:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879B133A01D;
	Thu,  4 Dec 2025 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Pq93/ZWh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CA333033F;
	Thu,  4 Dec 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843295; cv=none; b=b1QOv94DTHeMZcW2pKF+i8Kaa+oHkXx2rkBYGIWt93nlgtMYkIA4PEQxjdLwlpytaEF+eYVp8nlnEPsmykSKh3zWEYDkSA9IzrKN9H5MIGhRoPYHeZNJqiBv9ZVy6nACW4C22csMX+IDSBDfKWo+WS8lu1U/owwdZztRcs3XboY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843295; c=relaxed/simple;
	bh=7v8lURGWmIHb7ROsruuQZzIKFqQLuD3IUmcJRgS0N7E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NZ8g0UjPKmZFf7P4tU55fpplCCn7ov9OUWZSa4mksbU0uOPFmcnvUfLRB0Ux+X5FrX2FiiHaEc5A7dVt3sEWLpqCFQzjqvHQfFH8Emx8MdWmIJ98dNMxnZR7gmHBq1Bl3u/3D3erQHCa/z2PWQZ0H/kEE/CIWsV25EAwtVmyGTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Pq93/ZWh; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764843246;
	bh=bNym2dmNYvyM5hZFfSv8UCZgJLZi77M/Jn2RsdnmeCE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Pq93/ZWhg0AMmxU96763Wq/8QUayp7rC+HokLmt1ypYInEcMdEtwEG9X6NLq/99UL
	 7AwJnIpaeL0XVGJlRbFf/php2iUqGMX2IQn9bCE0aYIs0QQMW8gldQ29WNITSctF76
	 rVfPmPyISLRUS1Rbm9fZjQ5k+2Y/yMcpnAeGyMNY=
X-QQ-mid: zesmtpgz3t1764843209t05d020eb
X-QQ-Originating-IP: +6jKbCMg3kST4Qwj1gSdN7/Zou7WLHZFHOcq2AsXEH4=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 18:13:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15845300682569505555
EX-QQ-RecipientCnt: 11
From: Wentao Guan <guanwentao@uniontech.com>
To: brgl@kernel.org
Cc: andriy.shevchenko@linux.intel.com,
	mathieu.dubois-briand@bootlin.com,
	ioana.ciornei@nxp.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	Wentao Guan <guanwentao@uniontech.com>,
	stable@vger.kernel.org,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: [PATCH v3] gpio: regmap: Fix memleak in gpio_remap_register
Date: Thu,  4 Dec 2025 18:13:04 +0800
Message-Id: <20251204101303.30353-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OTvfxIEM1c8H/po7sVbVBH+fPyHaeejFXmGR2aC37gSGBlcv+FW7Gp9t
	GN70Psmpb2ibPTy9WjyymNyZXThXTDb4bD4BChodXGXOQDNnCre+6dDr4sNWwVliD0lB4e9
	SP2u/ygv4AUQUEVr0yA4MtSiuQzFkPjperYUxdDe6ke3IKimTgtlkdUQQiGRLip38zYY2QE
	v1ST8/49HDv8xfS6YN+CrH5qmztF8hFn71mVdbqm0zowY3a0EYLEb6qRxh7OhKVD4sdsHHk
	JjXErvPaKhuAe42w8wbxg5DOuGzaP1hp9ZSU9kRbBrR/ukFVdIItDhx9dIAUHNTRpK25ANy
	7713UjLuBavNy3CmnVuhd5DEG2klLMj1TblMreE5Lx8Pq53yQv+SaTkp+DwZYmtGqLzHWn3
	0INNVrDSKmPTRjYNGCEN5emAjQ7VcwRn/1ss6LaWboR626aLvheKNLzrDMy7hFPLUyel0nZ
	G7BGJL3+2pFCgToj6f4T8Xr/LSfU/EI6Cp0Wc6VK6bZnyjd0lmfJMfD817ve5rbzoblvKvA
	KuCD3fyr8OosU9craCIhOUnuoErZim/sAIQBgou25J/X+/TFNBRCRZs6HizaUzfCZ/byK1G
	0PdtoGmXvi6YmYmGrxgYR53SrVAhnHjqDmGjnOffHZK+O9yoh5ONT//dqHAt6BLqW+DRr+0
	kBjmsUKZYOPD2oFXPTxYDOu2OjUZgsVuYn6vZnncohq88LvoeX4U3aCPStjF0O6Io3T6+ZD
	Q9sv0reyOSO2FLGpdOaYiz/bMmWyujYxSd7ElZoB+aXpXYXpT/33XL7RPRxfA12Yq0acz9N
	FP68si5pm9TUKpjXDO8yNPCnWotWffL+9JVD3zcGfmymLGA78Cl/9sMzLA4Wk6M2w2QG3Rc
	OCATlPgGxB61Rl06oGMnshb6rQu9hFkvKiZm8UfZ8Ew2L0TAL5qoOxB2qp2cy0EW/Reksu7
	EFK5+4L39Ac7vj5lT4n/RcW52WyFyhthGBWM75z5hey16WgoOxeg9qFHNnKTcJdJkc+AaIe
	3YhQ9Oh44WJYnLeyNsanhD0mndEkrsuLK7XxAS0qRAyuGuzXPT8QZSh7WgZXecuVP/BuyIs
	mLKMBeHISZP
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

We should call gpiochip_remove(chip) to free the resource
alloced by gpiochip_add_data(chip, gpio) after the err path.

Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
Fixes: ae495810cffe ("gpio: regmap: add the .fixed_direction_output configuration parameter")
CC: stable@vger.kernel.org
Co-developed-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
changelog in v3:
Add dependency fixes tag which suggested by Andy Shevchenko.
changelog in v2:
1. format commit message.
2. rebase to mainline now.
---
---
 drivers/gpio/gpio-regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index f4267af00027e..c64805dcb9f88 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -328,7 +328,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 						 config->regmap_irq_line, config->regmap_irq_flags,
 						 0, config->regmap_irq_chip, &gpio->irq_chip_data);
 		if (ret)
-			goto err_free_bitmap;
+			goto err_remove_gpiochip;
 
 		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
 	} else
-- 
2.20.1


