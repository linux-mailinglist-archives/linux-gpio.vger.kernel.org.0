Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3ADB44ACA5
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343508AbhKILfe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343500AbhKILfc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:35:32 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0ADC061766
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:32:46 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id r12so75160986edt.6
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I2HXZ8+wDuZAmky1+IX48MpvrAcOVGAjLZECYWXvvFM=;
        b=ViSy+Fuf4TSMwakL6ULaDuiyzgLb/xlPh6CWrWS4Yg46sX30ZKasxKUHL/S7PTP8ZF
         EIKx6pVrgbMGCFg15lP4tINltaXLunFXPXFHEcoQlJhTdNM5fV77MlkRrgivaINQtXNG
         yyaaCtzJvMPJpSNoih5S5cxJrDjr64G37yuY1/nAO0ZoYhgqmWhLDlVIYBzQHI3mmjzr
         cUYN5Fcd2usBURCMFjJhd8k8jLL54jNRc/3qADmgxM9vcSI3QLyeR0cszm9NznLQMo9E
         mNETJ4rKcTimbnuVkrRqU2Ghq383oixQU7n9f6j2JypL849JjXHDFYeDl1OGZF3Avp6J
         mPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I2HXZ8+wDuZAmky1+IX48MpvrAcOVGAjLZECYWXvvFM=;
        b=FGbPOm+LBljMItjcs5FjJE/D8FkI8LoP2OvZx3zw70hgTzTWTCxYEr1cvy1tmtb68F
         lvyWy/lFdIv9X6iDqNYZqJYj+O9eJgT9KHJVAIhE/jwM7CqyTlKHqwETsI1oF+zIc2TI
         XyskHtWQnaaROyWfR1L+dDvWZ1RFHCkWVFtvrd04zQmFtc0Bv90DIGyRddRRB8CQptRp
         GZg3IKGlWS/RkTcS3G7/jFmcNmPFYG5Lt2LnieIuTUGiwD96w4x/0Yj2sAQcAbrLKKHw
         u4iiDa8F6FyAtEKPQro6dD3uEHTPTYhMy1jPsg2AtmSKnbYXiFMDRIqD07RXvB5j7pWD
         /ntA==
X-Gm-Message-State: AOAM5314rbbSXqjo3zR9zH3o12zXa4mKKfmOoRs7/lvxWrYfRyIqIGbb
        nH1FNKV7PIon2SG0wjjQB068Kg==
X-Google-Smtp-Source: ABdhPJyXJsWxDdMlK8qVyawOOIGf8bugo+Tq3xhAkRb1RCQJ5v7PvXtFDeNS2rNN/QwT9gpxLHacxQ==
X-Received: by 2002:a17:906:11ce:: with SMTP id o14mr8988544eja.457.1636457565031;
        Tue, 09 Nov 2021 03:32:45 -0800 (PST)
Received: from fedora.. (cpezg-94-253-144-18-cbl.xnet.hr. [94.253.144.18])
        by smtp.googlemail.com with ESMTPSA id s4sm6771167ejn.25.2021.11.09.03.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:32:44 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com, michael@walle.cc, andrew@lunn.ch
Cc:     luka.perkov@sartura.hr, bruno.banelli@sartura.hr,
        Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 1/6] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
Date:   Tue,  9 Nov 2021 12:32:34 +0100
Message-Id: <20211109113239.93493-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delta TN48M switches have a Lattice CPLD that serves
multiple purposes including being a GPIO expander.

So, lets use the simple I2C MFD driver to provide the MFD core.

Also add a virtual symbol which pulls in the simple-mfd-i2c driver and
provide a common symbol on which the subdevice drivers can depend on.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
Changes in v9:
* Depend on ARCH_MVEBU or COMPILE_TEST

Changes in v2:
* Drop the custom MFD driver and header
* Use simple I2C MFD driver
---
 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ad15be6b86bc..35b917e583b0 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -297,6 +297,17 @@ config MFD_ASIC3
 	  This driver supports the ASIC3 multifunction chip found on many
 	  PDAs (mainly iPAQ and HTC based ones)
 
+config MFD_TN48M_CPLD
+	tristate "Delta Networks TN48M switch CPLD driver"
+	depends on I2C
+	depends on ARCH_MVEBU || COMPILE_TEST
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  Select this option to enable support for Delta Networks TN48M switch
+	  CPLD. It consists of reset and GPIO drivers. CPLD provides GPIOS-s
+	  for the SFP slots as well as power supply related information.
+	  SFP support depends on the GPIO driver being selected.
+
 config PMIC_DA903X
 	bool "Dialog Semiconductor DA9030/DA9034 PMIC Support"
 	depends on I2C=y
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 87f684cff9a1..af8e91781417 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -39,6 +39,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "kontron,sl28cpld" },
+	{ .compatible = "delta,tn48m-cpld" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.33.1

