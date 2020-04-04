Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5885419E4D8
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2020 14:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgDDMIv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Apr 2020 08:08:51 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:36617 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgDDMIv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Apr 2020 08:08:51 -0400
Received: by mail-lj1-f174.google.com with SMTP id b1so9726204ljp.3
        for <linux-gpio@vger.kernel.org>; Sat, 04 Apr 2020 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+blAdCyyPd5TO4J0c1wmSIoLGBiNVPhnANjsOBO34Lo=;
        b=h7qtA2qqmxM7wOBr8JLzQtbyZ56VojwdRrhdt0wr/ol8iNtkNb+9zgpXmTJBPCdKYD
         qDow4vNPGxu0NrSdTfPLoYwLph8BngS8GNadgJJF6N+Dp21QTGBGNRssSNc7mudPXyut
         VvMhbu23PLIocupyxhHriVzRJIJaUvPP+M+kJOfWAX0lXAyZiumuL+hEKhIWQk0q5Hza
         mLaBCNSbfa7LtC5uiaoCEaxtal6rYg+N40Ew6Bk7H2qlLjzcrZYaHIJadWbIO2r3dfoS
         ZbJIyRj8uhhv5Jv6HZj9EMpQ/wFV0bndNAANBNOnTfpYMro/YAEnIm1MKReECpNZzEWF
         5YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+blAdCyyPd5TO4J0c1wmSIoLGBiNVPhnANjsOBO34Lo=;
        b=DaQ39ZtLF1C5s932sfklfAVPYwCi5ThWPwt4eZFUt0BAM9GlR3KoCO6pDhEMhV1oyq
         5QiUZJTWnO6RB4ZsrBhjthQfx74J7JPlHYmtcKpMHDFZ/pzQbwFXReJuZj5hqCWdMtnY
         XdNDK3G8ueK0ErGIhjUcIRAMaQV5aVY93/O/9Jc/bL0yI2yl2hY7G/Iksp4a1+wuevPf
         SmhhEQc8SOe/D1lLAsYM/F4d0NjPiFdL87Azypv8sIdtlN0w5/Zwluwjo433VBvlyhuz
         /v0OEiKE3YVUy4kgNgQBR67EaQpM0gKLqAKjcRh2KHwUnOzu30EIrNBqISxT8+TTMPO5
         Yd2Q==
X-Gm-Message-State: AGi0PuZfL2X+WogaL3faTRFB0JvOjOQjKyW4SgWWf56R9EdRsOOfozjI
        XKKxFLtHWZNi/XrW7vedTsv5Xo4kvsehE6dvuYmfjA==
X-Google-Smtp-Source: APiQypJDNM/YCsCWW77oPYzNWheWMuJlDUnF6UzNK0BerFYSMOGIds2KbPfYgWSE92gDAXpHfktSMPhDbzKsXCxeNQI=
X-Received: by 2002:a2e:9084:: with SMTP id l4mr7486363ljg.277.1586002125058;
 Sat, 04 Apr 2020 05:08:45 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Apr 2020 14:08:34 +0200
Message-ID: <CACRpkdYMcy0ctKsUTdeXQ7EKZ40AeQVEo4fE4BpgXODJ+U6K1Q@mail.gmail.com>
Subject: [GIT PULL] GPIO bulk changes for v5.7
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the GPIO pull request for the bulk of changes for v5.7.

There will be at least one conflict due to me fingering around and
renaming variables. It is pretty straight-forward to resolve: in the
gpiochip_irq_disable() what is in your branch came in as a late
fix and that is what should stay, with the variable "chip" renamed
to "gc". Sorry for messing with this so late in the cycle.

We have some patches to kfifo ACKed by the kfifo maintainer,
details about this can be found in the signed tag.

We have some two patches to arch/arm written by the maintainers
for these same platforms.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e=
:

  Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.7-1

for you to fetch changes up to 4ed7d7dd4890bb8120a3e77c16191a695fdfcc5a:

  Revert "gpio: eic-sprd: Use devm_platform_ioremap_resource()"
(2020-04-02 09:39:09 +0200)

----------------------------------------------------------------
This is the bulk of GPIO development for the v5.7 kernel cycle.

Core and userspace API:

- The userspace API KFIFOs have been imoproved with locks that
  do not block interrupts. This makes us better at getting
  events to userspace without blocking or disturbing new events
  arriving in the same time. This was reviewed by the KFIFO
  maintainer Stefani. This is a generic improvement which
  paves the road for similar improvements in other subsystems.

- We provide a new ioctl() for monitoring changes in the line
  information, such as when multiple clients are taking lines
  and giving them back, possibly reconfiguring them in the
  process: we can now monitor that and not get stuck with stale
  static information.

