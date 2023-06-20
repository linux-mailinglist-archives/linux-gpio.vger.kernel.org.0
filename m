Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C70873723D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jun 2023 19:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjFTRCX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jun 2023 13:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjFTRCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2023 13:02:22 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D1210E2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 10:02:20 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-440cff7870aso33836137.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 10:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687280539; x=1689872539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FlKmKVASdoZBr1V8sa5UPB3N4JwT5N5y08CJyYmSlmQ=;
        b=AygIvD2BOhImFB/UVypf6X4G6GBMKpKO89PyQaoELZe22PSId1ZX1gziEbTqJo4lxc
         al5QT0WD37lt16pJ5t8oKQxmajy2ug9vIyFbmxh3QQqusyt9Y+LxjxJrlNKEDzQAEsLR
         NUYQ9cpayZMRZBQJr8YaYCzs2TZwKsrU5j6gwxUm0I7didfoXxlt2hBv90OOad0zAqY1
         k5uG2eJVbLJLmaIagq5DrM10ZYLp4LF3TuByqzjo4sBB1Hrih4VPW29rZLB857cxH6By
         EUeCuimjl93XkTAi8+SB5dIBroYJkfY1yUReIC9AxP3WDb6maLi+yFGqWtsJgzruVHv9
         a+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687280539; x=1689872539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlKmKVASdoZBr1V8sa5UPB3N4JwT5N5y08CJyYmSlmQ=;
        b=Zs0Dz8G4UzRAfhltb8HT6eOWDUCIGhScyrJQh/wN+Ii3oYQbENuBLlQtC2Nu1xKBmx
         pB8JJFeoeNq6NwkIpb3Tn0CibJQ2mMKQ/HX2NuXfD6wrstCuyUPo5BJoBYmhB974DdJs
         QUj1wlggc9hiW02pA2Pa3MJajO4niQHh/37PNJTvRbHeyFAbeFAmFOIJY/0hNdWKGJxK
         jw6PErVqlDWgfInCZKvFXwXtbpbSY8ABioCSKZNyVDdBx2FVV8WCHZKW2ZnJ9hNOs1YQ
         kKZP6JGc+2gIK1jh+WIaLlxcRzhC3g9+qPvaMVhvHQ83hRUf4mDN6DIfwmXiiBwfECEU
         c8bg==
X-Gm-Message-State: AC+VfDyMZl9TegfuLINe967YEZDHPl0Yni0WhOMuTnewECQ+mjUSebQj
        4mSejKRw5GOfTb17/EhbFLJAdw==
X-Google-Smtp-Source: ACHHUZ4ONv4r6D2eJ0nebB/G913SPwmGqROuysv4vqjCbp2thXlcqnFn1aKlsCjp610GH/pv/cntxw==
X-Received: by 2002:a05:6102:1624:b0:43b:2d20:f364 with SMTP id cu36-20020a056102162400b0043b2d20f364mr3455693vsb.7.1687280539358;
        Tue, 20 Jun 2023 10:02:19 -0700 (PDT)
Received: from fedora.. (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id n24-20020a9f3158000000b00789a6c15851sm358865uab.13.2023.06.20.10.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 10:02:18 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linux-iio@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        andy.shevchenko@gmail.com,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH] counter: Fix menuconfig "Counter support" submenu entries disappearance
Date:   Tue, 20 Jun 2023 13:01:59 -0400
Message-Id: <20230620170159.556788-1-william.gray@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current placement of the I8254 Kconfig entry results in the
disappearance of the "Counter support" submenu items in menuconfig. Move
the I8254 above the menuconfig COUNTER entry to restore the intended
submenu behavior.

Fixes: d428487471ba ("counter: i8254: Introduce the Intel 8254 interface library module")
Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Closes: https://lore.kernel.org/all/32ddaa7b-53a8-d61f-d526-b545bd561337@linux.intel.com/
Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/counter/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/counter/Kconfig b/drivers/counter/Kconfig
index a61a4b9b8ec6..86536c2cc531 100644
--- a/drivers/counter/Kconfig
+++ b/drivers/counter/Kconfig
@@ -3,13 +3,6 @@
 # Counter devices
 #
 
-menuconfig COUNTER
-	tristate "Counter support"
-	help
-	  This enables counter device support through the Generic Counter
-	  interface. You only need to enable this, if you also want to enable
-	  one or more of the counter device drivers below.
-
 config I8254
 	tristate
 	select COUNTER
@@ -25,6 +18,13 @@ config I8254
 
 	  If built as a module its name will be i8254.
 
+menuconfig COUNTER
+	tristate "Counter support"
+	help
+	  This enables counter device support through the Generic Counter
+	  interface. You only need to enable this, if you also want to enable
+	  one or more of the counter device drivers below.
+
 if COUNTER
 
 config 104_QUAD_8

base-commit: d428487471ba6640ee8bcdabaf830aec08b85400
-- 
2.40.1

