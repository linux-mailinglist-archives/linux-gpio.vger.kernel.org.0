Return-Path: <linux-gpio+bounces-28565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7440C62D2B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 08:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50943B53BA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 07:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E58C31A810;
	Mon, 17 Nov 2025 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8ehgkz2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326A931A55A;
	Mon, 17 Nov 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366312; cv=none; b=Smn9IBs5vFojwZI+oZzvYLZfFr0PaL/OxXuzZ2rCombHV2jC3QlzXo22VdDXS1eJ2y0RMmFuKseJorYRkkfXUs80qwK3uAFL7ezOrWI2FRIELN5iQRqH1OdXgqC0KhhpBrBdZPVi9FGJZ/Go5Dn7adylzP/vctSf0/8wr09LYlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366312; c=relaxed/simple;
	bh=82rrWwytEG+GPf3rsvEQmFef+EK8pGQO3WYV4I2OfX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVidg5kzjpsBHdifTLNl05vU1Hj0jxZdQy/s35deHDOyVYZP1Q+zR5WEHdQ9WEUjmHn6Rc90/PeLK0OmxRnyJytTLAK7PXT3vdjlvAABKWd00IVF9EehIL1UADg6a3VK2+HU0lpk+3ngMZZa8FAMuy+0zIAU8hU64/siPlq4gwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8ehgkz2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763366311; x=1794902311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=82rrWwytEG+GPf3rsvEQmFef+EK8pGQO3WYV4I2OfX8=;
  b=H8ehgkz2/HCI8C7dBLdjPXRv5Wb3I4l79s1Lr3vAG6XTTdSBXUmlXaVJ
   j5DBsfDuZ6QmuEFGwT41tKZWT9rIMVG0LvuSbZqG95PkWfWOOkvYIE3NK
   PQqJGP+e2yfpYGYkUmDC29y3aVlqrlLXuCHv7RtsH7yurJASGWAS0Rxiq
   z7AJMS6JPKtOar1VQzxkNYwt75C4tyN8B0XpShu0YJTmY7x7jp7KB+RC+
   MWY/3OcrPVy5ywYUdSUu/uuuBWwqHJg25/gwh4Vj4IIlNJ+t0cd1Wa7Ll
   Xjzk1nhBzBakIYAKIgPBvDlQp4UlTDmq+Hvm2/Pee0DargOFRudfS3bVl
   A==;
X-CSE-ConnectionGUID: HCzDcZLQQ5m4V/QIG01z/g==
X-CSE-MsgGUID: nVEyAUWeRImjT2tdkEps2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65392684"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65392684"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 23:58:30 -0800
X-CSE-ConnectionGUID: UwjfynROSAa2uToRgdP2qA==
X-CSE-MsgGUID: yJBgVRCmRQq9TU/pPNFdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190169886"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2025 23:58:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F3CD598; Mon, 17 Nov 2025 08:58:26 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/3] pinctrl: intel: Refactor intel_gpio_add_pin_ranges() to make it shorter
Date: Mon, 17 Nov 2025 08:56:59 +0100
Message-ID: <20251117075826.3332299-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor intel_gpio_add_pin_ranges() to make it shorter in binary
and source formats.

Function                                     old     new   delta
intel_gpio_add_pin_ranges                    219     215      -4
Total: Before=15522, After=15518, chg -0.03%

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8e067aaf3399..a8b80a24e81f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1348,16 +1348,15 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
 static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct device *dev = pctrl->dev;
 	const struct intel_community *community;
 	const struct intel_padgroup *grp;
 	int ret;
 
 	for_each_intel_gpio_group(pctrl, community, grp) {
-		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
-					     grp->gpio_base, grp->base,
-					     grp->size);
+		ret = gpiochip_add_pin_range(gc, dev_name(dev), grp->gpio_base, grp->base, grp->size);
 		if (ret)
-			return dev_err_probe(pctrl->dev, ret, "failed to add GPIO pin range\n");
+			return dev_err_probe(dev, ret, "failed to add GPIO pin range\n");
 	}
 
 	return 0;
-- 
2.50.1


