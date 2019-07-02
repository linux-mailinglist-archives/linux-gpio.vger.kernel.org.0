Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71BA05DA9F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 03:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfGCBTF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 21:19:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40580 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfGCBTF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 21:19:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id p11so736231wre.7;
        Tue, 02 Jul 2019 18:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rWLzfbu8j4EYgy/8k30wN0dMRH7MHW+jd6HZ5Ksrd3U=;
        b=hEaxITbD6g01GU/E4tW0b9uFqAt6dT6NrdnsjGynaCiSDczc3wBtQ6h3N5KDIjVZTs
         bq+litxweOV0YzLcD+htddP+0KeUARG1QFlrZPaZdPOatV60kjAJGRzibtzNi4tCJ6LB
         BCx2+cvlgKxvgtol8Y1IZtr2JRmkDwnZqCDzK6DS1vsIUyorzJuuJrPhYZlbwugny5iY
         iHJYtLyqvTZSz1n2plu+X1bFXa7JU1nQbLEavg2aUj+SUizBeOLnB2hZ3y/LTPqDH9jG
         44vqaZTTMpgbCGizFvZHtpQ/h3jknSoV3ETZo7RMtxtbEcxrYA2HO32qpbuGGnHhQdbU
         WFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rWLzfbu8j4EYgy/8k30wN0dMRH7MHW+jd6HZ5Ksrd3U=;
        b=g+ZxcVmHJHNHNcsO9GJNMGjyauQ6AOIPzI4VeHw9ikGSKvZGLntv9xG6G9Gv01b08s
         rlWzoqm5CRVq4a7YiTnJSnyzSGSpDLQlDGgb+77aCLULUy5Jw3IfFhYUsarDZH785nO2
         muSHqkum5uZ6G8Kpak7XrzrvxN9l7spdxJWaUP7lv3CBkH9abEIQMrOzSCLQ533YGYje
         NkAkyg+YdpmjtJ3VEPLr0QODq8V3SJlU9UyEvCRAYwKhT3xpR4B6rDhQf0wMlbN8/76H
         vcOaQ15pQg++l5m5nqoky0VcOC7I5JQCyp/DE147oYVCq9tedjXZvm2wspt9Frj48jDj
         1Sag==
X-Gm-Message-State: APjAAAUUtPri8q2NXI3JyTXk0jNSKa3Bora0EOA6KTXm0arccsOX1w5O
        WeCUR9Pg5O1e4xmDZx9WgrWmtS0G
X-Google-Smtp-Source: APXvYqy1mj2CZXwhgjct0fF4qSkZ62Tn5IxLxpLT3bp0eyZredMoec+t+UbjgZuFjSB63XicwdQ2Cg==
X-Received: by 2002:adf:e311:: with SMTP id b17mr6840692wrj.11.1562106792800;
        Tue, 02 Jul 2019 15:33:12 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D62000A09003363445C98E.dip0.t-ipconnect.de. [2003:f1:33d6:2000:a090:336:3445:c98e])
        by smtp.googlemail.com with ESMTPSA id 18sm253513wmg.43.2019.07.02.15.33.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 15:33:12 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     blogic@openwrt.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Cc:     dev@kresin.me, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 4/4] gpio: stp-xway: allow compile-testing
Date:   Wed,  3 Jul 2019 00:32:48 +0200
Message-Id: <20190702223248.31934-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702223248.31934-1-martin.blumenstingl@googlemail.com>
References: <20190702223248.31934-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable compile-testing of the stp-xway GPIO driver now that it does not
depend on any architecture specific includes anymore.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f1f02dac324e..43d7d6a9d9ab 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -489,7 +489,8 @@ config GPIO_STA2X11
 
 config GPIO_STP_XWAY
 	bool "XWAY STP GPIOs"
-	depends on SOC_XWAY
+	depends on SOC_XWAY || COMPILE_TEST
+	depends on OF_GPIO
 	help
 	  This enables support for the Serial To Parallel (STP) unit found on
 	  XWAY SoC. The STP allows the SoC to drive a shift registers cascade,
-- 
2.22.0

