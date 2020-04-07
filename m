Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFFBD1A106D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 17:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgDGPnB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 11:43:01 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40201 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728917AbgDGPnA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 11:43:00 -0400
Received: by mail-wm1-f67.google.com with SMTP id a81so2323417wmf.5
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2020 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aWpnnYlYguz3F+JVvnjabHfBBjsGY++SGOyWdWzZ3Y=;
        b=DhHIZS8wCsY2m2Y4WUTVZOfRi1NuKy/87cmOCKVoLkgCRB/H9HL1usx3iwhVxtYoWI
         +fGuCdjEiJleXLyLp84a6YF7Ow7Z6xQqlpfWvFJaky0qMvBOm/D+UC9gHrc4tS5PEl/J
         ibWjrWXfDUrTttG7h3IskK+gKMvVjImOzcKxvw0kuE3grOMhUZj20fMQRr26uyDITT/U
         CgE08Rbr4oZrg/vdKgnvUhYCvgmNwFqQ2uGu6WlcVqJ10oOYAojCHEmj5R11mI+kRjmE
         1Pr6m57QPZZ6E1qJLVjqKACJY1mmEJKtxed9YP9vb+u4K/IXIRXunYS+GGc/y7pqeYLy
         Onxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aWpnnYlYguz3F+JVvnjabHfBBjsGY++SGOyWdWzZ3Y=;
        b=AdVrVlqx2ET44kfSHaS9kTQqqsKFHEnikc3uNSPpje6WHi2duPRvlk55OR72kdVTYC
         zQAxw1Wr8XOyGWMgurovSXInSrI8LozJKLTMpSVHY3DFVC0IbVhJ9K7e+T6tqXXeJ/e9
         HM31TEWEPh0UgFxb9xDLIgwcKKy5rE5rbSzrmLTunUBeArt/UnYIYTuHnhyMSx6uR/pY
         Oy+kZ6Q2QxypB0vT52b8zo2QgC4SIKH91Eq8YIOtIT6ATbFry8X78NY076WtBmyMNRXJ
         tBndcOADzUeGo1IU9Q5lQuWUKpP6TUT2Ao65Ie1XsgQOdcThgJcn1E+t8oGyITp9i9LC
         bDHw==
X-Gm-Message-State: AGi0PuZbCTjfcaRkfmCC0KPb6G5hlLL0cxspGBh00vt+xvuywAikB7hc
        cbzOP9Xdzrl+FjBfFpmR6d9t3A==
X-Google-Smtp-Source: APiQypLt6v8178aJkXJnaecq/E50zJ1PoLpY2ZRcWCSHf4lHftAxL/6+mWI8xxQQQ7ku3oTkB+4o0w==
X-Received: by 2002:a7b:ca46:: with SMTP id m6mr3032453wml.102.1586274177469;
        Tue, 07 Apr 2020 08:42:57 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id b14sm1329274wrw.83.2020.04.07.08.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 08:42:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: pca953x: disable regmap locking
Date:   Tue,  7 Apr 2020 17:42:45 +0200
Message-Id: <20200407154245.2548-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This driver uses its own locking but regmap silently uses a mutex for
all operations too. Add the option to disable locking to the regmap
config struct.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 5638b4e5355f..40da1954d74b 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -306,6 +306,7 @@ static const struct regmap_config pca953x_i2c_regmap = {
 	.writeable_reg = pca953x_writeable_register,
 	.volatile_reg = pca953x_volatile_register,
 
+	.disable_locking = true,
 	.cache_type = REGCACHE_RBTREE,
 	/* REVISIT: should be 0x7f but some 24 bit chips use REG_ADDR_AI */
 	.max_register = 0xff,
-- 
2.25.0

