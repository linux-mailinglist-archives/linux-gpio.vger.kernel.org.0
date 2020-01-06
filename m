Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A47C130BE7
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 02:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbgAFBwf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Jan 2020 20:52:35 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38827 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbgAFBwf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jan 2020 20:52:35 -0500
Received: by mail-lj1-f194.google.com with SMTP id w1so27367002ljh.5;
        Sun, 05 Jan 2020 17:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+WKDbV/B1whMsFkARIuj+xVMPqzn++Ge3NWQ5oVlVNI=;
        b=Jn8RXgrbA0x9c7VxoOnXr3F3Z7b0MDtzYYOElpNEWf3fMQTAoINw3ErXHyBmBI9B/f
         ctqk1W2N357i0AjDIZY3b2NPliWisTvtPSDSh5QBhpzT00IG2XpOD0ziLuW7qa9m4c75
         tdn4kN4brFKB6kjbwindIp1xczKU0ObDzsT5pSP7zgzb0hXyj+S0n9QtoGEm4s65DfHu
         IXadbATsaE6O7M0sBU4KsRmZhEtMzpbMcQIMSHqpjpnyfzZAsJLQ+2wpNYMsTKEv4WhX
         Kwu0hcyH6WiMu3/xrNpSEXdIv2iGyWvx0mxtGnsNLvhxuPfeCgMBqW1R3P6rtUxd42rX
         pHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+WKDbV/B1whMsFkARIuj+xVMPqzn++Ge3NWQ5oVlVNI=;
        b=R9h0Tof1W7/oCJARktTZpFviQGl6jBYeohvzZn8VnIMNY5DI4Tr72IQRS5x/PhX88s
         oVIOrIrEV8pxIoplAEVhgQv5TYcup7VS3D2kZKEsVSlfpPxnRkRkv0W72rmSJo4J9hfW
         Ql455Y9ACggqGclNPGYQajbGPMSyyQPz5BZkOc+UARvVobWmdVxcnAyETLMDT1hyDu5a
         pzd9I01GCxm3K/5M+5tMlz4tLD1xkSjZfJdE4dGwvA1+lkycisUpCab0UAYk3Bu99pCz
         z6ptM61MvlNsiLAexKDgK5z1wcu8vCEr+Btid51AHa3oruzgxehh/Tgl8MJDayMCrW8I
         Tsrw==
X-Gm-Message-State: APjAAAV18RHAQhI+tU7WPSf5uBsndXZ1qdHoop/AXB/sf7dzzXhyqUaI
        161L68Y4gT6k4vt12nraCBw=
X-Google-Smtp-Source: APXvYqyRELmENNsXGyiNlWWLXXV9nzG/DrG1gI0e4jsLV5xffbexDIkmohhIwDBJagerlHbfX18vKg==
X-Received: by 2002:a2e:580c:: with SMTP id m12mr58842955ljb.150.1578275553133;
        Sun, 05 Jan 2020 17:52:33 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y25sm28131951lfy.59.2020.01.05.17.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:52:32 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] gpio: max77620: Add missing dependency on GPIOLIB_IRQCHIP
Date:   Mon,  6 Jan 2020 04:51:54 +0300
Message-Id: <20200106015154.12040-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Driver fails to compile in a minimized kernel's configuration because of
the missing dependency on GPIOLIB_IRQCHIP.

 error: ‘struct gpio_chip’ has no member named ‘irq’
   44 |   virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 29689c7384ee..9e99d09a64c6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1146,6 +1146,7 @@ config GPIO_MADERA
 config GPIO_MAX77620
 	tristate "GPIO support for PMIC MAX77620 and MAX20024"
 	depends on MFD_MAX77620
+	select GPIOLIB_IRQCHIP
 	help
 	  GPIO driver for MAX77620 and MAX20024 PMIC from Maxim Semiconductor.
 	  MAX77620 PMIC has 8 pins that can be configured as GPIOs. The
-- 
2.24.0

