Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B901916146
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 11:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfEGJoX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 05:44:23 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44438 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfEGJoX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 05:44:23 -0400
Received: by mail-lf1-f65.google.com with SMTP id n134so9506935lfn.11
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2019 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WueN4BYUwjsLB2MFLCZC5aZrBzzhGVbyxsVYjGsGo9c=;
        b=mVasZqPnj9W+HKoVpnOmdNb0/on3AhhpN8pMnlONIiZ3OsUT/FiRvSGpWD+J99Lzrk
         jjrSt6nqmPNOffn/Ztc6W+ImDZdy+uoRTX4pNWsNnHqx7LFHT73UC+gyAauwXNX1Yvbd
         0onYcjOSxP80BpmrZhKLj1xup8TTlBJwgmJ0hx7VLH0t5gess9XN/a6X2McWI6LkbqlL
         1YNSqSD3GBz3xdLTkNWg4QGm3asOsdRwIII3ixxaIBHA42pf+ynwnpEYJ3BfW811FJnz
         ++Vsl2h9LhqZOxxuFNB4HQtqvm0U9gVkakSon6y4ZJVBfOEBuFjf4AFjMSWusT2e8085
         ZBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WueN4BYUwjsLB2MFLCZC5aZrBzzhGVbyxsVYjGsGo9c=;
        b=N1fY1wM5XCx1tWeh5Wc+lJErCL0h5Rm3gZnD6YuzuGqUI34W+gAwev1h0M5MC5aPro
         fmHytEWlfrhpZQT/zBRV6HKkn3rKgTvn1Fwv9KxsZoGPKAh2RuSLq4JiK4dxzFCljVNZ
         XVHQMd+qI+eNc0rgDXYfZWNRCXj+2sk9kGOv2bAVuSx91CRr38Tb7Z17R7pDLOTTeCED
         GaHq+Y0/j64QMNwhLjoYDuxBksCzMPvUzQzPbd8y8QqAJtCW6piswqAsIsbSDGmUbRoQ
         mOCS1h40XghbVBCG0pXKSYuNCVeDB4TTGqcEiuZesHx07KPl/iqV2lpu2NxcfnEFPUsV
         fQqw==
X-Gm-Message-State: APjAAAXB3nbzPN5KZ0GR3UKuXrvLtL0yNUnvWgMXv7OINeNSSehDTu01
        RSZrBLyLSTjLVcAFVyCt8lhpDTFm+AY=
X-Google-Smtp-Source: APXvYqyc9uWshFvh7G4HbPgwxfqt7B4Pj41eoNGwCC+YHoZgPJt2hUZazoCt9m0MIajkqd55iSajvQ==
X-Received: by 2002:a19:f50e:: with SMTP id j14mr15781696lfb.11.1557222257518;
        Tue, 07 May 2019 02:44:17 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u65sm1551516lja.39.2019.05.07.02.44.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2019 02:44:16 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: Update documentation
Date:   Tue,  7 May 2019 11:44:14 +0200
Message-Id: <20190507094414.5101-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Strictify the language a bit, move things around, make proper
headings, mention pull-up and pull-down, expand unreadable
acronyms etc.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Incorporated all changes from Bartosz.
---
 Documentation/driver-api/gpio/driver.rst | 361 ++++++++++++++---------
 1 file changed, 229 insertions(+), 132 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 3043167fc557..1ce7fcd0f989 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -1,10 +1,8 @@
-================================
-GPIO Descriptor Driver Interface
-================================
+=====================
+GPIO Driver Interface
+=====================
 
-This document serves as a guide for GPIO chip drivers writers. Note that it
-describes the new descriptor-based interface. For a description of the
-deprecated integer-based GPIO interface please refer to gpio-legacy.txt.
+This document serves as a guide for writers of GPIO chip drivers.
 
 Each GPIO controller driver needs to include the following header, which defines
 the structures used to define a GPIO driver:
@@ -15,32 +13,49 @@ the structures used to define a GPIO driver:
 Internal Representation of GPIOs
 ================================
 
