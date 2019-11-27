Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C854710AC06
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 09:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfK0InZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 03:43:25 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:43630 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfK0InL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 03:43:11 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id Wwiu2100e5USYZQ01wiuXV; Wed, 27 Nov 2019 09:43:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0000xt-QR; Wed, 27 Nov 2019 09:42:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0004P0-Ny; Wed, 27 Nov 2019 09:42:54 +0100
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
Subject: [PATCH v3 6/7] docs: gpio: Add GPIO Aggregator/Repeater documentation
Date:   Wed, 27 Nov 2019 09:42:52 +0100
Message-Id: <20191127084253.16356-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127084253.16356-1-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the GPIO Aggregator/Repeater, and the three typical use-cases.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 .../admin-guide/gpio/gpio-aggregator.rst      | 111 ++++++++++++++++++
 Documentation/admin-guide/gpio/index.rst      |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-aggregator.rst

diff --git a/Documentation/admin-guide/gpio/gpio-aggregator.rst b/Documentation/admin-guide/gpio/gpio-aggregator.rst
new file mode 100644
index 0000000000000000..826146e260253299
--- /dev/null
+++ b/Documentation/admin-guide/gpio/gpio-aggregator.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+GPIO Aggregator/Repeater
+========================
+
+The GPIO Aggregator/Repeater allows to aggregate GPIOs, and expose them as a
+new gpio_chip.  This supports the following use cases.
+
+
+Aggregating GPIOs using Sysfs
+-----------------------------
+
+GPIO controllers are exported to userspace using /dev/gpiochip* character
+devices.  Access control to these devices is provided by standard UNIX file
+system permissions, on an all-or-nothing basis: either a GPIO controller is
+accessible for a user, or it is not.
+
+The GPIO Aggregator allows access control for individual GPIOs, by aggregating
+them into a new gpio_chip, which can be assigned to a group or user using
+standard UNIX file ownership and permissions.  Furthermore, this simplifies and
+hardens exporting GPIOs to a virtual machine, as the VM can just grab the full
+GPIO controller, and no longer needs to care about which GPIOs to grab and
+which not, reducing the attack surface.
+
+Aggregated GPIO controllers are instantiated and destroyed by writing to
+write-only attribute files in sysfs.
+
+    /sys/bus/platform/drivers/gpio-aggregator/
+
+	"new_device" ...
+		Userspace may ask the kernel to instantiate an aggregated GPIO
+		controller by writing a string describing the GPIOs to
+		aggregate to the "new_device" file, using the format
+
+		.. code-block:: none
+
+		    [<gpioA>] [<gpiochipB> <offsets>] ...
+
+		Where:
+
+		    "<gpioA>" ...
+			    is a GPIO line name,
+
+		    "<gpiochipB>" ...
+			    is a GPIO chip label or name, and
+
+		    "<offsets>" ...
+			    is a comma-separated list of GPIO offsets and/or
+			    GPIO offset ranges denoted by dashes.
+
+		Example: Instantiate a new GPIO aggregator by aggregating GPIO
+		19 of "e6052000.gpio" and GPIOs 20-21 of "gpiochip2" into a new
+		gpio_chip:
+
+		.. code-block:: bash
+
+		    echo 'e6052000.gpio 19 gpiochip2 20-21' > new_device
+
+	"delete_device" ...
+		Userspace may ask the kernel to destroy an aggregated GPIO
+		controller after use by writing its device name to the
+		"delete_device" file.
+
+		Example: Destroy the previously-created aggregated GPIO
+		controller "gpio-aggregator.0":
+
+		.. code-block:: bash
+
+		    echo gpio-aggregator.0 > delete_device
+
+
+GPIO Repeater in Device Tree
+----------------------------
+
+A GPIO Repeater is a node in a Device Tree representing a repeater for one or
+more GPIOs, possibly including physical signal property translation (e.g.
+polarity inversion).  This allows to model e.g. inverters in DT.
+
+See Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
+
+
+Generic GPIO Driver
+-------------------
+
+The GPIO Aggregator can also be used as a generic driver for a simple
+GPIO-operated device described in DT, without a dedicated in-kernel driver.
+This is not unlike e.g. spidev, which allows to communicated with an SPI device
+from userspace.
+
+Binding a device to the GPIO Aggregator is performed either by modifying the
+gpio-aggregator driver, or by writing to the "driver_override" file in Sysfs.
+
+Example: If "frobnicator" is a GPIO-operated device described in DT, using its
+own compatible value::
+
+        frobnicator {
+                compatible = "myvendor,frobnicator";
+
+                gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>,
+                        <&gpio2 20 GPIO_ACTIVE_LOW>;
+        };
+
+it can be bound to the GPIO Aggregator by either:
+
+1. Adding its compatible value to ``gpio_aggregator_dt_ids[]``,
+2. Binding manually using "driver_override":
+
+.. code-block:: bash
+
+    echo gpio-aggregator > /sys/bus/platform/devices/frobnicator/driver_override
+    echo frobnicator > /sys/bus/platform/drivers/gpio-aggregator/bind
diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
index a244ba4e87d5398a..ef2838638e967777 100644
--- a/Documentation/admin-guide/gpio/index.rst
+++ b/Documentation/admin-guide/gpio/index.rst
@@ -7,6 +7,7 @@ gpio
 .. toctree::
     :maxdepth: 1
 
+    gpio-aggregator
     sysfs
 
 .. only::  subproject and html
-- 
2.17.1

