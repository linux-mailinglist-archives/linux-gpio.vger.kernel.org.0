Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F51448042
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 14:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239940AbhKHN1p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 08:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239938AbhKHN1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 08:27:45 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22ACC061714
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 05:25:00 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so11594011wmb.5
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 05:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lL2ZCAGuklL+cdNdCXmSU3JlVXVT4F4J0OffTPQBmg4=;
        b=LJOcCXnmM6RnAZaHq9PoVI9tppbezjrJtjI6thmzXMbWrwLP3N4yW6w6uIMw5JtM7a
         Jh2VKw4/v/VDjMB5RuGOh8obWK6Var6huI934Ql1HVYspwsgUx/NiTzSbfLsyI1KfGiM
         4qULoqjs3RSTE07uwjOBxt6Gfb+X7MjTimehKj8eiWkst75146Dl9YDaPkWQvl5RsMMo
         y8Sh9KnpvTWNppJBG5/qPpEb70wZouxOB1wjd+YiLAmijPY5QnX64342sJCq9rjspsgX
         96W5STRbj8FvLHvo4noUNasHGnljF3lhIwxNpHrL7rqJErkp4AqyrdAloK80mesiLSoz
         yr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lL2ZCAGuklL+cdNdCXmSU3JlVXVT4F4J0OffTPQBmg4=;
        b=yhk39zzZ9oHe9wzi842KY3JLeOAd7GbHG1d/6qqfEPhfLHiTno0IGzy654sEbLuoOF
         9yBA9m0+EbfKYsJFs8B6tE4fSyWqTWIZUPk1VJ5JsfccOdK6pdFmwaZecgNji/ECrP6F
         A3087zCoj+q2519mlidnOO8+TtvKHXnmhfeYg0C8eb/J/e9RMAjVLOUVNQZAkJ3OXdDH
         u6cTX0PyDDz44l5mkU5rAPjGyKBcoUbHk4FKaao6WDBHSawO7qtyACoCtjx4ZDLyZN+t
         51kvQYXyzBAQ60vu91hkFBjLub8yWiMpVUL8F6GmLEoyOuAZv7rH+sdU7LseGZP2vc1v
         0rYA==
X-Gm-Message-State: AOAM530J9CSeoJ4XCshvTwOgdp3O5nlLyWDX2//owX+hCw4fXmRhmmLd
        d93he2y0/6vZPpYwJobkJA4M6g==
X-Google-Smtp-Source: ABdhPJzOgWHuKIppcxJg3E9oZSkThnxStl5fVSJtApfi7bLUZZCbBKm+CFs751NPZCiv8SyCrVq/Qg==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr53237201wml.80.1636377899371;
        Mon, 08 Nov 2021 05:24:59 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id k37sm16634319wms.21.2021.11.08.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 05:24:59 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: updates for v5.16
Date:   Mon,  8 Nov 2021 14:24:56 +0100
Message-Id: <20211108132456.10033-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Here are this merge window's updates for the GPIO subsystem. We have a single
new driver, new features in others and some cleanups all over the place.
Nothing really stands out and the PR is relatively small.

There's a single patch for the networking subsystem (Acked by David Miller)
that depends on the GPIO changes and one other for the zynqmp firmware driver
similarly acked by the architecture maintainer - Michal Simek.

Details are in the signed tag.
Please pull.

Best Regards,
Bartosz Golaszewski

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.16

for you to fetch changes up to 7d0003da6297eb128f3490e396e6fc6df71557cd:

  virtio_gpio: drop packed attribute (2021-11-04 16:36:54 +0100)

----------------------------------------------------------------
gpio updates for v5.16

- new driver: gpio-modepin (plus relevant change in zynqmp firmware)
- add interrupt support to gpio-virtio
- enable the 'gpio-line-names' property in the DT bindings for gpio-rockchip
- use the subsystem helpers where applicable in gpio-uniphier instead of
  accessing IRQ structures directly
- code shrink in gpio-xilinx
- add interrupt to gpio-mlxbf2 (and include the removal of custom interrupt
  code from the mellanox ethernet driver)
