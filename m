Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD7D1CEF25
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 10:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgELI3F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 04:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729242AbgELI3E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 04:29:04 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA90C061A0E
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 01:29:04 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id o14so11537776ljp.4
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yKjBrHMVrYH11njH9u5nD+okiu5q1SOdbCQwts/no00=;
        b=m+TbK+SZq+zPcB/7S4UMMKdG7yj1h8fj/nsg36jNwxcjebDpBPaO2Aa0Bq8kA69uLM
         63oV5O21HAJuCgAchgNuMmPC3hNa3RMLLE1sOEd8Dw49wRhENvrW6lqDWsY5BgIIXGzo
         F/LMFiFEL0qjnEPnnZjCYxabFo1TI5YDV04tgmglaC22X46owly1HwbO232aAeX6E8s3
         JSJnKe7kqt/UC2aFM3dTTjGJaBfSidGXxWZi8wTfTsqZJEHVXRAPDoC5md1q9driUmO2
         9l7/dZMC9uLOub23fVrqZwCHHB2lg1HAGF2zZbgMp1jCmG7zU0uVGEGNLHzlISGJRS60
         XV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yKjBrHMVrYH11njH9u5nD+okiu5q1SOdbCQwts/no00=;
        b=b7VdR86zY5NTCT9Nm0v4X78545l7xyuK6/kIcxkUs6FRTeuPzX3FHbfY6JRwy5yS/5
         GYhKme2DF6etipZK+gxgK0aaxijHuBPzr/CqJ6TZH1Lggg7OXfPEvENPL6boeniTV2u1
         UdpwQ+haJVI54L+gylpBZqSw/uTStVy6zHoRMdpUtiQF8gCNacvLeLlU3wcnFfb18iCm
         H7FOaMFSDxS6uS4iVA+sFOSvpZRatnwiagTkQbuAXB6yxZTHNjwhzP9VGnbvyZQ6EYMy
         tEH/iW9rv25DPtRhiWr2c1OiTCEsA6ECZNZwfr/xiQOzaj/RHrB9i8C1fywpd9B/pFp3
         +pxg==
X-Gm-Message-State: AOAM532/1S4oAh+ea8/1tr3pEy00hqIb0sNvke+ZYgI47bzTMmcN+pAY
        doZ0tkkb4HShsmXSspp5yYnyS43b4nJeCPNy/PRab7OcXKk=
X-Google-Smtp-Source: ABdhPJyN3Q0EKdr+y6yVrRivbVl+fbwgrsuJQCdxpprQWH9cmGf+3VhzPRFPlhf9aER7AtwepwLVT1CnNjV6YBOqzrM=
X-Received: by 2002:a2e:81d5:: with SMTP id s21mr12698843ljg.258.1589272142969;
 Tue, 12 May 2020 01:29:02 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 10:28:50 +0200
Message-ID: <CACRpkdafEGdhvn9kgBp7SAXw=JwqWRRoHu9CmytcWGeOYoixzQ@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for the v5.7 series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

some GPIO fixes for v5.7, slightly overdue. Been learning
MMUs and KASan that is why it's late. Bartosz helped me
out, luckily!

Details are in the signed tag, please pull it in!

Yours,
Linus Walleij

The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.7-2

for you to fetch changes up to 0cf253eed5d2bdf7bb3152457b38f39b012955f7:

  gpio: tegra: mask GPIO IRQs during IRQ shutdown (2020-04-28 16:22:33 +0200)

----------------------------------------------------------------
Some GPIO fixes for the v5.7 kernel:

- Fix pin configuration in the PCA953x driver.
- Ruggedize the watch/unwatch ioctl().
- Possible call to a sleeping function when holding a spinlock,
  avoid this.
- Fix UML builds with DT overlays.
- Mask Tegra GPIO IRQs during shutdown().

----------------------------------------------------------------
Adam Ford (1):
      gpio: pca953x: Fix pca953x_gpio_set_config

Bartosz Golaszewski (2):
      gpiolib: improve the robustness of watch/unwatch ioctl()
      gpiolib: don't call sleeping functions with a spinlock taken

David Gow (1):
      gpio: of: Build fails if CONFIG_OF_DYNAMIC enabled without CONFIG_OF_GPIO

Linus Walleij (1):
      Merge tag 'gpio-fixes-for-v5.7-rc3' of
git://git.kernel.org/.../brgl/linux into fixes

Stephen Warren (1):
      gpio: tegra: mask GPIO IRQs during IRQ shutdown

 drivers/gpio/gpio-pca953x.c |  2 +-
 drivers/gpio/gpio-tegra.c   |  1 +
 drivers/gpio/gpiolib.c      | 34 +++++++++++++++++++++++++++++-----
 3 files changed, 31 insertions(+), 6 deletions(-)
