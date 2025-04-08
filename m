Return-Path: <linux-gpio+bounces-18506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCA5A80E90
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30A571BA382F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0A822B5A3;
	Tue,  8 Apr 2025 14:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hd/+GhPh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D1A229B0E
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123000; cv=none; b=DY5U8b2bJRBsNx1grRqh3A65dFZwnUEhv/NDAo51/LWauRn3ZbuAXAIUBXVxXVnzx4SOqWP7qxSYc3qbrj0h9ytS39P3FwcRf9rjROZpuQkSqhhWsvoaN4tG4m9cNyt5M0sUwzNExDrI61WIs+VaNzm0q9sx1njd0P1VcfMGJUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123000; c=relaxed/simple;
	bh=VMDuT2jhj89NF4sxHY78mrJyGiA92w/k0fyZukw4JbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQIsn52tbQN6BaOZ//P/7/wBOiMIWJpcN1qvKYtPdbLkhin1wU52O2DzAy23OCLHmyHJHC+cPhMJquIB19qBLWvbGiQ1CblWZZfyYp+raotSSAEpBfRm8vd6XoQCBJ8I+IFq4evWfrxy2XytlAWNwu3S3NUdVmOjHRIMeko8Dss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hd/+GhPh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso4337824f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744122996; x=1744727796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPPvBfN+HGZfLFV1ZtWLMiIkwQz23m7w6sKuYGQlZ7w=;
        b=hd/+GhPhIt/aavoNYkuoppjGAAZabEhso/V46Aq1c+szqS9myvxDBVdcjeho24Pp41
         sRnWIoOJ6LhAJRhcSIeWAiOvRd5uqpP4aD4czEYOIVaIa550WEuNqLBHXPBVOaZviCoB
         RbJFOUjrUSnU0vZcz4wLxpnQS6qelD1ibjto0w1Gow8KtLQLFPjrniLS5C/VOIPFl+T6
         MuW1QhvUCGF4s/fLB/rOt6HsvVNLMhf+mXOsiUYzYlAlOMGFZ32bbxngQc+UDAh+3Z3b
         GrMj6NHXet7+u0E875xDB81GsBHvBHeEZbY1tdjSWxEdSip95NGxiKu+56KJ3OH6CUmr
         3Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122996; x=1744727796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPPvBfN+HGZfLFV1ZtWLMiIkwQz23m7w6sKuYGQlZ7w=;
        b=NnLCqNX+8jFlpH4O95qkHMv3yugouOZyavXC70Af6NPUcgxEfjEpOZP6lUH9fhEHoa
         0cFwLHj76sjEIVxVW49rgmvNx2dutMXL2et3SGBnFGPv6uE4D+REn+PQB39V2Ce45Gl7
         9XNn76CBuurJDJja4AHjSDAIxunrWrK2y4W4kI0YwMkupsVYQ166YsEWAN+R8cYzTYoG
         1OdEDZQHlMJfPygBVLu44W+buBR36lNzRnQBIDSOrZwT9wDy14PSFWBN48SJiw1ypkO/
         7RP6HZUh2LMSRA4c69fnR/FWzMGE+h3FY6+RS/K0WVuhoKycntLOKSORpT8s1241ER6G
         jgXA==
X-Gm-Message-State: AOJu0YzoBOXlAhDZyC6eBjlimkMyqunLHQcK78mV43zVNMJT9WwFU0nd
	lzpwIuL1Pp5BJbcjXtMkXDzngH5IM1rtQbP1ums5NBpeI+UMLdzqVOUULZ/mSpk=
X-Gm-Gg: ASbGnctPfqt1lVK/4JndpzYvaZlPLNVDFWQIbm9kqb6DGrdU9YoGvaKH8h6tfpkmzhU
	zMTJ/StHaJvY7ky67G0LsWpG1qkqFZm0MRdEQHQ3fKOGiRidt4E40ZIaPlwTZnuchM9uyVnjT2o
	dZLQokfMlcFGDVodKFyxFqm/zIT/Dopt/U4tbEi2jAGcTLN49SirWbzbdr2UJXJF+A3B8X2bRtU
	ucT8C6rt6895C6Yfu7GP8/nSozUbmEHykFnu0T8OUCnLRQQlE4aAdXB0ajeqc5EXoCn4Jt3HGQO
	0hT/ZNnFeQcMwpbLXA0Ieyc6bGoez4lnJe8VfsX5jFqJ
X-Google-Smtp-Source: AGHT+IGs3Xppykht8aj5t+Cb6rFG+nfWJmqODTuMzwxw5i3C8PzwPs3DpgDnmHqpNVBS5pEI3mexfQ==
X-Received: by 2002:a05:6000:2289:b0:391:2a79:a110 with SMTP id ffacd0b85a97d-39d820ec28bmr3149920f8f.29.1744122995327;
        Tue, 08 Apr 2025 07:36:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a727bsm15003151f8f.27.2025.04.08.07.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:36:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: blzp1600: drop dependency on OF headers
Date: Tue,  8 Apr 2025 16:36:29 +0200
Message-ID: <20250408143629.125576-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the generic boolean device property getter instead of the
OF-specific variant. This allows us to stop pulling in linux/of.h. While
at it: drop the of_irq.h inclusion as none of its symbols are used in
this driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-blzp1600.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-blzp1600.c b/drivers/gpio/gpio-blzp1600.c
index 77ad0e596f3e..2760a13c0801 100644
--- a/drivers/gpio/gpio-blzp1600.c
+++ b/drivers/gpio/gpio-blzp1600.c
@@ -10,9 +10,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -217,7 +216,6 @@ static int blzp1600_gpio_set_config(struct gpio_chip *gc, unsigned int offset, u
 
 static int blzp1600_gpio_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	struct blzp1600_gpio *chip;
 	struct gpio_chip *gc;
 	int ret;
@@ -240,7 +238,7 @@ static int blzp1600_gpio_probe(struct platform_device *pdev)
 	gc = &chip->gc;
 	gc->set_config = blzp1600_gpio_set_config;
 
-	if (of_property_read_bool(node, "interrupt-controller")) {
+	if (device_property_present(&pdev->dev, "interrupt-controller")) {
 		struct gpio_irq_chip *girq;
 
 		chip->irq = platform_get_irq(pdev, 0);
-- 
2.45.2


