Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B71632765B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 08:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbfEWG42 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 02:56:28 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35699 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbfEWG42 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 02:56:28 -0400
Received: by mail-lf1-f66.google.com with SMTP id c17so3564230lfi.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 May 2019 23:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/WBJ44iDQX30k02SlTfkJc3yqkwJmRNSAtFwx3J5/HQ=;
        b=eoC99qMwNiwrn4v2tvawer93YYgIy10vPBy59SKp48cG3bvOvBEBPc74uFWhP8rRgk
         u37O5eoKRyCKgjo+Xe10DNeDnEthcQC62K+dCcEdO2YHzsorAg9PX1JCm6LGw+PKkefm
         +N+TDaJ9pNBlmMYA02EILADFv557+kaPGn19BNvfjxhZ/6wuq5qO4TgZxIZ7nlhS7Bk4
         fDfHEUMaLCBCh3ic1/ZATKN0+Py+ayOJCjG6xIIsycnjuBWYA7LnWUT6oMhJnRFA+LEg
         E415mc46d6Dc6FUhfxFToUw/vfezNwU5bWa6XCNgQtPVe9yzvjuLkMfk6MMbHwSZJqIf
         ut5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/WBJ44iDQX30k02SlTfkJc3yqkwJmRNSAtFwx3J5/HQ=;
        b=I9/7eaO/Z6bd9horr8YaX9F5OhPQ7gKzoXhSwlqLgwcCBixv5ef8RegFXwmKvIeDtO
         LFih5jqL9mr7AggCO5nEAzKX0DILA4YdZVE0O+oeLfMfmakLMwlCIvZg92a741I7xT1e
         3rKHBSaO8MZOB1vM9hZ7qsnEmQX8A/S/LAfDHzYCwBh4nxM3zpU62MkoCb86G7QiCvj/
         q/ZruDoQgjG6DS2PU1naJxhK4yf5CcCUMiPz4Vz7HXrehLxU42H8lZi5blBhLQMesZWb
         ZvgFtKE1J+krxHAMXbRMf7qJFuVIJsDu9JuaQ/ZBXLcMbESNI9F+uHOu5mQ55qfLslFi
         JvSQ==
X-Gm-Message-State: APjAAAXaz5/sB+qxt6Bkek/PcMnA7sOsl6WmogWGPQ6719MB2owd+X5B
        4Wr7Oq/B3rCatdC89A4jOIGBSPJLMPw=
X-Google-Smtp-Source: APXvYqw3+cxk9mNBYA6X7NKjKLozJFVLAD1u7WyCe9qNZBEahbDBt/knqzssZ7jMcGDz8MXkcR5m2g==
X-Received: by 2002:a19:e057:: with SMTP id g23mr14589323lfj.19.1558594585966;
        Wed, 22 May 2019 23:56:25 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u14sm4718677lfq.6.2019.05.22.23.56.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 23:56:24 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Update Kconfig text for GPIO_SYSFS
Date:   Thu, 23 May 2019 08:56:23 +0200
Message-Id: <20190523065623.5993-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This feature is deprecated, it is helpful to inform users about
this. I'm resisting the temptation to add "depends on BROKEN"
to this, but saving that for later.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8023d03ec362..a10b821e1d92 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -61,16 +61,12 @@ config GPIO_SYSFS
 	bool "/sys/class/gpio/... (sysfs interface)"
 	depends on SYSFS
 	help
-	  Say Y here to add a sysfs interface for GPIOs.
+	  Say Y here to add the legacy sysfs interface for GPIOs.
 
-	  This is mostly useful to work around omissions in a system's
-	  kernel support.  Those are common in custom and semicustom
-	  hardware assembled using standard kernels with a minimum of
-	  custom patches.  In those cases, userspace code may import
-	  a given GPIO from the kernel, if no kernel driver requested it.
-
-	  Kernel drivers may also request that a particular GPIO be
-	  exported to userspace; this can be useful when debugging.
+	  This ABI is deprecated. If you want to use GPIO from userspace,
+	  use the character device /dev/gpiochipN with the appropriate
+	  ioctl() operations instead. The character device is always
+	  available.
 
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
-- 
2.20.1

