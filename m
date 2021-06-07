Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E3339DC82
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 14:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhFGMfb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 08:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhFGMfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 08:35:30 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AA0C061787
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 05:33:25 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id ho18so15400390ejc.8
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s1McyNikPeBkyMCxJJKhjGXbmzHmFRGVfiDXNrONCTw=;
        b=Tlmrp/Lx1rETQeuEkLjcveKpE8NsDZh8QzPT4p3h4hUhxqjaccqSnzx+/PHSH5esO5
         XINlc86HFGLDMTtYWAJARJYsvJ7T9lfbWKIOHIvKhyysmPSymmI1cBqMbj56XfWB+VDe
         mtI2oq30yKsRxr7Cm134ccAzHlKvAA4RKezpbId4VLWTG4dMr+NRJ/Tdw7yheXYtOJAd
         BHop/MGWI454lK9IeTas5NM/skSNcRIyyV8FL2YH8+TAKgJCpDmf+GvkCmHlhIZn3ylp
         LdAmtMvQbDV+qTT1TTvc/KuGCa3qCpvtfQmY6jQqugLPOUjAHj9PIcemDforVBeLbzI5
         dRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s1McyNikPeBkyMCxJJKhjGXbmzHmFRGVfiDXNrONCTw=;
        b=JKxaUTRdl0zQvBPtQ+8201tLT9PzD9p/ChIgedEdawYJLtY5Dfkx8KBVmiuceLi0E8
         jyCLGe7Z3ggJiHqsiUZoerXu0p5c9FYqBnefcx5Wkw7gseu+HChAzR0arR4KwS7/RS0h
         krkocBPhwpWRtoihcsjt5aL2/lCrykdEPAxY3q+nBNFrOtFF0nJMR2CAGUhB7/muU+/j
         oao7sVS0/j++2hj9HAPgsZPiKhi3h2GexYKPzZyoryGC73hRrmr9tJ0y3y93uv698Fay
         qX+LyDWPt/kUPjdnKAqkYNu8DrrfLiLavwsrbuB6PsgdwlwdUzGcZZk3nlW3Z0LOKEHd
         S3tw==
X-Gm-Message-State: AOAM532INENRr633jk650pqGSLQmd44iygHTucDdZtYgBlaS75LlPMj7
        GoJIFF5NXel3C0jrD/XYTY2yYg==
X-Google-Smtp-Source: ABdhPJyx9+fVGPQO13neftlKAK7lNRGKMnjjOGyvp7SqnC0fIqlkQaJhv43Ypu8J0r8Ze57YVS7hVA==
X-Received: by 2002:a17:906:3485:: with SMTP id g5mr17369204ejb.174.1623069204108;
        Mon, 07 Jun 2021 05:33:24 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id f18sm6471000ejz.119.2021.06.07.05.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 05:33:23 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v6 1/6] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
Date:   Mon,  7 Jun 2021 14:33:12 +0200
Message-Id: <20210607123317.3242031-1-robert.marko@sartura.hr>
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
Changes in v2:
* Drop the custom MFD driver and header
* Use simple I2C MFD driver

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

