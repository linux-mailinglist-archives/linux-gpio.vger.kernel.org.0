Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D25EE04AD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 15:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730290AbfJVNPg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 09:15:36 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42093 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730197AbfJVNPg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 09:15:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so8231258wrs.9
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2019 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8VmKVRe1oOg78SLsdQ2oRohTOyOGHxoX93iI9V9Ro08=;
        b=up0zG/OuEL5GStlj1LH+8rcrlXl6WPGyeZ6wPNyVWvU/Tq9Xp4zyBqFCCLu5wU5D72
         X98I2Bcw3Z0nl8e9rUlHvGzxJBTb7ukSzKTJ9JkfssYMOBNKVpdQs77n4vBPczEvT/Yn
         C7qR5PICIGgDy6q0JicmCKUpoDDE4V6iW1X0ByO4zY0c9zXQm5Gxyn8+dtryA9JZMFzy
         6oygUmyghJQvhSeD+P+yV288cQ+3JLe6NCDt0p+FU9f64zablJT7bS+mEbt+cqUAt1fX
         V6hDsT+dhJ30LMObzgKs/atTcJ91PspszS2Z1Qutgt+5rk6UMUawpUblWRZ3R88eSDyQ
         pbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8VmKVRe1oOg78SLsdQ2oRohTOyOGHxoX93iI9V9Ro08=;
        b=dNUrPXWFd8OomCk4LiGqIpdW/RUM1Sz62DgaF5EOX1WbQUpd62mpFkp6aEbMEAutt+
         BHkLsaMEpFzM9nL5vISlxquP87a98IEQylLx7EfJiaFODrdFotELW6xxm4y6AjvykYmF
         LvEPx7sE9DyQnFx4xQiSbZ9U/XxlarxsMUT32RH7Xd20nMR0n7lDNVef2Kqf+CcMd/jO
         ZnAzHL6GrLkibTOaxgDIuySejZzLHfxLk8qFdrAqLLTefD+0sdPkRLUnQjgQCPAv2R++
         i72C5GmMsrlRODyKxW0d+/SJs37grgT9ltUo7zuG0rQ6jOtANeKlR5NbCCs04rEqNQG/
         sLGQ==
X-Gm-Message-State: APjAAAW1beIbBHM28qtpfHyNzEdgr3sSAWgR3GF4DHoQDngiIvsoZyQ7
        l7VyFOXIg/WykerREhByQRrDFWcBHRI=
X-Google-Smtp-Source: APXvYqxIvN3dYoUZ8ZVWPEnqLgyYOCJw9WDGXmQW3q5fm/24y2+93AwigmKhXEJ1t42BL3y7H3z8cw==
X-Received: by 2002:adf:9b9d:: with SMTP id d29mr3521670wrc.293.1571750134058;
        Tue, 22 Oct 2019 06:15:34 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o19sm17325348wmh.27.2019.10.22.06.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 06:15:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.5 - part 1
Date:   Tue, 22 Oct 2019 15:15:31 +0200
Message-Id: <20191022131531.16339-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

here is the first batch of changes for v5.5 gather since the merge window.

Please pull.

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.5-updates-for-linus-part-1

for you to fetch changes up to 228fc01040704f55fd884ab41daf3eafd2644b54:

  gpio: of: don't warn if ignored GPIO flag matches the behavior (2019-10-18 14:24:17 +0200)

----------------------------------------------------------------
gpio updates for v5.5

- only get the second IRQ when there is more than one IRQ in mxc
- move the code around in lineevent_create() for some shrinkage
- fix formatting for GPIO docs
- add DT binding for r8a774b1
- convert drivers that prevously used nocache ioremap() to using regular
  devm_platform_ioremap_resource()
- remove some redundant error messages
- shrink object code in 104-idi-48e
- drop an unneeded warning from gpiolib-of

----------------------------------------------------------------
Anson Huang (1):
      gpio: mxc: Only get the second IRQ when there is more than one IRQ

Bartosz Golaszewski (7):
      gpiolib: sanitize flags before allocating memory in lineevent_create()
      gpio: xgene: remove redundant error message
      gpio: xgene: use devm_platform_ioremap_resource()
      gpio: em: use devm_platform_ioremap_resource()
      gpio: ath79: use devm_platform_ioremap_resource()
      gpio: htc-egpio: use devm_platform_ioremap_resource()
      gpio: htc-egpio: remove redundant error message

Biju Das (1):
      dt-bindings: gpio: rcar: Add DT binding for r8a774b1

Colin Ian King (1):
      gpio: 104-idi-48e: make array register_offset static, makes object smaller

Jonathan Neuschäfer (1):
      Documentation: gpio: driver: Format code blocks properly

Lucas Stach (1):
      gpio: of: don't warn if ignored GPIO flag matches the behavior

 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |  1 +
 Documentation/driver-api/gpio/driver.rst           |  4 +++
 drivers/gpio/gpio-104-idi-48.c                     |  2 +-
 drivers/gpio/gpio-ath79.c                          | 10 ++----
 drivers/gpio/gpio-em.c                             | 20 +++++------
 drivers/gpio/gpio-htc-egpio.c                      | 37 +++++++------------
 drivers/gpio/gpio-mxc.c                            | 13 +++++--
 drivers/gpio/gpio-xgene.c                          | 27 ++++----------
 drivers/gpio/gpiolib-of.c                          |  6 ++--
 drivers/gpio/gpiolib.c                             | 42 ++++++++++------------
 10 files changed, 68 insertions(+), 94 deletions(-)
