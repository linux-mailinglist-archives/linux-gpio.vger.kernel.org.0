Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D3234C18D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 04:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbhC2CAK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 22:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbhC2B7q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 21:59:46 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1716DC061764
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:59:46 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id y32so7292835pga.11
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=AfF0syJPa3AZ/E4+2g/B+WMyDbSM6G2J2QkIgg8nw3Q=;
        b=T01xgGlZn2BIwUsonZP5ixX/9LH8VPlr+gd5BDTNg0VMSdRtjDBE0JOwLw7igeBhko
         wo/cM4iJlRvGHPcYYFLkDpM2mTG0+87twKvt7f7L68H+yRD62jlWQz0ZNgNyYtYWSSQr
         BA8svNiCo0uY2Rnz8GKeTY24Ilt2icIb75h6AWPSvtD5nh+C1a/Uy8P5iYAXxog5e0KL
         tdFUjRHfkIOF/IKP/A2P7xA4LBTWPZJC+8jOTUdtHvslE8R7lkQIGDMoucaQ5+rp5VzT
         rbbzXdgF2AGjr3VCtT/3mxA6eyoDtcTs0u4Yk0mELcDT2BHKiCFn9ESQX+pUeUGUkti7
         ssFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AfF0syJPa3AZ/E4+2g/B+WMyDbSM6G2J2QkIgg8nw3Q=;
        b=tSvbOwkAIGFjGgPZwWVYvAARLtTD2ZOSqYavz4qsd6hrGZ/TqUT1ZeHsC/BFE8/O1J
         fITapKF1p4qkCJp23ch307r81Gsdpj0OC6mqmWl+It52hl2iibvbTbWzQT3XKJ1O/Cu6
         dhfR3x2PyojK9t/HVqlPwS29OU0MOd+gOReZ+iEF5MGp3Jm17xVXYrpxliRF3UUFy59/
         qrAEfWtMH+3FDHvXV6LP5PMqpii7ODnORMxva4xBgUJqRyQUbBKhp4E14IfX8WPUQcOB
         lueV3DTzoW6G8kKtVBurWL2f8q9/63JBLA3hlqA4POrDg2qmy3tErsRpoT9E35XDyRcf
         csgw==
X-Gm-Message-State: AOAM532qAv1sxUAXpUFdvduZDCSyXiRwhgqTPEjDxNitLnCbPGmaGa3b
        ZdbKFzKoeGsw7w+JhnFv3ZFcWw==
X-Google-Smtp-Source: ABdhPJwqvHlLi+PBJ/1vUPZIesu3HIRE3E2tVo/qHkMLNjVAZtT91oBjuqfdT4SzwP9uUl+pbfBhBA==
X-Received: by 2002:a62:cfc1:0:b029:200:1eed:462 with SMTP id b184-20020a62cfc10000b02902001eed0462mr23229810pfg.55.1616983185403;
        Sun, 28 Mar 2021 18:59:45 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id w37sm14728027pgl.13.2021.03.28.18.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 18:59:45 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] Support Pensando Elba SoC
Date:   Sun, 28 Mar 2021 18:59:25 -0700
Message-Id: <20210329015938.20316-1-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series enables support for Pensando Elba SoC based platforms.
The Elba SoC has the following features:

- Sixteen ARM64 A72 cores
- Dual DDR 4/5 memory controllers
- 32 lanes of PCIe Gen3/4 to the Host
- Network interfaces: Dual 200GE, Quad 100GE, 50GE, 25GE, 10GE and
  also a single 1GE management port.
- Storage/crypto offloads and 144 programmable P4 cores.
- QSPI and EMMC for SoC storage
- Two SPI interfaces for peripheral management
- I2C bus for platform management

See below for an overview of changes since v1.

== Patch overview ==

- 01    Fix typo, return code value and log message.
- 03    Remove else clause, intrinsic DW chip-select is never used.
- 08-11 Split out dts and bindings to sub-patches
- 10    Converted existing cadence-quadspi.txt to YAML schema
- 13    New driver should use <linux/gpio/driver.h>

Brad Larson (13):
  gpio: Add Elba SoC gpio driver for spi cs control
  spi: cadence-quadspi: Add QSPI support for Pensando Elba SoC
  spi: dw: Add support for Pensando Elba SoC SPI
  spidev: Add Pensando CPLD compatible
  mmc: sdhci-cadence: Add Pensando Elba SoC support
  arm64: Add config for Pensando SoC platforms
  arm64: dts: Add Pensando Elba SoC support
  dt-bindings: Add pensando vendor prefix
  dt-bindings: mmc: Add Pensando Elba SoC binding
  dt-bindings: spi: cadence-qspi: Add support for Pensando Elba SoC
  dt-bindings: gpio: Add Pensando Elba SoC support
  MAINTAINERS: Add entry for PENSANDO
  gpio: Use linux/gpio/driver.h

 .../bindings/gpio/pensando,elba-spics.yaml    |  50 +++
 .../devicetree/bindings/mmc/cdns,sdhci.yaml   |   1 +
 .../bindings/spi/cadence-quadspi.txt          |  68 ----
 .../bindings/spi/cadence-quadspi.yaml         | 153 +++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   9 +
 arch/arm64/Kconfig.platforms                  |   5 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/pensando/Makefile         |   6 +
 arch/arm64/boot/dts/pensando/elba-16core.dtsi | 170 ++++++++++
 .../boot/dts/pensando/elba-asic-common.dtsi   | 112 +++++++
 arch/arm64/boot/dts/pensando/elba-asic.dts    |   7 +
 .../boot/dts/pensando/elba-flash-parts.dtsi   |  78 +++++
 arch/arm64/boot/dts/pensando/elba.dtsi        | 310 ++++++++++++++++++
 drivers/gpio/Kconfig                          |   6 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-elba-spics.c                | 113 +++++++
 drivers/mmc/host/Kconfig                      |  15 +
 drivers/mmc/host/Makefile                     |   1 +
 drivers/mmc/host/sdhci-cadence-elba.c         | 137 ++++++++
 drivers/mmc/host/sdhci-cadence.c              |  81 +++--
 drivers/mmc/host/sdhci-cadence.h              |  68 ++++
 drivers/spi/spi-cadence-quadspi.c             |   9 +
 drivers/spi/spi-dw-mmio.c                     |  28 +-
 drivers/spi/spidev.c                          |   1 +
 25 files changed, 1321 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pensando,elba-spics.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/cadence-quadspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/cadence-quadspi.yaml
 create mode 100644 arch/arm64/boot/dts/pensando/Makefile
 create mode 100644 arch/arm64/boot/dts/pensando/elba-16core.dtsi
 create mode 100644 arch/arm64/boot/dts/pensando/elba-asic-common.dtsi
 create mode 100644 arch/arm64/boot/dts/pensando/elba-asic.dts
 create mode 100644 arch/arm64/boot/dts/pensando/elba-flash-parts.dtsi
 create mode 100644 arch/arm64/boot/dts/pensando/elba.dtsi
 create mode 100644 drivers/gpio/gpio-elba-spics.c
 create mode 100644 drivers/mmc/host/sdhci-cadence-elba.c
 create mode 100644 drivers/mmc/host/sdhci-cadence.h

-- 
2.17.1

