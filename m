Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2121511FA77
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 19:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfLOSbm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 13:31:42 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42593 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfLOSbl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 13:31:41 -0500
Received: by mail-lj1-f195.google.com with SMTP id e28so4242779ljo.9;
        Sun, 15 Dec 2019 10:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PKh3AEiH5cNq1LZRWLK77CjDsirV0QFS3e0KYYZWwGE=;
        b=r+ODSpg1q7HyaHldIiEUcpn3IpVUFMP8vT52IXPicCaTfiSAmz19aO1tYSI0nedft3
         Db8lefvMiDzU6vhKQChxG+DyPjzAvaJnVRwuGsP3veLi6wocEHvhQuHKLO9drOkQEV6V
         jsvZuHxoWTTv7lL2ri7eIplo66cMuZnGxjR3uIRJImObPujfyRz2IQKyoajj4MUgSVq/
         e4p8FsDUsmuNIip4P8qrC6nqtmajP9hGJPccgHlLJCgd0jR2diJUseXwBwjAU3ZqiLIA
         W/InAhtqbeO9va0/RXPAJfvsvYVRQWxhpx5HC+8qM4u7tDpBeA3b5uNlJ+R2lW3VF29P
         dY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PKh3AEiH5cNq1LZRWLK77CjDsirV0QFS3e0KYYZWwGE=;
        b=sqxOgxaHcc2rVTRtXhKTUe0cMxbPAdygV9tz+tunR/nlvnTZvJ0oipG0iePmIJ9Agq
         MAKCv9Pg8aq1pgGn8RPI3xNhKZqpK/kPWYK+78SlHEvf7Fd1JWhDwc+S2vqTDfzldx4O
         uJbHa80H/szWV/8vEcdb+l/6SB1qnZ2sNnBr4isj7ILHPMgcspQtL0HnQ7DRw1qimZRW
         sEMhCqi+ThJGFSYhsMKkMoe3l0nES6hSzUd1ip+v4DHj+XB4i6XIxepxlGpeDjkslhbl
         ovI5busGuVbtRS01KXODd1Cnbheey9R++Y1xuyy8B/7VJ+umlse6RePx300wifpjDw9d
         ev7g==
X-Gm-Message-State: APjAAAWo3b9KMqkogD29Ga1rPPu9lelXTR3jXPHmZhn9Bw9Dm/cvsR4J
        b1YN7Xj8xWsmtF8mMITzEt+RdOOt
X-Google-Smtp-Source: APXvYqwhmwQ/qiTvRg66lREsz7P9Wx0VgwCd6UpJZi4Yp5C8JL0VR+XK5dj3RscJ1P+hJZ70rEgj5w==
X-Received: by 2002:a2e:b010:: with SMTP id y16mr17070084ljk.238.1576434698505;
        Sun, 15 Dec 2019 10:31:38 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id v2sm8814277ljv.70.2019.12.15.10.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 10:31:38 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] gpio: tegra: Properly handle irq_set_irq_wake() error
Date:   Sun, 15 Dec 2019 21:30:46 +0300
Message-Id: <20191215183047.9414-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Technically upstream interrupt controller may fail changing of GPIO's bank
wake-state and in this case the GPIO's wake-state shouldn't be changed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index f6a382fbd12d..4790dfec7758 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -497,6 +497,11 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
 	unsigned int gpio = d->hwirq;
 	u32 port, bit, mask;
+	int err;
+
+	err = irq_set_irq_wake(bank->irq, enable);
+	if (err)
+		return err;
 
 	port = GPIO_PORT(gpio);
 	bit = GPIO_BIT(gpio);
@@ -507,7 +512,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	else
 		bank->wake_enb[port] &= ~mask;
 
-	return irq_set_irq_wake(bank->irq, enable);
+	return 0;
 }
 #endif
 
-- 
2.24.0

