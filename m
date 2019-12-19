Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D0C1267D0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfLSRPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:15:42 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54833 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfLSRPl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:41 -0500
Received: by mail-wm1-f68.google.com with SMTP id b19so6230290wmj.4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZKnof9NnGnWaz5Wg5PNLvyOb/wEdh4vzWoDXW3CwsIs=;
        b=oOE+JHQMOaM2l1QZYogpzJH6M7Wn3Dp2n5HfS+vV9Nr7K85412tv8ZdYFI1dhaCtDD
         ++YFBXokMGS6KEFagBjki2uJesGJIgREumCwOdU9e2+v21zYxDYi2U8oPDVG9OcEm7/i
         xZbd3W+OlbjSLaOzwMM2rg3rETgaiRzWxf9onnmMPPKOYf+Fe3x2+WcKN39U/41wTmpN
         ZkTueFGigG84uc7joqvVY9tmyOgWWcddHiPhSXHcJ81j3fA/cY7nD4CWzX8cGrIWM/Y7
         XOxgbm7YkMD+lLRoLBtBdyIuSKEUDAOf64BBogI3nIhsGUCAWX4zLuZHfvutISOK+xBT
         fTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZKnof9NnGnWaz5Wg5PNLvyOb/wEdh4vzWoDXW3CwsIs=;
        b=ZVOUySxI0KlfKq21d7zieRz7NAqXnoomw0Np60CaVZArZMO+jrftxiJ0qLepG7va4f
         W2pE63hqiKgeXSq3OUSoVcQVOSy84Pf9qgq0VsTcYVfECLTc/L8FBQ9XZ36EPqG1QeYT
         a8vbDaRfQOaLrqYcW9K8sRoFN1muDR2SlCyaxic00gbp8qKW+qeRMVbPUNk32LlB386d
         uC3IFtVKBdv631haAx65cdH4klwWAKPTyMJde20lz5ShQMftxl9DC+WdoLPA9182c/hO
         UqIdaLIZ7TYlJ7IzIzAesGHowC3jYfJNMJGX5WJhpFp+c1yOorPsNpjaeamW6TqoKpgU
         nGzQ==
X-Gm-Message-State: APjAAAUZEJ6N2DX19VPVh+9wbe+UHY9h9UGF8YbXdPzGG2fySXVvTUdD
        nYpfQ50Wbt5KdR++cEkROsWAKg==
X-Google-Smtp-Source: APXvYqxyed9XQDWxCA7f59327N+KYa5GAs0nDM+2pUGQ5XO2gXAyJSlmK01+XGMkzke8l8r38BZI+w==
X-Received: by 2002:a1c:6404:: with SMTP id y4mr11340453wmb.143.1576775739740;
        Thu, 19 Dec 2019 09:15:39 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:39 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 04/13] gpiolib: use gpiochip_get_desc() in linehandle_create()
Date:   Thu, 19 Dec 2019 18:15:19 +0100
Message-Id: <20191219171528.6348-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219171528.6348-1-brgl@bgdev.pl>
References: <20191219171528.6348-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Unduplicate the ngpio check by simply calling gpiochip_get_desc() and
checking its return value.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpiolib.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b3ffb079e323..6ef55cc1188b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -678,14 +678,13 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	/* Request each GPIO */
 	for (i = 0; i < handlereq.lines; i++) {
 		u32 offset = handlereq.lineoffsets[i];
-		struct gpio_desc *desc;
+		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
 
-		if (offset >= gdev->ngpio) {
-			ret = -EINVAL;
+		if (IS_ERR(desc)) {
+			ret = PTR_ERR(desc);
 			goto out_free_descs;
 		}
 
-		desc = &gdev->descs[offset];
 		ret = gpiod_request(desc, lh->label);
 		if (ret)
 			goto out_free_descs;
-- 
2.23.0

