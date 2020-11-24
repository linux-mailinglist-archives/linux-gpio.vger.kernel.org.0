Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3562C2072
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 09:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730828AbgKXIxt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 03:53:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730519AbgKXIxt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 03:53:49 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E8EC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:53:48 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id a9so27779066lfh.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I2EmMJdusVtGBiOPmuBxSa/yxYa7w9wcih2XFbyqoVY=;
        b=rOzJh8nPd2bJlYYIp0tDoZzNyjPr5hO/eDo/Gh+AvBKrZrzR+183SDLWaAk0dJ7hFo
         1XXVL6v2oqETnYO5PN08RGGTgBuO62/uhT5dul1SzQyaLnhG5AsbPr39C0BFzdtZVjZU
         9BlFgQnPDjog6o3bsOyDz1jCv7tVFXBo6rH1r8DCcQpJ/U3C21DApr5nFtb5b4M8Gc2b
         dpgkzBgud5+0VcsQGQet0gxaydahKPy8LaKi+2Xe8yagBokZZGv3RCBdHInvPxvF2z1b
         62aWqiOofiyEpQ/mjm6RKZ4gjDe7KzVNLYKPOUAmSVp/v89TFY3z1M90E0s3+4Gymvyw
         SvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I2EmMJdusVtGBiOPmuBxSa/yxYa7w9wcih2XFbyqoVY=;
        b=lL8CPD6Qs61u1XFprSbFrJrrGjSVoJbyE+eQKdNqECTrSn8+U50eI6hmmeg2trx/oM
         q4NtjQ1dsgt2+jCdEA7dGof89buSJxRtyXwq7avI8jujqzt39umNtIp0cUcghQm4oLeg
         QQ45QTB/oA6qhIxSnd4pT/WAcTizLFm3A7ac/dG+LdFvGNdknHvhQvS4zEWfyzzKD0lP
         x/VKicQZ2i7yE5DljCKawcyl9fcMFaHcyAiFENSOFB5H6REvKO6kkWAjQnA+l0G8W40E
         w7ZRUuHA5xQS7yo54yaOZzHMclTOkDikcdGMo0pKv0ZjJW4eTB49Y3MDA2B7OPCRnkX+
         zMIg==
X-Gm-Message-State: AOAM533VlvFk1+3x3AmrF4glLhr7tFzyfu4XmjvYwBtC0ILHQ8GEk0R3
        mkvgxYj4yvoxY2JOghHWfLuaaA==
X-Google-Smtp-Source: ABdhPJxN36mZJwr2I4WhAVdmjPjYGdiZL3k+HSgPk49TyYEn2UM6QXQuYjWmX1ZrN+G7vHLl2JGrrQ==
X-Received: by 2002:a19:6914:: with SMTP id e20mr1171533lfc.506.1606208027340;
        Tue, 24 Nov 2020 00:53:47 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u18sm746602lfq.145.2020.11.24.00.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 00:53:46 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org,
        Darren Hart <dvhart@infradead.org>, x86@kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 1/3 v4] x86/platform/geode: Convert net5501 LED to GPIO machine descriptor
Date:   Tue, 24 Nov 2020 09:53:37 +0100
Message-Id: <20201124085339.6181-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the machine look up the LED from a GPIO machine
descriptor table. The Geode LEDs should be on the CS5535
companion chip.

Cc: linux-gpio@vger.kernel.org
Cc: Andres Salomon <dilinger@queued.net>
Cc: linux-geode@lists.infradead.org
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Cc: x86@kernel.org
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Cc x86@kernel.org
- Collect Hans' Review tag.
ChangeLog v2->v3:
- Rebase on v5.10-rc1
- Resend
ChangeLog v1->v2:
- Drop excess comma after terminator { }
- Collect Andy's Reviewed-by
---
 arch/x86/platform/geode/net5501.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
index 163e1b545517..558384acd777 100644
--- a/arch/x86/platform/geode/net5501.c
+++ b/arch/x86/platform/geode/net5501.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
 
 #include <asm/geode.h>
 
@@ -55,9 +56,7 @@ static struct platform_device net5501_buttons_dev = {
 static struct gpio_led net5501_leds[] = {
 	{
 		.name = "net5501:1",
-		.gpio = 6,
 		.default_trigger = "default-on",
-		.active_low = 0,
 	},
 };
 
@@ -66,6 +65,15 @@ static struct gpio_led_platform_data net5501_leds_data = {
 	.leds = net5501_leds,
 };
 
+static struct gpiod_lookup_table net5501_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		/* The Geode GPIOs should be on the CS5535 companion chip */
+		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static struct platform_device net5501_leds_dev = {
 	.name = "leds-gpio",
 	.id = -1,
@@ -80,6 +88,7 @@ static struct platform_device *net5501_devs[] __initdata = {
 static void __init register_net5501(void)
 {
 	/* Setup LED control through leds-gpio driver */
+	gpiod_add_lookup_table(&net5501_leds_gpio_table);
 	platform_add_devices(net5501_devs, ARRAY_SIZE(net5501_devs));
 }
 
-- 
2.26.2

