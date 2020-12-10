Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3573A2D5B9C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389195AbgLJNYY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgLJNYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:19 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E47C061282
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:33 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id c5so1838129wrp.6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LHCJFjccvvmBNwvZZu/MbDvjyrL7OVInXqtxbVXFUdQ=;
        b=Iz6MeHhAbu1ZOBjoiz5g+UgsOPxdRBCdUGcj4OoSBYYdVTuJbumeKis2FKzFZE+5Fi
         rWrj/c3w2RWCUxovtz9j6kOxniEX/8k2TNb/rZkaZdTnh57ArNxPPTVUgQMDI9W77Tm8
         ZdYJvIFm+np2QdJChfLKOh0lQJg+Lecz5AjdPdxuLoeyLrLN5XoSw35DukczrEiaZdZU
         COGe6An4iQSPiTCkSONbyrRF3QVvTGU7oRuTbqv+NNIUA7hDFgHxsUE22kzFwwGVm84v
         DdkFTv9KWnhKnmWYkDzi3mPoRd371XFLTH4dnxG7Szw/4x9hIZehel87Yuc9ooWD6etf
         FQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LHCJFjccvvmBNwvZZu/MbDvjyrL7OVInXqtxbVXFUdQ=;
        b=cI8hQAeASvlFao9Nd2guBbGsn8ZorlgeQn3X+ICTN2shrUj2347yyOcjNE6DdAirqj
         K2vXSM+eAq5mIyR984BgCUKsz+4ZpNx88nrMlr1e26S7eHWYGKVhjZgqaG3G48x2Batw
         YyO8MoYLzn7E7BEOnbPI/B6xASgH4BPZlJi1W7E/VO1/qtACq9ujS8ebIxTRvUx7dRD/
         4tCmmeWq/oxlTULgmXsjOv8ZPXZ6ZHY2PRiC3YXpGNtKWPqR6bilaO3IqxxdQ8L3y3/g
         WwRZKsqqLSQ9wLtaatpqHwffJI0LqsBBhzW/8PLTS518TGG8AGH8pRfhlEmcrWj9SG5K
         WJpA==
X-Gm-Message-State: AOAM532iXj3cfNeHW3GYP2b6yxMoHoP4UUkxuKRXJcKEuJIEQxIBOQ3Y
        vDXKkuxU3JCaYBvhlx9iU2+tSw==
X-Google-Smtp-Source: ABdhPJy/m7Y0VgaXjxG74SGkLlnpn6e5rcwtzMYe0EYLvUFa0mFaQtqs1RReBsznS4O8lDCTNAhKtQ==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr7746662wro.292.1607606612713;
        Thu, 10 Dec 2020 05:23:32 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:31 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 08/14] core: kill gpiod_line_close_chip()
Date:   Thu, 10 Dec 2020 14:23:09 +0100
Message-Id: <20201210132315.5785-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This helper was supposed to be used together with global line lookup
which will soon be removed so drop this one too.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/gpiod.h | 8 --------
 lib/helpers.c   | 7 -------
 2 files changed, 15 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index c6e0b65..2e8323a 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1092,14 +1092,6 @@ gpiod_line_get(const char *device, unsigned int offset) GPIOD_API;
  */
 struct gpiod_line *gpiod_line_find(const char *name) GPIOD_API;
 
-/**
- * @brief Close a GPIO chip owning this line and release all resources.
- * @param line GPIO line object
- *
- * After this function returns, the line must no longer be used.
- */
-void gpiod_line_close_chip(struct gpiod_line *line) GPIOD_API;
-
 /**
  * @}
  *
diff --git a/lib/helpers.c b/lib/helpers.c
index 3ec6c96..b3050ca 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -424,10 +424,3 @@ out:
 
 	return NULL;
 }
-
-void gpiod_line_close_chip(struct gpiod_line *line)
-{
-	struct gpiod_chip *chip = gpiod_line_get_chip(line);
-
-	gpiod_chip_close(chip);
-}
-- 
2.29.1

