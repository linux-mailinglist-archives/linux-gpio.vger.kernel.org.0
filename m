Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E22268E09
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 16:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgINOlx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 10:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgINOlq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 10:41:46 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A26C06174A;
        Mon, 14 Sep 2020 07:41:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id b79so307729wmb.4;
        Mon, 14 Sep 2020 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gzOaZ+9doo3e9MINvriYLJ9c1FIG4zynst8IxgcsqLk=;
        b=DZRmIViiCZ7QQ2zUCEkCO6A+Z8C/eQt5ChkUIcvGdpfHx2ZBvUrQVJYqVEy3q51kz5
         TFjGe/XLCvjKAVfXsEWklgJifUm7U2fZd8GGh5HIrkEI99SnlZu9W5EwKNlfbQh+BC09
         yFRn5BWABqTgO5JlMIPjVZHSefwvy74dKAFlNtvoMpMJ4qimbdybBqXZb8HjPHKdrxX5
         GASM6TYlww19XOCuX/Hw3sNgsTbVvCs6WCQVDwDIWpUsVKeET46idgGEKjFgqeZBSsx3
         oM7WUXix9EckT6kHc+VfN8cD3MAqk19MPaZ05zZREXdZgsYIRphqax1yS600WzNzEs76
         uYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gzOaZ+9doo3e9MINvriYLJ9c1FIG4zynst8IxgcsqLk=;
        b=Z/TRvRLQ+xZHGkbWKKnI2BHk1sq61TzYZPZQyTCEg+Jj0T4hrjEU8zDaX98p6kBYWt
         uTqREvmx4jcgV7AEyb/iFhmlb9PaxonDmy7zWsxkCK43YU7gVYFKm2R0ERk1NM4RSF12
         9WEckUKurKiCX6zn5OyDj43KyHAnzsTwkaMHbz3NNqmN1nghmSuj3ZAxrKRsdRJBACLn
         i2+AjFyOkmBOToEo05/QEBHRTWXu8q0Qnw7h9NEwZ2cxHFkgYFgw9cw0J22SejSNydrs
         oy8WMeekOGl8PVCPrExFyfWeA9tCPZN95AMGK7ql9N4qWP2fxECy4YxB4w53zuaA6eZ3
         WUKg==
X-Gm-Message-State: AOAM532sW/b16+zDplZAzavdqwC3FlMxoMlX6XcvjAZ7+8Q5hlKhsiZm
        Pjlg8+WDpax1TwTi4APZsKw=
X-Google-Smtp-Source: ABdhPJzXcOhHK7by7NsLZ4cIfrt/nXVH6TUtlu6R6APi9nfMpl32uOzvpNNw0ngxZ245uA+1Kjin0g==
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr15168395wml.176.1600094504093;
        Mon, 14 Sep 2020 07:41:44 -0700 (PDT)
Received: from localhost.localdomain ([85.153.229.188])
        by smtp.gmail.com with ESMTPSA id g12sm21329806wro.89.2020.09.14.07.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:41:43 -0700 (PDT)
From:   Necip Fazil Yildiran <fazilyildiran@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: [PATCH] pinctrl: bcm: fix kconfig dependency warning when !GPIOLIB
Date:   Mon, 14 Sep 2020 17:40:26 +0300
Message-Id: <20200914144025.371370-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When PINCTRL_BCM2835 is enabled and GPIOLIB is disabled, it results in the
following Kbuild warning:

WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
  Depends on [n]: GPIOLIB [=n]
  Selected by [y]:
  - PINCTRL_BCM2835 [=y] && PINCTRL [=y] && OF [=y] && (ARCH_BCM2835 [=n] || ARCH_BRCMSTB [=n] || COMPILE_TEST [=y])

The reason is that PINCTRL_BCM2835 selects GPIOLIB_IRQCHIP without
depending on or selecting GPIOLIB while GPIOLIB_IRQCHIP is subordinate to
GPIOLIB.

Honor the kconfig menu hierarchy to remove kconfig dependency warnings.

Fixes: 85ae9e512f43 ("pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP")
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 drivers/pinctrl/bcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index dcf7df797af7..0ed14de0134c 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -23,6 +23,7 @@ config PINCTRL_BCM2835
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	default ARCH_BCM2835 || ARCH_BRCMSTB
 	help
-- 
2.25.1

