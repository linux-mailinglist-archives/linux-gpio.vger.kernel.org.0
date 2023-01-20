Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 179A867516C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 10:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjATJp1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 04:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjATJp0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 04:45:26 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD657AF0B
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:25 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3238173wmq.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqYkAVDDJHqckoBGfhi4xsYYLbZddtA7wLw1qqPJGNc=;
        b=fISfqToLdi2KsdJevtG0TxCiHuprHieWJwPsyciUAouZKO8TZG27n9D/yLLZAUT9uw
         VvDWmGN84dDgZ8qNNkRc54SWP3zzXhjg+21UBDKGKqWk/z+zbmvS2L4kExPxDml3I1/Y
         PApCz3GgjoY7AHdCu7fieapAg9mpJWRzSbJr2fRvxsQuJXlGs1ug63FsiUVg4URgO5yt
         q74Ryg4AhAR/pGBoBO7XWM3JMAjD7RRJWwu+/GLxrRw0PCQpxqFw/ZldFZVk/pZX02Om
         jDf7Y9/RDYMr9og3HcaVNxr6DqSVDUePh6lWS0SmHJYQEvkzlVGI+3HR4jo6A+r7a3U7
         kZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqYkAVDDJHqckoBGfhi4xsYYLbZddtA7wLw1qqPJGNc=;
        b=ub4opv+3Lw3s93Iw6RxMmeuN/AJEtPC0fHO095vyNyjF+J2wCTaCOJx8eu5T1XBV/X
         OnSHsWgBqrBHJjZSLuccBcVzsHH3oG4yQxyNhqvXoHlRM2ZJkq2MyPZAHXIMZpXW9bTQ
         e77cFtVD7GlGufyQ7A37dt0Co9komt5tV4CbVNVnf0vwKzvWvpxgTSCR5lzpP73T+E+r
         uRVyx9G8gAmRr1HY7hMxQlwz8eP3EWAm2QnrdofvItgGYebtTJpRtn2gQgTXw1rLtGcc
         Kpm9gslw39wqgQ+3zGL3aEoPMbstZ4Rad5XAyR3HtMWYfo3waR2hlWplWUUIvJ/BN/iK
         +p3w==
X-Gm-Message-State: AFqh2kpzSFFCkMD6lbPdEwgNXWTC2XFzW2KcblYikgCFlS9SFC9BIhQJ
        YZnS3yOErCCr6RFceeeWGHm8+tYYeeo0MNSv
X-Google-Smtp-Source: AMrXdXuct8PIJR/hayrQfsHjYIDoSQBQqgerheEd9FYQ3rQNeAf19NmffoYaOToP+2Aknzp/iJcfMw==
X-Received: by 2002:a05:600c:538e:b0:3da:516:19ed with SMTP id hg14-20020a05600c538e00b003da051619edmr13339214wmb.29.1674207925469;
        Fri, 20 Jan 2023 01:45:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:580c:7b02:3ffd:b2e])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003d9e74dd9b2sm1800485wmn.9.2023.01.20.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:45:25 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 4/8] gpioset: use gpiod_line_config_set_output_values()
Date:   Fri, 20 Jan 2023 10:45:11 +0100
Message-Id: <20230120094515.40464-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120094515.40464-1-brgl@bgdev.pl>
References: <20230120094515.40464-1-brgl@bgdev.pl>
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

