Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E989C370ECC
	for <lists+linux-gpio@lfdr.de>; Sun,  2 May 2021 21:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbhEBTdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 May 2021 15:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhEBTdQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 May 2021 15:33:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90C6C06174A
        for <linux-gpio@vger.kernel.org>; Sun,  2 May 2021 12:32:22 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id h4so3367706wrt.12
        for <linux-gpio@vger.kernel.org>; Sun, 02 May 2021 12:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Er8/zvVZZcQ5ioo9PA1WDtngetyRVBToQdDjDe6uhN8=;
        b=vUxs63oHZSY/XJzqcvitR4xiYZMWdN3VFgkC18wT41XNqRuQF49k6cPxrJpShgLWdp
         eXaE+TnCJbYNVQL3RHD+9dhFVf1uH6Vv/5gmmzXEfHfeyyW0Pes3NgJ20S4y9dOLx5tu
         kVbYbf5XrlVd0xM58xFebRJau0P42G9hHM4CmhcJCQW5QhGFMDCVCO8u/Bfqx5qwMHt3
         l4bxIJ3nxL+jKjG4aYYoj7SgA1E98FxV9y4WiPnu8qLvbDtpNDY7JF5NEq+FTwypLfq+
         mk1s/E12bwHHq0AyWJY/8rHrNg9GnZRoLhcrH114k3HgcyH/nVrwIqqdMH8ZFh1Q7Yyy
         waBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Er8/zvVZZcQ5ioo9PA1WDtngetyRVBToQdDjDe6uhN8=;
        b=sXBPpvAj+1XnbVUhOpHCEgyCu79Kw2AkxOGauPz2E+jM7sWmVxPMmLZ+deW1Az9XhV
         6pCxPrGiFs9BPv6iGWrSe3uIZwqy/JzDd60cadpW6wyEhnp0p3vzMgwRdzf+qLT/pQmK
         pOYIDyDiik9wB5QjWDuCh5vXkb3k/lpx1THG00+Y1lTEFcDJZWjdU1jHeWmxm90qcTxY
         o2rRZF/Sez2hij04WYjWKohQ26iLuTlem3VDiP0LXobX6Vw6yB4/w/3sZAG6gxUh1O7p
         EI32cvk6YioCLUqpmfQIxsrVEsFuqmUoHP6r1wVmO/F6kcbfjLxlsJpaPoex9veXoqTC
         1JKA==
X-Gm-Message-State: AOAM530BrH6x8jbj/6QUE+wT3My5N0Jvg5TZ9YvK18CDsWIegWiq7yTG
        27qJkjJise/uloiisbnKfAW0PJeun2xSig==
X-Google-Smtp-Source: ABdhPJzTz1GxTLSMw30502mTRav4G75Dfm3vw3ZBpRjFCgFBN7RjHbIJb4IWj5XXScPc6l1LT6A+9w==
X-Received: by 2002:a05:6000:154e:: with SMTP id 14mr20821086wry.24.1619983941605;
        Sun, 02 May 2021 12:32:21 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id l14sm8556555wmq.4.2021.05.02.12.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 12:32:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: updates for v5.13
Date:   Sun,  2 May 2021 21:32:16 +0200
Message-Id: <20210502193216.24872-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

This is the big GPIO pull-request for this merge window. We've got two new
drivers, new features for existing ones (like edge detection support in
gpio-ich) and a lot of minor tweaks and improvements all over the place (but
not in the core gpiolib code this time). We also have much appreciated
documentation fixes and extensions. The details are in the signed tag.

You'll notice that we have a bunch of configfs commits in our tree not acked by
the configfs maintainers. These commits implement the concept of committable
items in configfs - something that was well defined in the documentation for
years but has remained unimplemented. Despite the first submission of these
patches back in November 2020[1] and repeated pings & resending, configfs
maintainers have remained unresponsive. After reviewing these on the GPIO
mailing list, we decided to pick them up ourselves and send them your way
together with the first user: the new GPIO simulator.

