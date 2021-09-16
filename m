Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DCE40E3B4
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 19:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbhIPQve (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 12:51:34 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58408
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245279AbhIPQsT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Sep 2021 12:48:19 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EA32D3F22C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631810817;
        bh=12aSWj1ztiQqgKWmd2hSEEbr16jSEW8EbSNL339apz0=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=Wnehpg/8OOtpW6cMsNrn3/uwOtPyADk+RNylD0ldTINDVFrgQfFBoBM5T0hOkVAw4
         UANAsDsNV/hNgIdhC+4d2GdRX/z6jz7LPBKWhpxDSQkD+dPMZsoCPdm1u4xlDtdGf8
         kc2WhWcgDDZ46v1QwGRy1nOV9eOdCZZBDrLLQV7M4p1ftRaZ2lXjm6nEEC6utsreyC
         OnupFK6V3jjDXGUAKjJaMYdIK5mq9gum6PrWrpd/XNvR0drYYzU2oKQ/OgdewsSHAP
         +5A9uF2mfLj3AxHVLu/OgwjsV/XTpfM+WeMcJssizAgEaEqMHlZIOKRf8S6LBVxlqF
         H5xW+BpGoqKSA==
Received: by mail-lf1-f69.google.com with SMTP id w18-20020ac25d520000b02903c5ff81b281so4445508lfd.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 09:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=12aSWj1ztiQqgKWmd2hSEEbr16jSEW8EbSNL339apz0=;
        b=d7d0J335MfNuZcDKE4WjxVF+DQUUzQoYcoct3FsAS1GaYAPDuk6ys/KqlQf+wydOAR
         P+D3t/ZkUoKyC6dbYhs0TslEd0mXlSkXP6xERzNyzotWCkRlA5//MJYeS1lzqWxMLrpM
         wP9P3Lb/eCQlbB5EsQ1RcWZtbjpx5qJkcDtKozdS/by3O50LIbHrmrWmiZ7vh4QM69fP
         MT8cElIkcAVIajKcnUKlK7HtwJwVGBJT3kiFD/6hbLr6gJ90IiQm9hKCKGYuv6HXDQrw
         5Nce8OZmM40ZrKCEEan+r8gVXALy7sBTWG1EGNWj504CSgHhQheiSK5sZcBhAKxZkwar
         SiAQ==
X-Gm-Message-State: AOAM5337VUw4ZvyvUISLZFEE7x2TSBW+uxItUbco2pGd3ry92m6Ybzdt
        ORyGjDTIxXmaK/hEUda1VsGztMjiOvAB3YtXtOlYcv8GLEPV2AmkkN6P9keRUxe6lc2F1KzukY4
        /deB70djTXpFZBWCc0oNTKO9NSA0/FMBYCnRh3xw=
X-Received: by 2002:a5d:4744:: with SMTP id o4mr7275319wrs.188.1631810806771;
        Thu, 16 Sep 2021 09:46:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw70yN5qCekMYA/rlQ8OzX3mdhQZ6OaZhSR5bUUc9V4g6B0MZyaLy/wh9mnnYQUZFT1U3yQGQ==
X-Received: by 2002:a5d:4744:: with SMTP id o4mr7275306wrs.188.1631810806585;
        Thu, 16 Sep 2021 09:46:46 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id o1sm3975340wru.91.2021.09.16.09.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:46:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] gpio: max77620: drop unneeded MODULE_ALIAS
Date:   Thu, 16 Sep 2021 18:46:40 +0200
Message-Id: <20210916164641.135008-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/gpio/gpio-max77620.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 82b3a913005d..ebf9dea6546b 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -365,5 +365,4 @@ module_platform_driver(max77620_gpio_driver);
 MODULE_DESCRIPTION("GPIO interface for MAX77620 and MAX20024 PMIC");
 MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
 MODULE_AUTHOR("Chaitanya Bandi <bandik@nvidia.com>");
-MODULE_ALIAS("platform:max77620-gpio");
 MODULE_LICENSE("GPL v2");
-- 
2.30.2