-Inside a GPIO driver, individual GPIOs are identified by their hardware number,
-which is a unique number between 0 and n, n being the number of GPIOs managed by
-the chip. This number is purely internal: the hardware number of a particular
-GPIO descriptor is never made visible outside of the driver.
-
-On top of this internal number, each GPIO also need to have a global number in
-the integer GPIO namespace so that it can be used with the legacy GPIO
+A GPIO chip handles one or more GPIO lines. To be considered a GPIO chip, the
+lines must conform to the definition: General Purpose Input/Output. If the
+line is not general purpose, it is not GPIO and should not be handled by a
+GPIO chip. The use case is the indicative: certain lines in a system may be
+called GPIO but serve a very particular purpose thus not meeting the criteria
+of a general purpose I/O. On the other hand a LED driver line may be used as a
+GPIO and should therefore still be handled by a GPIO chip driver.
+
+Inside a GPIO driver, individual GPIO lines are identified by their hardware
+number, sometime also referred to as ``offset``, which is a unique number
+between 0 and n-1, n being the number of GPIOs managed by the chip.
+
+The hardware GPIO number should be something intuitive to the hardware, for
+example if a system uses a memory-mapped set of I/O-registers where 32 GPIO
+lines are handled by one bit per line in a 32-bit register, it makes sense to
+use hardware offsets 0..31 for these, corresponding to bits 0..31 in the
+register.
+
+This number is purely internal: the hardware number of a particular GPIO
+line is never made visible outside of the driver.
+
+On top of this internal number, each GPIO line also needs to have a global
+number in the integer GPIO namespace so that it can be used with the legacy GPIO
 interface. Each chip must thus have a "base" number (which can be automatically
-assigned), and for each GPIO the global number will be (base + hardware number).
-Although the integer representation is considered deprecated, it still has many
-users and thus needs to be maintained.
+assigned), and for each GPIO line the global number will be (base + hardware
+number). Although the integer representation is considered deprecated, it still
+has many users and thus needs to be maintained.
 
-So for example one platform could use numbers 32-159 for GPIOs, with a
+So for example one platform could use global numbers 32-159 for GPIOs, with a
 controller defining 128 GPIOs at a "base" of 32 ; while another platform uses
-numbers 0..63 with one set of GPIO controllers, 64-79 with another type of GPIO
-controller, and on one particular board 80-95 with an FPGA. The numbers need not
-be contiguous; either of those platforms could also use numbers 2000-2063 to
-identify GPIOs in a bank of I2C GPIO expanders.
+global numbers 0..63 with one set of GPIO controllers, 64-79 with another type
+of GPIO controller, and on one particular board 80-95 with an FPGA. The legacy
+numbers need not be contiguous; either of those platforms could also use numbers
+2000-2063 to identify GPIO lines in a bank of I2C GPIO expanders.
 
 
 Controller Drivers: gpio_chip
 =============================
 
 In the gpiolib framework each GPIO controller is packaged as a "struct
-gpio_chip" (see linux/gpio/driver.h for its complete definition) with members
-common to each controller of that type:
+gpio_chip" (see <linux/gpio/driver.h> for its complete definition) with members
+common to each controller of that type, these should be assigned by the
+driver code:
 
  - methods to establish GPIO line direction
  - methods used to access GPIO line values
@@ -48,12 +63,12 @@ common to each controller of that type:
  - method to return the IRQ number associated to a given GPIO line
  - flag saying whether calls to its methods may sleep
  - optional line names array to identify lines
- - optional debugfs dump method (showing extra state like pullup config)
+ - optional debugfs dump method (showing extra state information)
  - optional base number (will be automatically assigned if omitted)
  - optional label for diagnostics and GPIO chip mapping using platform data
 
 The code implementing a gpio_chip should support multiple instances of the
-controller, possibly using the driver model. That code will configure each
+controller, preferably using the driver model. That code will configure each
 gpio_chip and issue ``gpiochip_add[_data]()`` or ``devm_gpiochip_add_data()``.
 Removing a GPIO controller should be rare; use ``[devm_]gpiochip_remove()``
 when it is unavoidable.
@@ -62,24 +77,28 @@ Often a gpio_chip is part of an instance-specific structure with states not
 exposed by the GPIO interfaces, such as addressing, power management, and more.
 Chips such as audio codecs will have complex non-GPIO states.
 
-Any debugfs dump method should normally ignore signals which haven't been
-requested as GPIOs. They can use gpiochip_is_requested(), which returns either
-NULL or the label associated with that GPIO when it was requested.
+Any debugfs dump method should normally ignore lines which haven't been
+requested. They can use gpiochip_is_requested(), which returns either
+NULL or the label associated with that GPIO line when it was requested.
 
