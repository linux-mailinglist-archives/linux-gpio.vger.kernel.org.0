Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E889439DA25
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 12:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhFGKxl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 06:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbhFGKxl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 06:53:41 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC31C061787
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 03:51:33 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id u24so19740540edy.11
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 03:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s1McyNikPeBkyMCxJJKhjGXbmzHmFRGVfiDXNrONCTw=;
        b=c74RTuIecNHosG6JNNuMdOCBDwc1mzNp+wEAOwV2/FiUUI1P09Ycaz4Q2bcuntEvoV
         BWqxP64V69duo8AZwBICV9VGQ4agIq9ThkOpCMyHpwxzZN8gj5fvT8BdYEQcq4s6pxYd
         Liwr1I/f/yXJkQJH6vBjqJbpm++SRua82Z/pqguxKrf+l6E4eZGqdIB02hDTAeJoZCqX
         qJPA43J9YXBIZybARyIt7BNcBWqL1BW3AsKwMWZQsmNhMp00boVJD/elGAZYumLK0RKV
         kM93ccvJsllldtMhY3N1Mm6k1jaa5mh/OdTmxuEpHjpynQKATX1Do8wmFj0hCV+ZSSEL
         Tj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s1McyNikPeBkyMCxJJKhjGXbmzHmFRGVfiDXNrONCTw=;
        b=WxlHTcoJzk0MszSW4hw7f6d8jOQeo7/TlJn8IG7rtopjmx7uMOu5xTh4bpplrGIaZY
         jqlEZ6OaRoJnoWeLGCKiwaXufuntaKFezDdxHWa4SmhA6Mhyts5GwkuF3/l8iMbhqh/O
         M9LwfE9E2Ze48aI4JhunGwv0ejcJF5K9y4wmzn9uu6AZHIJJTbRlUz/8Ri5/XqfkCIq5
         O66XV6gQrCE22Ip5zFIun5RF5hK7rn/mZGm3y/9XV28lzhIGzHYssxlSQu6SQqp3Smg9
         muu+CGIhzOLkOO43ANcC2t6Yziza8AZCXLoVyQt8tU5HR6MW7ybYdxYstb4xCDwmc7yk
         +G0g==
X-Gm-Message-State: AOAM531gMWC1dAxsR2/2Tbo7KvtkFserYI6Zk1NTQI0qJ4EwQ3yTaOFf
        wMz8tW7+y7vw+25BawMNpBgElg==
X-Google-Smtp-Source: ABdhPJy1vVluf2bTNfPnDXgLldykOnp1HnSADREAza+H/OWb8uoG5om9DSwts5Bq+gvxdAgyl4NUKA==
X-Received: by 2002:a05:6402:685:: with SMTP id f5mr19256801edy.178.1623063092281;
        Mon, 07 Jun 2021 03:51:32 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id f6sm6340003eja.108.2021.06.07.03.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:51:31 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, lee.jones@linaro.org,
        p.zabel@pengutronix.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bgolaszewski@baylibre.com
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 1/6] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
Date:   Mon,  7 Jun 2021 12:51:17 +0200
Message-Id: <20210607105122.2047212-1-robert.marko@sartura.hr>
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

