Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFB2D12A116
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfLXMHs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:07:48 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43858 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfLXMH3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:29 -0500
Received: by mail-wr1-f66.google.com with SMTP id d16so19635602wre.10
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tU86MMVxrse5YMWqteajnEFU35pv/6iPejb2oOl04wY=;
        b=moslOAFzC8vWO0kicWkt16Ro7NiZvBN2koOHrvPhnMlGotUNTc+9m+PZdN/40m/tpk
         oOwruzNE6pGSBV++h3rcgNGy6gejCRcVh+pgou2gf+IfvciNnQEvfcn2G08hQuvKLswp
         KlOhBDfAjs8KQMsHgFMU3/5Zj5/z18sg3CgXkIu3eEAlzcXhTCmR3VR2amhxpbvhaThV
         2APzZEs/gyYnnqSYHl5lNVmNARQyB5N38clYOtYWIlmkeAuQ7qIra7RPd0rXyVCevhXh
         MtXyMq5wMCueaA2HvUk+O16ODNIVK9iZfiECml0gWw+2NA4PXgLQ8e13F41X/RACfP4y
         oeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tU86MMVxrse5YMWqteajnEFU35pv/6iPejb2oOl04wY=;
        b=Y6A67RQ7ILhJs7QcHIvDp+2mZVrug8RBqgQBxwulycpSQjzcGESoviILyT139ew027
         LVkfyff/dEwGjgWP8H1D9F1vPH8LzQoAWmhb68endsMSugybePEv67Ps9AwcXkAZQS6p
         yVCAQEJpw0mCt88WHuAtvVrAcAC42rBsXHdWFgufB9aod4RrZe+ErvCnoqmVFELXiIXO
         I65PbqqiQ9+lKrNbbQAQuhwu9BU1yvUggIlhsu4XqUfCwsqB45YhqZy64me22CyTQFCJ
         e6OflU+kx/5EfAraEB0HsmCinhJ6AKxSogukexq/m7sDsEs8YvRL6y6h6uSKiD4hoeJJ
         g9SA==
X-Gm-Message-State: APjAAAXu8CaC2vScFIYXxHc2Q9qeGRMuPlj55x+/jUNMZ0rhr+NJ9ZU5
        mG2GIJ6y2wUdZq5AKmA0NDU2GA==
X-Google-Smtp-Source: APXvYqwb050E6ngqjjLeJ7b5rz3hizZ9dwrm2UfhuhdjQyNpDFqme8cZtJdaAd6GxTQ5Ji4xRGVIDA==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr33925895wrq.331.1577189247400;
        Tue, 24 Dec 2019 04:07:27 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:26 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 10/13] gpiolib: emit a debug message when adding events to a full kfifo
Date:   Tue, 24 Dec 2019 13:07:06 +0100
Message-Id: <20191224120709.18247-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191224120709.18247-1-brgl@bgdev.pl>
References: <20191224120709.18247-1-brgl@bgdev.pl>
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
index a859c0813e0d..543244355e1c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -979,6 +979,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 					    1, &le->wait.lock);
 	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("event FIFO is full - event dropped\n");
 
 	return IRQ_HANDLED;
 }
-- 
2.23.0

