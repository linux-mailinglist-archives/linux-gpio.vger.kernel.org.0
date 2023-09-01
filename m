Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 460C578FC44
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Sep 2023 13:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241189AbjIAL3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Sep 2023 07:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240050AbjIAL3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Sep 2023 07:29:41 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292D4E42
        for <linux-gpio@vger.kernel.org>; Fri,  1 Sep 2023 04:29:36 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so19562585e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Sep 2023 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693567774; x=1694172574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QYuTBLdcdSSpLg2t1QnpqmU64bzrT7uyyeDzbSmAKE=;
        b=gKSVxt9ac7QAE7muzkslUKmearbXKrc/X0I/pzidaVZKdgBCK4ZoPgwA7O/X+atxHm
         3Cd2yTtbxURQQU7xqEcycArEDpagtp3MtnS/vsyJz12lzzX00ROwfoauPoOHMlc0S+32
         oBKHy5avNQr3ChkXvtuKOcWfTvUI/dhBvBnxPFfTUPgyGvjCY1k4edhmAGnK0iUFtT7G
         AmSADYHSMeW/jsJ4wOSn+wmUB7Jd+brlQgRJL8GzyuHYwL7RhaeX3bF4BpIf/i4k48xG
         XF4Tfx4dJo/jKITmcMqbLoVtz/MRUP3NKwIZPH3L/RZDXnmsEMCFxrf9zzrr19pL7PYY
         fNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693567774; x=1694172574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QYuTBLdcdSSpLg2t1QnpqmU64bzrT7uyyeDzbSmAKE=;
        b=XzfYwYD/DmoY9pAMkFHVwIbGGmpOAVQvufbGNkeG93Vz4tbQAz5pma4EmtC60Opvew
         RtXile4WeIjzAxyZDgh2h4AU1l+I2JvCqxBEVx8jcOUUGLfZlttwWxdktxxCDESqEL3K
         xo5p2PAJIx6pzKXt9vwy5/cIegggBSv4mqwJlgOE8LVe9wzRceJy/CbZU3zcDv4m6mFg
         E7qZRgslmEDzSixb1rD89PZ5wede//p/vfioXE9fg6xW6mhwpGaUPAdCprCXa3GgOOdX
         Br1PDxmyKyzOKv7HHeBbdRlBR26+NZeesGFkFDHuzZmxnQ8PceLcFQfZFiCt2OGSJiB4
         wEiA==
X-Gm-Message-State: AOJu0YxT3oMQ86LelAmSL54k1l6yQyxZ2hLNx4qWNW1699pg6vOLLqqi
        e6l6QfCkZshof/HGOO4saKuEJg==
X-Google-Smtp-Source: AGHT+IHllpPvaZNB2c+2YSkS92WGiunk/yYBY2OTKwzTT/tn33a1esj5a80JaFodL/HQolRnLFoMNw==
X-Received: by 2002:a05:600c:20e:b0:3fe:19cf:93c9 with SMTP id 14-20020a05600c020e00b003fe19cf93c9mr1651768wmi.1.1693567774720;
        Fri, 01 Sep 2023 04:29:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e94b:1054:6760:aa27])
        by smtp.gmail.com with ESMTPSA id a28-20020a5d457c000000b00317f70240afsm4963426wrc.27.2023.09.01.04.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:29:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/3] pinctrl: da9062: add missing include
Date:   Fri,  1 Sep 2023 13:29:24 +0200
Message-Id: <20230901112926.13216-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901112926.13216-1-brgl@bgdev.pl>
References: <20230901112926.13216-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpiod_is_active_low() is defined in linux/gpio/consumer.h. It's only
because we're pulling in the gpiolib.h private header that we get this
declaration implicitly but let's fix it as that is going away soon.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-da9062.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index 0e0ac3f3ffef..9239b9cd9002 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -17,6 +17,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 
 #include <linux/mfd/da9062/core.h>
-- 
2.39.2