-RT_FULL: the GPIO driver should not use spinlock_t or any sleepable APIs
-(like PM runtime) in its gpio_chip implementation (.get/.set and direction
-control callbacks) if it is expected to call GPIO APIs from atomic context
-on -RT (inside hard IRQ handlers and similar contexts). Normally this should
-not be required.
+Realtime considerations: the GPIO driver should not use spinlock_t or any
+sleepable APIs (like PM runtime) in its gpio_chip implementation (.get/.set
+and direction control callbacks) if it is expected to call GPIO APIs from
+atomic context on realtime kernels (inside hard IRQ handlers and similar
+contexts). Normally this should not be required.
 
 
 GPIO electrical configuration
 -----------------------------
 
-GPIOs can be configured for several electrical modes of operation by using the
-.set_config() callback. Currently this API supports setting debouncing and
-single-ended modes (open drain/open source). These settings are described
-below.
+GPIO lines can be configured for several electrical modes of operation by using
+the .set_config() callback. Currently this API supports setting:
+
+- Debouncing
+- Single-ended modes (open drain/open source)
+- Pull up and pull down resistor enablement
+
+These settings are described below.
 
 The .set_config() callback uses the same enumerators and configuration
 semantics as the generic pin control drivers. This is not a coincidence: it is
@@ -94,8 +113,8 @@ description needs to provide "GPIO ranges" mapping the GPIO line offsets to pin
 numbers on the pin controller so they can properly cross-reference each other.
 
 
-GPIOs with debounce support
----------------------------
+GPIO lines with debounce support
+--------------------------------
 
 Debouncing is a configuration set to a pin indicating that it is connected to
 a mechanical switch or button, or similar that may bounce. Bouncing means the
@@ -111,8 +130,8 @@ a certain number of milliseconds for debouncing, or just "on/off" if that time
 is not configurable.
 
 
-GPIOs with open drain/source support
-------------------------------------
+GPIO lines with open drain/source support
+-----------------------------------------
 
 Open drain (CMOS) or open collector (TTL) means the line is not actively driven
 high: instead you provide the drain/collector as output, so when the transistor
@@ -132,13 +151,13 @@ This configuration is normally used as a way to achieve one of two things:
 - Level-shifting: to reach a logical level higher than that of the silicon
   where the output resides.
 
-- inverse wire-OR on an I/O line, for example a GPIO line, making it possible
+- Inverse wire-OR on an I/O line, for example a GPIO line, making it possible
   for any driving stage on the line to drive it low even if any other output
   to the same line is simultaneously driving it high. A special case of this
   is driving the SCL and SDA lines of an I2C bus, which is by definition a
   wire-OR bus.
 
-Both usecases require that the line be equipped with a pull-up resistor. This
+Both use cases require that the line be equipped with a pull-up resistor. This
 resistor will make the line tend to high level unless one of the transistors on
 the rail actively pulls it down.
 
@@ -208,27 +227,91 @@ For open source configuration the same principle is used, just that instead
 of actively driving the line low, it is set to input.
 
 
+GPIO lines with pull up/down resistor support
+---------------------------------------------
+
+A GPIO line can support pull-up/down using the .set_config() callback. This
+means that a pull up or pull-down resistor is available on the output of the
+GPIO line, and this resistor is software controlled.
+
+In discrete designs, a pull-up or pull-down resistor is simply soldered on
+the circuit board. This is not something we deal or model in software. The
+most you will think about these lines is that they will very likely be
+configured as open drain or open source (see the section above).
+
+The .set_config() callback can only turn pull up or down on and off, and will
+no have any semantic knowledge about the resistance used. It will only say
+switch a bit in a register enabling or disabling pull-up or pull-down.
+
+If the GPIO line supports shunting in different resistance values for the
+pull-up or pull-down resistor, the GPIO chip callback .set_config() will not
+suffice. For these complex use cases, a combined GPIO chip and pin controller
+need to be implemented, as the pin config interface of a pin controller
+supports more versatile control over electrical properties and can handle
+different pull-up or pull-down resistance values.
+
+
 GPIO drivers providing IRQs
