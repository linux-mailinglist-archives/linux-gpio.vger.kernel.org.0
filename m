Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 757CE14EC80
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2020 13:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgAaM3h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Jan 2020 07:29:37 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36152 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728484AbgAaM3h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jan 2020 07:29:37 -0500
Received: by mail-pg1-f196.google.com with SMTP id k3so3381636pgc.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2020 04:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jQmDkq5w3M+sCehIaFg3N7w/ApO+t3y+nuuienB0hV4=;
        b=c7S3qKLeppPVlE96R5TL7s3q0DyUtMUfRJESMMiTIAU3zk7h1ts4gLM09t4IWVUFIr
         G2XybYZBqlV4SxTtnsP90WnCyBf3yak4ROD9vwkKQvvFVKlqZwAD1efPPsmlThKqbOeV
         y+tBHXd9wqUTHdy+WqBqNThsqdTPQP/Vc1Nq0ChFqD2ZADBK/rpcdTvEoBOsLAgJlNmP
         lEH7UOLSmcpLwWQ0luRJFtnf3DfzcVb4DH2KSf4/pW7V8D2e2M6cV5dXewZiXW1RmG8P
         UwFiuLqIGv3WkiQeh1ErxQsDInjAjUHPD9joQiF3STyCv9Q9O9I1ijzTjrzxTeclZgPo
         aHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jQmDkq5w3M+sCehIaFg3N7w/ApO+t3y+nuuienB0hV4=;
        b=bBKbyQ7VuLslksjuH2BHsr3Kx2E4AVOZXgy5HBQwXYYIT6Ewxb8grGQPdD5WNP8kgQ
         p35VbOGo2oLuOon13VGDz4AZktz+UtCN4bpYteyLKBu9QviUw5jybXQQA1qqFl6Oh7uB
         ljxbyfRzPbCOKFwRU6HSFr6chAXiyXIGkj3ywmNHLdk55vSye2l1M9bOiNGKaEQj0HBF
         SrNuMAikMSlp7yNW4L1hdWmbks3keglf4zzW78sq1oDk9umN0RyF5H+WOKqRTHczq7NS
         OVZiNjBoDaUPUGx2MkjE+odHSeVCzxhqEzY6eWm17EtPmAYT6QsuTgl0Q6Zl7sWXbQUf
         Qxvw==
X-Gm-Message-State: APjAAAWfGPYebQKHddLmUeN8Ifn6eYskoBUP6dgD8d4iPCbc76uLwF/T
        hCiqzm5QBpg884ziIlS+Pfn5fA==
X-Google-Smtp-Source: APXvYqxqQKwUAOu2jl1jAYPynYHz2nfiGvReRr51QZeyQGQETi8KjlMFvzbBF1S6pU3mL+eB684Kig==
X-Received: by 2002:a62:2a07:: with SMTP id q7mr10406916pfq.153.1580473775318;
        Fri, 31 Jan 2020 04:29:35 -0800 (PST)
Received: from localhost.localdomain (36-239-237-206.dynamic-ip.hinet.net. [36.239.237.206])
        by smtp.gmail.com with ESMTPSA id d14sm10551187pjz.12.2020.01.31.04.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 04:29:34 -0800 (PST)
From:   Axel Lin <axel.lin@ingics.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] gpio: wcd934x: Don't change gpio direction in wcd_gpio_set
Date:   Fri, 31 Jan 2020 20:29:17 +0800
Message-Id: <20200131122918.7127-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The .set callback should just set output value.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Srinivas,
I don't have this h/w to test, so please help to review and test the patchs.
Thanks,
Axel
 drivers/gpio/gpio-wcd934x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index 74913f2e5697..9d4ec8941b9b 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -66,7 +66,10 @@ static int wcd_gpio_get(struct gpio_chip *chip, unsigned int pin)
 
 static void wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 {
-	wcd_gpio_direction_output(chip, pin, val);
+	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+
+	regmap_update_bits(data->map, WCD_REG_VAL_CTL_OFFSET,
+			   WCD_PIN_MASK(pin), val ? WCD_PIN_MASK(pin) : 0);
 }
 
 static int wcd_gpio_probe(struct platform_device *pdev)
-- 
2.20.1

