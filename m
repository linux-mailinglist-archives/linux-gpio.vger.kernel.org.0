Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BA81CDDC0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 16:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730448AbgEKOxM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 10:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730567AbgEKOxM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 May 2020 10:53:12 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAF5C05BD18
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2020 07:53:10 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:702c:fb99:3097:2049])
        by xavier.telenet-ops.be with bizsmtp
        id dSsy2200A0GoAb601SsyQe; Mon, 11 May 2020 16:53:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jY9ne-00082p-6p; Mon, 11 May 2020 16:52:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jY9ne-0005zd-5G; Mon, 11 May 2020 16:52:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
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
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v7 5/6] docs: gpio: Add GPIO Aggregator documentation
Date:   Mon, 11 May 2020 16:52:56 +0200
Message-Id: <20200511145257.22970-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511145257.22970-1-geert+renesas@glider.be>
References: <20200511145257.22970-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the GPIO Aggregator, and the two typical use-cases.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
v7:
  - No changes,

v6:
  - Fix "allows" without object:
      -> provides a mechanism to aggregate GPIOs,
      -> provides access control for a set of one or more GPIOs,
      -> allows the user to communicate,
  - Drop "gpiochipN" support,
  - Extend example,

v5:
  - Add Reviewed-by, Tested-by,
  - Fix inconsistent indentation,

v4:
  - Add Reviewed-by,
  - Drop controversial GPIO repeater,
  - Clarify industrial control use case,
  - Fix typo s/communicated/communicate/,
  - Replace abstract frobnicator example by concrete door example with
    gpio-line-names,

v3:
  - New.
---
 .../admin-guide/gpio/gpio-aggregator.rst      | 111 ++++++++++++++++++
 Documentation/admin-guide/gpio/index.rst      |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-aggregator.rst

diff --git a/Documentation/admin-guide/gpio/gpio-aggregator.rst b/Documentation/admin-guide/gpio/gpio-aggregator.rst
new file mode 100644
index 0000000000000000..5cd1e7221756504c
--- /dev/null
+++ b/Documentation/admin-guide/gpio/gpio-aggregator.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+GPIO Aggregator
+===============
+
+The GPIO Aggregator provides a mechanism to aggregate GPIOs, and expose them as
+a new gpio_chip.  This supports the following use cases.
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
+The GPIO Aggregator provides access control for a set of one or more GPIOs, by
+aggregating them into a new gpio_chip, which can be assigned to a group or user
+using standard UNIX file ownership and permissions.  Furthermore, this
+simplifies and hardens exporting GPIOs to a virtual machine, as the VM can just
+grab the full GPIO controller, and no longer needs to care about which GPIOs to
+grab and which not, reducing the attack surface.
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
+			    is a GPIO chip label, and
+
+		    "<offsets>" ...
+			    is a comma-separated list of GPIO offsets and/or
+			    GPIO offset ranges denoted by dashes.
+
+		Example: Instantiate a new GPIO aggregator by aggregating GPIO
+		line 19 of "e6052000.gpio" and GPIO lines 20-21 of
+		"e6050000.gpio" into a new gpio_chip:
+
+		.. code-block:: sh
+
+		    $ echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device
+
+	"delete_device" ...
+		Userspace may ask the kernel to destroy an aggregated GPIO
+		controller after use by writing its device name to the
+		"delete_device" file.
+
+		Example: Destroy the previously-created aggregated GPIO
+		controller, assumed to be "gpio-aggregator.0":
+
+		.. code-block:: sh
+
+		    $ echo gpio-aggregator.0 > delete_device
+
+
+Generic GPIO Driver
+-------------------
+
+The GPIO Aggregator can also be used as a generic driver for a simple
+GPIO-operated device described in DT, without a dedicated in-kernel driver.
+This is useful in industrial control, and is not unlike e.g. spidev, which
+allows the user to communicate with an SPI device from userspace.
+
+Binding a device to the GPIO Aggregator is performed either by modifying the
+gpio-aggregator driver, or by writing to the "driver_override" file in Sysfs.
+
+Example: If "door" is a GPIO-operated device described in DT, using its own
+compatible value::
+
+	door {
+		compatible = "myvendor,mydoor";
+
+		gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>,
+			<&gpio2 20 GPIO_ACTIVE_LOW>;
+		gpio-line-names = "open", "lock";
+	};
+
+it can be bound to the GPIO Aggregator by either:
+
+1. Adding its compatible value to ``gpio_aggregator_dt_ids[]``,
+2. Binding manually using "driver_override":
+
+.. code-block:: sh
+
+    $ echo gpio-aggregator > /sys/bus/platform/devices/door/driver_override
+    $ echo door > /sys/bus/platform/drivers/gpio-aggregator/bind
+
+After that, a new gpiochip "door" has been created:
+
+.. code-block:: sh
+
+    $ gpioinfo door
+    gpiochip12 - 2 lines:
+	    line   0:       "open"       unused   input  active-high
+	    line   1:       "lock"       unused   input  active-high
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