----------------------------
+===========================
+
 It is custom that GPIO drivers (GPIO chips) are also providing interrupts,
 most often cascaded off a parent interrupt controller, and in some special
 cases the GPIO logic is melded with a SoC's primary interrupt controller.
 
-The IRQ portions of the GPIO block are implemented using an irqchip, using
+The IRQ portions of the GPIO block are implemented using an irq_chip, using
 the header <linux/irq.h>. So basically such a driver is utilizing two sub-
 systems simultaneously: gpio and irq.
 
-RT_FULL: a realtime compliant GPIO driver should not use spinlock_t or any
-sleepable APIs (like PM runtime) as part of its irq_chip implementation.
+It is legal for any IRQ consumer to request an IRQ from any irqchip even if it
+is a combined GPIO+IRQ driver. The basic premise is that gpio_chip and
+irq_chip are orthogonal, and offering their services independent of each
+other.
 
-* spinlock_t should be replaced with raw_spinlock_t [1].
-* If sleepable APIs have to be used, these can be done from the .irq_bus_lock()
+gpiod_to_irq() is just a convenience function to figure out the IRQ for a
+certain GPIO line and should not be relied upon to have been called before
+the IRQ is used.
+
+Always prepare the hardware and make it ready for action in respective
+callbacks from the GPIO and irq_chip APIs. Do not rely on gpiod_to_irq() having
+been called first.
+
+We can divide GPIO irqchips in two broad categories:
+
+- CASCADED INTERRUPT CHIPS: this means that the GPIO chip has one common
+  interrupt output line, which is triggered by any enabled GPIO line on that
+  chip. The interrupt output line will then be routed to an parent interrupt
+  controller one level up, in the most simple case the systems primary
+  interrupt controller. This is modeled by an irqchip that will inspect bits
+  inside the GPIO controller to figure out which line fired it. The irqchip
+  part of the driver needs to inspect registers to figure this out and it
+  will likely also need to acknowledge that it is handling the interrupt
+  by clearing some bit (sometime implicitly, by just reading a status
+  register) and it will often need to set up the configuration such as
+  edge sensitivity (rising or falling edge, or high/low level interrupt for
+  example).
+
+- HIERARCHICAL INTERRUPT CHIPS: this means that each GPIO line has a dedicated
+  irq line to a parent interrupt controller one level up. There is no need
+  to inquire the GPIO hardware to figure out which line has figured, but it
+  may still be necessary to acknowledge the interrupt and set up the
+  configuration such as edge sensitivity.
+
+Realtime considerations: a realtime compliant GPIO driver should not use
+spinlock_t or any sleepable APIs (like PM runtime) as part of its irqchip
+implementation.
+
+- spinlock_t should be replaced with raw_spinlock_t [1].
+- If sleepable APIs have to be used, these can be done from the .irq_bus_lock()
   and .irq_bus_unlock() callbacks, as these are the only slowpath callbacks
   on an irqchip. Create the callbacks if needed [2].
 
-GPIO irqchips usually fall in one of two categories:
 
-* CHAINED GPIO irqchips: these are usually the type that is embedded on
+Cascaded GPIO irqchips
+----------------------
+
+Cascaded GPIO irqchips usually fall in one of three categories:
+
+- CHAINED CASCADED GPIO IRQCHIPS: these are usually the type that is embedded on
   an SoC. This means that there is a fast IRQ flow handler for the GPIOs that
   gets called in a chain from the parent IRQ handler, most typically the
   system interrupt controller. This means that the GPIO irqchip handler will
@@ -245,16 +328,19 @@ GPIO irqchips usually fall in one of two categories:
   struct gpio_chip, as everything happens directly in the callbacks: no
   slow bus traffic like I2C can be used.
 
