Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C26851E468
	for <lists+linux-gpio@lfdr.de>; Sat,  7 May 2022 07:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445564AbiEGFeZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 May 2022 01:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445721AbiEGFdJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 May 2022 01:33:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4567C719C7;
        Fri,  6 May 2022 22:27:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A206BB8015A;
        Sat,  7 May 2022 05:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138C8C385A6;
        Sat,  7 May 2022 05:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651901262;
        bh=lzeGR8ll1bjvqTHfed0cq25GEnBSFtqv9ldqBWypF0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B9aIxrW5ypVyXA+hVNH/1zGIT3+RLKhh0fCyEZI9SKvJsPUOr8cbl/bdQHihNK5Nt
         C2Ou0moPNawbkx+DJuxEBIFnmYo1jOuacg61l51YzYbfWQ8whg3nhlM5yfSp2/F3Tg
         8448Jx7dErbsdblLo2fkNnKd3QnfMGei9+lCDG1GNRKQhXHFYqm4UZeApauv4APTd3
         6A+/WLgY2U8d6teTrQNv9CNbLkCgHT9QxxPpqKiogTSEW4zb8NwNoZBrTc/UDbQu8I
         b0GTeXdgLCZWrNsrb1eRpk0PASQnVZ+lL/Li9if3SY4SNDFHmn2BrNVEWSjfVdxc5Z
         6G8hV+RJmoEPA==
From:   Miguel Ojeda <ojeda@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: [PATCH v6 22/23] [RFC] drivers: gpio: PrimeCell PL061 in Rust
Date:   Sat,  7 May 2022 07:24:20 +0200
Message-Id: <20220507052451.12890-23-ojeda@kernel.org>
In-Reply-To: <20220507052451.12890-1-ojeda@kernel.org>
References: <20220507052451.12890-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Wedson Almeida Filho <wedsonaf@google.com>

A port to Rust of the PrimeCell PL061 GPIO driver.

This module is a work in progress and will be sent for review later
on, as well as separately from the Rust support.

However, it is included to show how an actual working module
written in Rust may look like.

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpio/Kconfig            |   8 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio_pl061_rust.rs | 370 ++++++++++++++++++++++++++++++++
 3 files changed, 379 insertions(+)
 create mode 100644 drivers/gpio/gpio_pl061_rust.rs

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 45764ec3b2eb..ad99b96f6d79 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -481,6 +481,14 @@ config GPIO_PL061
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device.
 
+config GPIO_PL061_RUST
+	tristate "PrimeCell PL061 GPIO support written in Rust"
+	depends on ARM_AMBA && RUST
+	select IRQ_DOMAIN
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the PrimeCell PL061 GPIO device
+
 config GPIO_PMIC_EIC_SPRD
 	tristate "Spreadtrum PMIC EIC support"
 	depends on MFD_SC27XX_PMIC || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 14352f6dfe8e..30141fec12be 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -118,6 +118,7 @@ obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
 obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