- An example tool 'gpio-watch' is provided to showcase this
  functionality.

- Timestamps for events are switched to ktime_get_ns() which is
  monotonic. We previously had a 'realtime' stamp which could
  move forward and *backward* in time, which probably would just
  cause silent bugs and weird behaviour. In the long run we
  see two relevant timestamps: ktime_get_ns() or the timestamp
  sometimes provided by the GPIO hardware itself, if that
  exists.

- Device Tree overlay support for GPIO hogs. On systems that
  load overlays, these overlays can now contain hogs, and will
  then be respected.

- Handle pin control interaction with nonexisting pin ranges
  in the GPIO library core instead of in the individual
  drivers.

New drivers:

- New driver for the Mellanox BlueField 2 GPIO controller.

Driver improvements:

- Introduce the BGPIOF_NO_SET_ON_INPUT flag to the generic
  MMIO GPIO library and use this flag in the MT7621 driver.

- Texas Instruments OMAP CPU power management improvements,
  such as blocking of idle on pending GPIO interrupts.

----------------------------------------------------------------
Alexander Sverdlin (1):
      gpio: pl061: Warn when IRQ line has not been configured

Andy Shevchenko (3):
      gpio: Avoid kernel.h inclusion where it's possible
      gpiolib: Optimize gpiochip_remove() when check for requested line
      gpiolib: Rename 'event' to 'ge' to be consistent with other use

Anson Huang (2):
      gpio: mxc: Add COMPILE_TEST support for GPIO_MXC
      gpio: mxs: add COMPILE_TEST support for GPIO_MXS

Anssi Hannula (1):
      tools: gpio: Fix out-of-tree build regression

Ashish Chavan (1):
      gpio: rcar: Fix typo in comment

Asmaa Mnebhi (1):
      gpio: add driver for Mellanox BlueField 2 GPIO controller

Axel Lin (2):
      gpio: wcd934x: Don't change gpio direction in wcd_gpio_set
      gpio: wcd934x: Fix logic of wcd_gpio_get

Baolin Wang (1):
      Revert "gpio: eic-sprd: Use devm_platform_ioremap_resource()"

Bartosz Golaszewski (10):
      kfifo: provide noirqsave variants of spinlocked in and out helpers
      kfifo: provide kfifo_is_empty_spinlocked()
      gpiolib: rework the locking mechanism for lineevent kfifo
      gpiolib: emit a debug message when adding events to a full kfifo
      gpiolib: provide a dedicated function for setting lineinfo
      gpiolib: add new ioctl() for monitoring changes in line info
      tools: gpio: implement gpio-watch
      gpio: mockup: coding-style fix
      gpiolib: use gpiochip_get_desc() where applicable
      gpiolib: fix bitmap operations related to line event watching

Chris Packham (1):
      gpio: mvebu: avoid error message for optional IRQ

Chuanhong Guo (2):
      gpio: mmio: introduce BGPIOF_NO_SET_ON_INPUT
      gpio: mt7621: add BGPIOF_NO_SET_ON_INPUT flag

Colin Ian King (1):
      tools: gpio-hammer: fix spelling mistake: "occurences" -> "occurrence=
s"

Doug Berger (1):
      gpio: brcmstb: support gpio-line-names property

Gabriel Ravier (2):
      tools: gpio-hammer: Avoid potential overflow in main
      tools: gpio-hammer: Apply scripts/Lindent and retain good changes

Geert Uytterhoeven (7):
      gpio: of: Extract of_gpiochip_add_hog()
      gpio: of: Add DT overlay support for GPIO hogs
      gpiolib: Fix inverted check in gpiochip_remove()
      ARM: integrator: impd1: Use GPIO_LOOKUP() helper macro
      gpiolib: Introduce gpiod_set_config()
      gpiolib: Pass gpio_desc to gpio_set_config()
      gpiolib: Remove unused gpio_chip parameter from gpio_set_bias()

Gustavo A. R. Silva (1):
      gpio: uniphier: Replace zero-length array with flexible-array member

Jonathan Neusch=C3=A4fer (1):
      gpio: uapi: Improve phrasing around arrays representing empty strings

Kent Gibson (1):
      gpiolib: fix unwatch ioctl()

Linus Walleij (8):
      Merge tag 'gpio-updates-for-v5.7-part1' of
git://git.kernel.org/.../brgl/linux into devel
      gpio: Switch timestamps to ktime_get_ns()
      Merge tag 'gpio-updates-for-v5.7-part2' of
git://git.kernel.org/.../brgl/linux into devel
      Merge branch 'ib-omap-block-idle' into devel
      gpio: Move devres calls to devres file
      Merge tag 'gpio-updates-for-v5.7-part4' of