-  RT_FULL: Note, chained IRQ handlers will not be forced threaded on -RT.
-  As result, spinlock_t or any sleepable APIs (like PM runtime) can't be used
-  in chained IRQ handler.
-  If required (and if it can't be converted to the nested threaded GPIO irqchip)
-  a chained IRQ handler can be converted to generic irq handler and this way
-  it will be a threaded IRQ handler on -RT and a hard IRQ handler on non-RT
-  (for example, see [3]).
-  Know W/A: The generic_handle_irq() is expected to be called with IRQ disabled,
+  Realtime considerations: Note that chained IRQ handlers will not be forced
+  threaded on -RT. As a result, spinlock_t or any sleepable APIs (like PM
+  runtime) can't be used in a chained IRQ handler.
+
+  If required (and if it can't be converted to the nested threaded GPIO irqchip,
+  see below) a chained IRQ handler can be converted to generic irq handler and
+  this way it will become a threaded IRQ handler on -RT and a hard IRQ handler
+  on non-RT (for example, see [3]).
+
+  The generic_handle_irq() is expected to be called with IRQ disabled,
   so the IRQ core will complain if it is called from an IRQ handler which is
-  forced to a thread. The "fake?" raw lock can be used to W/A this problem::
+  forced to a thread. The "fake?" raw lock can be used to work around this
+  problem::
 
 	raw_spinlock_t wa_lock;
 	static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
@@ -263,7 +349,7 @@ GPIO irqchips usually fall in one of two categories:
 		generic_handle_irq(irq_find_mapping(bank->chip.irq.domain, bit));
 		raw_spin_unlock_irqrestore(&bank->wa_lock, wa_lock_flags);
 
-* GENERIC CHAINED GPIO irqchips: these are the same as "CHAINED GPIO irqchips",
+- GENERIC CHAINED GPIO IRQCHIPS: these are the same as "CHAINED GPIO irqchips",
   but chained IRQ handlers are not used. Instead GPIO IRQs dispatching is
   performed by generic IRQ handler which is configured using request_irq().
   The GPIO irqchip will then end up calling something like this sequence in
@@ -273,16 +359,19 @@ GPIO irqchips usually fall in one of two categories:
         for each detected GPIO IRQ
             generic_handle_irq(...);
 
-  RT_FULL: Such kind of handlers will be forced threaded on -RT, as result IRQ
-  core will complain that generic_handle_irq() is called with IRQ enabled and
-  the same W/A as for "CHAINED GPIO irqchips" can be applied.
+  Realtime considerations: this kind of handlers will be forced threaded on -RT,
+  and as result the IRQ core will complain that generic_handle_irq() is called
+  with IRQ enabled and the same work around as for "CHAINED GPIO irqchips" can
+  be applied.
+
+- NESTED THREADED GPIO IRQCHIPS: these are off-chip GPIO expanders and any
+  other GPIO irqchip residing on the other side of a sleeping bus such as I2C
+  or SPI.
 
-* NESTED THREADED GPIO irqchips: these are off-chip GPIO expanders and any
-  other GPIO irqchip residing on the other side of a sleeping bus. Of course
-  such drivers that need slow bus traffic to read out IRQ status and similar,
-  traffic which may in turn incur other IRQs to happen, cannot be handled
-  in a quick IRQ handler with IRQs disabled. Instead they need to spawn a
-  thread and then mask the parent IRQ line until the interrupt is handled
+  Of course such drivers that need slow bus traffic to read out IRQ status and
+  similar, traffic which may in turn incur other IRQs to happen, cannot be
+  handled in a quick IRQ handler with IRQs disabled. Instead they need to spawn
+  a thread and then mask the parent IRQ line until the interrupt is handled
   by the driver. The hallmark of this driver is to call something like
   this in its interrupt handler::
 
@@ -294,36 +383,46 @@ GPIO irqchips usually fall in one of two categories:
   flag on struct gpio_chip to true, indicating that this chip may sleep
   when accessing the GPIOs.
 
+  These kinds of irqchips are inherently realtime tolerant as they are
+  already set up to handle sleeping contexts.
+
+
+Infrastructure helpers for GPIO irqchips
+----------------------------------------
+
 To help out in handling the set-up and management of GPIO irqchips and the
 associated irqdomain and resource allocation callbacks, the gpiolib has
 some helpers that can be enabled by selecting the GPIOLIB_IRQCHIP Kconfig
 symbol:
 
-* gpiochip_irqchip_add(): adds a chained irqchip to a gpiochip. It will pass
-  the struct gpio_chip* for the chip to all IRQ callbacks, so the callbacks
-  need to embed the gpio_chip in its state container and obtain a pointer
-  to the container using container_of().
+- gpiochip_irqchip_add(): adds a chained cascaded irqchip to a gpiochip. It
+  will pass the struct gpio_chip* for the chip to all IRQ callbacks, so the
+  callbacks need to embed the gpio_chip in its state container and obtain a
+  pointer to the container using container_of().
   (See Documentation/driver-model/design-patterns.txt)
 
-* gpiochip_irqchip_add_nested(): adds a nested irqchip to a gpiochip.
+- gpiochip_irqchip_add_nested(): adds a nested cascaded irqchip to a gpiochip,
+  as discussed above regarding different types of cascaded irqchips. The
+  cascaded irq has to be handled by a threaded interrupt handler.
   Apart from that it works exactly like the chained irqchip.
 
-* gpiochip_set_chained_irqchip(): sets up a chained irq handler for a
+- gpiochip_set_chained_irqchip(): sets up a chained cascaded irq handler for a
   gpio_chip from a parent IRQ and passes the struct gpio_chip* as handler
-  data. (Notice handler data, since the irqchip data is likely used by the
-  parent irqchip!).
+  data. Notice that we pass is as the handler data, since the irqchip data is
+  likely used by the parent irqchip.
 
-* gpiochip_set_nested_irqchip(): sets up a nested irq handler for a
+- gpiochip_set_nested_irqchip(): sets up a nested cascaded irq handler for a
   gpio_chip from a parent IRQ. As the parent IRQ has usually been
   explicitly requested by the driver, this does very little more than
   mark all the child IRQs as having the other IRQ as parent.
 
-If there is a need to exclude certain GPIOs from the IRQ domain, you can
-set .irq.need_valid_mask of the gpiochip before gpiochip_add_data() is
-called. This allocates an .irq.valid_mask with as many bits set as there
-are GPIOs in the chip. Drivers can exclude GPIOs by clearing bits from this
-mask. The mask must be filled in before gpiochip_irqchip_add() or
-gpiochip_irqchip_add_nested() is called.
+If there is a need to exclude certain GPIO lines from the IRQ domain handled by
+these helpers, we can set .irq.need_valid_mask of the gpiochip before
+[devm_]gpiochip_add_data() is called. This allocates an .irq.valid_mask with as
+many bits set as there are GPIO lines in the chip, each bit representing line
+0..n-1. Drivers can exclude GPIO lines by clearing bits from this mask. The mask
+must be filled in before gpiochip_irqchip_add() or gpiochip_irqchip_add_nested()
+is called.
 
 To use the helpers please keep the following in mind:
 
@@ -333,33 +432,24 @@ To use the helpers please keep the following in mind:
 
 - Nominally set all handlers to handle_bad_irq() in the setup call and pass
   handle_bad_irq() as flow handler parameter in gpiochip_irqchip_add() if it is
-  expected for GPIO driver that irqchip .set_type() callback have to be called
-  before using/enabling GPIO IRQ. Then set the handler to handle_level_irq()
-  and/or handle_edge_irq() in the irqchip .set_type() callback depending on
-  what your controller supports.
+  expected for GPIO driver that irqchip .set_type() callback will be called
+  before using/enabling each GPIO IRQ. Then set the handler to
+  handle_level_irq() and/or handle_edge_irq() in the irqchip .set_type()
+  callback depending on what your controller supports and what is requested
+  by the consumer.
 
-It is legal for any IRQ consumer to request an IRQ from any irqchip no matter
-if that is a combined GPIO+IRQ driver. The basic premise is that gpio_chip and
-irq_chip are orthogonal, and offering their services independent of each
-other.
-
-gpiod_to_irq() is just a convenience function to figure out the IRQ for a
-certain GPIO line and should not be relied upon to have been called before
-the IRQ is used.
 
-So always prepare the hardware and make it ready for action in respective
-callbacks from the GPIO and irqchip APIs. Do not rely on gpiod_to_irq() having
-been called first.
+Locking IRQ usage
+-----------------
 
-This orthogonality leads to ambiguities that we need to solve: if there is
-competition inside the subsystem which side is using the resource (a certain
-GPIO line and register for example) it needs to deny certain operations and
-keep track of usage inside of the gpiolib subsystem. This is why the API
-below exists.
+Since GPIO and irq_chip are orthogonal, we can get conflicts between different
+use cases. For example a GPIO line used for IRQs should be an input line,
+it does not make sense to fire interrupts on an output GPIO.
 
+If there is competition inside the subsystem which side is using the
+resource (a certain GPIO line and register for example) it needs to deny
+certain operations and keep track of usage inside of the gpiolib subsystem.
 
-Locking IRQ usage
------------------
 Input GPIOs can be used as IRQ signals. When this happens, a driver is requested
 to mark the GPIO as being used as an IRQ::
 
@@ -380,9 +470,15 @@ assigned.
 
 Disabling and enabling IRQs
 ---------------------------
+
+In some (fringe) use cases, a driver may be using a GPIO line as input for IRQs,
+but occasionally switch that line over to drive output and then back to being
+an input with interrupts again. This happens on things like CEC (Consumer
+Electronics Control).
+
 When a GPIO is used as an IRQ signal, then gpiolib also needs to know if
 the IRQ is enabled or disabled. In order to inform gpiolib about this,
-a driver should call::
+the irqchip driver should call::
 
 	void gpiochip_disable_irq(struct gpio_chip *chip, unsigned int offset)
 
@@ -398,40 +494,45 @@ irqchip.
 When using the gpiolib irqchip helpers, these callbacks are automatically
 assigned.
 
+
 Real-Time compliance for GPIO IRQ chips
 ---------------------------------------
 
-Any provider of irqchips needs to be carefully tailored to support Real Time
+Any provider of irqchips needs to be carefully tailored to support Real-Time
 preemption. It is desirable that all irqchips in the GPIO subsystem keep this
 in mind and do the proper testing to assure they are real time-enabled.
-So, pay attention on above " RT_FULL:" notes, please.
-The following is a checklist to follow when preparing a driver for real
-time-compliance:
 
-- ensure spinlock_t is not used as part irq_chip implementation;
-- ensure that sleepable APIs are not used as part irq_chip implementation.
+So, pay attention on above realtime considerations in the documentation.
+
+The following is a checklist to follow when preparing a driver for real-time
+compliance:
+
+- ensure spinlock_t is not used as part irq_chip implementation
+- ensure that sleepable APIs are not used as part irq_chip implementation
   If sleepable APIs have to be used, these can be done from the .irq_bus_lock()
-  and .irq_bus_unlock() callbacks;
+  and .irq_bus_unlock() callbacks
 - Chained GPIO irqchips: ensure spinlock_t or any sleepable APIs are not used
-  from chained IRQ handler;
+  from the chained IRQ handler
 - Generic chained GPIO irqchips: take care about generic_handle_irq() calls and
-  apply corresponding W/A;
-- Chained GPIO irqchips: get rid of chained IRQ handler and use generic irq
-  handler if possible :)
-- regmap_mmio: Sry, but you are in trouble :( if MMIO regmap is used as for
-  GPIO IRQ chip implementation;
-- Test your driver with the appropriate in-kernel real time test cases for both
-  level and edge IRQs.
+  apply corresponding work-around
+- Chained GPIO irqchips: get rid of the chained IRQ handler and use generic irq
+  handler if possible
+- regmap_mmio: it is possible to disable internal locking in regmap by setting
+  .disable_locking and handling the locking in the GPIO driver
+- Test your driver with the appropriate in-kernel real-time test cases for both
+  level and edge IRQs
+
+* [1] http://www.spinics.net/lists/linux-omap/msg120425.html
+* [2] https://lkml.org/lkml/2015/9/25/494
+* [3] https://lkml.org/lkml/2015/9/25/495
 
 
 Requesting self-owned GPIO pins
--------------------------------
+===============================
 
 Sometimes it is useful to allow a GPIO chip driver to request its own GPIO
-descriptors through the gpiolib API. Using gpio_request() for this purpose
-does not help since it pins the module to the kernel forever (it calls
-try_module_get()). A GPIO driver can use the following functions instead
-to request and free descriptors without being pinned to the kernel forever::
+descriptors through the gpiolib API. A GPIO driver can use the following
+functions to request and free descriptors::
 
 	struct gpio_desc *gpiochip_request_own_desc(struct gpio_desc *desc,
 						    u16 hwnum,
@@ -446,7 +547,3 @@ gpiochip_free_own_desc().
 These functions must be used with care since they do not affect module use
 count. Do not use the functions to request gpio descriptors not owned by the
 calling driver.
-
-* [1] http://www.spinics.net/lists/linux-omap/msg120425.html
-* [2] https://lkml.org/lkml/2015/9/25/494
-* [3] https://lkml.org/lkml/2015/9/25/495
-- 
2.20.1

