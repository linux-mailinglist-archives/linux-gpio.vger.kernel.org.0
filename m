Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF6F87BBF68
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 20:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbjJFS5n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 14:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbjJFS5k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 14:57:40 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5412FA6
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 11:57:37 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3296a998234so746767f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 11:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696618656; x=1697223456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5ujGhg/oWpMfh+EFmyYE/R6gmVaUYXCMy0MWwjtD4k=;
        b=Aj+Yl9cZ8V6jqIEJ5lQ4xHdIvx8Osazv8rUmyakjM9nC45/62OgIML9scil8uMpoGf
         8pdc9Erx9Znth6eNNNRjXLVO0WuuQ7QntlGp3J+Aro4YPEYeYPihek1t5vCc7qIv2J5U
         khleH6uD8oeMJE5x8gjvOI4QkkjFy55o/8i6lOe+GnwvwdnSODoLUw1BteB0Z4pOXa6k
         VRVbuqJsleVuqVNyxv2xul7MaetO+nNhMr7uJKhAz7lo0xBU9T38+eNMne7apyWl1ZJr
         p2IDs8CIfhzZa1j8o4fw1WHH5kYSX0MtEcQxqPj3EJD5ZF6dIaF0qhKX4McI4WPyYCzK
         LatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618656; x=1697223456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5ujGhg/oWpMfh+EFmyYE/R6gmVaUYXCMy0MWwjtD4k=;
        b=aPp2beWt0QhVxOeWimQVnrT/gyiDA686TeTOqJy+E7jPSI9S7kbiS44XM3JwxWL93z
         6p3wXtMayo2P6P+L1pIVb9zNBdp6732feRMwQEIg2bsWH/KFdfTC1nNsZTJ1xA1qn1yZ
         69Tbd0J8XcVK+NqJRe6m+UiB/8ywQ3uL6entHF/3WhhkhLQFrBKp2HglVrTcgVNQ8qJv
         cTXLgl71dPO/1jkTa3EwLjEVbu35xwUgzpnc2XBgxJKbzHILSJT5cf4bSLGY5dthICv9
         3fkVpt4GmvG+f15BUnd50ymfF3B99xS0sTVXXrq4jrp/KxYlJeie04yRlbhZNGEh2Ucv
         usRw==
X-Gm-Message-State: AOJu0YzazUFi25B5Q+Q0GCTJcn6PuUcjjGcS+p56HwITKfuiWWqlsuUr
        gyHVsVZq40fPaYGrJ9zoqwJAHA==
X-Google-Smtp-Source: AGHT+IHJ75LSX2vESlJBeft1GpfLzUS09dlvQHzl3mgsuDTtAZgtBWpajx1rtfb6MjH2Mb5kgKrx5A==
X-Received: by 2002:adf:e406:0:b0:31a:e6c2:7705 with SMTP id g6-20020adfe406000000b0031ae6c27705mr7996277wrm.50.1696618655676;
        Fri, 06 Oct 2023 11:57:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8160:8fdc:c61c:a0a6])
        by smtp.gmail.com with ESMTPSA id n20-20020adf8b14000000b003296b62d413sm1740890wra.82.2023.10.06.11.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:57:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.6-rc5
Date:   Fri,  6 Oct 2023 20:57:34 +0200
Message-Id: <20231006185734.39969-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull another round of driver one-liners from the GPIO subsystem
for the next RC.

Thanks,
Bartosz

The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

  Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.6-rc5

for you to fetch changes up to f9315f17bf778cb8079a29639419fcc8a41a3c84:

  gpio: aspeed: fix the GPIO number passed to pinctrl_gpio_set_config() (2023-10-05 08:41:56 +0200)

----------------------------------------------------------------
gpio fixes for v6.6-rc5

- disable pin control on MMP GPIOs in gpio-pxa
- fix the GPIO number passed to one of the pinctrl callbacks in gpio-aspeed

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: aspeed: fix the GPIO number passed to pinctrl_gpio_set_config()

Duje Mihanović (1):
      gpio: pxa: disable pinctrl calls for MMP_GPIO

 drivers/gpio/gpio-aspeed.c | 2 +-
 drivers/gpio/gpio-pxa.c    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
