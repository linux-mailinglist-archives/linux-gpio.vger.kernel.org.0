Return-Path: <linux-gpio+bounces-25455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5CEB417A3
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 658303AC21A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC2B2D3748;
	Wed,  3 Sep 2025 08:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EkhiNMDw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC45A2EB5D4
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886435; cv=none; b=Ug1PbJKsD6CaS410uVhyPJ7aWU76qmmHUJWz+aupattjKjHF2kd/usJf4if7WEJv3xlJlAdGmaZnb2YekLp7LkHAymOjzivfD7wpcA2u4ZG0CiCtB+nT9ozJzhmMa4xqTye9e7ou4g+/vQ1vkUsUCNWtAoZCoZnolHXOB39BT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886435; c=relaxed/simple;
	bh=IPumybGFRYFYQaM9OlD6dpGN1i1pIA9siLLRAwG3nFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YDjYHlD+WOf3A9NK9CI7cP9SygUi8vsc5SddNVFX3QQG9MNdS6bEVCcaQEfA+34xpsDXW0WAhUg/GaBNX2bn1rKMmNJD3NpVml4uWnu2ANL1kDNS+8xQCuT4VwA78My1eoJk8ouHrjBDqvaVRyrGpNqmgK0CD8w4mXR9csY/NY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EkhiNMDw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso42032585e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886432; x=1757491232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xl9c50SijOEdAZRChzrnPJTZawBct2jboofqHxITrdY=;
        b=EkhiNMDwSeSay4o4etE3iYe1iCNYO74pCLy2KdN75HPPFowTLgRqmEDBeiCxLBoIwT
         YNMZVjGZ/AZL5B1Q27SKml4hre5nRdfJojdfKZoHDJISIA6wIYZ1eZyR0YAuK3qEJSJz
         bTOMvT2SUubGiVxVGRAW8v+dIBkpmIVZ2mkX2ypL+ghwxFQ/klis3jnv0USbciQ3DYYU
         DVms89IvBXFPUYMP06102zuX0ZxFmg6SzsAQAlsVEfjXMA1ydGAqRkny8jQcf/GRDZ+T
         URE0hlTJC2VV08TAB6m2oActstiPZ0W9st8DIkMG72Srmm3k83a+yXCdmq6TI79tYYBN
         5/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886432; x=1757491232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xl9c50SijOEdAZRChzrnPJTZawBct2jboofqHxITrdY=;
        b=g1co+mc05NWUdboe0Iev9qzn96sfvg2W75ZDSHq8m9tQMlmR5f+62srL4XnR053ylE
         5z0rZOeYFMwWpAUjF+Ju/Zgq9K48gjWeuZUPgLBld7y5w0d200RJsIT5rCL9ECk/b7tb
         7YxgXyt4sFWhgCtj/JwhkpVgIgxBklJKMPz0JiALNg6tvUahPagtD4EFN8yHkP0TZBg4
         RZjNIQO22hXUUi0wDJnclcIwKNq/XxpMG5E7mM1ZqTMNYTyJLGVF5OHJPwNRXc/lorNW
         3Zf7xD13mTWJ+4mwLIoE7OGkOkIfqxGLNtJU/GlGmHl9e37oxjKxyGXa3WXrwDm0l31M
         ck6A==
X-Gm-Message-State: AOJu0YwG+kV86dSv/Gpmni0cV9Y/EldX/0MWfgs8rn1QhCvcOgxp51an
	mvGgwLmoJETSNwqzOvmyLsfPHRqf2M5UUcizmNPZvWoCqve8BcEjeD6wm2cXgNqQ03719xregzl
	yKaPz
