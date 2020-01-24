Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAAEC148CF2
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 18:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390498AbgAXR1f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 12:27:35 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35776 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390492AbgAXR1e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jan 2020 12:27:34 -0500
Received: by mail-wr1-f67.google.com with SMTP id g17so2941288wro.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jan 2020 09:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9tqJ8hKTow0T/VgL6aumMqy4dOXfLxsRaXXpIm/xvCo=;
        b=V4XH+jQZzL3PvFu3wJZuk/g9eIJ+Vptk7cYflTShliBZfW8vZXb7gBYTF/TjY1zpT3
         dFKQQ+h+e7SL2w5L5jE2eXRuYnX9WMBcwGISSsNoX+vnYQ1kUiPktuUR+BAtS/CNO0vC
         mJJh7CKtM5zfKJ8PmCp45TVJBVDxRSB9WsxsiNF9qeAAUMKfBLnEi0C0gCTb3vr8n9/a
         YWhU/ARyrS0eNFGkSSQQVagSmas9GLllv5bRbzlWIsx6jfXFJVMY32JsFxZFHj96Ooh+
         vdJLNd/J88KhX/xDpXLD12ByyjC6J0dXLjHjBzEz+9YGIcitFIvUztCxFXD1G/Doq88Y
         +8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9tqJ8hKTow0T/VgL6aumMqy4dOXfLxsRaXXpIm/xvCo=;
        b=hzl2nUMnjMkq9MKccq4zlMO7dV9llH5HKOQBV9H/Fy2z+jwrW+wLWWT5q/RxGNXemx
         9kvnHM32U+VYR8ZO6991EhW+uj7/Uw3eQ6DXDKvOm6Kb/0f4ZWEfYszioLw9CDLKZ44i
         pZFWgRnJQj4BKXW8ww80N1zvrag9B6HEWignKlJtEXKej9vySHWcz8uhRMJXQJQbuea5
         26+9+h93erT2y1sebdj8zpZfqffyx3eED1fUB5onU/tmNzwKIKHNUls1lVBdSidFOT0w
         Oe3fW+ThA+W8s5NeoK3kY2kjh0BMXIRef+mnYthneBKKyvxFt8vOjGxqT8lP2QTb2wFz
         KN4g==
X-Gm-Message-State: APjAAAXVvv16GfgsY6w0nsMMg+cpmEcmvkdPGVK5RDm5Ocm0t8qgE7kK
        7zrup90917dZkgJ7BTc/cZJMSw==
X-Google-Smtp-Source: APXvYqwDicetKOsRSolDyzcTai9wz8IIiJRWhiY9UOc0DDJaEy3wTnK+25XS/RJhILTVIlRhTK7V/Q==
X-Received: by 2002:adf:dfd2:: with SMTP id q18mr5816993wrn.152.1579886840707;
        Fri, 24 Jan 2020 09:27:20 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id t8sm8358585wrp.69.2020.01.24.09.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 09:27:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v6 4/7] gpiolib: emit a debug message when adding events to a full kfifo
Date:   Fri, 24 Jan 2020 18:27:07 +0100
Message-Id: <20200124172710.20776-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200124172710.20776-1-brgl@bgdev.pl>
References: <20200124172710.20776-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 66df06a24cfd..4ce34958e335 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -978,6 +978,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 					    1, &le->wait.lock);
 	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("event FIFO is full - event dropped\n");
 
 	return IRQ_HANDLED;
 }
-- 
2.23.0

