Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97021267D9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfLSRQH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:16:07 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39734 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbfLSRPs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:48 -0500
Received: by mail-wm1-f66.google.com with SMTP id 20so6331389wmj.4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uycbaS0g1vE0Cuob7CqLcnjNvgH80U0c2b2m+7/3Ktw=;
        b=rBzzEYfyA1MtQaHuNuBZq+0ETt+FtIFBvw4RFKKOcpSVbBFxol0tf56M85YAhphsr5
         a/HmMFRQKK/20smBrmLQA4rAUYEhkJKpwC1Sft2mP16nyeCkBG76iQr9pcTYfyTib+bY
         LOhO5AWg6DkMc1VUTfA5F7UbE8rVtwLCnyPT7zK9+jP+9iv77TX1eRVoYYLi+Z4X0V/a
         4TJ6xwHag5hCVsmXg0LdXyKCyzsU1aOVDB+eECTV35zGRLzWJjXJ95Xgtbh4Y8HONcEY
         0wyoBWzcCOXk+7lYfiUqoX2Agfn+cFBFqqi4C+CmqCjJjGvZgDxaOHpKJOQlbUOruwOP
         MQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uycbaS0g1vE0Cuob7CqLcnjNvgH80U0c2b2m+7/3Ktw=;
        b=LWyxUF+fj5xBDIjuVB8hztrj4P77Nn4QB/NSmYUsPVdKo9wuyrjNp3moiuVETsOqV2
         9W2bDNBkLWNT78DQbW/keZbLCJVW8+PbapjFlEKKQHK65J/AHb8pesHYKqh2y8cQBWVn
         ZgHW2+IkPAdAxUvXeMqpHhlPSUFB0pOD5DYwQczRKncG1tRwEccjuVnibabZjKlhggIE
         0qmDk5MOhnvo/XukwkJA6FZB4ktxZ2tZrp34bD7kfgrWCAJ6R+uxW72eoM99jrBAyLa4
         jWgILlinb7rU222tqCN+13j5ibWrNR5hz6SlaSfBIzh9QF5mEv0muodZ6SwNu7nBCPpE
         uKiQ==
X-Gm-Message-State: APjAAAVN9uoBpzJRxsAZ5UnoEn9YmTzDS4NAzKrV1cyPE2wgQLa9EnAn
        Ji/rN+ntwC4fzHA/FE62NP2yqg==
X-Google-Smtp-Source: APXvYqwsGU6Wo1uPHcriBaY8UhilFJcnLEteqy07AwUJ7zq340qlG3Ixhg1A+rJmWNmKh/4+fligKQ==
X-Received: by 2002:a05:600c:108a:: with SMTP id e10mr10817499wmd.38.1576775746351;
        Thu, 19 Dec 2019 09:15:46 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:45 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 10/13] gpiolib: emit a debug message when adding events to a full kfifo
Date:   Thu, 19 Dec 2019 18:15:25 +0100
Message-Id: <20191219171528.6348-11-brgl@bgdev.pl>
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

Currently if the line-event kfifo is full, we just silently drop any new
events. Add a ratelimited debug message so that we at least have some
trace in the kernel log of event overflow.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 073bc75b3d45..e27cf2113fed 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -979,6 +979,9 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 					    1, &le->wait.lock);
 	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited(
+			"%s: event FIFO is full - event dropped\n", __func__);
 
 	return IRQ_HANDLED;
 }
-- 
2.23.0

