Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B60A10AC09
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 09:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfK0InK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 03:43:10 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:43646 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbfK0InK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 03:43:10 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id Wwiu2100b5USYZQ01wiuXS; Wed, 27 Nov 2019 09:43:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0000xd-K7; Wed, 27 Nov 2019 09:42:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0004No-H4; Wed, 27 Nov 2019 09:42:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/7] gpio: Add GPIO Aggregator/Repeater
Date:   Wed, 27 Nov 2019 09:42:46 +0100
Message-Id: <20191127084253.16356-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

GPIO controllers are exported to userspace using /dev/gpiochip*
character devices.  Access control to these devices is provided by
standard UNIX file system permissions, on an all-or-nothing basis:
either a GPIO controller is accessible for a user, or it is not.
Currently no mechanism exists to control access to individual GPIOs.

Hence this adds a GPIO driver to aggregate existing GPIOs, and expose
them as a new gpiochip.  This is useful for implementing access control,
and assigning a set of GPIOs to a specific user.  Furthermore, this
simplifies and hardens exporting GPIOs to a virtual machine, as the VM
can just grab the full GPIO controller, and no longer needs to care
about which GPIOs to grab and which not, reducing the attack surface.

Recently, other use cases have been discovered[1]:
  - Describing GPIO inverters in DT, as a generic GPIO Repeater,
  - Describing simple GPIO-operated devices in DT, and using the GPIO
    Aggregator as a generic GPIO driver for userspace.

Changes compared to v2[2] (more details in the individual patches):
  - Integrate GPIO Repeater functionality,
  - Absorb GPIO forwarder library, as the Aggregator and Repeater are
    now a single driver,
  - Use the aggregator parameters to create a GPIO lookup table instead
    of an array of GPIO descriptors,
  - Add documentation,
  - New patches:
      - "gpiolib: Add GPIOCHIP_NAME definition",
      - "gpiolib: Add support for gpiochipN-based table lookup",
      - "gpiolib: Add support for GPIO line table lookup",
      - "dt-bindings: gpio: Add gpio-repeater bindings",
      - "docs: gpio: Add GPIO Aggregator/Repeater documentation",
      - "MAINTAINERS: Add GPIO Aggregator/Repeater section".
  - Dropped patches:
      - "gpio: Export gpiod_{request,free}() to modular GPIO code",
      - "gpio: Export gpiochip_get_desc() to modular GPIO code",
      - "gpio: Export gpio_name_to_desc() to modular GPIO code",
      - "gpio: Add GPIO Forwarder Helper".

Changes compared to v1[3]:
  - Drop "virtual", rename to gpio-aggregator,
  - Create and use new GPIO Forwarder Helper, to allow sharing code with
    the GPIO inverter,
  - Lift limit on the maximum number of GPIOs,
  - Improve parsing of GPIO specifiers,
  - Fix modular build.

Aggregating GPIOs and exposing them as a new gpiochip was suggested in
response to my proof-of-concept for GPIO virtualization with QEMU[4][5].

