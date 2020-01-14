Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CADD913A310
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 09:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgANIj3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 03:39:29 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38224 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgANIj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 03:39:29 -0500
Received: by mail-pl1-f194.google.com with SMTP id f20so4956218plj.5
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 00:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8JR9yEt6b0AGTafWTRmeS+cXJwQ1Uu9FXByOWzd3y04=;
        b=lQ9UyFB2f5gf50X+5NKcN2iWu107p1GVVEgDYNIDI+HDlqkJoDe+4P1qGo/xlJQtJc
         o6KfB4lATJ+G6IB/9fRxbLHcPou9LfD0WEtzdl9Zc5AJSsaw3BH22ZDsbyucoyTjMer+
         xbZImvaVzRDMIj6tiQesDpqpVZiTgVZu6auEvVHVXegWEscL2+mqqOzh4kGtPeAYrc6N
         yAm2wty5Q99/v8DEOpy+6AbZ26vUiWKRdI8ZWbTCObXae3rn7Qcc0eBFvb/vv0bi5Plk
         N5YxnkhDZ5pc3AKy69R+LV4uioxaZzxJYrhhC+XDCqZMQtP4MhmzSDRnP5xmqk1faBFu
         wz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8JR9yEt6b0AGTafWTRmeS+cXJwQ1Uu9FXByOWzd3y04=;
        b=CXelhYvnvPj9aRcK24+nsoRO4dDeQhCsz7RITEXrdwpSeIte4v1GiTDNiB0m6qXGEC
         NBhOStDzZ4/u/5b+Jz/0B6bACEEk8pxtYxEQRcGtZ1t20oRXGe1+pYOC6GGsJI4DYILp
         XyoWlgVC2TyCqa2oNKhgaWUfAsas3TQE95GtWv1bjGCx3VQUxdy5DkEUY1EE2VFF3GDj
         74vw5u8OZraXLYQeflZtxf2ksqUbyhLZb1BJ1XYXPu/AzK4PxphZmHzv+sK9Kk/SJ93y
         L1RAj188uSVloK2G1MEnupY6Ib6sAuizTFyQQb8we013NLhy5X3GZDtsVqlqIsCIx1pr
         mrEg==
X-Gm-Message-State: APjAAAVGvdTkAop/fc9O7Ble4c2KZGkhkoDIgdL7ymE3rvWD+e9KTP2R
        0eRAuwO9q83mPnCASHoABp4ha1rQy9c=
X-Google-Smtp-Source: APXvYqzzDSi8mFKDOqqozSHzVUcD0H93n2r8ItKRPMZ6vczZ3Z3n+iBC7xPVjiROB9sYC+hifTeCiw==
X-Received: by 2002:a17:902:ff05:: with SMTP id f5mr19256147plj.197.1578991168275;
        Tue, 14 Jan 2020 00:39:28 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id o16sm16284910pgl.58.2020.01.14.00.39.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 00:39:27 -0800 (PST)
From:   Kevin Hao <haokexin@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/4] Fix the regression for the thunderx gpio
Date:   Tue, 14 Jan 2020 16:28:17 +0800
Message-Id: <20200114082821.14015-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.14.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Since the commit a7fc89f9d5fc ("gpio: thunderx: Switch to
GPIOLIB_IRQCHIP"), the thunderx gpio doesn't work anymore. I noticed
that you have submitted a patch [1] to fix the " irq_domain_push_irq: -22"
error, but the kernel would panic after applying that fix because the hwirq
passed to the msi irqdomain is still not correct. It seems that we need
more codes to make the thunderx gpio work with the GPIOLIB_IRQCHIP. So I
would prefer to revert the commit a7fc89f9d5fc first to make the thunderx
gpio to work on the 5.4.x and 5.5 at least. We can then do more test for
GPIOLIB_IRQCHIP switching (which the patch 2 ~ 4 do) before merging
them.

[1] https://patchwork.ozlabs.org/patch/1210180/

Kevin Hao (4):
  Revert "gpio: thunderx: Switch to GPIOLIB_IRQCHIP"
  gpiolib: Add support for the irqdomain which doesn't use irq_fwspec as
    arg
  gpiolib: Add the support for the msi parent domain
  gpio: thunderx: Switch to GPIOLIB_IRQCHIP

 drivers/gpio/gpio-tegra186.c             | 13 ++++++--
 drivers/gpio/gpio-thunderx.c             | 36 +++++++++++++++++++---
 drivers/gpio/gpiolib.c                   | 51 ++++++++++++++++++++++----------
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c |  2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c |  2 +-
 include/linux/gpio/driver.h              | 21 +++++--------
 6 files changed, 87 insertions(+), 38 deletions(-)

-- 
2.14.4

