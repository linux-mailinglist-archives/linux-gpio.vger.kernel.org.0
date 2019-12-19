Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0D51267C5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfLSRPn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:15:43 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52885 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfLSRPm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:42 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so6238115wmc.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Srugj812bEad7lTKigN1hZIzPJdNdOMlpYaAJOfYAF4=;
        b=BnDEMX+afx9fDJ+i/VCutbb8AFolX5d7d9pqZ41uk9qRHnoY91mJh4l4JDsNZVvsPC
         4wUTIz3Wcci1tRsQMdRzDp+3ZX5UvXXgUN3dhWN2F6UV2KXG4MLet6JX9UtunslNOfck
         xEFcIOBjfx1a5+xdwb/ZMftjszOTd06KorkIx4lzzIkkrICHB8XwgJOqz4K89bpXiqCL
         k3f7nKuetBXHNLEwLLvffqZUnBuuLWx/kYsxjw048Xv4FT67Q7psPUM/xnxUyVwz/NTn
         6sOkjcdBFk4bCbWO5I/MuG5LFcVGM4L64x8rvg/rOU96xlC2fq67mvYUHUKHpTp9+31s
         6fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Srugj812bEad7lTKigN1hZIzPJdNdOMlpYaAJOfYAF4=;
        b=KCQsjO2TRmNLFZeg/OMy/nquuKBbfxTAunmu/bn1twwGyrsAzYa+KvvLjHu293Do2y
         gyYJW9/XvOZD6CJlhcyyXxW71sP3xxiD7RxN3XIKi4ql4c1QUUj0yT5BGCR2OoM36fBK
         867KdrEWZVgmIeD8tbfsfeyFj2/AjynwKC4XbdKenqSSTOZSVRL1yPXxPShqgwJO8aAv
         nam31tJmKlPzEtyZ4KBiKXVVg4iDu2Lb45UTVcmqfnjivUbXBoLBo8ZaezvPHK07WpMG
         BHsm/b2OCXhQ5KO+4P7wA8l5uI2ci/U3L4BNz/YFXgqh0rqT/nXzlDScwC0vXV89xDqy
         bnpw==
X-Gm-Message-State: APjAAAUV+I38LqEyISR193FC5kNqqxwzpHvK5KncUmgR8iVSrDE3k2Ha
        MoLAFbaUVu5Jbesm4lfiT66qvQ==
X-Google-Smtp-Source: APXvYqw9BKPU3MwZXjSWVFbnLdLXiP4QsXclsAm4IhCn5elS0bX/IO0FaokjhPdH92FkGCV0lPANdw==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr11583568wma.5.1576775740982;
        Thu, 19 Dec 2019 09:15:40 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:40 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 05/13] gpiolib: use gpiochip_get_desc() in lineevent_create()
Date:   Thu, 19 Dec 2019 18:15:20 +0100
Message-Id: <20191219171528.6348-6-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6ef55cc1188b..17796437d7be 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1009,8 +1009,9 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	lflags = eventreq.handleflags;
 	eflags = eventreq.eventflags;
 
-	if (offset >= gdev->ngpio)
-		return -EINVAL;
+	desc = gpiochip_get_desc(gdev->chip, offset);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 
 	/* Return an error if a unknown flag is set */
 	if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
@@ -1048,7 +1049,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
-	desc = &gdev->descs[offset];
 	ret = gpiod_request(desc, le->label);
 	if (ret)
 		goto out_free_label;
-- 
2.23.0

