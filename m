Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B75E1495F1
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jan 2020 14:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgAYNcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jan 2020 08:32:17 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40425 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgAYNcR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jan 2020 08:32:17 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so5398335wrn.7
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jan 2020 05:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lz2dpU6mYSfS4dEPviWw9jfY12Vf5qGVsYVrw5nE384=;
        b=DENsxFnA98JOA/R2tKXK66mbu87yiyxrRfe8pFKzkOY0CiipvSHxfFga6nJZVKwDU+
         OOsX9uP16UM5ivt2yQKA6LkcxPlr9tZYqEopW0CepYdN06WgJlr0jIqYIe8CY6DXWCUM
         k825gaggjRIO2nS4BW/DV8V9EaVL8Td8Wc9Cfm/1l0vyj9U5j26m9S1ZY5iW5t8PNhGK
         Sh+dwPhDjwLm9oRCqEb33dtWxxcb59UFveHYBPanRpfug2PZTUaQ5Cpt7hIEqvaHYoDT
         MD3/WeNMM5htZG3Xe+0f7N262PYV9/E/ZH4adQqh5stRDFHXMEuNx6o494AguvTHM33/
         v5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lz2dpU6mYSfS4dEPviWw9jfY12Vf5qGVsYVrw5nE384=;
        b=pY8KY/R+JNUueQZYf+F2/C+KSmXbA9UY7pTGICNpWQv4pjUBG0fzdlvJiUmZOVZK95
         emrJYn51DewhgdvmgtXCQgS/LZagkOEjhWVoSp8IVk4KZ7oKxjcrCNSk1ALviBfeUAkw
         xQ4Zg55H9cnRLh4AEaARSewiVRQrtMuK+seu/9sN3XIfMB/s9+b/7L+r8tikR7pV/0iV
         /AoBslcKAlyopliat6m5JH0+e8bQ75JgqEtsEQX1Sg5Yp8ZnpG9EQKjy6DTM5f5El/Ff
         w1BEdpjT8a9FRP4gHfD4hJhxBXkAN+xqKfg9xy0KUN6D94z2fLx3tIG81xpLeEfXDLLr
         PFKw==
X-Gm-Message-State: APjAAAXh4vpjjUZqJ5ZX98ITxxZPxiz4LyzGQCpv7geV8BnS13TtckKR
        hd4GfLiHeoM5fnLEVEnKWrtoVQ==
X-Google-Smtp-Source: APXvYqwjvpzZp4aY9kaSaPFj4LxCx61HG3EBgpiH7CcbpEB3/X6I10siymoqlJHIGFDAktGVbmgX5A==
X-Received: by 2002:adf:f606:: with SMTP id t6mr10070257wrp.85.1579959135302;
        Sat, 25 Jan 2020 05:32:15 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id c5sm11167672wmb.9.2020.01.25.05.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2020 05:32:14 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.6 part 2
Date:   Sat, 25 Jan 2020 14:32:12 +0100
Message-Id: <20200125133212.4105-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

I was about to send you this patch together with the new uAPI patches
but it turned out they were not ready yet. I'm not sure anymore if I'll
try to push them for v5.6 - I need to take another look. In the meantime
I send out a v6 of the series.

Please pull this single patch so that it doesn't miss the merge window.
This is unrelated to the uAPI changes.

The following changes since commit 2a2cabd8bc1715ceceb9d9566055f4a0a8ff749a:

  gpiolib: use gpiochip_get_desc() in gpio_ioctl() (2020-01-07 12:03:28 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v5.6-part2

for you to fetch changes up to 1e4d149e901769fcde71be039227d184c6e4fda9:

  gpio: altera: change to platform_get_irq_optional to avoid false-positive error (2020-01-09 10:35:05 +0100)

----------------------------------------------------------------
gpio: updates for v5.6

- use platform_get_irq_optional() in gpio-altera

----------------------------------------------------------------
Ooi, Joyce (1):
      gpio: altera: change to platform_get_irq_optional to avoid false-positive error

 drivers/gpio/gpio-altera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
