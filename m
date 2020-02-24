Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E9316A2DF
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 10:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgBXJmG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 04:42:06 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45486 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbgBXJmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2020 04:42:05 -0500
Received: by mail-wr1-f66.google.com with SMTP id g3so9497847wrs.12
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2020 01:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BDw9QNweqb8Crta/jUlU1isRq0T1j9Nt5ppyUp7U7FY=;
        b=L26uxfUsLo4EeQiOs+5bVkIce/bMLQNW5Vtw9VHZW2aU9Vao8LzNmUsFPwX8BezftQ
         MMSh8Pc7lHpx1HXSj1aAWjFqHy3jmYdK3S5UUW/c12PDui27zl5Uhk17ghpBhDpJoDb4
         LfDSVZ9mLJUJJiedxP7TKYGWJtTm1X7M1GRk0AAyWkGXqFnfnI6NqqT+m0Sn4FuQtIy0
         qH+smPMth3Wue1/bleFMlKbWtRZCWU1xN661hKylmYwBePU49c4A92W6oDdzT7VBlvqB
         ridJzWCbHOB3sJY+ZtO89r8gjhzjJz/MlJrqXFbdk1wTALGsy7i7sPMQzfZFF8QSLK4P
         Cpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BDw9QNweqb8Crta/jUlU1isRq0T1j9Nt5ppyUp7U7FY=;
        b=Rsz2zkSm1kAwoQf6W/tLFzN6ULQNrV8D5fs55k1yXsRZ0s349RsFDpkj78JxxY8x/3
         qzLJo3UR04r6hu1Lh1dxKTa5yqAr4HVFEo8kNWeotknfT46L5CX2sv/C2k1HZAJGfwbB
         953fCeKJlI1HeKt+lvxDnuBWLq/jhj9mBXJkDbDyNJZvpeJpY3wQiBL24U1V7QLsumf6
         y5Q9flsKTHSlBAG8VPQOaZUC7uVYlp8ymuMFWwC+/5Ls24IAQ1wcf7P1s1nWCuUwj4g+
         Sjg6enpFJLcqBapVCidiDDSqhMrXguloYc0lFAtz4o/Q7QoelroK3tntnP6Yw+jfUwHa
         EDHw==
X-Gm-Message-State: APjAAAU5eC96MXpjhdMnRgZQN9AoxqQwSaixvQqr8mnTL/052dHN4vj7
        A8Rl9L9mPPis3hIIPS0ejtxHYg==
X-Google-Smtp-Source: APXvYqwRsWCIn+gAgBdNY6yBK4Jnp2qIU7Kjr2E4c7OlOXGTYpWkjwokdTZ9bXKrry542I0OIXrWZA==
X-Received: by 2002:a5d:5044:: with SMTP id h4mr62492872wrt.4.1582537322303;
        Mon, 24 Feb 2020 01:42:02 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id t10sm16920730wmi.40.2020.02.24.01.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 01:42:01 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/3] gpiolib: add reference counting to GPIO descriptors
Date:   Mon, 24 Feb 2020 10:41:55 +0100
Message-Id: <20200224094158.28761-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This was: nvmem/gpio: fix resource management.

These are the remaining patches from the series aimed at fixing resource
management problems in nvmem.

The first one adds a new descriptor validation macro. The second uses kref to
add reference counting to GPIO descriptors. The last one fixes a potential
use-after-free problem in nvmem.

The last change should actually go into v5.6 but it depends on a new feature.
I'm not sure how to go about applying this.

Changes in patch 2/3 since the last submission:
- add a stub for when GPIOLIB is not selected
- use might_sleep() in gpiod_put() as we may not necessarily call gpiod_free()
  every time now (where it would have been called normally) depending on the
  reference count

Bartosz Golaszewski (3):
  gpiolib: provide VALIDATE_DESC_PTR() macro
  gpiolib: use kref in gpio_desc
  nvmem: increase the reference count of a gpio passed over config

 drivers/gpio/gpiolib.c        | 48 ++++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h        |  1 +
 drivers/nvmem/core.c          |  2 +-
 include/linux/gpio/consumer.h |  9 +++++++
 4 files changed, 55 insertions(+), 5 deletions(-)

-- 
2.25.0