Which brings us to one of the new drivers which is a new testing module based
on configfs & sysfs (as opposed to the old one using module parameters and
debugfs) which allows to dynamically create simulated chips from user-space.
It's meant to eventually completely replace gpio-mockup.

The other new driver is the one supporting the Otto GPIO controller from
Realtek.

Other than configfs changes, there's nothing really controversial in there.

Please pull!
Bartosz

[1] https://www.lkml.org/lkml/2020/11/25/514

The following changes since commit 0d02ec6b3136c73c09e7859f0d0e4e2c4c07b49b:

  Linux 5.12-rc4 (2021-03-21 14:56:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.13

for you to fetch changes up to edc510855d963b5687b05a5b39a72bd35fc4c4ba:

  gpio: sim: Fix dereference of free'd pointer config (2021-04-27 14:59:05 +0200)

----------------------------------------------------------------
gpio updates for v5.13

- new driver for the Realtek Otto GPIO controller
- ACPI support for gpio-mpc8xxx
- edge event support for gpio-sch (+ Kconfig fixes)
- Kconfig improvements in gpio-ich
- fixes to older issues in gpio-mockup
- ACPI quirk for ignoring EC wakeups on Dell Venue 10 Pro 5055
- improve the GPIO aggregator code by using more generic interfaces instead of
  reimplementing them in the driver
- implement configfs committable items
- implement a new GPIO testing module based on configfs & sysfs together with
  its test-suite with the intention of eventually removing the old gpio-mockup
- convert the DT bindings for gpio-74x164 to yaml
- documentation improvements
- a slew of other minor fixes and improvements to GPIO drivers

----------------------------------------------------------------
Alexander Dahl (2):
      docs: kernel-parameters: Move gpio-mockup for alphabetic order
      docs: kernel-parameters: Add gpio_mockup_named_lines

Andy Shevchenko (14):
      lib/cmdline: Export next_arg() for being used in modules
      gpio: aggregator: Replace custom get_arg() with a generic next_arg()
      irqdomain: Introduce irq_domain_create_simple() API
      gpiolib: Unify the checks on fwnode type
      gpiolib: Move of_node operations to gpiolib-of and correct fwnode use
      gpiolib: Introduce acpi_gpio_dev_init() and call it from core
      gpiolib: Reuse device's fwnode to create IRQ domain
      gpiolib: Fold conditionals into a simple ternary operator
      gpio: mockup: Drop duplicate NULL check in gpio_mockup_unregister_pdevs()
      gpio: mockup: Adjust documentation to the code
      gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events
      gpio: sch: Drop MFD_CORE selection
      gpio: ich: Switch to be dependent on LPC_ICH
      gpio: sim: Initialize attribute allocated on the heap

Barney Goette (1):
      gpio: 104-dio-48e: Fix coding style issues

Bartosz Golaszewski (15):
      configfs: increase the item name length
      configfs: use (1UL << bit) for internal flags
      configfs: implement committable items
      samples: configfs: add a committable group
      lib: bitmap: remove the 'extern' keyword from function declarations
      lib: bitmap: order includes alphabetically
      lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
      gpio: sim: new testing module
      selftests: gpio: provide a helper for reading chip info
      selftests: gpio: add a helper for reading GPIO line names
      selftests: gpio: add test cases for gpio-sim
      gpio: sim: actually use the OF module table
      Merge tag 'intel-gpio-v5.13-1' of gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next
      Merge tag 'intel-gpio-v5.13-2' of gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next
      gpio: sim: allocate IDA numbers earlier

Colin Ian King (1):
      gpio: sim: Fix dereference of free'd pointer config

Geert Uytterhoeven (1):
      dt-bindings: gpio: fairchild,74hc595: Convert to json-schema

Hans de Goede (1):
      gpiolib: acpi: Add quirk to ignore EC wakeups on Dell Venue 10 Pro 5055

Jan Kiszka (1):
      gpio: sch: Add edge event support

Jiapeng Chong (2):
      gpio: it87: remove unused code
      gpio: mxs: remove useless function

Johan Jonker (1):
      dt-bindings: gpio: add YAML description for rockchip,gpio-bank

Jonathan Neuschäfer (1):
      docs: driver-api: gpio: consumer: Mark another line of code as such

Linus Walleij (1):
      gpio: Mention GPIO MUX in docs

Ran Wang (1):
      gpio: mpc8xxx: Add ACPI support

Randy Dunlap (3):
      tools: gpio-utils: fix various kernel-doc warnings
      gpiolib: some edits of kernel docs for clarity
      gpio: sch: depends on LPC_SCH

Sander Vanheule (2):
      dt-bindings: gpio: Binding for Realtek Otto GPIO
      gpio: Add Realtek Otto GPIO support

Tian Tao (1):
      gpio: omap: Use device_get_match_data() helper

 Documentation/admin-guide/gpio/gpio-mockup.rst     |  11 +-
 Documentation/admin-guide/gpio/gpio-sim.rst        |  72 ++
 Documentation/admin-guide/kernel-parameters.txt    |  10 +-
 Documentation/core-api/irq/irq-domain.rst          |  22 +-
 .../bindings/gpio/fairchild,74hc595.yaml           |  77 ++
 .../devicetree/bindings/gpio/gpio-74x164.txt       |  27 -
 .../bindings/gpio/realtek,otto-gpio.yaml           |  78 ++
 .../bindings/gpio/rockchip,gpio-bank.yaml          |  82 ++
 .../bindings/pinctrl/rockchip,pinctrl.txt          |  58 +-
 Documentation/driver-api/gpio/consumer.rst         |   2 +-
 Documentation/driver-api/gpio/drivers-on-gpio.rst  |   6 +
 Documentation/filesystems/configfs.rst             |   6 +-
 drivers/gpio/Kconfig                               |  32 +-
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/gpio-104-dio-48e.c                    |  50 +-
 drivers/gpio/gpio-aggregator.c                     |  39 +-
 drivers/gpio/gpio-ich.c                            |   2 -
 drivers/gpio/gpio-it87.c                           |   8 -
 drivers/gpio/gpio-mockup.c                         |   9 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  47 +-
 drivers/gpio/gpio-mxs.c                            |   5 -
 drivers/gpio/gpio-omap.c                           |   5 +-
 drivers/gpio/gpio-realtek-otto.c                   | 325 ++++++++
 drivers/gpio/gpio-sch.c                            | 198 ++++-
 drivers/gpio/gpio-sim.c                            | 877 +++++++++++++++++++++
 drivers/gpio/gpiolib-acpi.c                        |  21 +
 drivers/gpio/gpiolib-acpi.h                        |   4 +
 drivers/gpio/gpiolib-of.c                          |   6 +-
 drivers/gpio/gpiolib.c                             |  62 +-
 fs/configfs/configfs_internal.h                    |  22 +-
 fs/configfs/dir.c                                  | 245 +++++-
 include/linux/bitmap.h                             | 127 +--
 include/linux/configfs.h                           |   3 +-
 include/linux/gpio/driver.h                        |  12 +-
 include/linux/irqdomain.h                          |  19 +-
 kernel/irq/irqdomain.c                             |  20 +-
 lib/bitmap.c                                       |  42 +-
 lib/cmdline.c                                      |   1 +
 samples/configfs/configfs_sample.c                 | 153 ++++
 tools/gpio/gpio-utils.c                            |  18 +-
 tools/testing/selftests/gpio/.gitignore            |   2 +
 tools/testing/selftests/gpio/Makefile              |   4 +-
 tools/testing/selftests/gpio/config                |   1 +
 tools/testing/selftests/gpio/gpio-chip-info.c      |  57 ++
 tools/testing/selftests/gpio/gpio-line-name.c      |  55 ++
 tools/testing/selftests/gpio/gpio-sim.sh           | 229 ++++++
 46 files changed, 2781 insertions(+), 372 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
 create mode 100644 Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-74x164.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
 create mode 100644 drivers/gpio/gpio-realtek-otto.c
 create mode 100644 drivers/gpio/gpio-sim.c
 create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c
 create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c
 create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh
