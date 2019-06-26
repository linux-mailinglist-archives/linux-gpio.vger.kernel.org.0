Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C121564C5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 10:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbfFZIoP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 04:44:15 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45120 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFZIoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 04:44:15 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so970983lfm.12
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SLIBh+4MeOX6wUrIInCjt/HbzpPX6JHV6NhcclCEZTI=;
        b=OwsEGB0pjtQFE/SvBONQLCejvBkNpt4cPrYH69cH5zav0dLbnapBPv3zDqyWCj8kNw
         UqS7sghR5dQ/+jEx2tkbW3hQ+EjCivswmgcsX24Xbfj+yauEc5ob/O/CpthJX8vRDqwU
         92HLHZhhN+G5/hPWKxzI9Qm0GaKUIyw2enCXGii2QvWS9dNF+8FZlf7w82OnKFZoU6n1
         kGoRtYbu7mvD8QLC0p4NvdHiWyI82EVo2VFZCzgpvEC4H3grAES3see4nfJnBO9KsXXD
         z5cutm/XH6Daf7XRremxLMSiJLwJzNLl4N29VAxybSac99JLwVU1vKjujUerKeJ7M0kt
         731A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SLIBh+4MeOX6wUrIInCjt/HbzpPX6JHV6NhcclCEZTI=;
        b=EoqwqRoiDslK0SgHMpHfoe1dpeebx0APfPraGlBmwfbqUoWMAi8wrHWHi2SRjm66TK
         h5CG4Ms8yAWTNXoQKcK+aLwcvbM0VzzY7vlX0Sn34ujxOkwIT1u31f7dq2RoliJCz5bj
         lqZ0YbBJXsg84M+Mw5rfbUjQGLRkH39OmXATpmq7rcIh9mCa+TVME/cqCPphaeDFSlHg
         EfGioKGE88DBK+WGC3HdiWRh5vG+W3HNanJQ/89vGy2iVkhraPgrnFtjUK3SNTt0bwoA
         lhBslqQeGh+82DfMAnYpj7i2FHnVRbFVp5qnVTAJqmO84LMdxGNpdwJ+YX8FQ6CLf2QT
         /ytA==
X-Gm-Message-State: APjAAAVG7nG58vNFXqJLolPNpT6pc3Pc7Qaj6WjkeTbHTeqpt9YoVSyr
        Dm65YuXTM2Jj7sDJM8IyGcttX3I8nI4=
X-Google-Smtp-Source: APXvYqzz/92zBThDreOsKpWnB6V04Fv6/cy89cfKK8Jc9WKk+VWLPDDq6S2C+uffuHHoeFplpSNmiA==
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr2044277lfm.120.1561538653168;
        Wed, 26 Jun 2019 01:44:13 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y5sm2683635ljj.5.2019.06.26.01.44.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 01:44:12 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 1/5] gpio: siox: Do not call gpiochip_remove() on errorpath
Date:   Wed, 26 Jun 2019 10:44:03 +0200
Message-Id: <20190626084407.27976-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiochip_remove() was called on the errorpath if
gpiochip_add() failed: this is wrong, if the chip failed
to add it is not there so it should not be removed.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-siox.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index fb4e318ab028..0b4450118865 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -243,17 +243,14 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	if (ret) {
 		dev_err(&sdevice->dev,
 			"Failed to register gpio chip (%d)\n", ret);
-		goto err_gpiochip;
+		return ret;
 	}
 
 	ret = gpiochip_irqchip_add(&ddata->gchip, &ddata->ichip,
 				   0, handle_level_irq, IRQ_TYPE_EDGE_RISING);
-	if (ret) {
+	if (ret)
 		dev_err(&sdevice->dev,
 			"Failed to register irq chip (%d)\n", ret);
-err_gpiochip:
-		gpiochip_remove(&ddata->gchip);
-	}
 
 	return ret;
 }
-- 
2.20.1

