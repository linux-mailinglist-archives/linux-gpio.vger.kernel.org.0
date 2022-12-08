Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7D6D6475B3
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Dec 2022 19:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbiLHSlS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Dec 2022 13:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiLHSlR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2022 13:41:17 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786B684241
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 10:41:16 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u12so2671222wrr.11
        for <linux-gpio@vger.kernel.org>; Thu, 08 Dec 2022 10:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7pbq7+rpaYIQ8cR3gMH/amJidSeybt6jlwzS86DlhDY=;
        b=4nrr8N6Ja8d4FL9eIVZnD7H3v0fTE5f4ZNIPk00w1eNd6OSSsJS5D7JJAThz54n/4p
         s5+7n35E74OUiTkQyI7tyVQB7mNyR7f52wwGH2V2aqk8Lvjch5XbisC0pR+jMQ7B1OFG
         27I1z009HdgkRlJlfL39Kw2xX8bVXJ+REGlbTwJsWkVGUP0PTxpTa9Dj9cQwGXNYa86T
         28ZmXbAuKWKGXDelhSzkqQ1gKKdezWyv961xzyIwwbpSu5KX07d8MQsuH46EscTC0vRx
         q2OM9I6h799/SaOtXIQGPHFZodwgiYVO/s/hmkUlET0Nd1PaDuKe0unmGBHxJf48gkga
         t4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pbq7+rpaYIQ8cR3gMH/amJidSeybt6jlwzS86DlhDY=;
        b=7LCy5Tru3f1QjFJBMgrdBYnrDEq6G6kpAUYBeQkO9MI27AWpjerNVGnmDhWtfLM/Dg
         Yp0cOa4Rzg4YmBE+JbFrx7X7hAJgN8Vyzf4TdLW2oMfRQwjso3AlCiRwf6ScLDVmO97r
         EQjtif9wJ+PNLl7N0ki/em8M44iSmGYNeYsPrX4JxBYA9zJE4iQvzRXQ5QLp00n//ywg
         rLmJbJrBmrspzMyaIKqw29FCGzFehO4CC33RedfSh+2vL+o8WyqZ572dX+h+957fqWvU
         R7JiEFydZYPe7+TSplcyaOa6F3nwb8wA/xYgwFFoTUWFDb7xQJzc3agUTQPhN90UO0ET
         iVeg==
X-Gm-Message-State: ANoB5pnhcE/xBQMYLN2hDVkTyxux2KqSiIXIaVyJF0u+TF2okEuq2i/R
        LPSpPZWJZ3lvpH6cFVFTSW4ZxJjhB+IMMNyY
X-Google-Smtp-Source: AA0mqf4uKpADED9U3uXT9PTeg7ggQcdp5KYsufGIgONvE3Zzbo8Ow3lW8LmrGRv5VyllEq+bf4Ewdg==
X-Received: by 2002:a5d:4086:0:b0:242:509a:ad42 with SMTP id o6-20020a5d4086000000b00242509aad42mr1977726wrp.36.1670524875029;
        Thu, 08 Dec 2022 10:41:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1fd:11b0:f877:1d6c])
        by smtp.gmail.com with ESMTPSA id i12-20020adffc0c000000b00241d21d4652sm22511361wrr.21.2022.12.08.10.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 10:41:14 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.1
Date:   Thu,  8 Dec 2022 19:41:10 +0100
Message-Id: <20221208184110.252270-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here's the last PR with fixes for this release from the GPIO subsystem.
This is the same PR as last week sans the character device changes and with
one more tiny resource leak fix.

Please pull,
Bartosz Golaszewski

The following changes since commit b7b275e60bcd5f89771e865a8239325f86d9927d:

  Linux 6.1-rc7 (2022-11-27 13:31:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.1

for you to fetch changes up to 63ff545af73f759d1bd04198af8ed8577fb739fc:

  gpio/rockchip: fix refcount leak in rockchip_gpiolib_register() (2022-12-06 10:10:46 +0100)

----------------------------------------------------------------
gpio fixes for v6.1

- fix a memory leak in gpiolib core
- fix reference leaks in gpio-amd8111 and gpio-rockchip

----------------------------------------------------------------
Wang Yufen (1):
      gpio/rockchip: fix refcount leak in rockchip_gpiolib_register()

Xiongfeng Wang (1):
      gpio: amd8111: Fix PCI device reference count leak

Zeng Heng (1):
      gpiolib: fix memory leak in gpiochip_setup_dev()

 drivers/gpio/gpio-amd8111.c  |  4 ++++
 drivers/gpio/gpio-rockchip.c |  1 +
 drivers/gpio/gpiolib.c       | 42 ++++++++++++++++++++++++++----------------
 3 files changed, 31 insertions(+), 16 deletions(-)
