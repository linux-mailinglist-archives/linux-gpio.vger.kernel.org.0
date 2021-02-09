Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E5231502F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhBINcC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:32:02 -0500
Received: from forward106j.mail.yandex.net ([5.45.198.249]:49719 "EHLO
        forward106j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230346AbhBINcC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 08:32:02 -0500
Received: from iva4-b3068118e41e.qloud-c.yandex.net (iva4-b3068118e41e.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:14a6:0:640:b306:8118])
        by forward106j.mail.yandex.net (Yandex) with ESMTP id 3524211A0713;
        Tue,  9 Feb 2021 16:31:18 +0300 (MSK)
Received: from iva1-bc1861525829.qloud-c.yandex.net (iva1-bc1861525829.qloud-c.yandex.net [2a02:6b8:c0c:a0e:0:640:bc18:6152])
        by iva4-b3068118e41e.qloud-c.yandex.net (mxback/Yandex) with ESMTP id PNS8PLlIdI-VHJqWPpe;
        Tue, 09 Feb 2021 16:31:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612877478;
        bh=h62dzumydjyGMFzAtxrNLCwgnY4pRZXbw2h8Vuwc1bE=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=DDEb9p8iVVxaUyYRnBtWnGby0HpiT3ZUYZf1qAlHQwEMEt+G231A2KrigPoRu9P6s
         pP//hDuYnj/RKXjBUwr0KTgHLvRNG1e5IxzMzjmsF9Lj4D9MG1swc9Jn5Fvectt68O
         KN95jr70wIHxX71rHAXs3Q2kJvFoZeHIgZqivKtU=
Authentication-Results: iva4-b3068118e41e.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva1-bc1861525829.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id aJNFhJtpP6-VHoaf9wM;
        Tue, 09 Feb 2021 16:31:17 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/7] gpio: ep93xx: fixes series patch
Date:   Tue,  9 Feb 2021 16:31:03 +0300
Message-Id: <20210209133110.7383-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v2: 
https://lore.kernel.org/linux-gpio/20210127104617.1173-1-nikita.shubin@maquefel.me/

v3:
https://lore.kernel.org/linux-gpio/20210128122123.25341-1-nikita.shubin@maquefel.me/

v4:
https://lore.kernel.org/linux-gpio/20210205080507.16007-1-nikita.shubin@maquefel.me/

v5: 
https://lore.kernel.org/linux-gpio/20210208085954.30050-1-nikita.shubin@maquefel.me/

v5->v6 changes

[PATCH v6 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
Andy Shevchenko:
- add devm_kasprintf() return value check and move it out from
  ep93xx_init_irq_chip()
- removed ep93xx_gpio_irq_chip
- pass girq->chip instead of removed ep93xx_gpio_irq_chip to
  irq_set_chip_and_handler for port F

Tested all patches on ts7250 board.
