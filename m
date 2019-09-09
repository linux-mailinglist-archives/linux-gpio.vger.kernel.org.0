Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3F8AD22E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 05:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387491AbfIIDXB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Sep 2019 23:23:01 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33133 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387403AbfIIDXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Sep 2019 23:23:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so8260938pfl.0
        for <linux-gpio@vger.kernel.org>; Sun, 08 Sep 2019 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gwUn6LZY/+tXNbWADM6TlgZV7T1ZrquvHLWoehydA7o=;
        b=NnvByjkNCgMYh3p5KTUXyMu7X5Tk+hvFjw9UnnOjl4JBFoNwPUGQxJq0dvRbxuXJm3
         sYj2JbEclxd0Ih95V/7FpknNpYnlP+xw1FBPFqMCv2VkxWplFRclfeTD8sEsh+WKA7LE
         G0gxNdvpm8n49Y8I0YpacK6WeFpUKoBDDcxFWEbgnPU2bmmvkQkYkgogQv4eRWaKorVy
         d/HQS3rIYKMlQXQtnXeOoSxJ0UXz2+0rQtsQxdsFxYnj5zUQixuDbzjZ1Xy+ILcPwb0a
         0346Ce1X858lQQn6O13oUfyWbVQnH3tWwOF7BQOUnsJQCdncjGtR9X4PnDYqaRiSmWCK
         Qe4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gwUn6LZY/+tXNbWADM6TlgZV7T1ZrquvHLWoehydA7o=;
        b=Sf+PUb3DOPhHa+lcwYW+0uZQ3NOrsaBg3Yv77sy/I6cvzdjWRjc0p5FBHhUFmx5Zvb
         +Ir4zxgeZoGEPJ4rpXcDGWHOJbX4Xv9IiUzUPCqgID1eZ31ZIDYJ1ziu3mUUC+Tzazpo
         jgY5VUxCpYqvB23BJSKJOL7vWY6PmzuaGNpjvgDIi+3sv4GBi1llaFZ5PvkM6Yvdr+OD
         HiXwp/BbGGc/Z9vxit2PTny57LHKsYGQCAvixWJ5AVhhdgNhGxNdcZdCETfIDWJu93il
         z7OCHZjXerZSh5pju3mEEDqRrUXg1Qso3DwoGYFbZ+R04QyGqWlf6i7ERd3H23S8DmHf
         k4Fg==
X-Gm-Message-State: APjAAAWlmGVzrGHo1B97zHeywZ+GydqePAweooPlXB6RuEamJXnQCbfT
        OWdHasWAIxtpyi7vs3cjAwR9bP/ZF/T8XQ==
X-Google-Smtp-Source: APXvYqxJhqWlbYHFPp3NKAdulLE5YCRvlTxDnBuA4qByrTyXPNhuHTH9pVQYH6xInGlbTNAxdcF9aw==
X-Received: by 2002:a65:5c02:: with SMTP id u2mr19603981pgr.367.1567999379794;
        Sun, 08 Sep 2019 20:22:59 -0700 (PDT)
Received: from firefly.lan (220-235-119-39.dyn.iinet.net.au. [220.235.119.39])
        by smtp.gmail.com with ESMTPSA id a1sm12782901pgd.74.2019.09.08.20.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2019 20:22:59 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpio: fix line flag validation in linehandle_create
Date:   Mon,  9 Sep 2019 03:22:18 +0000
Message-Id: <20190909032218.1901-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linehandle_create should not allow both GPIOHANDLE_REQUEST_INPUT
and GPIOHANDLE_REQUEST_OUTPUT to be set.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cca749010cd0..7502230a4ec8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -535,6 +535,14 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	if (lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
 		return -EINVAL;
 
+	/*
+	 * Do not allow both INPUT & OUTPUT flags to be set as they are
+	 * contradictory.
+	 */
+	if ((lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    (lflags & GPIOHANDLE_REQUEST_OUTPUT))
+		return -EINVAL;
+
 	/*
 	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
 	 * the hardware actually supports enabling both at the same time the
-- 
2.23.0

