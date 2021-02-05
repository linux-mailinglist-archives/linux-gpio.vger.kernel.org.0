Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C6D310669
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 09:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbhBEINg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 03:13:36 -0500
Received: from forward101p.mail.yandex.net ([77.88.28.101]:38862 "EHLO
        forward101p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231400AbhBEIGL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 03:06:11 -0500
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward101p.mail.yandex.net (Yandex) with ESMTP id B8AE3328418D;
        Fri,  5 Feb 2021 11:05:14 +0300 (MSK)
Received: from vla1-166bfab327a3.qloud-c.yandex.net (vla1-166bfab327a3.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:3007:0:640:166b:fab3])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id B58503A2000B;
        Fri,  5 Feb 2021 11:05:14 +0300 (MSK)
Received: from vla1-1bc5b51c612f.qloud-c.yandex.net (vla1-1bc5b51c612f.qloud-c.yandex.net [2a02:6b8:c0d:89c:0:640:1bc5:b51c])
        by vla1-166bfab327a3.qloud-c.yandex.net (mxback/Yandex) with ESMTP id DcYEVzh11L-5EH0f0cn;
        Fri, 05 Feb 2021 11:05:14 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612512314;
        bh=On/41Mo9ITxdmci4KKWPotsE5mCAVCxPGLVZ7Fk3gVg=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=GF3DyDwctAlp+8ZmrPNBZIEnid+4jAdZqWHZa5khTYUOYlXAaC6SwULRfWznn6jSn
         cV1dAw5mZzlM3vUcay2ZGvv9fzeEfTAlBU1ayCH+QpQjqOajRAA/rCD6I4WL6YEQJa
         ovZSAQJQYKx3ZTCHZ7BtDxFgKGhE/wpXM2WsCRJ4=
Authentication-Results: vla1-166bfab327a3.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-1bc5b51c612f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 8MWdPhaokU-5Dn87YVS;
        Fri, 05 Feb 2021 11:05:13 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] gpio: ep93xx: fixes series patch
Date:   Fri,  5 Feb 2021 11:05:00 +0300
Message-Id: <20210205080507.16007-1-nikita.shubin@maquefel.me>
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

v3->v4 changes

[PATCH v4 1/7] gpio: ep93xx: fix BUG_ON port F usage
As suggested Alexander and Andy, drop confusing index conversion and embed 
all necessary IRQ data into struct ep93xx_gpio_irq_chip, this keeps indexes 
consistent and simplifies access.
