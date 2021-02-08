Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A34312CCF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhBHJIl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:08:41 -0500
Received: from forward106p.mail.yandex.net ([77.88.28.109]:36707 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231284AbhBHJAz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 04:00:55 -0500
Received: from iva3-2436f5349071.qloud-c.yandex.net (iva3-2436f5349071.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:498b:0:640:2436:f534])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id 11A821C828E7;
        Mon,  8 Feb 2021 12:00:01 +0300 (MSK)
Received: from iva5-057a0d1fbbd8.qloud-c.yandex.net (iva5-057a0d1fbbd8.qloud-c.yandex.net [2a02:6b8:c0c:7f1c:0:640:57a:d1f])
        by iva3-2436f5349071.qloud-c.yandex.net (mxback/Yandex) with ESMTP id plVk62kBPw-00Huw22K;
        Mon, 08 Feb 2021 12:00:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612774801;
        bh=QivlRSg2glO+ZbFgQYWUy3CpeN6FzJgloLpPwkNnnfo=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=hXIIODv/mxiUBe0yQ1xS955HJphKDOIh1cVfNGb3vqy5UMQTwCert+ZQB9HhEhjLQ
         h0gicTJsL1FgCqEZsTAg0ehIf6IyKM8cchpNTRwMkBFa/A+h2Te8/yCw/1m+3EyVax
         TUUXzhlMnVYBYHDme/Tf9ibNex+7d3TPockumeyg=
Authentication-Results: iva3-2436f5349071.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva5-057a0d1fbbd8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id N9nOuejTfy-xxJmJdUX;
        Mon, 08 Feb 2021 12:00:00 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] gpio: ep93xx: fixes series patch
Date:   Mon,  8 Feb 2021 11:59:47 +0300
Message-Id: <20210208085954.30050-1-nikita.shubin@maquefel.me>
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

v4->v5 changes

[PATCH v5 1/7] gpio: ep93xx: fix BUG_ON port F usage
Alexander Sverdlin:
- make to_ep93xx_gpio_irq_chip() static 

[PATCH v5 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
Alexander Sverdlin:
- generate IRQ chip's names dynamicaly from label

