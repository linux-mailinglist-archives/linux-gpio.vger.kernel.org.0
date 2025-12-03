Return-Path: <linux-gpio+bounces-29231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B1C9F42B
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 15:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1E4D4E1E2A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 14:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A862F1FDA;
	Wed,  3 Dec 2025 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ew2Re2b3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B841EDA2B;
	Wed,  3 Dec 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771488; cv=none; b=kao38Huc/OEQGf8FNcCxnVySy5fxs29g5g4xjnHgoVLRA5GJeMkHPreYL1e3LqjLr8FEb3a4Z/Z8hbJUMuEb82exoR82rQbVdxGl1F+Ipy06OOTrUx6H4rNoMXhd3hOcLTeQ00rmNOKoEW/TOJJEObvlwPiu94PLmZw+fo9zPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771488; c=relaxed/simple;
	bh=0oISHUEw1Kx5h39u8HCe3QFxowdlIIBBNMyllOvjxas=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uEBsgx76q+GDuffG4KmHRq0tF5kdHldJ/i/mfiFa0ZGubdErMbX7YuS17V/DNwtz0RjuTT8yWrPWNt7BKVDfXdYigE81H5xwDVbk4JrJT5pn1TKrRyVXr2nEpnvgLzW4lScFTqh3L14EFcHGlxVe60Dae74klqrToZU0ILkgatA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ew2Re2b3; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764771421;
	bh=VQxMZw9Bj4TduIndxmUmouwTj7ndMCiSYmZsORJAikk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ew2Re2b3mBkS7H7+OAy520ys7fVhqVW1YjzC4x8k0wbEVJeQtZD+MRfK1g5SAsEor
	 Uv+av34a7xoKlbNEI0vGcYHPe+ENV+JoqiL/upDRMoW20Y5JutA2V6LTuPNZ2KXaNI
	 X4mVH2k2D7pfUowFgLHX4pNEMw7jAf1V2n8rXkIM=
X-QQ-mid: esmtpsz18t1764771385td15bb606
X-QQ-Originating-IP: 3ff67xybBtAGjn0zPPQwa8OwIFgKL6AErjRywgZ2QK0=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 03 Dec 2025 22:16:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 917455319191210113
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
Subject: [PATCH v2] gpio: regmap: Fix memleak in gpio_remap_register
Date: Wed,  3 Dec 2025 22:15:58 +0800
Message-Id: <20251203141557.2652348-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M6x2tnEVru4e6MWDbJjL8M2g3m7Bg/ixWZFblvwvzS4HLazDDjh3ELVj
	rzUIgasmT/lQcsRhVSoinz/09kYhuHAul7HkBJ9TcVg3KCPdazCKpYTckEGMsXe6YDL06Cl
	0wu3O+h0Ms7DEYrLfnUqRsG84G1jFyD+oZvwHwLsncsS/sM6Ae/U3WuvfJkaFUBrXWZPuG8
	pAcHOFlUm+fyeAJ02MpSr25r13rHszQd7W0GI3oaNWQDomQSdsNS0egXmCaaPnWzoK32zMV
	2/c3eQpurs+S73iS245dYpssfijbXcmbui+PjfWxhlUUX7CKtGVBMYSJkE1Dp3/cPQuJb2Z
	p9qDw1Vc6Z1OfhNGTD5YMHZjNSRCw4/D6UjV8kW2uXJ1iS94+IxwdKZnLfi63i3O+XO+YQC
	qbkS5PeywWy+uiMAcDvObWRRindUwbcdHEnh73/NxhZMCuh+sNfyN8kvMWiKwIdi4yC5iiT
	atuT0RFyO6ASd+gpgh6ZOnz3hcXZVDYbEsXIKp4VPEBRPfCwwdMgKQ/oiVl58j5+k+FT+f9
	g0plO4BVXpcw+qWCEuH3ZkjT2VFbSbGZu3HkNDu0wLQVKVF6Bia1Jy8mQwyw6oTs4HEfbuK
	3J0HdZ3c2kIsuq/yuwg61HwPdN85REqmLDiMCPiyv50mGyvvov0fCXclrtTw49btt+jOrsT
	vX8gH5kuhFAqQFt1s091sipZ8iur1mTld7+r+iGlMC0PSNO8qr1bg7GzqEEpU61UzHdN8zl
	KFqgf99GNtSIFPJQKEqIhBfskIWGlbetoqRabTDDPRzCDYxNBRutRZLb+B/7jbfYIWynFmV
	KMzdxtQ5Kut4AQoN4doPhfxGGcHi430gLPizWmp9hOPPmTdrPSfN/oN3qf7NlOEGB06tDkc
	wo0Ew0GWR9SXuRhcgLoX7mkDpX+a7jCpmLnruJthdmWd1ZLi86KNkGtWvz5Gklr3eH+Em+T
	YWwVolnCZcz1dtrofFfRs9i/8/LpBT9hiOsvBAdweq+ekcLiDQ/VQyMqTeLrA/XrJtbmf3X
	Oxjpos+mcvD3WQeMwBYWetZwS/kkzVAV9aVWHi0dcjLkdxTsetxaCcCPDCvf8+dMeZYliuD
	Ypkyr5zxAb2
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

We should call gpiochip_remove(chip) to free the resource
alloced by gpiochip_add_data(chip, gpio) after the err path.

Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
CC: stable@vger.kernel.org
Co-developed-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
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

base-commit: 3f9f0252130e7dd60d41be0802bf58f6471c691d
-- 
2.20.1


