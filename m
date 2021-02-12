Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44923319B17
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 09:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhBLIQ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 03:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhBLIQ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 03:16:57 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F321CC061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:16:16 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id q14so10573149ljp.4
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mp0nbtNRl8gWe0rPnSclmdD/qR94yW782UlkxCeg7wY=;
        b=SOH4lKvIqAfUo02lq9wETmPYH4o8aPDnG9W+Fg4Ppseq0X+M4tx5a5z278LfBr0o8W
         tg/FQa2QbdzL1VpIy6WS1iOtp4rnoHHIn9dEk6PMyGV7WncX63lrQl9NKRsylUVDISyD
         um4e0zkH6lZ6QmOFEdKZtkzKvws63mHPPLRai0GqUl+xDLrAH9iN+jhc21KN1l3F/Wrk
         WIzvBqQL+C8jZQM4bSbRscpdg5eG9MeCDHFONHag9RtEr56ENVtR1IlCDV3BgASmFMCo
         1N1l6O5ihliM4H9Hw/EvJMNKt/2qVO3X6teSEGyYJp0Zt6k2zGUsiC1o1RSPCjN0Dwid
         aPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mp0nbtNRl8gWe0rPnSclmdD/qR94yW782UlkxCeg7wY=;
        b=BkWNvIZkXUF7+T9iIk8hVYATVfF1UANaJ1c7liajH7XScTzR1wxxnXl4vF1RPdLe2v
         SWnFO7csjnkFQWJ39+bl/n0+sTv2t098yK/iMa+AZ5wA2CNbG+RurVuK6iQesT6rdEYB
         6k2/jgyaRsUNXm3dvIMw1nUww+tsZtTYEOKYKq2lKEPbU3M3w/jRm31vd0LbtbWdeg9m
         psR13TAOg+Iu024NAR+OHmdDYZ59e36It/HoN5twiaVoCviYtlw8cbfZXpoefRzXR5S7
         t6LZEj1LQXs1t5runmmaKJX3A7sco7J4aB7oZ0ZLukZTVY23g7OC+fzcDm7U6ovlp01t
         TPQw==
X-Gm-Message-State: AOAM5320YwTYl2cFXgpqSAkzg7p8DCrsFMnjivlsGztOOjSPmCUNbRPu
        ExJRXwaj4doeSiEfyT9C1CdYTBaFlb/td1Aj
X-Google-Smtp-Source: ABdhPJxELwlwWWts/lNvJCXR6cTs90jqGSSUZFKRIuF15m76ksNQsLsTHi4x8qOFOVdUWfRWfMjlsw==
X-Received: by 2002:a05:651c:502:: with SMTP id o2mr1060250ljp.84.1613117775222;
        Fri, 12 Feb 2021 00:16:15 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id y1sm895907lfd.115.2021.02.12.00.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 00:16:14 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] pinctrl: actions: Add depends on || COMPILE_TEST
Date:   Fri, 12 Feb 2021 09:14:11 +0100
Message-Id: <20210212081411.50774-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I happened to apply the v1 of the patch restriction the
selection to ARM or ARM64, sorry for my sloppiness.
Fixing up the mistake as I can't back the patch out now.

Fixes: 5784921f7b6c ("pinctrl: actions: Add the platform dependency to drivers")
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/actions/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/actions/Kconfig b/drivers/pinctrl/actions/Kconfig
index 8bb8345b17da..119f0e471efd 100644
--- a/drivers/pinctrl/actions/Kconfig
+++ b/drivers/pinctrl/actions/Kconfig
@@ -12,21 +12,21 @@ config PINCTRL_OWL
 
 config PINCTRL_S500
 	bool "Actions Semi S500 pinctrl driver"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S500 pinctrl driver
 
 config PINCTRL_S700
 	bool "Actions Semi S700 pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S700 pinctrl driver
 
 config PINCTRL_S900
 	bool "Actions Semi S900 pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S900 pinctrl driver
-- 
2.29.2

