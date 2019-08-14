Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8DC98CC92
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 09:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfHNHUh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 03:20:37 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38652 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbfHNHUg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 03:20:36 -0400
Received: by mail-lf1-f68.google.com with SMTP id h28so78527529lfj.5
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/HZTPpUPSoZO1hQYWfHk+1kE4VXCBxNHlEBuFv1b85I=;
        b=mbwpz0KDemAFpK/dbrSHkCqwrffF5ACHOh8j3U+QTE8pR7xYHkeUM1niRyXA5GVjlP
         z72G7VmrYo80fr5dVB7yQ0v7kLgxMliupLZQFLORswjMrQRf506z5KzZarXUzenYoCFJ
         P1V0LWN+4ki45ELkVgUdxnyJrt5ny+230vhFwOfbToIIicI2+kerJXr3jDjXbWkiQU0L
         bbUnvCnHkspkm3ol3klxjlczgJRfBw6wE+yajfLmLslKmauV/W4Uv/iTQE/moN9sbIRt
         V3Nk+zmwMYcS9f7TIPswOUBEC431dmSOvjN4496DETD5Dhcw5/ecGBus6o30Al5qUKCk
         PeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/HZTPpUPSoZO1hQYWfHk+1kE4VXCBxNHlEBuFv1b85I=;
        b=DXCkGjSC3z7TFVK82GQn9IAHSy/uJKOxTOe0Z9Dey4dUe6HAo8GIXC8Olh1GAAVp/N
         ji9l6F5VKfDlAdnrYAVGRP7lTnepu28nlPncnXEz2Q0MZHYLOxhcpv3FiAWYviscp9Y9
         NVf0xiU+UAOnQoj45Mlmh+hQYvYOanyam95gxWvVOYl3f3XQmMeUuZBE0nVKdaIV7e8K
         tB5WA3TDoT4+mg+zGqv1kOG0jN7qGZQcjgF6a4iSmoFerAqoFj4ilvMHseRAk8IL07h0
         mpmklSUvKuIMWrQLyWZCfjcEkr0WbPR9Y1/FIU65L5BylW1CuHqstpeJ/SnWR0iT+gqe
         eBDQ==
X-Gm-Message-State: APjAAAU2Qn1MwYYiEwFJzVn9ihCtgDOLSP2R1YW1aOTzZiH7jGDjK3Ls
        GYSQgU5KRJJjbDnHxr6vbAFQQkb/yGY=
X-Google-Smtp-Source: APXvYqzoFHDlaGjR1sPC3XN4Ogv7WAQJfDSDQ0MG3baJB9i5f9aRhiAFYW0ryUK/gMgp5y+GLGw7xw==
X-Received: by 2002:ac2:5468:: with SMTP id e8mr24391902lfn.2.1565767234502;
        Wed, 14 Aug 2019 00:20:34 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h10sm20027512lfp.33.2019.08.14.00.20.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 00:20:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Include the right header
Date:   Wed, 14 Aug 2019 09:20:32 +0200
Message-Id: <20190814072032.5876-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a GPIO driver, use the appropriate header
<linux/gpio/driver.h> rather than the legacy <linux/gpio.h>
header.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Geert tell me how you want me to handle this, you can send
it with your pull requests or I can apply it directly
if you're not queueing stuff right now.
---
 drivers/pinctrl/sh-pfc/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index 64c09aa374ae..5a55b8da7919 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -7,7 +7,7 @@
  */
 
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
-- 
2.21.0

