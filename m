Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2BEB7CC29B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbjJQMJO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343620AbjJQMI0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:08:26 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA6A2729
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:54 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso26683531fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544351; x=1698149151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hYD07DORFpnS7uYBoHZE2h5e1OIf1dxiUrdwCdcwh8=;
        b=YIu5VoLUyDZdc4GzzY4yeQngmFMEqNxsOge6vYW5iH6Z1pTmdpXiQBZF2X7ZsyWg8U
         WK1l3RrgIux+ccszK1RyYVF64sdX8L0BwbjX9LxCSBqZqt+1n0uv5AEK1oz1kDRsMHRI
         KPbMILCveEPNjjSZWQ3VC7GZzgjP1zbiBnRJfeHOZmeAOrNnkWFKcl+GImw0dahe8qeC
         ZNCLDrzKoXGUUJiw/jZrx8qzqIRan86FjkUbQZdIhc+02ku+R4TtUljU6WYTnm7sOkO8
         VivntbruAkQMGVJ0/x68mf3/LRJxO/1ebgcTNeSSejzjJOqHh4g/ZICj4MvProGVn4hs
         X2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544351; x=1698149151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hYD07DORFpnS7uYBoHZE2h5e1OIf1dxiUrdwCdcwh8=;
        b=VeStzp2eNWu0NV60iVEw1bWKpRt2gU4d4J485jht/TbsPVAZqX70YFAWRGQBPk/UD+
         11AEsoByhquZpoaPEpBS8pWPqbN/DOJjTQfmumb+ebpHDvNT5M4GaMh+W4qeKy7swMPP
         0TmZHJsF0Ut1nlqj4XSYuwPcfq56BzcSNqmcGjvSls7MJBQJp2wfC7BGRmfTcZ6rCzQL
         38VP9jScbEsb7za64TV8BcYYR7k0x1IxsjcrmM4XBChJpTuxyWfa0UHdy0gViPPfFsh2
         njZgWf7+2EOuAjyWom0PPfXB60vQStsR7F44VlrZB5PUB3OCbxWrVxJTBxc5VqqeEzwA
         ijJQ==
X-Gm-Message-State: AOJu0YwgkPmtI4tyOaFwQ1byiLxq6bBC/6/syVBkMe5n2iGDFYKi2GlS
        hFN4+k9QFLhKzg8kknsS/WEMaQ==
X-Google-Smtp-Source: AGHT+IGHA0KTHjACmMppnOrbLys7zmg8kwaZANk8Z3VE+lQNYP7/N7ei5QDPueZ3kNClunLrIiSSvw==
X-Received: by 2002:a2e:b893:0:b0:2c5:924:e8b1 with SMTP id r19-20020a2eb893000000b002c50924e8b1mr1638200ljp.19.1697544351561;
        Tue, 17 Oct 2023 05:05:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:50 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 66/73] pinctrl: ocelot: drop the wrapper around pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:04:24 +0200
Message-Id: <20231017120431.68847-67-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
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

pinctrl_gpio_direction_input() now has the same signature as the
wrapper around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ocelot.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 96b4e9fceb78..52aadd6d72a8 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1776,12 +1776,6 @@ static int ocelot_gpio_get_direction(struct gpio_chip *chip,
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int ocelot_gpio_direction_input(struct gpio_chip *chip,
-				       unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int ocelot_gpio_direction_output(struct gpio_chip *chip,
 					unsigned int offset, int value)
 {
@@ -1804,7 +1798,7 @@ static const struct gpio_chip ocelot_gpiolib_chip = {
 	.set = ocelot_gpio_set,
 	.get = ocelot_gpio_get,
 	.get_direction = ocelot_gpio_get_direction,
-	.direction_input = ocelot_gpio_direction_input,
+	.direction_input = pinctrl_gpio_direction_input,
 	.direction_output = ocelot_gpio_direction_output,
 	.owner = THIS_MODULE,
 };
-- 
2.39.2

