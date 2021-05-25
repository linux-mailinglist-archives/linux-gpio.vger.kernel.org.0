Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14BD43906FB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 18:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhEYQ5W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 12:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbhEYQ5V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 12:57:21 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F5BC061756
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 09:55:50 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id y14so30902505wrm.13
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=56nDPhFIj8bYnpdmgf2D5pufG3atbZiNiJawhVqj3ks=;
        b=bCjBiw1k+xFMqPf4nex6kscsLYlhaIHMRIYgmoLAPAYShq9qTUzpF3W5fPN+obY8Wc
         vtsguGfPBszH7fOHD+387HersGfn3O2yVc+emyPzERdGXK8zQTp26lI2Xd25+KzMc6gm
         QR9NAUJ2uX0Bk0AJDArhg2TKp7lL4tHFSvv1BMHSzNkEzOQqcWGu5EkB/Y8W7yOWmb0S
         sIBylF0934BiTKctU9EmPhSnbl+vuED5mG6lxF2L9dKN7/UUyZfxhRo9bhIUj1rxAbw8
         7+HvMcr7+cbQG8cBjt0MC8aKvOY7htL9P8VeqIsAwLCbws69uC0qW88wG40Q0a7ITM/p
         tfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=56nDPhFIj8bYnpdmgf2D5pufG3atbZiNiJawhVqj3ks=;
        b=O4iq04rddavNDjLFuv52OczRTsojNFV/xMrjziOEamLjjAmMK9CRkMusggLM66Fmhn
         cPwuC+J9a9viG16GDUODlQv/EA+ATWmfPml2MLJMpQJRceNO5ZhxtP3F9tFyj94kJ5q+
         Jswl6kDg9A4P7Ew3IhISY2GhoyfcVOM0WPNld7dzUE2BUERHvmsrQLq4PxFfrrSyTztL
         AxWd1avJUoVoK963YVtNcfmwTQlJPooBjhYabF/XiIb37ZkHTJV1jYRtW7hm48ziCP4/
         7HwHI1LqByIpHVImuv65AyF4QLEWUWMfpgZbE7SRP4EPlyyi/oP1dwgT4QVfJlKnVe70
         PqXg==
X-Gm-Message-State: AOAM531h78f6hgrjXUTP59qq1UGK7Lfr5d39Pc2BDOkm4PXLCjyp1AtG
        1i0N9117nc77d/FPy2UgyxlZ1g==
X-Google-Smtp-Source: ABdhPJyEnBrUpX71recZ5Cz9ghtNvZv2axCQifVKUy04RpPOy0rEInHPbsrS2pzA/OHJF5g5of8r0A==
X-Received: by 2002:a5d:650b:: with SMTP id x11mr27794223wru.186.1621961748918;
        Tue, 25 May 2021 09:55:48 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id l3sm11571447wmh.2.2021.05.25.09.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 09:55:48 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        john.stultz@linaro.org, amit.pundir@linaro.org,
        bjorn.andersson@linaro.org, andy.shevchenko@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v2] gpio: wcd934x: Fix shift-out-of-bounds error
Date:   Tue, 25 May 2021 17:55:39 +0100
Message-Id: <20210525165539.25330-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

bit-mask for pins 0 to 4 is BIT(0) to BIT(4) however we ended up with BIT(n - 1)
which is not right, and this was caught by below usban check

UBSAN: shift-out-of-bounds in drivers/gpio/gpio-wcd934x.c:34:14

Fixes: 59c324683400 ("gpio: wcd934x: Add support to wcd934x gpio controller")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
changes since v1:
	- removed unnecessary dump stack from log

 drivers/gpio/gpio-wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index 1cbce5990855..97e6caedf1f3 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -7,7 +7,7 @@
 #include <linux/slab.h>
 #include <linux/of_device.h>
 
-#define WCD_PIN_MASK(p) BIT(p - 1)
+#define WCD_PIN_MASK(p) BIT(p)
 #define WCD_REG_DIR_CTL_OFFSET 0x42
 #define WCD_REG_VAL_CTL_OFFSET 0x43
 #define WCD934X_NPINS		5
-- 
2.21.0