X-Gm-Gg: ASbGncscf44GrTBALVswdws7obfXqkPiB3aZ59DLbcnEgogfW73e0/UB9fnVdS1sNw3
	96+poFCmw0jG9+toKB+c3JZffY870cXlYhz9PbXbFr7M4YsUpYB7PU+AlmYCTU9I3IYCNizVhh7
	MWctBiPiCyp0N5aypMkh6ga9eVDnGqqUgxNOQic5FR99f0iJy5fYnTgirky5jEi5p8xeoY2o9KO
	/e5gp+zkJMhyVQVUKiFvJfEH6A9ZMQHiJ1ah6TZaseb3FM07hshUupUUmvybsXQQVIu/QtBQ5SJ
	27PPEvcHkfJwOUuAmF2eyJHn6EPbSiQj0GuHFLPYP0xpvl/Q/FfZ4vmMe4ygy6eagzNnWaZPEag
	ddv63MVgFH0cdveZd1rUwKSpfTAc=
X-Google-Smtp-Source: AGHT+IF2bnM3rciUVbRMrNwmO+YSe6bBRk0RN/gGbq8L7FMVer7GZO86jwyTuVa/jTrPDmY9JPEBSg==
X-Received: by 2002:a05:600c:46c8:b0:45b:80ab:3359 with SMTP id 5b1f17b1804b1-45b8549c269mr116288125e9.0.1756886432069;
        Wed, 03 Sep 2025 01:00:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:14 +0200
Subject: [PATCH 10/12] gpio: ep93xx: order includes alphabetically
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-10-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SeHuZ4DyFwDbjs5OShkvtEguX9jqUfBZsavpnJL0KgY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WSv3trZSskCN08g6ztefjtu8g89Qs468UlP
 JhNKWGRoYqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kgAKCRARpy6gFHHX
 ck6qEACV9xM3Bt5eAt5FKZW48qyPbqMf5pY7l5XUTZ+Li09j3ed6/2R3UB6jMZWQvEkintiENSV
 J8By/NYAK4bUYnVe3rZL6Riuz3NnRt7SLjU/DI7P6sMgGwkeEITYCQgZgFKik31jX3hK5gWyxEv
 WJKvrt8Tk8EhJyGrJMmng7ppj0kLU4CsB9hcW+GzGja2pjhI8d/gLF7weFg8JX2JynngL72C8bH
 gS8LKxDx4JtjReUqTJFVJ1yWBkQ9uHZ8Zn5qlbivGwdoo5B4raqBIUmUqMhz8L4/CyrRFFWJtSs
 TxAjpLuAI5tOzztMl42AyAKnG23mT5670+oLdSCC+g0Ns0jIUO2cLwFi3DaEbFhBiZYO1oaaOyj
 jdmnMzotD1HvlI0COVxnNFdd9uTvZxhduLOD6yR/RLWTAR3GalX78PTp2R2CcBYXT6UG/pWFPgr
 F75LNdWHDcmCUZx4JeOIHBvGjz3Km2w+ecrIAM4VrxrIxZQ0G1U6PMPXSXfzdrNf63fp/lYWicD
 LINF1QLAlwABiyEVV6qD/0i/gc6iWIyL9e62/lvSQk7+qbIduSlgn24qa/2QyKZSPe8LKslBWhq
 d88D5wmIoE10KJBLDO8WAbYyPPia8OWbIJJlL9z73xorUARUXsnHkOyz3s57BhAuuVwF3vo2WKR
 OFj2ms6wO2yJIJw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better readability and easier maintenance, order the includes
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ep93xx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 58d2464c07bc360137f3100de4e4147030bb121c..08e5ae8bf4d1a80ca26680a3c7bff0b8039fa41a 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -9,16 +9,16 @@
  *  linux/arch/arm/mach-ep93xx/core.c
  */
 
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
 #include <linux/init.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
-#include <linux/slab.h>
-#include <linux/gpio/driver.h>
-#include <linux/bitops.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/seq_file.h>
+#include <linux/slab.h>
 
 struct ep93xx_gpio_irq_chip {
 	void __iomem *base;

-- 
2.48.1


