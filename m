Return-Path: <linux-gpio+bounces-12423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 507F09B8BE3
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE3D31F210E5
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 07:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FDB153801;
	Fri,  1 Nov 2024 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sa0meP7T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80931531E3;
	Fri,  1 Nov 2024 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730445335; cv=none; b=oB2DlxpIpSIfxSmOSRD161N+gjd+gM+eRewlnupHlxbBqi9ar3az2FO5YC6sObfslgXh59tzIAw05vL1oM24ORgrzdQUV1sqZkepOfgp1Xvcx/JQlzxk+4YXv9gCnFcJ3DywYW5F/d9FBQE1L2vaHdg1K1FXtFgmI4h3iMCxgkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730445335; c=relaxed/simple;
	bh=pqCHbefJia4K1aQNqr1JJ0xqZ/HF1gOFf70y9GquLnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPabca7V3Y4cwidq8i7VqaIRIqw1JsdoagP7VPXE9vJ1ptvPZzYSwExqWOd+9KsGBELkxkfrZnu3EPN4ZxF1DKUrLX+wz+K2Us+ODln/0bvecAnXf7bGv1sq3pywERwIrPg4MXqRcCqJCy7pM24S8gwUbww0tp0mOsulcqWXYVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sa0meP7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7386C4CED3;
	Fri,  1 Nov 2024 07:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730445334;
	bh=pqCHbefJia4K1aQNqr1JJ0xqZ/HF1gOFf70y9GquLnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sa0meP7TB9ImCr9Iium0o34uyLo55rKpvlZg3Xy9Ub5ryk1a0EbNNMCsyKAS+mP1Q
	 mwOkIOcWPmF+ksNcDV85avuEfGtCwBzhy5kaSQWweMdfcCgxcbBQ0KCZsiW4idbucZ
	 xirpwG/kd5KvqEc8FVdGR8ZARwFugca/dz1MHy6/9mq/WMvdX/aZVWd8wxgSzFVw4X
	 i+YnLhWaYUWIDu99sKgqsy5zZtbYKWagJ0jM8Zs5l/ilaWq4YFeMK+MbnQLdaOOgHk
	 UBu/KImE77URpLonFvix8LLst5dE6Vx13kunLZcqv+I9i9Kga9Ijl3GL0plOtFHWKc
	 84akrOyqAxwPw==
From: William Breathitt Gray <wbg@kernel.org>
Date: Fri, 01 Nov 2024 16:15:08 +0900
Subject: [PATCH 1/2] gpio: pci-idio-16: Replace deprecated PCI functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-pci_iomap_region_gpio_acces-v1-1-26eb1dc93e45@kernel.org>
References: <20241101-pci_iomap_region_gpio_acces-v1-0-26eb1dc93e45@kernel.org>
In-Reply-To: <20241101-pci_iomap_region_gpio_acces-v1-0-26eb1dc93e45@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802; i=wbg@kernel.org;
 h=from:subject:message-id; bh=pqCHbefJia4K1aQNqr1JJ0xqZ/HF1gOFf70y9GquLnQ=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOkqDSJvv7TK1vxqyZuvXKR69ar9k+I7bt8Er/PL8M/OY
 9aofvu8o5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZjIgruMDK95+Ld+rOw2d+MW
 bxJd+v+j4qHGyztvrO9imima8TBF/zwjw2VzPwc731zxPm8lDoUyK3U9RUvur53MXRkL5WO6jR9
 zAwA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

pcim_iomap_regions() and pcim_iomap_table() have been deprecated in
commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
pcim_iomap_regions_request_all()"). Replace these functions with
pcim_iomap_region().

In order to match the rest of the code in idio_16_probe(), utilize
dev_err_probe() to handle error for pcim_enable_device().

Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 drivers/gpio/gpio-pci-idio-16.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 44c0a21b1d1d9f1ba4e013ba0947ccae78288d5c..64f332c805507645039615e0a89b83175f6bb616 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -70,24 +70,17 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct device *const dev = &pdev->dev;
 	int err;
 	const size_t pci_bar_index = 2;
-	const char *const name = pci_name(pdev);
 	struct idio_16_regmap_config config = {};
 	void __iomem *regs;
 	struct regmap *map;
 
 	err = pcim_enable_device(pdev);
-	if (err) {
-		dev_err(dev, "Failed to enable PCI device (%d)\n", err);
-		return err;
-	}
-
-	err = pcim_iomap_regions(pdev, BIT(pci_bar_index), name);
-	if (err) {
-		dev_err(dev, "Unable to map PCI I/O addresses (%d)\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to enable PCI device\n");
 
-	regs = pcim_iomap_table(pdev)[pci_bar_index];
+	regs = pcim_iomap_region(pdev, pci_bar_index, pci_name(pdev));
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs), "Unable to map PCI I/O addresses\n");
 
 	map = devm_regmap_init_mmio(dev, regs, &idio_16_regmap_config);
 	if (IS_ERR(map))

-- 
2.47.0


