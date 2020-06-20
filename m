Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F58202654
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 22:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgFTUNy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 16:13:54 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36264 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728727AbgFTUNx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 16:13:53 -0400
Received: by mail-lf1-f67.google.com with SMTP id c21so7466045lfb.3
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 13:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oOji5s1j3V7J+9EQS5KPt58NPGIcuQSZTULzhnPF9e8=;
        b=x5bOq+FWlXVJ/dejXmuf7HApMGjFOf2Y7gBpta7iAPf1chpGD/Q8sDtcqcBllAEt4n
         2KA+1CWn0l2d/CuuqNcR3ljwjiO1PeNC7AG8ZvP/jQOIi6+6B71cONIhXhkDRNHUDQO6
         ukq+Y4vDLjpHQS7VCgafx9tD2ZtIEPxIE66P1DGGtzpImKWR+YVm03mukFRRt1x7oDQ8
         OUzW6PEI4s2LWPwxxjBu+QGHYS6Ddb6O5fTM1IlQO1FD4i3V8xcooxwBT0GJmbLBHxEX
         w/+JdIZY37q14L60+pY1CMQpwujbea/L3WEGiDXXO3qfnvDronSj+5xREydtUJLCnQ46
         lSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oOji5s1j3V7J+9EQS5KPt58NPGIcuQSZTULzhnPF9e8=;
        b=rWnMlIOZ8cBYbOrtihP0U15RnWk8Fsz/0M+3n1f5s4zNecJkAERjn/T9f5uJ1hfJM7
         MI3yT5ZWSJd5HvRwvL/KTlrVkUPDaYK1hld6nUcMedxJX0DI79QdjlcBUNzkS3GBQMzQ
         jhWlkeGXX2CQiCevyEksV7lJNOHFgTnpWEOkjWTXz0jeBMf+AAf4T8UduEGPZilA7RXL
         tPh6nDqkHoNdf1vQV4i1I0Tou8K/QQ3+3jRNHO0wrkjbmis3kkVu/3TgnsdOcwRGpJGK
         hvSQwMVkEeCuXmSeaMS/K6Mi6QtjhBkkjCnJH/QJyMq2SWvUlZzc1h1Ti7b2eoAvzBSS
         tDfQ==
X-Gm-Message-State: AOAM533yGuP6cr8KdRbwyTTox+GOM4jpVyURTNXjVwnAfUmlAII+Huak
        99Pbg5myBabZvrJt06KQUkUidx4JJHw=
X-Google-Smtp-Source: ABdhPJzvzyw1kPNp1mGaIkVo/o90P/AWQBrkN650wU6NHD4c83wc7+clOyuN+Ler4tNFPCkg/rmgCw==
X-Received: by 2002:a19:87c2:: with SMTP id j185mr5001058lfd.183.1592683971619;
        Sat, 20 Jun 2020 13:12:51 -0700 (PDT)
Received: from genomnajs.lan (81-26-241-46.customers.ownit.se. [81.26.241.46])
        by smtp.gmail.com with ESMTPSA id h28sm1829983ljb.52.2020.06.20.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 13:12:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2] gpio: Add gpio-charger to the documentation
Date:   Sat, 20 Jun 2020 22:12:48 +0200
Message-Id: <20200620201248.28843-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO-based charger is another of the helpful devices built
on top of GPIO.

Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- We are checking for the AC charger not the battery per
  se.
---
 Documentation/driver-api/gpio/drivers-on-gpio.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/driver-api/gpio/drivers-on-gpio.rst b/Documentation/driver-api/gpio/drivers-on-gpio.rst
index 820b403d50f6..41ec3cc72d32 100644
--- a/Documentation/driver-api/gpio/drivers-on-gpio.rst
+++ b/Documentation/driver-api/gpio/drivers-on-gpio.rst
@@ -89,6 +89,13 @@ hardware descriptions such as device tree or ACPI:
   Consumer Electronics Control bus using only GPIO. It is used to communicate
   with devices on the HDMI bus.
 
+- gpio-charger: drivers/power/supply/gpio-charger.c is used if you need to do
+  battery charging and all you have to go by to check the presence of the
+  AC charger or more complex tasks such as indicating charging status using
+  nothing but GPIO lines, this driver provides that and also a clearly defined
+  way to pass the charging parameters from hardware descriptions such as the
+  device tree.
+
 Apart from this there are special GPIO drivers in subsystems like MMC/SD to
 read card detect and write protect GPIO lines, and in the TTY serial subsystem
 to emulate MCTRL (modem control) signals CTS/RTS by using two GPIO lines. The
-- 
2.25.4

