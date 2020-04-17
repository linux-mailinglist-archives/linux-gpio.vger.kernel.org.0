Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA061AE4D2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 20:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgDQSeO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 14:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728178AbgDQSeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 14:34:07 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8E4C061A10;
        Fri, 17 Apr 2020 11:34:07 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t63so2894296wmt.3;
        Fri, 17 Apr 2020 11:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pqjK23e5niBPyYYV4FBWCvjwk6bdtewgoJfg2lsAz+w=;
        b=rEeV+ZBGaELhRToq5R4e2zlgWdKG7o0amDt2cOMAbqdPzIyVqgZ1zkP0oCHXfMA1mj
         JXIXjCu6I5D6ek2KiQPv3jZofeYJw5IxUMQy4aC7sgdC52aVG8aRLFIAwc7DAccb362M
         E3/8jeIR8k3SiMsI9nJ602VLJ+ILgUSkLNi7bBrpr3sF6yY+iAk28l4zUg/Ry6f4T7k3
         j9kSBP5SJVhSrwEvKf7iAPZunSkCIriqiUYYHK02Yh2CA1qgaWdRRzK/zCym3VLHU2xS
         7PiQnv9hMrx+dagiP0qCYLgHZEBDKYTC2eWsV6MUgEPZ0Uu425ssz7I23c263DmB95X5
         li4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqjK23e5niBPyYYV4FBWCvjwk6bdtewgoJfg2lsAz+w=;
        b=PKUx2/4I8AgSijqaEe/QI5O3H/o3cJRASRSZ40MbxEnWMw188qrn+/m65ThG27xtYb
         lNwDjerZiKR2rAO7i2ifciwNJ5NsPzfMKqfpzATfCgm5GalXV79GM52Eyn8kuLzvA25i
         VJS3X//eeuZ+cG+InhW/1kj1m8K0Zqk4U/SnDjRwITXti/5jXFA8XU5T49smSqaN+8Hz
         1puU9vcPWqMFq67g9BViiQVZ09myZrqxfP+vE7rNWAc/GANaVueU50EOUuDDxArIDBwa
         ddWo0D4Io8txX4NJIYptTullV9Kjd0hrZeuHzIhLS5yMZ90zhB/yZU6L7vS++e+/ov/z
         YhAA==
X-Gm-Message-State: AGi0PuaETrJkcLvmQZJseuG9d9+FK2MNy2K4R5U0vI+v2JyqC0KrwYAX
        JbsZEC9sVxinYhqGMSGs+CE=
X-Google-Smtp-Source: APiQypJ87WyYs30OruOEhUmTBWEXm2nZ8TD62n93y+711ja1mQWeDwy84MwtmyD8NExGoy5BV5gD+A==
X-Received: by 2002:a1c:3c08:: with SMTP id j8mr4668608wma.30.1587148446067;
        Fri, 17 Apr 2020 11:34:06 -0700 (PDT)
Received: from localhost.localdomain (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de. [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id o7sm3074994wmh.46.2020.04.17.11.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 11:34:05 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jbrunet@baylibre.com, khilman@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RESEND v2 2/2] pinctrl: meson: wire up the gpio_chip's set_config callback
Date:   Fri, 17 Apr 2020 20:33:49 +0200
Message-Id: <20200417183349.1283092-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
References: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use gpiochip_generic_config for the gpio_chip's set_config callback so
GPIO flags like GPIO_PULL_UP or GPIO_PULL_DOWN can be used in the board
.dts descriptions.
This is required for some Meson8m2 boards where GPIO_BSD_EN provides the
"MUTE" signal and requires enabling the internal pull-up resistor.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 291f3078e7c7..079f8ee8d353 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -603,6 +603,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.parent = pc->dev;
 	pc->chip.request = gpiochip_generic_request;
 	pc->chip.free = gpiochip_generic_free;
+	pc->chip.set_config = gpiochip_generic_config;
 	pc->chip.get_direction = meson_gpio_get_direction;
 	pc->chip.direction_input = meson_gpio_direction_input;
 	pc->chip.direction_output = meson_gpio_direction_output;
-- 
2.26.1