- support multiple interrupts per bank in gpio-tegra186 (and force one interrupt
  per bank in older models)
- fix GPIO line IRQ offset calculation in gpio-realtek-otto
- drop unneeded MODULE_ALIAS expansions in multiple drivers
- code cleanup in gpio-aggregator
- minor improvements in gpio-max730x and gpio-mc33880
- Kconfig cleanups

----------------------------------------------------------------
Asmaa Mnebhi (2):
      gpio: mlxbf2: Introduce IRQ support
      net: mellanox: mlxbf_gige: Replace non-standard interrupt handling

Geert Uytterhoeven (1):
      gpio: aggregator: Wrap access to gpiochip_fwd.tmp[]

Johan Jonker (1):
      dt-bindings: gpio: add gpio-line-names to rockchip,gpio-bank.yaml

Krzysztof Kozlowski (2):
      gpio: max77620: drop unneeded MODULE_ALIAS
      gpio: tps65218: drop unneeded MODULE_ALIAS

Kunihiko Hayashi (2):
      gpio: uniphier: Use helper function to get IRQ hardware number
      gpio: uniphier: Use helper functions to get private data from IRQ data

Michael S. Tsirkin (1):
      virtio_gpio: drop packed attribute

Piyush Mehta (3):
      firmware: zynqmp: Add MMIO read and write support for PS_MODE pin
      dt-bindings: gpio: zynqmp: Add binding documentation for modepin
      gpio: modepin: Add driver support for modepin GPIO controller

Randy Dunlap (1):
      gpio: clean up Kconfig file

Sander Vanheule (1):
      gpio: realtek-otto: fix GPIO line IRQ offset

Thierry Reding (2):
      gpio: tegra186: Force one interrupt per bank
      gpio: tegra186: Support multiple interrupts per bank

Uwe Kleine-König (2):
      gpio: max730x: Make __max730x_remove() return void
      gpio: mc33880: Drop if with an always false condition

Viresh Kumar (1):
      gpio: virtio: Add IRQ support

Wolfram Sang (1):
      gpio: xilinx: simplify getting .driver_data

 .../bindings/gpio/rockchip,gpio-bank.yaml          |   2 +
 .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    |  43 +++
 drivers/firmware/xilinx/zynqmp.c                   |  46 ++++
 drivers/gpio/Kconfig                               | 123 +++++----
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-aggregator.c                     |  25 +-
 drivers/gpio/gpio-max7300.c                        |   4 +-
 drivers/gpio/gpio-max7301.c                        |   4 +-
 drivers/gpio/gpio-max730x.c                        |   6 +-
 drivers/gpio/gpio-max77620.c                       |   1 -
 drivers/gpio/gpio-mc33880.c                        |   2 -
 drivers/gpio/gpio-mlxbf2.c                         | 142 +++++++++-
 drivers/gpio/gpio-realtek-otto.c                   |   2 +-
 drivers/gpio/gpio-tegra186.c                       | 114 +++++++-
 drivers/gpio/gpio-tps65218.c                       |   1 -
 drivers/gpio/gpio-uniphier.c                       |  18 +-
 drivers/gpio/gpio-virtio.c                         | 302 ++++++++++++++++++++-
 drivers/gpio/gpio-xilinx.c                         |   6 +-
 drivers/gpio/gpio-zynqmp-modepin.c                 | 162 +++++++++++
 drivers/net/ethernet/mellanox/mlxbf_gige/Makefile  |   1 -
 .../net/ethernet/mellanox/mlxbf_gige/mlxbf_gige.h  |  12 -
 .../ethernet/mellanox/mlxbf_gige/mlxbf_gige_gpio.c | 212 ---------------
 .../ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c |  22 +-
 include/linux/firmware/xlnx-zynqmp.h               |  14 +
 include/linux/spi/max7301.h                        |   2 +-
 include/uapi/linux/virtio_gpio.h                   |  27 +-
 26 files changed, 943 insertions(+), 351 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
 create mode 100644 drivers/gpio/gpio-zynqmp-modepin.c
 delete mode 100644 drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_gpio.c
