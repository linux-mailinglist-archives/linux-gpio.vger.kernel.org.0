Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91CD1B6578
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 22:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgDWUeg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 16:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgDWUef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2020 16:34:35 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8301C09B042
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 13:34:35 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a7so2984024pju.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S6QHYAQNJk/r7RcX2egg9QjNYJDfZ7VPfp2pyf+zOWQ=;
        b=iuLVk7tU3P3H5Mb1U3zBU4nWhOhIRU5F/zHi9uFNWmfJsHIbXcw1Fq8YtaDEcAOuR3
         JPhKTcSr8mLnmintaxTFgbNsVH/uXvrg8cNfE/krwGJFmsJlsqYeRV7sr6oqMdseMFSQ
         Qd39yC6MzTDdmRRmpM+96KY4wn8Z7GUwGDU9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S6QHYAQNJk/r7RcX2egg9QjNYJDfZ7VPfp2pyf+zOWQ=;
        b=nGv09JVQGz46BI0vG8IsFeXFj/N83Qr67DgjeNHOMxnsmXMgrjGROc9gMFW91ffnrf
         sqAQH1zo16LA2b+bLQS21z4rbdV+j4JNKwm+ezKdx1rlbtl4afpeqsPVrCaiFE80kygl
         6uSQBRZSUSuIlWx1hppHw5UbeGyCGbMxubU8OWmbYujM2MlI7Yyk/NevQuWhzb3pWrTh
         xdp7NA4UWjjQ+OPk6bY543MDodIlXvjUhoo6PIiNlcLQ7XzOu2QheanXlYbJa7UmHp8x
         pWNX6qm3+W3viiMFHRP2ymj8wQVoJUdCxeF1+C3v1rPNchq3HCqcH597A7+vnXrXQLaH
         uvig==
X-Gm-Message-State: AGi0PuY0PhkrJ81sFHkiTh8rrClVZaf7xm/XjAhRipmz6M/m3ZiD/nNq
        BsKgVQ1CVpvuA6MeuK2pOV0hMA==
X-Google-Smtp-Source: APiQypJXeojnpJa/3rx7LWMgNYonCQfG+V/x3GE+RkoYxeMue+ICy0iF43qe2z6K+6WZkzhatKZVpg==
X-Received: by 2002:a17:902:8688:: with SMTP id g8mr5781326plo.268.1587674075346;
        Thu, 23 Apr 2020 13:34:35 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c3sm3391925pfa.160.2020.04.23.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 13:34:34 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Alexandru M Stan <amstan@chromium.org>
Subject: [PATCH] gpiolib: devprop: Warn if gpio-line-names is too long
Date:   Thu, 23 Apr 2020 13:34:16 -0700
Message-Id: <20200423203416.133274-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some DT authors (including myself) have messed up the length of
gpio-line-names and made it longer than it should be. Add a warning here
so that developers can figure out that they've messed up their DT and
should fix it.

Cc: Alexandru M Stan <amstan@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpio/gpiolib-devprop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-devprop.c b/drivers/gpio/gpiolib-devprop.c
index 53781b253986..26741032fa9e 100644
--- a/drivers/gpio/gpiolib-devprop.c
+++ b/drivers/gpio/gpiolib-devprop.c
@@ -37,8 +37,11 @@ void devprop_gpiochip_set_names(struct gpio_chip *chip,
 	if (count < 0)
 		return;
 
-	if (count > gdev->ngpio)
+	if (count > gdev->ngpio) {
+		dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
+			 count, gdev->ngpio);
 		count = gdev->ngpio;
+	}
 
 	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
 	if (!names)
-- 
Sent by a computer, using git, on the internet

