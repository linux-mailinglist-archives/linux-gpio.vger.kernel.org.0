Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB52398972
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 14:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhFBM1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 08:27:39 -0400
Received: from mail-ej1-f47.google.com ([209.85.218.47]:38482 "EHLO
        mail-ej1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhFBM1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 08:27:37 -0400
Received: by mail-ej1-f47.google.com with SMTP id e18so3563391eje.5
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMQqmoj3nd3kMgvLGFUrh0di1g3/21uyykstmCG03/k=;
        b=NAFpRO8EU0sFU8JLDKS8uFc/Sx0L1jbkbuP7t1U3t2plfSjNUBgNdk0s9PMiSp59Ka
         C6b5ULTJ+jLzpMUcmhSh9TvUPbXen0La6LJ61Te3UNd285UzFO8/PELKD+TppKJZ+u9y
         bRUD4XjqxeOf2JwgtTE51l0Zy5jU8SXZHFUq98CpJIHFIZY6sc/F1z3nJ6tqMvksgX0P
         zV2+z6sIFmlep8Xz5QRkbUxnsNwo4OuaZOVD6LoJ+vgDZOczoHCxa0Et8hcXEKlY4jwl
         Q0qIYvfpIewK3h/zlVh5FnvkY+KPcAHzHUAfzB8JGPqWyBfNJzoN3dhaN69pbcUxaWaW
         iJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMQqmoj3nd3kMgvLGFUrh0di1g3/21uyykstmCG03/k=;
        b=lh4b7CT7maXDIM8wf7UW/EnaFWK4KKVdQbit0bevBJFE9CJ0aosBID9hhYX8cjvpZ0
         oUxTjJAvpKewxHRJ5sT2r6Z+YHlY3aWnBxK3aYCK5PEbbN9WaCL9pyjeh5Y8xfNi1TQR
         63PvuWO0oMkSUpOE0RwAio7o3A/jD8qQweg3bWcL2isrdEYRF9SGAh9wEr6y96E/vFAW
         trjRKU9u6kjGyj/uxEOku8xbqDayIZErxc4uMwmara6hAHKttdwkD7ZLOZTUfiTm4I8O
         mdJm0Ucwymo42MvcxlWa20x70wJFZ1GNGsrIWCnMGFOj+rpc9t6J78UQ+cV8NI1MO5dU
         ywIA==
X-Gm-Message-State: AOAM53209tCUOf0EMmPy7/tiknnN7dppfexC4IeHj1GtapRlkdTDuX8r
        zL9c0BAQFIRKwc46r/jZq5eQQA==
X-Google-Smtp-Source: ABdhPJyhXqHlCP22Ff6XGljlqO/zNDq1mX06640rFNztfLb0dLKAQ9sTqEjYIN+tbLjNW5Ove5Nz2Q==
X-Received: by 2002:a17:906:eb88:: with SMTP id mh8mr16455568ejb.540.1622636686035;
        Wed, 02 Jun 2021 05:24:46 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-250.xnet.hr. [88.207.96.250])
        by smtp.googlemail.com with ESMTPSA id z17sm8539340ejc.69.2021.06.02.05.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 05:24:45 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 1/6] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
Date:   Wed,  2 Jun 2021 14:24:34 +0200
Message-Id: <20210602122439.2084775-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
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
 drivers/mfd/Kconfig          | 10 ++++++++++
 drivers/mfd/simple-mfd-i2c.c |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index b74efa469e90..733c2f9adb15 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -297,6 +297,16 @@ config MFD_ASIC3
 	  This driver supports the ASIC3 multifunction chip found on many
 	  PDAs (mainly iPAQ and HTC based ones)
 
+config MFD_TN48M_CPLD
+	tristate "Delta Networks TN48M switch CPLD driver"
+	depends on I2C
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
2.31.1

