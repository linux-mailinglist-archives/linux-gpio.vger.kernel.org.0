Return-Path: <linux-gpio+bounces-9267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3823496269D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 14:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E73B42843C0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 12:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF3A173320;
	Wed, 28 Aug 2024 12:12:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E7172BDC
	for <linux-gpio@vger.kernel.org>; Wed, 28 Aug 2024 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847161; cv=none; b=JvaA34IfrH6X521FiMdPEVfsMoVjl8M8he1WDX4E807eeVV5TDsMSCzY2c7D8AvroiLxXnavnsQ+/laPk6UtVUSBMoNMKBScOyPNYiHvSMdtO+Mym2ZpNDy/oMDG+yf1sINZJ5i1vZg+3Eq+oyo9ZzIB7BUhPhztlzJwFDlQCtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847161; c=relaxed/simple;
	bh=mtSC2GoiVFqJfoApUM6Up5VML7pC7ADPMB/r81Yt2E0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jzo94vXV8zGagk/3VgSVABvI+u6p/jiZJKzuR1FbK+OfwU8t09D233u5J/dZCeDCyVEMK/rG9v1Y578bvzClSmYwK5NgX5F9/c5KHunERAjSAKi7Ksla8vYsZKXMcWIWrx2oEqZH9hUcDrWrZ0+q4GMH/GzUr7T4zEvAwuzQ8Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wv3836Yj2zQqtW;
	Wed, 28 Aug 2024 20:07:47 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id C3936180AE6;
	Wed, 28 Aug 2024 20:12:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 20:12:37 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>
CC: <linux-gpio@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next] gpio: Use IS_ERR_OR_NULL() helper function
Date: Wed, 28 Aug 2024 20:20:39 +0800
Message-ID: <20240828122039.3697037-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Use the IS_ERR_OR_NULL() helper instead of open-coding a
NULL and an error pointer checks to simplify the code and
improve readability.

No functional changes are intended.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3903d0a75304..de425db71111 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -356,7 +356,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	 * We cannot use VALIDATE_DESC() as we must not return 0 for a NULL
 	 * descriptor like we usually do.
 	 */
-	if (!desc || IS_ERR(desc))
+	if (IS_ERR_OR_NULL(desc))
 		return -EINVAL;
 
 	CLASS(gpio_chip_guard, guard)(desc);
@@ -3591,7 +3591,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	 * requires this function to not return zero on an invalid descriptor
 	 * but rather a negative error number.
 	 */
-	if (!desc || IS_ERR(desc))
+	if (IS_ERR_OR_NULL(desc))
 		return -EINVAL;
 
 	gdev = desc->gdev;
-- 
2.34.1


