Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAC673B4EF
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 12:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbjFWKMQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 06:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjFWKMB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 06:12:01 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8F62699
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 03:10:16 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f9bff0a543so5955705e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 03:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687515015; x=1690107015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z45duKd8r9zuHh7uvKkf3z2YlrX0jycRC5IGNE/1IC4=;
        b=yZodZxFV/Mr0vV0IvYgK6s76rDyvnNNAeaESJa1GOwypJ1Butmdj+f7GR6B+dfnndL
         T4jhlzR7F8UaBVyrpV5n7WDFRGA/ySv/4ANOuxakgExpjdwNK+yMQdWSR3DPfk+WJXJp
         YYKIbxNb/p+yb37Hd13aRpq50d1DQoYIPt1a0WJ+b0YbmbAXicG7i2tqbawI4mWXD3SI
         mZI/KdaapDs0cAUsldPyqnzAbNOnxCscLnQrT5iTB7YhytKNbWzl0L9Mfd3mT5U5l6Is
         5xdhHzL6mNHXX+YUhbi7lboU9WRZISksjIzG5km8Ud1YROLUcue/IL1kgabiyzh1Kg77
         P0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687515015; x=1690107015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z45duKd8r9zuHh7uvKkf3z2YlrX0jycRC5IGNE/1IC4=;
        b=W5Q+KkjxcwKCQcm7kPeTRbHMMeS3GWn5WXR6EIjAfDSAbtvdGQAlW0ipUwesRnNoz+
         6EMpLC+WzWqRjh7tF5NB+K/egcAKCuIUoY80Q2AXpuXAuezjb2AvBLUMma1rS8GVROcV
         3Y4VcF+tF8wcEiq1kO45d2GWG/uNsUYMW911AmIUu94lK0NVWWgqXZA4sTrYNPIM56Se
         8A9dKSdedkxqE8yp5olHgEPJo+UEmM6b/5APM7Zn+7ZJOH/IpRWcOdVgciO7wF89VqZv
         pXbJGkQCUPlFNGU38+CwqOFrV+sHaEXNi4WPtEptP136W3hHkkhOcEMqMBlnXYgLC5Nm
         eI5A==
X-Gm-Message-State: AC+VfDyY8KlyiVF2cKcqmyQDjwRjjxVltKZSKgjtBImXy4DbOjlMgF2j
        LNyq+0txkZGUCJcuzGvxqW8osA==
X-Google-Smtp-Source: ACHHUZ6rB1MJ6Mrpr2bTQR+bW3iZPArnl4qK34PQuH4XKwW3IVuEY3ardiQsFIU1Xg0XY2FtWHTEEQ==
X-Received: by 2002:a1c:7212:0:b0:3f5:146a:c79d with SMTP id n18-20020a1c7212000000b003f5146ac79dmr17026162wmc.15.1687515015167;
        Fri, 23 Jun 2023 03:10:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id v15-20020a05600c214f00b003fa78d1055esm1907694wml.21.2023.06.23.03.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 03:10:14 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.4
Date:   Fri, 23 Jun 2023 12:10:12 +0200
Message-Id: <20230623101012.114200-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the final round of fixes for this release from the GPIO subsystem.

Thanks
Bartosz

The following changes since commit 858fd168a95c5b9669aac8db6c14a9aeab446375:

  Linux 6.4-rc6 (2023-06-11 14:35:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.4

for you to fetch changes up to ff7a1790fbf92f1bdd0966d3f0da3ea808ede876:

  gpiolib: Fix irq_domain resource tracking for gpiochip_irqchip_add_domain() (2023-06-19 14:57:38 +0200)

----------------------------------------------------------------
gpio fixes for v6.4

- fix IRQ initialization in gpiochip_irqchip_add_domain()
- add a missing return value check for platform_get_irq() in gpio-sifive
- don't free irq_domains which GPIOLIB does not manage

----------------------------------------------------------------
Jiasheng Jiang (1):
      gpio: sifive: add missing check for platform_get_irq

Jiawen Wu (1):
      gpiolib: Fix GPIO chip IRQ initialization restriction

Michael Walle (1):
      gpiolib: Fix irq_domain resource tracking for gpiochip_irqchip_add_domain()

 drivers/gpio/gpio-sifive.c  |  8 ++++++--
 drivers/gpio/gpiolib.c      | 11 ++++++++++-
 include/linux/gpio/driver.h |  8 ++++++++
 3 files changed, 24 insertions(+), 3 deletions(-)
