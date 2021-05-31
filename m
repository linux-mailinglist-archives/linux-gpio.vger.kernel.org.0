Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841F4395AEC
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 14:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhEaMxc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 08:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbhEaMxb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 08:53:31 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4020C061760
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:51:51 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id g20so1070019ejt.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5rfovGLCK9Yz+7vSUxaJpHcGW+GXYlgTgZ8LhUcz2d4=;
        b=Dz9VTHpKFzWdXajE6INSvTCz/7/iwn9Zs8EmpCC7EFf2KW2uQydCVrlwv5tCwlVjVL
         6+9Uke1Fwlmkg9emuqcZopw8rg6NNVlfQYpX7McrkNglSSqKeoUyoIWqo9qQ6g7d7eZa
         GGKIMPOHmTPrq7A8KSAuvt/JvHVbzoxrj4fG6oj6HZHRmEqEWNlkPfRFFj9UszROyu+J
         I36YPmo29xRx0WWkJFdxSdh6u2Hcrfijl2RBRPZTlZrDpBbJP4+t5bAvZ+o0vYEg3hTk
         sDN4YRmmpC0mZv+XyVMgjrTIC6h1GvJp7VQCVH+uXUHcdlDKal18ZB9dykqOS8XQ2jbN
         qNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5rfovGLCK9Yz+7vSUxaJpHcGW+GXYlgTgZ8LhUcz2d4=;
        b=e9UnZFH3Q+c8lUxhg80ifUg/3kbI+cWXwe/lEUOjZOE82sfHLLB7Tj2sRjMSZUgCkz
         OTFYHBX0cbuiEK16ExXCGL3CR/qj+0jdpGqE5TGGu9s9RzPuVTMjmTJHUfZ4Q2ChjZQh
         o5RgvfEhj8I20yl91+cUFio3M7Gx+pUZlUuydNyV9CPrlUM3pKl6ZKp9R8uNxJIsLMjV
         h85v+16lpdATdpNkBeAzA9MlduS1x1RUouq7YdarAt++u7w+LMizA/K6ifTuTgsTE6sZ
         Aq4kAFE+YgA9bw3ZrwYyR9CJ0kBWxMPKEd4oaKy0bzmLY9WOeY7Tf5ZQ1gGwMeuGftIg
         6lJQ==
X-Gm-Message-State: AOAM53230uEbnhFNiQUADB547605JckU9070ib5x3sbEAAYJsk7rJoC5
        teThEJ4alr+YjOy8J5Mx2XWBxg==
X-Google-Smtp-Source: ABdhPJyZdpYKzaSGcb7CRlJKL1SSI6rpuNmcXd9A6yd2ZAHbgVeJMWthsh+jNqDmnelHf5OrI4WyBQ==
X-Received: by 2002:a17:907:76b8:: with SMTP id jw24mr22725829ejc.359.1622465510438;
        Mon, 31 May 2021 05:51:50 -0700 (PDT)
Received: from localhost.localdomain ([188.252.220.231])
        by smtp.googlemail.com with ESMTPSA id zb2sm5886898ejb.52.2021.05.31.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 05:51:49 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, p.zabel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 1/6] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
Date:   Mon, 31 May 2021 14:51:38 +0200
Message-Id: <20210531125143.257622-1-robert.marko@sartura.hr>
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
---
Changes in v2:
* Drop the custom MFD driver and header
* Use simple I2C MFD driver

 drivers/mfd/Kconfig          | 10 ++++++++++
 drivers/mfd/simple-mfd-i2c.c |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index b74efa469e90..2b5ad314125d 100644
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
+	  CPLD. It consists of MFD and GPIO drivers. CPLD provides GPIOS-s
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

