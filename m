Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421DE23FE71
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgHIN0W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgHIN0V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:26:21 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF78C061756;
        Sun,  9 Aug 2020 06:26:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id p1so3460824pls.4;
        Sun, 09 Aug 2020 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mL4xScgLpm6GZnT5ws/9FIwwZ74rEqIv1N27JN7upQo=;
        b=Qvy+4vEjYq9/7duZPVSb/4rxz6vz4RAz4Lbp2mrg5lET4dKfzgO0Ba98BW7oeR2y+M
         rWFE+JUzn45Ds0kKhd2Rnl1Y7VvU6GYirHBaKw/Fo/E5vRUGOTlZJLjUFOJLDJXeoI7Y
         NljaXq9kqtlN4QA9GStzVAiaOqJsqutAfH+KqFlXhFvT3L/Znlh444zfaidfqkJRJXZN
         FyDNsJhtTGifE5nUo6oRJsyCbUXbAZet5i2+yPCOfSJgbV/q5v4OiS5qfSYw+0rSZH8T
         u2qp+ziBJzJa11K/aZjWQSryfCU5cRP1LgzldB6lJAEVBx2njCEmbVdqhKILfAHy1/IH
         5v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mL4xScgLpm6GZnT5ws/9FIwwZ74rEqIv1N27JN7upQo=;
        b=NQQJ1g741tV/OAv5WkSMSkrZ3o8pYFN20V3cQIzD/9On+zgkRGvZADFm7fulVaeBf6
         KqLjMtMFNY1q2BP8h/oMw+tpOgh0cxrxhCT6lkYIcuQnr/XDzw3CjWpGed585Q00HAt2
         9c8B28USlRJnwRyNaoylGLZ1qA7V1cTR4tuliWwE+staZpr0aM4l1Ac4WMtEYoSptqYR
         W4PIzQFVa9wteU9awfGw2aOw4pdwSs5+3QDKjZngNADZLAzxdURkzfOzi4GnpvwsvZ7j
         4S5jYFBWkN0+nL2qwIYYibiAu/S9CCoEzY4BRVN8+XU/wuGnksD9o5uW/+mUM2OUWWnw
         oZmg==
X-Gm-Message-State: AOAM531isYWC1o3dHruGh8/QaDv6SImYK40Ix+HWSa15+D/DICjb6mNx
        Qbe1dK8+ikmnhFVVj4UHuPDf/87S
X-Google-Smtp-Source: ABdhPJwWUIBLP+QIZj7qr8n6s8ScUCW0tP9DNqez9dUNgsEk4o1//qiOFpXZQUdat/5Sh/eZ8Br55g==
X-Received: by 2002:a17:90b:358d:: with SMTP id mm13mr20120371pjb.88.1596979580560;
        Sun, 09 Aug 2020 06:26:20 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:26:19 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 04/18] gpiolib: add build option for CDEV v1 ABI
Date:   Sun,  9 Aug 2020 21:25:15 +0800
Message-Id: <20200809132529.264312-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a build option to allow the removal of the CDEV v1 ABI.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

This patch is before the v2 implementation, and is non-functional until
that patch, as some parts of that patch would be written slightly
differently if removing v1 was not considered.
Adding this patch after that would necessitate revisiting the v2 changes,
so this ordering results in two simpler patches.

 drivers/gpio/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8e409b9c33dc..0c62e35cf3a6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -82,6 +82,18 @@ config GPIO_CDEV
 
 	  If unsure, say Y.
 
+config GPIO_CDEV_V1
+	bool "Support GPIO ABI Version 1"
+	default y
+	depends on GPIO_CDEV
+	help
+	  Say Y here to support version 1 of the GPIO CDEV ABI.
+
+	  This ABI version is deprecated and will be removed in the future.
+	  Please use the latest ABI for new developments.
+
+	  If unsure, say Y.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
-- 
2.28.0

