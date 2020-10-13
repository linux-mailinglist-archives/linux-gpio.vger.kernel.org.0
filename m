Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170E528CB31
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 11:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgJMJty (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 05:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgJMJtu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 05:49:50 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F481C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 02:49:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a5so19709573ljj.11
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=l2oIQjpDqijiabdlCeMYK7fn/FtkvSpkgziUWrkQZ7s=;
        b=FYSMlCWrzpfFUYnio9nNn8f40L9FpnPWGpP0HfHcqYHetYWn+N31ne1lqKPybKzzXx
         fXwmnN90qaLkBMA9ZEgqpoqa1nVHE/C4fvPTVsOifPOFgEESiy4HF/smorQf2DOZVkAk
         v3GaKLs0F7oodczidVuKxeYWhD3NbBW85R1S4RwFXnVUeklVHN4bC/9FUJxBF1yKBYN8
         u688zSwnET8OENio/F4F3HyNmT8cKJW85Mk8Hj2bG7/776xq0VvtbvCleSAOta/GgIeI
         bQxw0DqrcAXM6PxFjddXYin0UV+T5ho9kpJ6nJyGpnN19K5M8SshL3H8iyfubYYfNaDj
         HFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=l2oIQjpDqijiabdlCeMYK7fn/FtkvSpkgziUWrkQZ7s=;
        b=eUCZ6MXGuWmadotB3IAssTwcjbybHWXN0wZE+Lwk/97SDGPI2K+LRSed3xN/EXvfFh
         rPEOxRvDgZXH0ufoy6snOpk8pLiKdnkn9XwfzL65Tx1tpbPWonjttXKRBe3i7IeWHky3
         ZKVvUO0DkHBPkSZpf6fKg8oLobIWxSi33AtOqyZBaHDIwbIwzAbz3uavsr+tiO0nowPx
         0/UKQdJP5tpxon4Y0Cw3OBjyprB7gOZxYhxM/2ZgyKed+rtVPTcSAiUiIMCqkAuJMjk3
         ZJbSj8qDfyJH1s7SA4wEZNJH6N8IYWoIGXttufycNu1hqnUd12ygtGOoystEYVBf6mcE
         Ofog==
X-Gm-Message-State: AOAM532gXV41Yy/qkvYmzokXVC3vyEPsCX5ZBlZStkJvbO4KrM6lYYf7
        fb9cVllfVavUxFnpXftNLV/TEaUJDJrQD2VSJfJBoLQGUZb7siS6
X-Google-Smtp-Source: ABdhPJx7AvdDQnT4GBA/MxMdWC3aZYWDpuleorkBjY0LotOBfFlySsoz5CKloC/gtXAYBt17jR2LggFsbHoveHg5DAY=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr11110446lji.338.1602582586505;
 Tue, 13 Oct 2020 02:49:46 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Oct 2020 11:49:35 +0200
Message-ID: <CACRpkdbQU7xBcJ5GMhmovhvdpyDXmmr49wGUcuppHcKEc_Kacw@mail.gmail.com>
Subject: [GIT PULL] GPIO bulk changes for the v5.10 kernel series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of GPIO changes for the v5.10 kernel.

This time very little driver changes but lots of core changes.
Details in the signed tag. We have some interesting cooperative
work for ARM and Intel alike, making the GPIO subsystem
more and more suitable for industrial systems and the like,
in addition to the in-kernel users.

We touch driver core (device properties) and lib/* by adding one
simple string array free function, these are authored by Andy
Shevchenko who is a well known and recognized core
helpers maintainers so this should be fine.

We also see some Android GKI-related modularization in the
MXC drivers.

I foresee a merge conflict in drivers/gpio/gpio-mockup.c
due to things merged into the release candidate. The merge
should be trivial and pertains to using pr_fmt and
numerical return values: what's on my branch goes and that
is also the resolution you find in linux-next.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.10-1

for you to fetch changes up to fc709df553a34fd18010f52e6b47652268d83e7d:

  gpiolib: Update header block in gpiolib-cdev.h (2020-10-08 22:57:16 +0200)

----------------------------------------------------------------
GPIO bulk changes for the v5.10 kernel cycle:

Core changes:

- The big core change is the updated (v2) userspace character
  device API. This corrects badly designed 64-bit alignment around
  the line events. We also add the debounce request feature.
  This echoes the often quotes passage from Frederick Brooks
  "The mythical man-month" to always throw one away, which we
  have seen before in things such as V4L2. So we put in a new
  one and deprecate and obsolete the old one.

- All example tools in tools/gpio/* are migrated to the new API
  to set a good example. The libgpiod userspace library has been
  augmented to use this new API pretty much from day 1.

- Some misc API hardening by using strn* function calls has been
  added as well.

- Use the simpler IDA interface for GPIO chip instance enumeration.

- Add device core function for counting string arrays in
  device properties.

- Provide a generic library function kfree_strarray() that can
  be used throughout the kernel.

Driver enhancements:

- The DesignWare dwapb-gpio driver has been enhanced and now
  uses the IRQ handling in the gpiolib core.

- The mockup and aggregator drivers have seen some substantial
  code clean-up and now use more of the core kernel
  inftrastructure.

- Misc cleanups using dev_err_probe().

- The MXC drivers (Freescale/NXP) can now be built modularized,
  which makes modularized GKI Android kernels happy.

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      gpio: stp-xway: automatically drive GPHY leds on ar10 and grx390

Andy Shevchenko (3):
      gpio: aggregator: Refactor ->{get, set}_multiple() to make Sparse happy
      gpiolib: convert to use DEFINE_SEQ_ATTRIBUTE macro
      gpiolib: Update header block in gpiolib-cdev.h

Anson Huang (1):
      gpio: mxc: Support module build

Bartosz Golaszewski (16):
      gpiolib: switch to simpler IDA interface
      device: property: add helpers to count items in string arrays
      gpiolib: generalize devprop_gpiochip_set_names() for device properties
      gpiolib: unexport devprop_gpiochip_set_names()
      gpiolib: check for parent device in devprop_gpiochip_set_names()
      gpio: mockup: fix resource leak in error path
      lib: string_helpers: provide kfree_strarray()
      Documentation: gpio: add documentation for gpio-mockup
      gpio: mockup: drop unneeded includes
      gpio: mockup: use KBUILD_MODNAME
      gpio: mockup: use pr_fmt()
      gpio: mockup: remove unneeded return statement
      gpio: mockup: increase the number of supported device properties
      gpio: mockup: pass the chip label as device property
      gpio: mockup: use the generic 'gpio-line-names' property
      gpio: mockup: refactor the module init function

Kent Gibson (21):
      gpiolib: cdev: gpio_desc_to_lineinfo() should set info offset
      gpiolib: cdev: replace strncpy() with strscpy()
      gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
      gpio: uapi: define uAPI v2
      gpiolib: make cdev a build option
      gpiolib: add build option for CDEV v1 ABI
      gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and
GPIO_V2_LINE_GET_VALUES_IOCTL
      gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and
GPIO_V2_GET_LINEINFO_WATCH_IOCTL
      gpiolib: cdev: support edge detection for uAPI v2
      gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
      gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
      gpiolib: cdev: support setting debounce
      gpio: uapi: document uAPI v1 as deprecated
      tools: gpio: port lsgpio to v2 uAPI
      tools: gpio: port gpio-watch to v2 uAPI
      tools: gpio: rename nlines to num_lines
      tools: gpio: port gpio-hammer to v2 uAPI
      tools: gpio: port gpio-event-mon to v2 uAPI
      tools: gpio: add multi-line monitoring to gpio-event-mon
      tools: gpio: add debounce support to gpio-event-mon
      gpiolib: cdev: switch from kstrdup() to kstrndup()

Krzysztof Kozlowski (15):
      gpio: bcm-kona: Simplify with dev_err_probe()
      gpio: davinci: Simplify with dev_err_probe()
      gpio: omap: Simplify with dev_err_probe()
      gpio: pca953x: Simplify with dev_err_probe()
      gpio: pisosr: Simplify with dev_err_probe()
      gpio: zynq: Simplify with dev_err_probe()
      dt-bindings: gpio: fsl-imx-gpio: Add i.MX 8 compatibles
      dt-bindings: gpio: fsl-imx-gpio: Add gpio-ranges property
      dt-bindings: gpio: fsl-imx-gpio: Add parsing of hogs
      dt-bindings: gpio: fsl-imx-gpio: Add power-domains
      dt-bindings: gpio: pl061: add gpio-line-names
      dt-bindings: gpio: fsl-imx-gpio: add i.MX ARMv6 and ARMv7 compatibles
      dt-bindings: gpio: fsl-imx-gpio: add gpio-line-names
      dt-bindings: gpio: convert bindings for NXP PCA953x family to dtschema
      dt-bindings: gpio: convert bindings for Maxim MAX732x family to dtschema

Lad Prabhakar (1):
      dt-bindings: gpio: renesas, rcar-gpio: Add r8a774e1 support

Linus Walleij (3):
      Merge tag 'imx-gpio-5.10' of
https://git.kernel.org/.../krzk/linux into devel
      Merge tag 'gpio-updates-for-v5.10-part1' of
git://git.kernel.org/.../brgl/linux into devel
      Merge tag 'gpio-updates-for-v5.10-part2' of
git://git.kernel.org/.../brgl/linux into devel

Mauro Carvalho Chehab (1):
      docs: gpio: add a new document to its index.rst

Michael Walle (1):
      gpio: mpc8xxx: simplify ls1028a/ls1088a support

Mike Looijmans (1):
      gpio: pca953x: Add support for the NXP PCAL9554B/C

Necip Fazil Yildiran (1):
      pinctrl: bcm: fix kconfig dependency warning when !GPIOLIB

Serge Semin (10):
      dt-bindings: gpio: dwapb: Add ngpios property support
      gpio: dwapb: Add ngpios DT-property support
      gpio: dwapb: Move MFD-specific IRQ handler
      gpio: dwapb: Add max GPIOs macro
      gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip
      gpio: dwapb: Discard GPIO-to-IRQ mapping function
      gpio: dwapb: Discard ACPI GPIO-chip IRQs request
      gpio: dwapb: Get reset control by means of resource managed interface
      gpio: dwapb: Get clocks by means of resource managed interface
      gpio: dwapb: Use resource managed GPIO-chip add data method

dillon min (1):
      gpio: tc35894: Disable Direct KBD interrupts to enable gpio irq

 Documentation/admin-guide/gpio/gpio-mockup.rst     |   50 +
 Documentation/admin-guide/gpio/index.rst           |    1 +
 .../devicetree/bindings/gpio/fsl-imx-gpio.yaml     |   55 +-
 .../devicetree/bindings/gpio/gpio-max732x.txt      |   58 -
 .../devicetree/bindings/gpio/gpio-pca953x.txt      |   90 --
 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |  232 +++
 .../devicetree/bindings/gpio/pl061-gpio.yaml       |    3 +
 .../bindings/gpio/renesas,rcar-gpio.yaml           |    1 +
 .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml |    6 +
 .../devicetree/bindings/trivial-devices.yaml       |    4 -
 drivers/gpio/Kconfig                               |   33 +-
 drivers/gpio/Makefile                              |    3 +-
 drivers/gpio/gpio-aggregator.c                     |   70 +-
 drivers/gpio/gpio-bcm-kona.c                       |    5 +-
 drivers/gpio/gpio-davinci.c                        |    8 +-
 drivers/gpio/gpio-dwapb.c                          |  352 ++---
 drivers/gpio/gpio-mockup.c                         |  160 +-
 drivers/gpio/gpio-mpc8xxx.c                        |   45 +-
 drivers/gpio/gpio-mxc.c                            |    6 +
 drivers/gpio/gpio-omap.c                           |    5 +-
 drivers/gpio/gpio-pca953x.c                        |   11 +-
 drivers/gpio/gpio-pisosr.c                         |    9 +-
 drivers/gpio/gpio-stp-xway.c                       |   54 +-
 drivers/gpio/gpio-tc3589x.c                        |   18 +-
 drivers/gpio/gpio-zynq.c                           |    8 +-
 drivers/gpio/gpiolib-acpi.c                        |    3 -
 drivers/gpio/gpiolib-cdev.c                        | 1542 +++++++++++++++++---
 drivers/gpio/gpiolib-cdev.h                        |   19 +-
 drivers/gpio/gpiolib-devprop.c                     |   63 -
 drivers/gpio/gpiolib-of.c                          |    5 -
 drivers/gpio/gpiolib.c                             |   89 +-
 drivers/gpio/gpiolib.h                             |    6 +
 drivers/pinctrl/bcm/Kconfig                        |    1 +
 include/linux/gpio/driver.h                        |    3 -
 include/linux/mfd/tc3589x.h                        |    6 +
 include/linux/platform_data/gpio-dwapb.h           |    4 +-
 include/linux/property.h                           |   13 +
 include/linux/string_helpers.h                     |    2 +
 include/uapi/linux/gpio.h                          |  334 ++++-
 lib/string_helpers.c                               |   23 +
 tools/gpio/gpio-event-mon.c                        |  146 +-
 tools/gpio/gpio-hammer.c                           |   56 +-
 tools/gpio/gpio-utils.c                            |  176 ++-
 tools/gpio/gpio-utils.h                            |   48 +-
 tools/gpio/gpio-watch.c                            |   16 +-
 tools/gpio/lsgpio.c                                |   60 +-
 46 files changed, 2964 insertions(+), 938 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-mockup.rst
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
 delete mode 100644 drivers/gpio/gpiolib-devprop.c
