Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 249A016A2E3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 10:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgBXJmP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 04:42:15 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37289 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbgBXJmI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2020 04:42:08 -0500
Received: by mail-wr1-f68.google.com with SMTP id l5so5277696wrx.4
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2020 01:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=se6uVwZcUyEVQTI7VQ6AKAp5xkuS44LPDYDciQyl3tk=;
        b=O82vNF3QqwU7p+lGPjsqdpw1i7j+XuJ8MZsNiIkmrG7MVC9u6AwMxE0cqfHxeJ+rdd
         tcWC1wkiKWJDfAZqgk95DzKAyoIFgwr1kzHjr5u8RkqPtvy1IyocArEV2vnsJV4U7w5m
         re/Aa8x8RbQ8VT+DL0O1KiEIlSQLSOY3CIr96Uj60GbBhlW6HdQd0iIPTu/927HieDNZ
         6B5Q3wdHpuHQfUgj3/wC2Oo/VMoNscNTnnCMDC3pWRrgHlnNfLhGe9SHbUY1KlxpSUUH
         QnRiMS2pdZps8WBFT+lVDK51CFuUpxlMnGoS12C6Svk9gHhTlSlTKlxpIEoWPSBFJkoq
         giQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=se6uVwZcUyEVQTI7VQ6AKAp5xkuS44LPDYDciQyl3tk=;
        b=gSg40LagCWMIFTs4GTD0PNHZBr+BqqhXHlADZqze935ruQhXOeH3s0NDeEAln67New
         GpJCdVRLoDGvFDKij5/lI+CcG8cGRY+d2hHOFWWEXzBtQXY0PmtSgqxmWfVmCypMZA4s
         xwhexvusKuAs7Sfdfqilxo+NpXITy/lnEY/Ux5ueyir1VndTZeD6XhLHYSVgSRSv0FR2
         NUhHcrbSz+bBUx2bJBzpFca5+yzbAHuHNLFLemA70XK603PJdoJ/ThIe40sCLwS9yGhA
         5mZ7kJco6kcsWGh2huXfLle4lUgsj7AqW1RAct0RmxuALrmICtQrx5QRpq9diDrz7i6v
         tfhw==
X-Gm-Message-State: APjAAAWrn4GSkpWa7bF1qUTvG07L/QhyOzI9+QWnKZbk61OyHj/m1Lpr
        15ty7hsFWQW+IXy2a66FOoYAjih1z5c=
X-Google-Smtp-Source: APXvYqxf12lBuwbXbSZ26h3BV1csXjjbVp20n2b9sVxPONCeVBJmqOfyMt8VnTEoh4PD570ZbZhhBw==
X-Received: by 2002:adf:e683:: with SMTP id r3mr69472357wrm.38.1582537325948;
        Mon, 24 Feb 2020 01:42:05 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id t10sm16920730wmi.40.2020.02.24.01.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 01:42:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/3] nvmem: increase the reference count of a gpio passed over config
Date:   Mon, 24 Feb 2020 10:41:58 +0100
Message-Id: <20200224094158.28761-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224094158.28761-1-brgl@bgdev.pl>
References: <20200224094158.28761-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We can obtain the write-protect GPIO in nvmem_register() by requesting
it ourselves or by storing the gpio_desc passed in nvmem_config. In the
latter case we need to increase the reference count so that it gets
freed correctly.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index c05c4f4a7b9e..790ec9b5552e 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -350,7 +350,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	}
 
 	if (config->wp_gpio)
-		nvmem->wp_gpio = config->wp_gpio;
+		nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
 	else
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
-- 
2.25.0