+obj-$(CONFIG_GPIO_PL061_RUST)		+= gpio_pl061_rust.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
diff --git a/drivers/gpio/gpio_pl061_rust.rs b/drivers/gpio/gpio_pl061_rust.rs
new file mode 100644
index 000000000000..13c8c3eb3e4f
--- /dev/null
+++ b/drivers/gpio/gpio_pl061_rust.rs
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Driver for the ARM PrimeCell(tm) General Purpose Input/Output (PL061).
+//!
+//! Based on the C driver written by Baruch Siach <baruch@tkos.co.il>.
+
+use kernel::{
+    amba, bit, bits_iter, define_amba_id_table, device, gpio,
+    io_mem::IoMem,
+    irq::{self, ExtraResult, IrqData, LockedIrqData},
+    power,
+    prelude::*,
+    sync::{RawSpinLock, Ref, RefBorrow},
+};
+
+const GPIODIR: usize = 0x400;
+const GPIOIS: usize = 0x404;
+const GPIOIBE: usize = 0x408;
+const GPIOIEV: usize = 0x40C;
+const GPIOIE: usize = 0x410;
+const GPIOMIS: usize = 0x418;
+const GPIOIC: usize = 0x41C;
+const GPIO_SIZE: usize = 0x1000;
+
+const PL061_GPIO_NR: u16 = 8;
+
+#[derive(Default)]
+struct ContextSaveRegs {
+    gpio_data: u8,
+    gpio_dir: u8,
+    gpio_is: u8,
+    gpio_ibe: u8,
+    gpio_iev: u8,
+    gpio_ie: u8,
+}
+
+#[derive(Default)]
+struct PL061DataInner {
+    csave_regs: ContextSaveRegs,
+}
+
+struct PL061Data {
+    dev: device::Device,
+    inner: RawSpinLock<PL061DataInner>,
+}
+
+struct PL061Resources {
+    base: IoMem<GPIO_SIZE>,
+    parent_irq: u32,
+}
+
+type PL061Registrations = gpio::RegistrationWithIrqChip<PL061Device>;
+
+type DeviceData = device::Data<PL061Registrations, PL061Resources, PL061Data>;
+
+struct PL061Device;
+
+impl gpio::Chip for PL061Device {
+    type Data = Ref<DeviceData>;
+
+    kernel::declare_gpio_chip_operations!(
+        get_direction,
+        direction_input,
+        direction_output,
+        get,
+        set
+    );
+
+    fn get_direction(data: RefBorrow<'_, DeviceData>, offset: u32) -> Result<gpio::LineDirection> {
+        let pl061 = data.resources().ok_or(ENXIO)?;
+        Ok(if pl061.base.readb(GPIODIR) & bit(offset) != 0 {
+            gpio::LineDirection::Out
+        } else {
+            gpio::LineDirection::In
+        })
+    }
+
+    fn direction_input(data: RefBorrow<'_, DeviceData>, offset: u32) -> Result {
+        let _guard = data.inner.lock_irqdisable();
+        let pl061 = data.resources().ok_or(ENXIO)?;
+        let mut gpiodir = pl061.base.readb(GPIODIR);
+        gpiodir &= !bit(offset);
+        pl061.base.writeb(gpiodir, GPIODIR);
+        Ok(())
+    }
+
+    fn direction_output(data: RefBorrow<'_, DeviceData>, offset: u32, value: bool) -> Result {
+        let woffset = bit(offset + 2).into();
+        let _guard = data.inner.lock_irqdisable();
+        let pl061 = data.resources().ok_or(ENXIO)?;
+        pl061.base.try_writeb((value as u8) << offset, woffset)?;
+        let mut gpiodir = pl061.base.readb(GPIODIR);
+        gpiodir |= bit(offset);
+        pl061.base.writeb(gpiodir, GPIODIR);
+
+        // gpio value is set again, because pl061 doesn't allow to set value of a gpio pin before
+        // configuring it in OUT mode.
+        pl061.base.try_writeb((value as u8) << offset, woffset)?;
+        Ok(())
+    }
+
+    fn get(data: RefBorrow<'_, DeviceData>, offset: u32) -> Result<bool> {
+        let pl061 = data.resources().ok_or(ENXIO)?;
+        Ok(pl061.base.try_readb(bit(offset + 2).into())? != 0)
+    }
+
+    fn set(data: RefBorrow<'_, DeviceData>, offset: u32, value: bool) {
+        if let Some(pl061) = data.resources() {
+            let woffset = bit(offset + 2).into();
+            let _ = pl061.base.try_writeb((value as u8) << offset, woffset);
+        }
+    }
+}
+
+impl gpio::ChipWithIrqChip for PL061Device {
+    fn handle_irq_flow(
+        data: RefBorrow<'_, DeviceData>,
+        desc: &irq::Descriptor,
+        domain: &irq::Domain,
+    ) {
+        let chained = desc.enter_chained();
+
+        if let Some(pl061) = data.resources() {
+            let pending = pl061.base.readb(GPIOMIS);
+            for offset in bits_iter(pending) {
+                domain.generic_handle_chained(offset, &chained);
+            }
+        }
+    }
+}
+
+impl irq::Chip for PL061Device {
+    type Data = Ref<DeviceData>;
+
+    kernel::declare_irq_chip_operations!(set_type, set_wake);
+
+    fn set_type(
+        data: RefBorrow<'_, DeviceData>,
+        irq_data: &mut LockedIrqData,
+        trigger: u32,
+    ) -> Result<ExtraResult> {
+        let offset = irq_data.hwirq();
+        let bit = bit(offset);
+
+        if offset >= PL061_GPIO_NR.into() {
+            return Err(EINVAL);
+        }
+
+        if trigger & (irq::Type::LEVEL_HIGH | irq::Type::LEVEL_LOW) != 0
+            && trigger & (irq::Type::EDGE_RISING | irq::Type::EDGE_FALLING) != 0
+        {
+            dev_err!(
+                data.dev,
+                "trying to configure line {} for both level and edge detection, choose one!\n",
+                offset
+            );
+            return Err(EINVAL);
+        }
+
+        let _guard = data.inner.lock_irqdisable();
+        let pl061 = data.resources().ok_or(ENXIO)?;
+
+        let mut gpioiev = pl061.base.readb(GPIOIEV);
+        let mut gpiois = pl061.base.readb(GPIOIS);
+        let mut gpioibe = pl061.base.readb(GPIOIBE);
+
+        if trigger & (irq::Type::LEVEL_HIGH | irq::Type::LEVEL_LOW) != 0 {
+            let polarity = trigger & irq::Type::LEVEL_HIGH != 0;
+
+            // Disable edge detection.
+            gpioibe &= !bit;
+            // Enable level detection.
+            gpiois |= bit;
+            // Select polarity.
+            if polarity {
+                gpioiev |= bit;
+            } else {
+                gpioiev &= !bit;
+            }
+            irq_data.set_level_handler();
+            dev_dbg!(
+                data.dev,
+                "line {}: IRQ on {} level\n",
+                offset,
+                if polarity { "HIGH" } else { "LOW" }
+            );
+        } else if (trigger & irq::Type::EDGE_BOTH) == irq::Type::EDGE_BOTH {
+            // Disable level detection.
+            gpiois &= !bit;
+            // Select both edges, settings this makes GPIOEV be ignored.
+            gpioibe |= bit;
+            irq_data.set_edge_handler();
+            dev_dbg!(data.dev, "line {}: IRQ on both edges\n", offset);
+        } else if trigger & (irq::Type::EDGE_RISING | irq::Type::EDGE_FALLING) != 0 {
+            let rising = trigger & irq::Type::EDGE_RISING != 0;
+
+            // Disable level detection.
+            gpiois &= !bit;
+            // Clear detection on both edges.
+            gpioibe &= !bit;
+            // Select edge.
+            if rising {
+                gpioiev |= bit;
+            } else {
+                gpioiev &= !bit;
+            }
+            irq_data.set_edge_handler();
+            dev_dbg!(
+                data.dev,
+                "line {}: IRQ on {} edge\n",
+                offset,
+                if rising { "RISING" } else { "FALLING}" }
+            );
+        } else {
+            // No trigger: disable everything.
+            gpiois &= !bit;
+            gpioibe &= !bit;
+            gpioiev &= !bit;
+            irq_data.set_bad_handler();
+            dev_warn!(data.dev, "no trigger selected for line {}\n", offset);
+        }
+
+        pl061.base.writeb(gpiois, GPIOIS);
+        pl061.base.writeb(gpioibe, GPIOIBE);
+        pl061.base.writeb(gpioiev, GPIOIEV);
+
+        Ok(ExtraResult::None)
+    }
+
+    fn mask(data: RefBorrow<'_, DeviceData>, irq_data: &IrqData) {
+        let mask = bit(irq_data.hwirq() % irq::HwNumber::from(PL061_GPIO_NR));
+        let _guard = data.inner.lock();
+        if let Some(pl061) = data.resources() {
+            let gpioie = pl061.base.readb(GPIOIE) & !mask;
+            pl061.base.writeb(gpioie, GPIOIE);
+        }
+    }
+
+    fn unmask(data: RefBorrow<'_, DeviceData>, irq_data: &IrqData) {
+        let mask = bit(irq_data.hwirq() % irq::HwNumber::from(PL061_GPIO_NR));
+        let _guard = data.inner.lock();
+        if let Some(pl061) = data.resources() {
+            let gpioie = pl061.base.readb(GPIOIE) | mask;
+            pl061.base.writeb(gpioie, GPIOIE);
+        }
+    }
+
+    // This gets called from the edge IRQ handler to ACK the edge IRQ in the GPIOIC
+    // (interrupt-clear) register. For level IRQs this is not needed: these go away when the level
+    // signal goes away.
+    fn ack(data: RefBorrow<'_, DeviceData>, irq_data: &IrqData) {
+        let mask = bit(irq_data.hwirq() % irq::HwNumber::from(PL061_GPIO_NR));
+        let _guard = data.inner.lock();
+        if let Some(pl061) = data.resources() {
+            pl061.base.writeb(mask.into(), GPIOIC);
+        }
+    }
+
+    fn set_wake(data: RefBorrow<'_, DeviceData>, _irq_data: &IrqData, on: bool) -> Result {
+        let pl061 = data.resources().ok_or(ENXIO)?;
+        irq::set_wake(pl061.parent_irq, on)
+    }
+}
+
+impl amba::Driver for PL061Device {
+    type Data = Ref<DeviceData>;
+    type PowerOps = Self;
+
+    define_amba_id_table! {(), [
+        ({id: 0x00041061, mask: 0x000fffff}, None),
+    ]}
+
+    fn probe(dev: &mut amba::Device, _data: Option<&Self::IdInfo>) -> Result<Ref<DeviceData>> {
+        let res = dev.take_resource().ok_or(ENXIO)?;
+        let irq = dev.irq(0).ok_or(ENXIO)?;
+
+        let mut data = kernel::new_device_data!(
+            gpio::RegistrationWithIrqChip::new(),
+            PL061Resources {
+                // SAFETY: This device doesn't support DMA.
+                base: unsafe { IoMem::try_new(res)? },
+                parent_irq: irq,
+            },
+            PL061Data {
+                dev: device::Device::from_dev(dev),
+                // SAFETY: We call `rawspinlock_init` below.
+                inner: unsafe { RawSpinLock::new(PL061DataInner::default()) },
+            },
+            "PL061::Registrations"
+        )?;
+
+        // SAFETY: General part of the data is pinned when `data` is.
+        let gen_inner = unsafe { data.as_mut().map_unchecked_mut(|d| &mut (**d).inner) };
+        kernel::rawspinlock_init!(gen_inner, "PL061Data::inner");
+
+        let data = Ref::<DeviceData>::from(data);
+
+        data.resources().ok_or(ENXIO)?.base.writeb(0, GPIOIE); // disable irqs
+
+        data.registrations()
+            .ok_or(ENXIO)?
+            .as_pinned_mut()
+            .register::<Self>(PL061_GPIO_NR, None, dev, data.clone(), irq)?;
+
+        dev_info!(data.dev, "PL061 GPIO chip registered\n");
+
+        Ok(data)
+    }
+}
+
+impl power::Operations for PL061Device {
+    type Data = Ref<DeviceData>;
+
+    fn suspend(data: RefBorrow<'_, DeviceData>) -> Result {
+        let mut inner = data.inner.lock();
+        let pl061 = data.resources().ok_or(ENXIO)?;
+        inner.csave_regs.gpio_data = 0;
+        inner.csave_regs.gpio_dir = pl061.base.readb(GPIODIR);
+        inner.csave_regs.gpio_is = pl061.base.readb(GPIOIS);
+        inner.csave_regs.gpio_ibe = pl061.base.readb(GPIOIBE);
+        inner.csave_regs.gpio_iev = pl061.base.readb(GPIOIEV);
+        inner.csave_regs.gpio_ie = pl061.base.readb(GPIOIE);
+
+        for offset in 0..PL061_GPIO_NR {
+            if inner.csave_regs.gpio_dir & bit(offset) != 0 {
+                if let Ok(v) = <Self as gpio::Chip>::get(data, offset.into()) {
+                    inner.csave_regs.gpio_data |= (v as u8) << offset;
+                }
+            }
+        }
+
+        Ok(())
+    }
+
+    fn resume(data: RefBorrow<'_, DeviceData>) -> Result {
+        let inner = data.inner.lock();
+        let pl061 = data.resources().ok_or(ENXIO)?;
+
+        for offset in 0..PL061_GPIO_NR {
+            if inner.csave_regs.gpio_dir & bit(offset) != 0 {
+                let value = inner.csave_regs.gpio_data & bit(offset) != 0;
+                let _ = <Self as gpio::Chip>::direction_output(data, offset.into(), value);
+            } else {
+                let _ = <Self as gpio::Chip>::direction_input(data, offset.into());
+            }
+        }
+
+        pl061.base.writeb(inner.csave_regs.gpio_is, GPIOIS);
+        pl061.base.writeb(inner.csave_regs.gpio_ibe, GPIOIBE);
+        pl061.base.writeb(inner.csave_regs.gpio_iev, GPIOIEV);
+        pl061.base.writeb(inner.csave_regs.gpio_ie, GPIOIE);
+
+        Ok(())
+    }
+
+    fn freeze(data: RefBorrow<'_, DeviceData>) -> Result {
+        Self::suspend(data)
+    }
+
+    fn restore(data: RefBorrow<'_, DeviceData>) -> Result {
+        Self::resume(data)
+    }
+}
+
+module_amba_driver! {
+    type: PL061Device,
+    name: b"pl061_gpio",
+    author: b"Wedson Almeida Filho",
+    license: b"GPL v2",
+}
-- 
2.35.3

