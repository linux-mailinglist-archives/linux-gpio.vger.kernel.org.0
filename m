Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6321A5304
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2020 19:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgDKREF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Apr 2020 13:04:05 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44206 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgDKREF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Apr 2020 13:04:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id c15so5581050wro.11;
        Sat, 11 Apr 2020 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hn0sT3llx8dpfWYLFXBaKS2N7KsXP2uNkFQw7JnlQ78=;
        b=vIHIAPgNSZBSqUHtWgWpknpwGthPyNqOLnQPEJLgduq5OPJYbigDsQ4DoqO81Vl2Iq
         6aZNwQTeAtQSg3PlhToI4e84NvRqpYD9RcQeqrBZ6yvUC4RMqMj2GuGBz4iJb8hMpJqV
         QrbRxjIHEOHmeCSgIggWktC/1vFbScQ8v1T4oiQmq95hqESTBLmeY88xebeMGwp6pNOL
         8z6i77rhvklK/AMHgPQgUD8JFLfJzA2znsoC594BZpVmAeHZwMZby6pccq4EMFM5Tmh1
         k9/60OxKUe5Lr2/PYi/65fj8jkpFCH6OAMDDD73QspPPqWMGYq7PdJNl9EIhts+lQd10
         d1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hn0sT3llx8dpfWYLFXBaKS2N7KsXP2uNkFQw7JnlQ78=;
        b=T3yTyZcCNO7F4i3tdQi0P35tBjlVsBDmz7CqHvu3g9+AkdcM8oqBF96XA0b5BcZI/n
         h4seGFDtErJUDNzVIk7tWSPxdLuNaeTJOZOuZp+YpLXuD3/mthS/lNKAYfKKXE/OP/8N
         p4qDkDZIMgkSq2ZK7ECs+CAkJ18UTBJsyLDbGsU5DX01FMFq2cj3s2oD+IF78wa2SpzH
         vBKSGTrX3sQpHNjV9Qn4lalO7FCWaf6D/FgoWAv8NE8XhQAnmZPpgGjveLmRH9Eyi6u9
         L9jmHSWv2FBe/rx1owhcH2YseV6H1gsNhVwu+y41g9aNnj4GpOBY0Iy/c9iL+zivmcaL
         szhw==
X-Gm-Message-State: AGi0PuajRxXsSF4KUuqWtXgiN/WsTnz3LeTokfXlwafebZGa7IdE66S+
        RetfXDPIzbKt7MFDmBC1DEgRan3Cb7M=
X-Google-Smtp-Source: APiQypKffhed79h64CgKowH7kOFGYoOVBE6NWJV8QjVqZV2b6YDMGzsVwnNQqJKbQtiDP1fe/aLApQ==
X-Received: by 2002:adf:a28e:: with SMTP id s14mr10524687wra.208.1586624643968;
        Sat, 11 Apr 2020 10:04:03 -0700 (PDT)
Received: from localhost.localdomain (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de. [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id x18sm7105067wmi.29.2020.04.11.10.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 10:04:03 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jbrunet@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 1/2] pinctrl: meson: implement the gpio_chip get_direction callback
Date:   Sat, 11 Apr 2020 19:03:55 +0200
Message-Id: <20200411170356.1578031-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com>
References: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com>
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
2.26.0

