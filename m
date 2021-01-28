Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D55F3075E9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 13:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhA1MXM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 07:23:12 -0500
Received: from forward105p.mail.yandex.net ([77.88.28.108]:47485 "EHLO
        forward105p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231508AbhA1MWY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Jan 2021 07:22:24 -0500
Received: from sas1-2c02ca35cfae.qloud-c.yandex.net (sas1-2c02ca35cfae.qloud-c.yandex.net [IPv6:2a02:6b8:c14:3992:0:640:2c02:ca35])
        by forward105p.mail.yandex.net (Yandex) with ESMTP id AF0554D41D0B;
        Thu, 28 Jan 2021 15:21:35 +0300 (MSK)
Received: from sas1-27140bb19246.qloud-c.yandex.net (sas1-27140bb19246.qloud-c.yandex.net [2a02:6b8:c08:1803:0:640:2714:bb1])
        by sas1-2c02ca35cfae.qloud-c.yandex.net (mxback/Yandex) with ESMTP id DOD2zEoBkr-LZGO4aYo;
        Thu, 28 Jan 2021 15:21:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611836495;
        bh=yxUd7GW+52WO9gCx62QYkoMSITctOlyet8SNAIkbEtU=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=HJZ/xqQLwdo10VJQKXQVa/T3kIhYUxoSgB7hWqarTvhxjD2yb0Fe/sp8mIp5r2oi7
         8xPfAANeUzFv6E9/YWFHIECNFTK+yVIzgfi1YoZLqLTPoh1kSLxaC0sWX4fH8n/WKe
         xapbkTMlt/NHZQFYjcfZ+tAgZmsU3437Ych8hA0k=
Authentication-Results: sas1-2c02ca35cfae.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-27140bb19246.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id dVFT85naok-LYn8A8ge;
        Thu, 28 Jan 2021 15:21:34 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] gpio: ep93xx: fixes series patch
Date:   Thu, 28 Jan 2021 15:21:16 +0300
Message-Id: <20210128122123.25341-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v2: 
https://lore.kernel.org/linux-gpio/20210127104617.1173-1-nikita.shubin@maquefel.me/

v2->v3 changes

[PATCH v3 1/7] gpio: ep93xx: fix BUG_ON port F usage
As suggested Andy Shevchenko dropped  most of commit message

[PATCH v3 2/7] gpio: ep93xx: Fix single irqchip with multi
 gpiochips
- Andy Shevchenko:
	- added coma
- Alexander Sverdlin:
	- changed to fixes commit d2b091961510

[PATCH v2 6/9] gpio: ep93xx: refactor ep93xx_gpio_add_bank
- Alexander Sverdlin:
	- use ->num_parents instead of ARRAY_SIZE()

Alexander - i think you are right about these two patches
they have no meaning currently, so i dropped them.

[PATCH v2 7/9] gpio: ep93xx: separate IRQ's setup
- Alexander Sverdlin:
	- drop patch entirely

[PATCH v2 9/9] gpio: ep93xx: replace bools with idx for IRQ ports
- Alexander Sverdlin:
	- drop patch entirely
