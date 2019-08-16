Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F998FF2C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2019 11:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfHPJir (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Aug 2019 05:38:47 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37567 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbfHPJir (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2019 05:38:47 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so2090381pgp.4
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2019 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wvZCB2AqwQT6L1Xk5NrMqLDc2Y/wNMj0vd4lQmqKBE=;
        b=1ZBnc38S0YKhbRHhv5aqARfq3jBTbDRbpVAZZzyvteiEsJmaOz0au9gq/gpQUkjr8E
         cS+vvsnt8b86RkiV5oCOCpuLX5qseEoIFNatrErqU4esHomRvTJC9+jmhRjO6lj9zn8f
         Q4uFDr/jXkalQYySHdX2zE612k93JjpsNYJJWsTYK54IbFDWdG02oSu93TZBhzufyTGi
         70QPcBoeseKnYV5n4600jIyfdmuX2ELWAdIlaoe72e01UYuefONms5EmaJECGrzRNZDi
         Kk8iebNsCuVgwj+UENRqMuVbUdbBTwUpYbP/5h3ymXCzwKTwV+F02faI2/n3Z7N4jbdp
         3IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wvZCB2AqwQT6L1Xk5NrMqLDc2Y/wNMj0vd4lQmqKBE=;
        b=KQqAmeGKVnCDkroGx7wyIKPfXzpN7TAqIKGVLrOghPhZzUMBzGNfrhOGigM1pNxW0E
         42S+jaCo4jB4jYMtZV/EGf8iqdblJrLpkoOpv7G3uOzmEiJU+pgHqXY0jk5O9TPzUYzI
         BUVjwg8NK8DAjTMU9ylJaYgbumTA28pJpR/oKBUdpj+qHgoy+RkKO0mhoDYOK74M9bdV
         hs2r/vx2kL/lS9QSXU78O7kkcUP89Hcfl1AEGdJK7IjMS0cijVJCptbnu17NBLsl9U/y
         +VqPuI5ib5NGJa8Vk6CzwyL3TPWXJcha0mmyjvCrlNOgiNGrTFo/onJRq5fxb/8MvhRl
         2DSg==
X-Gm-Message-State: APjAAAWUYQ3SAYt8+U5sUA/orgKbTeo+tNxg89YrORhJM/SfXUBVdAEI
        vy9/tkuQe3/q6mBkXkB8qXxIkiKm3uo=
X-Google-Smtp-Source: APXvYqyfRXZANkuoN4sJBk9Vh/hrwQ5aLVTN7zB0Q/x/yFrR8ZhQoQnTRAXnyfRGiw6deL6bPBXueA==
X-Received: by 2002:a63:f907:: with SMTP id h7mr698218pgi.418.1565948326028;
        Fri, 16 Aug 2019 02:38:46 -0700 (PDT)
Received: from localhost.localdomain (59-127-47-126.HINET-IP.hinet.net. [59.127.47.126])
        by smtp.gmail.com with ESMTPSA id fa14sm3851924pjb.12.2019.08.16.02.38.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 16 Aug 2019 02:38:45 -0700 (PDT)
From:   Chris Chiu <chiu@endlessm.com>
To:     mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessm.com
Subject: [PATCH] pinctrl: intel: remap the pin number to gpio offset for irq enabled pin
Date:   Fri, 16 Aug 2019 17:38:38 +0800
Message-Id: <20190816093838.81461-1-chiu@endlessm.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Asus X571GT, GPIO 297 is configured as an interrupt and serves
for the touchpad. The touchpad will report input events much less
than expected after S3 suspend/resume, which results in extremely
slow cursor movement. However, the number of interrupts observed
from /proc/interrupts increases much more than expected even no
touching touchpad.

This is due to the value of PADCFG0 of PIN 225 for the interrupt
has been changed from 0x80800102 to 0x80100102. The GPIROUTIOXAPIC
is toggled on which results in the spurious interrupts. The PADCFG0
of PIN 225 is expected to be saved during suspend, but the 297 is
saved instead because the gpiochip_line_is_irq() expect the GPIO
offset but what's really passed to it is PIN number. In this case,
the /sys/kernel/debug/pinctrl/INT3450:00/gpio-ranges shows

288: INT3450:00 GPIOS [436 - 459] PINS [216 - 239]

So gpiochip_line_is_irq() returns true for GPIO offset 297, the
suspend routine spuriously saves the content for PIN 297 which
we expect to save for PIN 225.

This commit maps the PIN number to GPIO offset first in the
intel_pinctrl_should_save() to make sure the values for the
specific PINs can be correctly saved and then restored.

Signed-off-by: Chris Chiu <chiu@endlessm.com>

---
 drivers/pinctrl/intel/pinctrl-intel.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index a18d6eefe672..8d6a843bbc7e 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -796,6 +796,29 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
 	return -EINVAL;
 }
 
+/**
+ * intel_pin_to_gpio() - Translate from pin number to GPIO offset
+ * @pctrl: Pinctrl structure
+ * @pin: pin number
+ *
+ * Translate the pin number of pinctrl to GPIO offset
+ */
+static int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
+{
+	const struct intel_community *community;
+	const struct intel_padgroup *padgrp;
+
+	community = intel_get_community(pctrl, pin);
+	if (!community)
+		return -EINVAL;
+
+	padgrp = intel_community_get_padgroup(community, pin);
+	if (!padgrp)
+		return -EINVAL;
+
+	return pin - padgrp->base + padgrp->gpio_base;
+}
+
 static int intel_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
@@ -1443,7 +1466,8 @@ static bool intel_pinctrl_should_save(struct intel_pinctrl *pctrl, unsigned int
 	 * them alone.
 	 */
 	if (pd->mux_owner || pd->gpio_owner ||
-	    gpiochip_line_is_irq(&pctrl->chip, pin))
+	    gpiochip_line_is_irq(&pctrl->chip,
+				 intel_pin_to_gpio(pctrl, pin)))
 		return true;
 
 	return false;
-- 
2.22.1

