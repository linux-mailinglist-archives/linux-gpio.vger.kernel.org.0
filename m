Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A432A8CD3F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 09:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfHNHws (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 03:52:48 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36985 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfHNHws (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 03:52:48 -0400
Received: by mail-lf1-f68.google.com with SMTP id c9so78601150lfh.4
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6y1NrcZ/EIV/Z/9WpGpEcjaPRpokRPI9zp3tsyZnWrg=;
        b=LuXDqQtsxueqAxM2J1fwaGs1vrBPFabEq54w+ZgW9NsOFYnBBXALr7e55pwIQOEUGU
         xdI8F1oAM28iyXSsv+dSSlhVXk23Nv6kl9T7f2N4qNoa5vmip4yWMMpEd8ld8qp4FDVt
         nEOU76SvRc6XELugSRAJXdxk/qXf5NYF3XAUmNlj1STG01IWf5XcYo1rgL4NBegJRboW
         iKucQHfHnPrUYmqZsZYcgPFPFKox4Po6DKppIeKUzUVb9NC7leUYhj7bvnqO8TWo71EB
         EytdSKykUw5Vq0X+NJ3RFuPWGRMbMSVCCFYz5GpSXtyfoq1ycx9KNfX9iVR0bv9KPBkz
         ut4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6y1NrcZ/EIV/Z/9WpGpEcjaPRpokRPI9zp3tsyZnWrg=;
        b=TrW2xhDOnlqrmdGIew8/JGa/YT+LR+ad0FYsK1gcIFs4zW9hcG0jFB/U1IoysyTs36
         izFOHD7eUOJf5T9eJBXH0olybktmj3Aa1oYTbFgOWzi3ku1E9Pu+baeTUduPOwWN0pzL
         7FtO4VDIerQTPcUH1DTNpyaPMbuqwqLJ0tIAKcw+BML1ndt6nfnVitSwhDZK6+uSE6pJ
         KHsSuaQ6fsVbbowpHfZmTfQ4I5WA2af/XDWlv5yDDlV3GRmcNUspVla8qvSf2ihlyACe
         tYhKq7c93WnSZD/c49Vu2JSwUlkaWXAf9LTxAPv7GlAjpVVRPRqfcT1b0E9sYME/NM3R
         oRtw==
X-Gm-Message-State: APjAAAXts5R/8Y9aBKzFO0n26srKgqaWTzrPXeZZb2gIwmPQcAQpYR7s
        uiZk98S52eJKWJ/KYgOxId1c3kUc4ng=
X-Google-Smtp-Source: APXvYqwVzMtPz4CagdcdQeFvv0SxymxgJCNQVth/8YgJqjV23Rtn0kQ191b5IXx7fNKQQCSkbZ/hfg==
X-Received: by 2002:a19:5217:: with SMTP id m23mr24506919lfb.124.1565769166506;
        Wed, 14 Aug 2019 00:52:46 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id q21sm7453942lfo.18.2019.08.14.00.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 00:52:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] ARM: plat-samsung: Include GPIO driver header
Date:   Wed, 14 Aug 2019 09:52:44 +0200
Message-Id: <20190814075244.8726-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This file is using struct gpio_chip and needs to include
<linux/gpio/driver.h> to get that.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Samsung maintainers: please apply this where appropriate.
---
 arch/arm/plat-samsung/include/plat/gpio-core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h b/arch/arm/plat-samsung/include/plat/gpio-core.h
index 51e721f5e491..c0bfceb88340 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-core.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
@@ -12,6 +12,7 @@
 
 /* Bring in machine-local definitions, especially S3C_GPIO_END */
 #include <mach/gpio-samsung.h>
+#include <linux/gpio/driver.h>
 
 #define GPIOCON_OFF	(0x00)
 #define GPIODAT_OFF	(0x04)
-- 
2.21.0