git://git.kernel.org/.../brgl/linux into devel
      Merge tag 'v5.6-rc7' into devel
      gpio: Rename variable in core APIs

Lubomir Rintel (1):
      gpio: pxa: Avoid a warning when gpio0 and gpio1 IRQS are not there

Mauro Carvalho Chehab (2):
      docs: gpio: driver.rst: don't mark literal blocks twice
      gpio: gpiolib: fix a doc warning

Micha=C5=82 Miros=C5=82aw (1):
      gpiolib: gpio_name_to_desc: factor out !name check

Mykyta Poturai (1):
      tools: gpio: Fix typo in gpio-utils

Stephen Rothwell (1):
      gpio: export of_pinctrl_get to modules

Thierry Reding (7):
      gpio: Support GPIO controllers without pin-ranges
      gpio: tegra186: Add support for pin ranges
      gpio: tegra186: Add Tegra194 pin ranges for GG.0 and GG.1
      gpio: Avoid using pin ranges with !PINCTRL
      pinctrl: Define of_pinctrl_get() dummy for !PINCTRL
      gpio: Unconditionally assign .request()/.free()
      pinctrl: Unconditionally assign .request()/.free()

Tony Lindgren (3):
      ARM: OMAP2+: Handle errors for cpu_pm
      gpio: omap: Block idle on pending gpio interrupts
      Revert "gpio: omap: Fix lost edge wake-up interrupts"

Uwe Kleine-K=C3=B6nig (1):
      gpio: siox: use raw spinlock for irq related locking

 Documentation/driver-api/gpio/driver.rst |    4 +-
 arch/arm/mach-integrator/impd1.c         |   11 +-
 arch/arm/mach-omap2/cpuidle34xx.c        |    9 +-
 arch/arm/mach-omap2/cpuidle44xx.c        |   26 +-
 arch/arm/mach-omap2/pm34xx.c             |    8 +-
 drivers/gpio/Kconfig                     |   11 +-
 drivers/gpio/Makefile                    |    1 +
 drivers/gpio/gpio-brcmstb.c              |   44 +
 drivers/gpio/gpio-davinci.c              |    7 +-
 drivers/gpio/gpio-eic-sprd.c             |    9 +-
 drivers/gpio/gpio-mlxbf2.c               |  335 ++++++++
 drivers/gpio/gpio-mmio.c                 |   23 +-
 drivers/gpio/gpio-mockup.c               |    2 +-
 drivers/gpio/gpio-mt7621.c               |    4 +-
 drivers/gpio/gpio-mvebu.c                |    2 +-
 drivers/gpio/gpio-mxc.c                  |    7 +-
 drivers/gpio/gpio-omap.c                 |   29 +-
 drivers/gpio/gpio-pl061.c                |   13 +-
 drivers/gpio/gpio-pxa.c                  |   11 +-
 drivers/gpio/gpio-rcar.c                 |    4 +-
 drivers/gpio/gpio-siox.c                 |   28 +-
 drivers/gpio/gpio-tegra186.c             |   64 ++
 drivers/gpio/gpio-uniphier.c             |    2 +-
 drivers/gpio/gpio-wcd934x.c              |    9 +-
 drivers/gpio/gpio-zx.c                   |   10 +-
 drivers/gpio/gpiolib-devres.c            |   46 ++
 drivers/gpio/gpiolib-of.c                |  139 +++-
 drivers/gpio/gpiolib-of.h                |    2 +
 drivers/gpio/gpiolib.c                   | 1297 +++++++++++++++++---------=
----
 drivers/gpio/gpiolib.h                   |    4 +
 drivers/pinctrl/devicetree.c             |    1 +
 drivers/pinctrl/pinctrl-ingenic.c        |    7 +-
 include/asm-generic/gpio.h               |    4 +-
 include/linux/gpio.h                     |    2 -
 include/linux/gpio/consumer.h            |   13 +-
 include/linux/gpio/driver.h              |  139 ++--
 include/linux/kfifo.h                    |   73 ++
 include/linux/of_gpio.h                  |    9 +-
 include/linux/pinctrl/pinctrl.h          |    2 +-
 include/uapi/linux/gpio.h                |   38 +-
 tools/gpio/.gitignore                    |    1 +
 tools/gpio/Build                         |    1 +
 tools/gpio/Makefile                      |   13 +-
 tools/gpio/gpio-hammer.c                 |   19 +-
 tools/gpio/gpio-utils.c                  |    6 +-
 tools/gpio/gpio-watch.c                  |   99 +++
 46 files changed, 1814 insertions(+), 774 deletions(-)
 create mode 100644 drivers/gpio/gpio-mlxbf2.c
 create mode 100644 tools/gpio/gpio-watch.c