For the first use case, aggregated GPIO controllers are instantiated and
destroyed by writing to atribute files in sysfs.
Sample session on the Renesas Koelsch development board:

  - Unbind LEDs from leds-gpio driver:

        echo leds > /sys/bus/platform/drivers/leds-gpio/unbind

  - Create aggregators:

    $ echo e6052000.gpio 19,20 \
        > /sys/bus/platform/drivers/gpio-aggregator/new_device

    gpio-aggregator gpio-aggregator.0: gpio 0 => gpio-953 (gpio-aggregator.0)
    gpio-aggregator gpio-aggregator.0: gpio 1 => gpio-954 (gpio-aggregator.0)
    gpiochip_find_base: found new base at 778
    gpio gpiochip8: (gpio-aggregator.0): added GPIO chardev (254:8)
    gpiochip_setup_dev: registered GPIOs 778 to 779 on device: gpiochip8 (gpio-aggregator.0)

    $ echo e6052000.gpio 21 e6050000.gpio 20-22 \
        > /sys/bus/platform/drivers/gpio-aggregator/new_device

    gpio-aggregator gpio-aggregator.1: gpio 0 => gpio-955 (gpio-aggregator.1)
    gpio-aggregator gpio-aggregator.1: gpio 1 => gpio-1012 (gpio-aggregator.1)
    gpio-aggregator gpio-aggregator.1: gpio 2 => gpio-1013 (gpio-aggregator.1)
    gpio-aggregator gpio-aggregator.1: gpio 3 => gpio-1014 (gpio-aggregator.1)
    gpiochip_find_base: found new base at 774
    gpio gpiochip9: (gpio-aggregator.1): added GPIO chardev (254:9)
    gpiochip_setup_dev: registered GPIOs 774 to 777 on device: gpiochip9 (gpio-aggregator.1)

  - Adjust permissions on /dev/gpiochip[89] (optional)

  - Control LEDs:

    $ gpioset gpiochip8 0=0 1=1 # LED6 OFF, LED7 ON
    $ gpioset gpiochip8 0=1 1=0 # LED6 ON, LED7 OFF
    $ gpioset gpiochip9 0=0     # LED8 OFF
    $ gpioset gpiochip9 0=1     # LED8 ON

  - Destroy aggregators:

    $ echo gpio-aggregator.0 \
            > /sys/bus/platform/drivers/gpio-aggregator/delete_device
    $ echo gpio-aggregator.1 \
            > /sys/bus/platform/drivers/gpio-aggregator/delete_device

Thanks for your comments!

References:
  [1] "[PATCH V4 2/2] gpio: inverter: document the inverter bindings"
      (https://lore.kernel.org/linux-gpio/1561699236-18620-3-git-send-email-harish_kandiga@mentor.com/)
  [2] "[PATCH/RFC v2 0/5] gpio: Add GPIO Aggregator Driver"
      (https://lore.kernel.org/linux-gpio/20190911143858.13024-1-geert+renesas@glider.be/)
  [3] "[PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver"
      (https://lore.kernel.org/lkml/20190705160536.12047-1-geert+renesas@glider.be/)
  [4] "[PATCH QEMU POC] Add a GPIO backend"
      (https://lore.kernel.org/linux-renesas-soc/20181003152521.23144-1-geert+renesas@glider.be/)
  [5] "Getting To Blinky: Virt Edition / Making device pass-through
       work on embedded ARM"
      (https://fosdem.org/2019/schedule/event/vai_getting_to_blinky/)

Geert Uytterhoeven (7):
  gpiolib: Add GPIOCHIP_NAME definition
  gpiolib: Add support for gpiochipN-based table lookup
  gpiolib: Add support for GPIO line table lookup
  dt-bindings: gpio: Add gpio-repeater bindings
  gpio: Add GPIO Aggregator/Repeater driver
  docs: gpio: Add GPIO Aggregator/Repeater documentation
  MAINTAINERS: Add GPIO Aggregator/Repeater section

 .../admin-guide/gpio/gpio-aggregator.rst      | 111 ++++
 Documentation/admin-guide/gpio/index.rst      |   1 +
 .../bindings/gpio/gpio-repeater.yaml          |  53 ++
 MAINTAINERS                                   |   8 +
 drivers/gpio/Kconfig                          |  13 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-aggregator.c                | 587 ++++++++++++++++++
 drivers/gpio/gpiolib-sysfs.c                  |   7 +-
 drivers/gpio/gpiolib.c                        |  38 +-
 drivers/gpio/gpiolib.h                        |   2 +
 include/linux/gpio/machine.h                  |   2 +-
 11 files changed, 815 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-aggregator.rst
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
 create mode 100644 drivers/gpio/gpio-aggregator.c

-- 
2.17.1

