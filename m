Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C881327AC05
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 12:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgI1KmJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 06:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgI1KmD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 06:42:03 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13896C061755
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:03 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k18so621789wmj.5
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BgQC3n53i35n7GC4c6lOV6W434EKfBGkaRy/2vzORco=;
        b=g25S92GzFTtlvrXh1qKrS/Vwlmclx80rOqSPIoXFYXySdro3WbP05KxXTAPR6v3exM
         ktTM+IJme5cRnb4LbYPLmz1mXORBY7M91DOyzGSbReyWETCpIyAfMA1stxJJLtDtxYak
         OdXu930qd9y3kFxYNsvMaDZN1sUYXRasTgjeflLvqROirlEIEi47pdPrdolGMO9W2Mfl
         saNiCjsYw3hpDcf052MHVKMu6/CP3RWUrd42qbQ+WEMUe49rppw728yuoFN9a1iTi/25
         EGAsht8jzipIbdyIVTys8PMyYmtjgtrJjoL3DwTLRgFqB4fNUsT6bnABqUL1G+AtQitg
         uhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BgQC3n53i35n7GC4c6lOV6W434EKfBGkaRy/2vzORco=;
        b=Qy3XvgPAyc3kft9hRlFBg0FxN8g/sM00aAqHSnFZ87M1KeDG3INkMyG24003gDFemX
         lW1tX7IgbuVsqT/0nsY6QWOyJTKDk3sedl5srXecg1Mg1Kse9e5c+a1h2Fb6FRfTTGDA
         VkHvzwMfUwuB4lBSA5wcoC4msx1Vvl3z8Jlwxx74eoTS47Dm/bprJX0Nc5L2DXKx6wB2
         OqfbiYRPdS0AS92Q6aeB7G0bub0USy42DwYQQ98H4le6C14YEVlahJIZrC976WE5pSmS
         eha9l1dwyLF6IJy1FUBQLu7o3q2GzsaEuOMcguQpw8g4JKUQVJzxXEXZLR9Av1KaV6ys
         T9fg==
X-Gm-Message-State: AOAM532VsNuGet4T6sLODHcod7FEethVntQJo8a+QAeGWTHUgzYC+XdO
        L/5/t7UFxOuETOPT5oJUeGpxNg==
X-Google-Smtp-Source: ABdhPJzuoHu8hiPRyruz0R0GxX7FPtBX6BtsAj+v2MOxtfNzI1H20bJDYnfNZISzWIcqTHi2x057Ug==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr963978wmi.170.1601289721775;
        Mon, 28 Sep 2020 03:42:01 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:42:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/9] Documentation: gpio: add documentation for gpio-mockup
Date:   Mon, 28 Sep 2020 12:41:48 +0200
Message-Id: <20200928104155.7385-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200928104155.7385-1-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's some documentation for gpio-mockup's debugfs interface in the
driver's source but it's not much. Add proper documentation for this
testing module.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../admin-guide/gpio/gpio-mockup.rst          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-mockup.rst

diff --git a/Documentation/admin-guide/gpio/gpio-mockup.rst b/Documentation/admin-guide/gpio/gpio-mockup.rst
new file mode 100644
index 000000000000..9fa1618b3adc
--- /dev/null
+++ b/Documentation/admin-guide/gpio/gpio-mockup.rst
@@ -0,0 +1,50 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+GPIO Testing Driver
+===================
+
+The GPIO Testing Driver (gpio-mockup) provides a way to create simulated GPIO
+chips for testing purposes. The lines exposed by these chips can be accessed
+using the standard GPIO character device interface as well as manipulated
+using the dedicated debugfs directory structure.
+
+Creating simulated chips using module params
+--------------------------------------------
+
+When loading the gpio-mockup driver a number of parameters can be passed to the
+module.
+
+    gpio_mockup_ranges
+
+        This parameter takes an argument in the form of an array of integer
+        pairs. Each pair defines the base GPIO number (if any) and the number
+        of lines exposed by the chip. If the base GPIO is -1, the gpiolib
+        will assign it automatically.
+
+        Example: gpio_mockup_ranges=-1,8,-1,16,405,4
+
+        The line above creates three chips. The first one will expose 8 lines,
+        the second 16 and the third 4. The base GPIO for the third chip is set
+        to 405 while for two first chips it will be assigned automatically.
+
+    gpio_named_lines
+
+        This parameter doesn't take any arguments. It lets the driver know that
+        GPIO lines exposed by it should be named.
+
+        The name format is: gpio-mockup-X-Y where X is mockup chip's ID
+        and Y is the line offset.
+
+Manipulating simulated lines
+----------------------------
+
+Each mockup chip creates its own subdirectory in /sys/kernel/debug/gpio-mockup/.
+The directory is named after the chip's label. A symlink is also created, named
+after the chip's name, which points to the label directory.
+
+Inside each subdirectory, there's a separate attribute for each GPIO line. The
+name of the attribute represents the line's offset in the chip.
+
+Reading from a line attribute returns the current value. Writing to it (0 or 1)
+changes the configuration of the simulated pull-up/pull-down resistor
+(1 - pull-up, 0 - pull-down).
-- 
2.26.1

