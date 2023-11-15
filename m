Return-Path: <linux-gpio+bounces-181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E81617EC8F1
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 17:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E4DC1F244D7
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 16:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279B42EAF7;
	Wed, 15 Nov 2023 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vPjtHPlX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F5D2D799
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 16:50:10 +0000 (UTC)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6960819F
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:50:07 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-675b844adc7so39400056d6.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700067006; x=1700671806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBzGno4D43Ros4hSmP6lFXf2RSbEodgJworHzjxav/U=;
        b=vPjtHPlX9qo45SMY2An0s5cvFgsnc/DPWwwA2fJ1H699LAhLmFqvN9ZREOmfxJEvD6
         lIYshiSUIIGnk4L4x+OoukIqcMQPcet+NYQCIdEmvY2mMeiQVEFiV0+97QEJ4x9lhwUH
         G3vKgtovD8Zz9P6M4GmiQXbsdA/e+ypyxY5Zb1Nb0TLmEtB9W1GFf9qYF4ZpnVFq/epP
         fXxi3XogmlqY3hkw3QB8Gx+hdQan9R96g1hlPcWC5r456nDMlEweg3a0cOm6KAHO6GZ0
         XENGoI0ms6MXbfB9H1LFfCisZfY2vq1y/n3rJLwOQXP8B54VDgsGIOX7gfgG3Ngub1uP
         l3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067006; x=1700671806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBzGno4D43Ros4hSmP6lFXf2RSbEodgJworHzjxav/U=;
        b=jZs1nYZGKLG+Xiz2NRnibcrtKHtqESqUYvuD7mILAjQbEWOGKGeHtEToqStLeXI/H1
         gnkiFUzUgY3NSzpRQqS0k5KqIZ/v61NhKanRDQ2d8vyI9HoXUQy1yhxQw3JsQD6VhQIQ
         mbkstGhGk1qiMOamJpTpAlRt2Xr83epUKppS3si/0OyqNtLorPQ24pnijQPS6IzxBidx
         antzAcyc9b+QLn3XFb3efOjiRjGkw06kKYEP0Cos8lrJuB1gqdEvt2TIfNvcKZ0aaaTw
         xLpU9QwWI/PyaacHUvOsu4sJv5v8DXolT0nT6BGhnIE8rfU117+OsH3qF+g7wJaXnZQQ
         rrFw==
X-Gm-Message-State: AOJu0YxtU0y5F6CbeIEnIjvkgtvHPOUMsw+bUaRHYhF0BeqfumdwYVLY
	s8kVd8Ii/at8UfHTO1ySDxjlbw==
X-Google-Smtp-Source: AGHT+IFRu8UzuC2/0PimlUZ+XtnZn4xYNBiel6D8QAFpK0dkZkTmuT6QrPD8tNJRmUck9qf84yYvwA==
X-Received: by 2002:a05:6214:5497:b0:677:a1d5:4331 with SMTP id lg23-20020a056214549700b00677a1d54331mr6464857qvb.33.1700067006554;
        Wed, 15 Nov 2023 08:50:06 -0800 (PST)
Received: from brgl-uxlite.. ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id mn16-20020a0562145ed000b00670a8921170sm658781qvb.112.2023.11.15.08.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:50:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/3] pinctrl: don't include GPIOLIB private header
Date: Wed, 15 Nov 2023 17:50:01 +0100
Message-Id: <20231115165001.2932350-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231115165001.2932350-1-brgl@bgdev.pl>
References: <20231115165001.2932350-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpio_to_desc() is declared in linux/gpio.h so there's no need to include
gpiolib.h directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 0b4d07aea387..e55959e1af5a 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -24,6 +24,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 
+#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 
 #include <linux/pinctrl/consumer.h>
@@ -31,10 +32,6 @@
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
 
-#ifdef CONFIG_GPIOLIB
-#include "../gpio/gpiolib.h"
-#endif
-
 #include "core.h"
 #include "devicetree.h"
 #include "pinconf.h"
-- 
2.40.1


