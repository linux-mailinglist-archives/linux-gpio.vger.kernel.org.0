Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24B51168241
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgBUPsz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:48:55 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51978 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729169AbgBUPsu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:48:50 -0500
Received: by mail-wm1-f65.google.com with SMTP id t23so2276332wmi.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kc3RH6cl8PrURMVC2HcOMEqzVbKCqch6ndQPKF/V66A=;
        b=RI1Eye7XDj1Sf4dEbOo6SKh+OtOPT62d9EGBP15dioK9//v/oxEheCrG4DZXrkVurJ
         VEU03SSY5RtDayC9Ly5GNiz1jPKY8k7sxHYdSIOzdX6lnBGm1HBtvLxdaqnJSz5MtGvB
         Bxg1LmCfvHxMb+Ux9j6QNOK7//ktcTYB3yHsnONKRDiNj3hKYEHh4TyZYJmJ6StVvCDb
         K3n+8GRLuWsP+tacCC4LVSnIg+Sy6ENIjVWC3xF4UEIuFu1cEOsj7A+HxoHe0CSrJroR
         4mBHsP/ElDeMemZ10+r2VeAYr+5PcEoDnwO8CDjZL6XEfodYS2VWeDXPfYD43k9Ry8Dg
         6qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kc3RH6cl8PrURMVC2HcOMEqzVbKCqch6ndQPKF/V66A=;
        b=lnD/HYxSmzF0uy8e2BeC/QGrhOeSreB1cVc1We1RVawo1vPUHIISBRLV3zohrBeegx
         wmrsWPbWkC0BGOZTnf1GEE/EoSHHLqTEo1Br9KwQlfsQUjp6xX0JVfglw7IHKHDdQ4dm
         GopinHdIfHuTeXKnINKH/SmOKhlrpdcFMVrACtB2tZ9VZgw0fwpCLxhjRkH6S0QPBwEY
         93fDxH/H5LgbyWiPl5mSydIJTui3KUK12QjxIGLwf5yiNfbaCopc8Uzp/xCEWJD9TtiL
         jX2yQSsw0+Ldlx94Hb1Kc+elN+vfd7NsHBxkX/K9iMmyDRbZHmYo0e0CIriK2eVh91Ai
         cNGA==
X-Gm-Message-State: APjAAAUl7Pic6xlFsYJzdxdiStjElITAUo/mJhshZPNBZILVTpQua066
        HYIDnvsfWziLBKE1RNM9VY6qRQ==
X-Google-Smtp-Source: APXvYqwm5JScae4Vtb7EJK4NqO1U0EeoMiI7GvTzMu19s3xt71xFidsN/+ghrTO1Ugo/ZubaVCEiZw==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr4640116wmi.116.1582300129076;
        Fri, 21 Feb 2020 07:48:49 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id h10sm4267947wml.18.2020.02.21.07.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 07:48:48 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 2/5] gpiolib: provide VALIDATE_DESC_PTR() macro
Date:   Fri, 21 Feb 2020 16:48:34 +0100
Message-Id: <20200221154837.18845-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221154837.18845-1-brgl@bgdev.pl>
References: <20200221154837.18845-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We're about to add a public GPIO function that takes a descriptor as
argument and returns a pointer. Add a corresponding macro wrapping the
validate_desc() function that returns an ERR_PTR() on error.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4d0106ceeba7..da8ffd40aa97 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2864,6 +2864,14 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 		return; \
 	} while (0)
 
+#define VALIDATE_DESC_PTR(desc) do { \
+	int __valid = validate_desc(desc, __func__); \
+	if (__valid < 0) \
+		return ERR_PTR(__valid); \
+	if (__valid == 0) \
+		return NULL; \
+	} while (0)
+
 int gpiod_request(struct gpio_desc *desc, const char *label)
 {
 	int ret = -EPROBE_DEFER;
-- 
2.25.0

