Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FD91AE4CC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 20:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgDQSeI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 14:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728158AbgDQSeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 14:34:07 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F15BC061A0F;
        Fri, 17 Apr 2020 11:34:06 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id u13so4190744wrp.3;
        Fri, 17 Apr 2020 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bc/4pRlxC+D2ONP1rH1iDduXk9QWuQPhI7TtU7wZt5A=;
        b=XGX0WSH5u91Vm9+oAwQwPXioSYI72fUAscUYc1Ykbw8DGjTGQQm37imIPumogvw6Bv
         C0H7R7Hme4YRD655b+hVV5mYfW5qHWenUYbbJFHaTRAWtWksydEuJWzWsD0UU/jIVihB
         gmxbjYR0Ky7EOt9UAcvcuGmzlcLTZ8OvkJO2a6r8GXf+G1gdaumQIhGPaQm0kvfwdOog
         4XvsHGH5arT0hEEUZdg+MxYbyzquI0BxQWftDmB0y6OVYJAjbt2iPSlEZqZLso+9pyUS
         /O2nVDMxL5mjwqm1F62ucvLGLbZPtCd1wIXVq3SeKiRH90ChR3eypjiKngKoXUSCHMjN
         EJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bc/4pRlxC+D2ONP1rH1iDduXk9QWuQPhI7TtU7wZt5A=;
        b=eJMq5IB/YJ2MoMe+6IIqhGlmAedv+UZzwmKAnPPqI6fkDn3Xg6RY0IIlF7eLZxL+Qd
         kpm+UYmACIUJNOMVahKZ90wNQk1ZV6ph7YR2f/VjQoFEcelLgusTefdXWfb8Ug7eD3ud
         VSud9meDBhNX19Ya5bndWKSaK4SmZEk+bZjohykpMPeDDDMWNG0kUZLWaIN4Xr+3DywY
         xnG1k2dFdQNXGnn0RQzZVieuHloF6yy5n/w4JqwgDh3Nn1mJkkPqcx/4TpDYesp1a5t1
         xP19i7TrAVBXI/cujhm1Nn8ovpTcp0UWFLsqOjVJeqGIH74i28gsrmBXxDeb//hk2fjg
         HJ2Q==
X-Gm-Message-State: AGi0PubIyZPuZjDpApy10EDhr6jqxu7aC2w8OMWHZt0XVFwn56vZ+LAZ
        py8vGpURRpZa8FJ7o3n4P0E=
X-Google-Smtp-Source: APiQypJXKwAyXZE4BpbMeuBoaJhj5rZNgR7yJJgPmD6EnGtgcUKatnBXclheu+LM3LD+NmNCXZqjYw==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr4986564wrs.94.1587148444923;
        Fri, 17 Apr 2020 11:34:04 -0700 (PDT)
Received: from localhost.localdomain (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de. [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id o7sm3074994wmh.46.2020.04.17.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 11:34:04 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jbrunet@baylibre.com, khilman@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RESEND v2 1/2] pinctrl: meson: implement the gpio_chip get_direction callback
Date:   Fri, 17 Apr 2020 20:33:48 +0200
Message-Id: <20200417183349.1283092-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
References: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement the get_direction callback so we read the direction from the
actual GPIO controller register. This is recommended by the gpio_chip
kernel doc.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index bbc919bef2bf..291f3078e7c7 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -549,6 +549,18 @@ static const struct pinconf_ops meson_pinconf_ops = {
 	.is_generic		= true,
 };
 
+static int meson_gpio_get_direction(struct gpio_chip *chip, unsigned gpio)
+{
+	struct meson_pinctrl *pc = gpiochip_get_data(chip);
+	int ret;
+
+	ret = meson_pinconf_get_output(pc, gpio);
+	if (ret < 0)
+		return ret;
+
+	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
 	return meson_pinconf_set_output(gpiochip_get_data(chip), gpio, false);
@@ -591,6 +603,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.parent = pc->dev;
 	pc->chip.request = gpiochip_generic_request;
 	pc->chip.free = gpiochip_generic_free;
+	pc->chip.get_direction = meson_gpio_get_direction;
 	pc->chip.direction_input = meson_gpio_direction_input;
 	pc->chip.direction_output = meson_gpio_direction_output;
 	pc->chip.get = meson_gpio_get;
-- 
2.26.1

