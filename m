Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8841F27C1E9
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgI2KKV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgI2KKS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 06:10:18 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F73C0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:17 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so4663953wrl.12
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BgQC3n53i35n7GC4c6lOV6W434EKfBGkaRy/2vzORco=;
        b=Vlwp5g8nq3clh05VTdk4D5/6nGKS3gJzlJ6Qci4WMXVDpaFe8+w3bNqKKyH9PvhJdk
         r8iaxDY20JE2VFOz6Rbwu5mNGhNb9M70UvPINute+KCs8x8ypMcLpzeATeXYQOq9VzIB
         lsUTEPPx/2Eq8OjjBMOWCFSjKGWd3rPNiyqMAwPIbR17ZkMobYn7mroG5P5/6kMOanLz
         +5o1kcZPT5HY55Zr6p4WvjLzaYqZocoapIMFdhc8QYuuwl48MK1Q/+AvCHHImITeUZus
         +qkHUPLnyA355BMsYiV+BzZxEVNwYpNKSj9Vzgcf6Rqz0E6F+J+PNneZRlBvocb5pEFq
         cA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BgQC3n53i35n7GC4c6lOV6W434EKfBGkaRy/2vzORco=;
        b=M2a9E1dPQtHlgpZsEV5IWjWmHCyQziMutsXOkGB3U0RW9aFIJlLX3gJe7czRdRMABV
         wYmbqidhdYpoopHrevr1GFAAPREGPMyyyjhYxPeIPtm+H0OUnI+VnStYSNFdDo/morZR
         kG11jxL+lIhaidkmIBanT9jQOltfRGPr53tUvSDAgpci/M1PYyOjmVSIGLjiemW6jJ5o
         iyw1w/V/X/OSbYVsM1MjV3aMRoj0b8gvvUqUH5nNwCH/KotzfZ/gqhnQNiJJ5I982rbM
         ta06q1cUu+6cDkfETPo9yzQWIMmW0bJCwo5ir46qp+RKW+u4akXDycg4yP6rCupFE5EI
         b2SA==
X-Gm-Message-State: AOAM532xaZFzQt64tXDgmDOCf+ExDavz8dT4Y3jDSLb2KqNUcWCptXZR
        k0NZVkpFDuO6oEkIXBwyR9qJOw==
X-Google-Smtp-Source: ABdhPJyuFk9oLj8oeKx5P1cDeMQ/VsotouQuatcO5DStHJNiJydDu3sx3SxN+GryFbyn4Eb0Q3HxXw==
X-Received: by 2002:adf:f106:: with SMTP id r6mr3453748wro.106.1601374216544;
        Tue, 29 Sep 2020 03:10:16 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 02/10] Documentation: gpio: add documentation for gpio-mockup
Date:   Tue, 29 Sep 2020 12:09:56 +0200
Message-Id: <20200929101004.20288-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
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

