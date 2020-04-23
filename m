Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4731B606D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 18:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbgDWQLI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 12:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728865AbgDWQLI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Apr 2020 12:11:08 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C5FC09B041
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 09:11:07 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g13so7496632wrb.8
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Oicma1MBgZbQF2akoDHcSsrFoGKdPLFNTqRTFU/b4M=;
        b=vrV0fdzsAdC6GW0Pge6WbvUWlL6vp0xmODmIHt/TTJUaZKWP8kcbwJdK+aNBrRGXgP
         7t5dGR7NEwzjKu+dw40owZRQ/UIrqnY9wFyI4pGbpEb5lI/xi1+coJ/zv60sa7H5DXoq
         rKvl+lMq2wUfJKnshl0tRNVP2c6b6gFKX/vdEfCwK+BNPFDy4iONwpyrSKpizwYRSC9B
         zfcN9Eu15TSHWhlL+e615WCuawFC8g56Xgjx7uiEjN5TlAK9Xevu20obO0QJXAHewed1
         s7Ps4mKKjF6YK3EcusfOaFRz5Ksm1KErFJHU0VjJDzqyIrCKEvDZbaf70pv3m4tTa4pm
         ggoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Oicma1MBgZbQF2akoDHcSsrFoGKdPLFNTqRTFU/b4M=;
        b=tyeS4mra5yuOmEQxiSfIkQtV8VvxRfo11rMifi81U6Of8C9DBaPlTvCDw89wbGNV57
         UE3RylGWrOw4qjMChuqGgUehy8QizVS0vbVCj8qNHQtMrFs6c1U+OiHtsTy050LUjSp2
         h5ULx7Y9BF5g9xCiZKSstOvl+0rICLcNW/QPzj19q7v6nFUD1QBduH96kfsNTMhDWSov
         ft8FxcUOeWKFL24fkG63lx/59mpz4jryqU+siB+6vGg7AhMXM37Ztjt+PV3MV7WCu/yM
         dZJSv3mQlukqUPA83uqSw6pKx22iVJ7uaIbwS47BPzzhrtbWfyv0inr+3s8L5Pk58FaN
         yfVw==
X-Gm-Message-State: AGi0PuYVZwLG0BxnU3SHIS2slWdMzfSlgJS0YKem09NnfJ4EGPgXymAA
        2ejZ+3ruF2JZzNepcKh4EMfnqg==
X-Google-Smtp-Source: APiQypLzqXV5Dc0IC07dcB9aBwRhf7IUbMoM+3IxhHkAIgWpyVJSDILhjphX8JKQBLZUxtnFwkS6Yg==
X-Received: by 2002:a5d:4005:: with SMTP id n5mr5673730wrp.242.1587658265881;
        Thu, 23 Apr 2020 09:11:05 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 33sm4535466wrp.5.2020.04.23.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 09:11:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.7-rc3
Date:   Thu, 23 Apr 2020 18:11:01 +0200
Message-Id: <20200423161101.15993-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.7-rc3

for you to fetch changes up to 6409d049ce28bef35e13dfb8699fc7ee27469ba1:

  gpiolib: don't call sleeping functions with a spinlock taken (2020-04-23 17:55:27 +0200)

----------------------------------------------------------------
gpio fixes for v5.7-rc3

- fix set_config in pca953x
- improve robustness of the new line watch/unwatch ioctl()
- fix a bug with caling a sleeping function with spinlock taken

----------------------------------------------------------------
Adam Ford (1):
      gpio: pca953x: Fix pca953x_gpio_set_config

Bartosz Golaszewski (2):
      gpiolib: improve the robustness of watch/unwatch ioctl()
      gpiolib: don't call sleeping functions with a spinlock taken

 drivers/gpio/gpio-pca953x.c |  2 +-
 drivers/gpio/gpiolib.c      | 29 ++++++++++++++++++++++++++---
 2 files changed, 27 insertions(+), 4 deletions(-)
