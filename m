Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD92F415A04
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 10:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239893AbhIWI2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 04:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239889AbhIWI2R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 04:28:17 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A39C061756
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 01:26:45 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id u18so14797808wrg.5
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JIHH2K/oKfCd+IwalkmMlifZv1RtkTKjfSBzx6j1QOY=;
        b=2wHT0olraHGog1MKCEg5DWw3cZZNADM7tPhcZVuFe6q70qeR/MFTtfh0z77Ej8CpPl
         HdYi1ZEvx5p31lOla71O37oyP4qSCIKmTN/gLmKIzkQYHAzKjPWDKU5UOHkoJ6TgT/W8
         1l5D2hTFUVsUnS3iJTeuTIDlXwFG7aPzrkyEsbBthueRoazX813aaWNO/+iZjR9+7Q4Q
         2wx0TKi6+3ndpdtayNPFv1nmk3Rbbwlxc/1XvO7mJfj8ZFwWgLj6+AzKbCqfMynVghhI
         R2/f/wNAOmaorgG9jl1J727m92C8H2YaVZ0MS/5mgBhe3gzkDcH+Ge2z6+PeUj2O8mCI
         wVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JIHH2K/oKfCd+IwalkmMlifZv1RtkTKjfSBzx6j1QOY=;
        b=NXPCnb8dOVrlW9q5xnMaQ0IciMTK2t77y4F1KLGP5AW25cXF0czpihaOHsKmZDIz1+
         E/5vxVqKXCpJIZw0uDyNxnDG+cJfl4i+BpY4EK2Kdkz9LSjCqYbQKBintWPfJuBnRgzQ
         CatoO4PJNhA1o/8iuGYYgvHjpcDbHWkGkeQpWTqiHBMCvrTpWYdwba+CTDNkzdcYqVaY
         /4ZQVLKz6NEcb5QhGNFSo9o+FFF/6D5T/gdN+MAnVBAnCNKCD1D2YOp6QEoDVG2eQuXw
         k0sRj8M6OuGOpU6ynQX8cw/QDfcdt+4bJGmErqhrtDxSkzjENYff6RYSzbIiSdggGluX
         /yBw==
X-Gm-Message-State: AOAM530S+UEor86+tsJhNFDQ5LH5dyUI5jMMlJTEnlzbaGFiviksv8rP
        FaWdo88yBq/eMPn1OGJL3WWULNy+pv7K0w==
X-Google-Smtp-Source: ABdhPJxj9m6aXmYPAeTiQhOlUCXV4r8Pd0w3SL6FmjjOPzBEpvrrMLrkOIDcttr52mZg5r/Xyv6reA==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr14647307wmc.105.1632385604420;
        Thu, 23 Sep 2021 01:26:44 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id c15sm4941524wrc.83.2021.09.23.01.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 01:26:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.15-rc3
Date:   Thu, 23 Sep 2021 10:26:41 +0200
Message-Id: <20210923082641.32745-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following set of fixes for the GPIO subsystem. Details are in
the signed tag.

Best Regards,
Bartosz Golaszewski

The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.15-rc3

for you to fetch changes up to b22a4705e2e60f342b1b851c9ebdb3ea02f21f8f:

  gpio/rockchip: fix get_direction value handling (2021-09-22 11:31:52 +0200)

----------------------------------------------------------------
gpio fixes for v5.15-rc3

- fix a regression in GPIO ACPI on HP ElitePad 1000 G2 where the
  gpio_set_debounce_timeout() now returns a fatal error if the specific
  debounce period is not supported by the driver instead of just emitting
  a warning
- fix return values of irq_mask/unmask() callbacks in gpio-uniphier
- fix hwirq calculation in gpio-aspeed-sgpio
- fix two issues in gpio-rockchip: only make the extended debounce support
  available for v2 and remove a redundant BIT() usage

----------------------------------------------------------------
Hans de Goede (1):
      gpiolib: acpi: Make set-debounce-timeout failures non fatal

Heiko Stuebner (2):
      gpio/rockchip: extended debounce support is only available on v2
      gpio/rockchip: fix get_direction value handling

Kunihiko Hayashi (1):
      gpio: uniphier: Fix void functions to remove return value

Steven Lee (1):
      gpio: gpio-aspeed-sgpio: Fix wrong hwirq in irq handler.

 drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
 drivers/gpio/gpio-rockchip.c     | 4 ++--
 drivers/gpio/gpio-uniphier.c     | 4 ++--
 drivers/gpio/gpiolib-acpi.c      | 6 ++++--
 4 files changed, 9 insertions(+), 7 deletions(-)
