Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBB266A565
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbjAMVwb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbjAMVw2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:28 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112D089BF0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:27 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so18297110wms.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqYkAVDDJHqckoBGfhi4xsYYLbZddtA7wLw1qqPJGNc=;
        b=z4cWGqMJ5Z59D9JfHVDzxPPHVnRxz9KaYgGNk5H8pWDcxxSUtzDM4pJHPS+egPHWLJ
         QKiER924sqlxMvv+XYKJsWwkM4anB4IBhGCkKvPRkskwAM4tJG8saqGndy5ZX+hIiqGe
         6PjxoFJ4ATyIwVylrWhE1uRJ4rtEsUdqR9aZAxJ8aDxY1WBfhBRmpHBGrtcNzNmKycv6
         2tAyRFW0HEsFj7ZXzoUs3JZEahQh9jQ5Jk98wOIEdQOFqG4/flkU3mAofcOTA6EUmxvH
         Jto/rZnCkCyJqjCt5R2aXNZhC18oRa/yszmyaYlJWaRjFPNN18pyaSfK6GGh5yeExWC0
         hu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqYkAVDDJHqckoBGfhi4xsYYLbZddtA7wLw1qqPJGNc=;
        b=QCTtsk9xArUOiu8bByhXrZGw/1vZvsey4Aw2F+NdCqckY6YQKli0vKUfcfmBScWdVj
         UBGhyp1gdFtPISfXQPFieUTPR7QNwzlzL+QnkidogNDMIM7vBVdabx4B8wF95YLBu2zO
         tSFtExlp5LKSKEYfEKzSKVMoCU4tiMvzgsnpZI/Wd78qmiLuzFU3oBzMhz22mWQWrrra
         RTJouJbH/I9hVM8sMeH7fMelkyPYj4kJz+5GSH7PGJIBwMHyfd1R7WEmXn6CL7Dbyszi
         3hpjSodMrLXp9imb2HXPdlDcFVTbq4JakX0XG2btOiJJzzWWKw2qQa58I+zjXhgQK2C9
         eQkQ==
X-Gm-Message-State: AFqh2ko6cuAdaNKtBE5eYk9MtJO8Ln+fiU4U07k/80lhtLQD0vWofv6p
        bZt+l/4Tq13oNZHXyfeYzDNCSA==
X-Google-Smtp-Source: AMrXdXuRggr3qfGgM8FysCW7OkcVpeQsH5Vp0MHfUzp33pxq6SkXqDARhLreOp37FaGRfo38XKzFuQ==
X-Received: by 2002:a05:600c:1f12:b0:3cf:8155:2adc with SMTP id bd18-20020a05600c1f1200b003cf81552adcmr61056616wmb.33.1673646747533;
        Fri, 13 Jan 2023 13:52:27 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 11/16] gpioset: use gpiod_line_config_set_output_values()
Date:   Fri, 13 Jan 2023 22:52:05 +0100
Message-Id: <20230113215210.616812-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113215210.616812-1-brgl@bgdev.pl>
References: <20230113215210.616812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the new line config function to shrink the gpioset code and drop one
for loop.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpioset.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index a871a16..1429d65 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -870,9 +870,9 @@ int main(int argc, char **argv)
 	struct gpiod_line_config *line_cfg;
 	struct line_resolver *resolver;
 	enum gpiod_line_value *values;
-	int i, j, num_lines, ret;
 	struct gpiod_chip *chip;
 	unsigned int *offsets;
+	int i, num_lines, ret;
 	struct config cfg;
 	char **lines;
 
@@ -933,15 +933,16 @@ int main(int argc, char **argv)
 							values);
 
 		gpiod_line_config_reset(line_cfg);
-		for (j = 0; j < num_lines; j++) {
-			gpiod_line_settings_set_output_value(settings,
-							     values[j]);
-
-			ret = gpiod_line_config_add_line_settings(
-				line_cfg, &offsets[j], 1, settings);
-			if (ret)
-				die_perror("unable to add line settings");
-		}
+
+		ret = gpiod_line_config_add_line_settings(line_cfg, offsets,
+							  num_lines, settings);
+		if (ret)
+			die_perror("unable to add line settings");
+
+		ret = gpiod_line_config_set_output_values(line_cfg,
+							  values, num_lines);
+		if (ret)
+			die_perror("unable to set output values");
 
 		chip = gpiod_chip_open(resolver->chips[i].path);
 		if (!chip)
-- 
2.37.2

