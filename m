Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442701E0AB2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389523AbgEYJf0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388437AbgEYJf0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:35:26 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86C8C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:35:24 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id z80so17026924qka.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9/WjjAH16JogwAqKuItAZP3hFkClHLr1AGEJnOfpiNo=;
        b=c0NAVYnDrmDih5NYIQAtkiHLurrkB+lsrDtHqvtG8s5ODFg2Qz5f3MAwLL92sn5/Xh
         qcvjS0kVXBFn/ZKjKQAqclAi7r93eFMcNg860G/yv2DG1fEGPqioz68kHaTPxpMoTrT2
         j0OiiqUK047B8HYLuTEL8aDOeHrSGgqxxmYM+Z8w5TdIShk9gLtTibG0OZAvIIoZfzrK
         s1Q6HTj/9EBkQn8IFlvQi86z5px6jv5Oyh/AsKOQ6UOegH7DA/pl/B6XULIjxyrFl4Kl
         XUSUusIecnM5gl1y6fMSlNcRLTYeM4NyU5CYLEaEDf9uuW+61zYDcH6tuhN8MyIc2SBT
         UGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9/WjjAH16JogwAqKuItAZP3hFkClHLr1AGEJnOfpiNo=;
        b=WLiQ1r+g/SVCFU5/Lrc8QMFQzVPyXHQsG+NIGvxXD2Ko00W1nHZABJh/j+U9SRT+MR
         fPKg+/EpT+YCPzJhe/Ptob7+hYzwXduXmbrTcBEHLoWSNDIDn3d7+TOWzpjY4U+JPwme
         2LIMO06ASdp2MMQ8Sfkhge2kU8vWefnCH2ltu59zw0sPnhO6xMMIZwtlHpjuaIe9uHAA
         U96o7NNGY1bKuTjk6zlRGIfKl3GSo+H92EXIXXte2crB6ewCN1usm1KDT3x8jwhRLQ9Q
         5kl+MCJhKEZFWsuQluQPGn5irlpEq5QJO7jdYrZ4x8mzlNbTQ1FEOHSTa+JmU1Rn8Vuk
         Hg3g==
X-Gm-Message-State: AOAM531TU9DJI7aDpy2cPMECLw1jnJyxqV7mHRoVColLzlHKfD9xU71q
        LuK7hPWuGsON0vZaIc1Nbs9HAYBf2cgKh5HQTUrcnw==
X-Google-Smtp-Source: ABdhPJy94ZUpn2zLsQhbAZR6LLlGLHwRwS1nilF++9nPJOFrQ/bLjSt4UrBL0oJT5JuQMuz9xQSuvL+jmi7Co2AzyGw=
X-Received: by 2002:a37:5b47:: with SMTP id p68mr26416158qkb.120.1590399324049;
 Mon, 25 May 2020 02:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200525054833.28995-1-saraon640529@gmail.com>
In-Reply-To: <20200525054833.28995-1-saraon640529@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 May 2020 11:35:13 +0200
Message-ID: <CAMpxmJVuxqfX9V18F9jXba+ta4Dc1-hBX25jiyuK=wzxB=JbZg@mail.gmail.com>
Subject: Re: [PATCH] GPIO: Submit a new GPIO driver
To:     Richard Hsu <saraon640529@gmail.com>
Cc:     Richard_Hsu@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
        Andrew_Su@asmedia.com.tw, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 25 maj 2020 o 07:48 Richard Hsu <saraon640529@gmail.com> napisa=C5=82=
(a):
>
> This driver provide GPIO functionality on Asmedia 28XX and 18XX PCI-E
> Bridge

Hi Richard,

please make the commit subject more explicit: it should be "gpio:
<name of the driver>: new driver/add support" or something similar.

>
> Signed-off-by: Richard Hsu <saraon640529@gmail.com>
> ---
>  patch | 312 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 312 insertions(+)
>  create mode 100644 patch
>
> diff --git a/patch b/patch
> index 0000000..a713f91
> --- /dev/null
> +++ b/patch
> @@ -0,0 +1,312 @@
> +diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/dri=
vers/gpio/gpio-asm28xx-18xx.c linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28=
xx-18xx.c
> +--- linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c   1970-01-01 08:00:=
00.000000000 +0800
> ++++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c     2020-05-2=
2 11:55:13.736272177 +0800
> +@@ -0,0 +1,282 @@
> ++// SPDX-License-Identifier: GPL-2.0-only
> ++/*
> ++ * Asmedia 28xx/18xx GPIO driver
> ++ *
> ++ * Copyright (C) 2020 ASMedia Technology Inc.
> ++ * Author: Richard Hsu <Richard_Hsu@asmedia.com.tw>
> ++ */
> ++
> ++
> ++#include <linux/module.h>
> ++#include <linux/kernel.h>
> ++#include <linux/gpio/driver.h>
> ++#include <linux/pci.h>
> ++#include <linux/spinlock.h>
> ++#include <linux/pm_runtime.h>
> ++
> ++
> ++/* GPIO registers offsets */
> ++#define ASM_GPIO_CTRL         0x920
> ++#define ASM_GPIO_OUTPUT               0x928
> ++#define ASM_GPIO_INPUT                0x930
> ++#define ASM_REG_SWITCH                0xFFF
> ++
> ++#define ASM_REG_SWITCH_CTL    0x01
> ++
> ++#define ASM_GPIO_PIN5         5
> ++#define ASM_GPIO_DEFAULT      0
> ++
> ++
> ++#define PCI_DEVICE_ID_ASM_28XX_PID1   0x2824
> ++#define PCI_DEVICE_ID_ASM_28XX_PID2   0x2812
> ++#define PCI_DEVICE_ID_ASM_28XX_PID3   0x2806
> ++#define PCI_DEVICE_ID_ASM_18XX_PID1   0x1824
> ++#define PCI_DEVICE_ID_ASM_18XX_PID2   0x1812
> ++#define PCI_DEVICE_ID_ASM_18XX_PID3   0x1806
> ++#define PCI_DEVICE_ID_ASM_81XX_PID1   0x812a
> ++#define PCI_DEVICE_ID_ASM_81XX_PID2   0x812b
> ++#define PCI_DEVICE_ID_ASM_80XX_PID1   0x8061
> ++
> ++/*
> ++ * Data for PCI driver interface
> ++ *
> ++ * This data only exists for exporting the supported
> ++ * PCI ids via MODULE_DEVICE_TABLE.  We do not actually
> ++ * register a pci_driver, because someone else might one day
> ++ * want to register another driver on the same PCI id.
> ++ */
> ++static const struct pci_device_id pci_tbl[] =3D {
> ++      { PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_28XX_PID1),=
 0 },
> ++      { PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_28XX_PID2),=
 0 },
> ++      { PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_28XX_PID3),=
 0 },
> ++      { PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_18XX_PID1),=
 0 },
> ++      { PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_18XX_PID2),=
 0 },
> ++      { PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_18XX_PID3),=
 0 },
> ++      { PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_81XX_PID1),=
 0 },
> ++      { PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_81XX_PID2),=
 0 },
> ++      { PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_80XX_PID1),=
 0 },
> ++      { 0, }, /* terminate list */
> ++};
> ++MODULE_DEVICE_TABLE(pci, pci_tbl);
> ++

Stray newline.

> ++
> ++struct asm28xx_gpio {
> ++      struct gpio_chip        chip;
> ++      struct pci_dev          *pdev;
> ++      spinlock_t              lock;
> ++};
> ++
> ++void pci_config_pm_runtime_get(struct pci_dev *pdev)
> ++{
> ++      struct device *dev =3D &pdev->dev;
> ++      struct device *parent =3D dev->parent;
> ++
> ++      if (parent)
> ++              pm_runtime_get_sync(parent);
> ++      pm_runtime_get_noresume(dev);
> ++      /*
> ++       * pdev->current_state is set to PCI_D3cold during suspending,
> ++       * so wait until suspending completes
> ++       */
> ++      pm_runtime_barrier(dev);
> ++      /*
> ++       * Only need to resume devices in D3cold, because config
> ++       * registers are still accessible for devices suspended but
> ++       * not in D3cold.
> ++       */
> ++      if (pdev->current_state =3D=3D PCI_D3cold)
> ++              pm_runtime_resume(dev);
> ++}
> ++
> ++void pci_config_pm_runtime_put(struct pci_dev *pdev)
> ++{
> ++      struct device *dev =3D &pdev->dev;
> ++      struct device *parent =3D dev->parent;
> ++
> ++      pm_runtime_put(dev);
> ++      if (parent)
> ++              pm_runtime_put_sync(parent);
> ++}
> ++
> ++static int asm28xx_gpio_request(struct gpio_chip *chip, unsigned offset=
)
> ++{
> ++

Stray new line.

> ++      dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d request\n", offs=
et);
> ++

Please don't do this, we have enough debug messages and trace points
in gpiolib core.

> ++      if (offset =3D=3D ASM_GPIO_PIN5)
> ++              return -ENODEV;
> ++
> ++      return 0;
> ++}
> ++
> ++static void asm28xx_gpio_free(struct gpio_chip *chip, unsigned offset)
> ++{
> ++      dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d free\n", offset)=
;

And *especially* don't do this. Just don't implement this callback.

> ++}
> ++
> ++static void asm28xx_gpio_set(struct gpio_chip *chip, unsigned offset, i=
nt value)
> ++{
> ++      struct asm28xx_gpio *agp =3D gpiochip_get_data(chip);
> ++      unsigned char temp;
> ++      unsigned long flags;
> ++
> ++      pci_config_pm_runtime_get(agp->pdev);
> ++      spin_lock_irqsave(&agp->lock, flags);
> ++      pci_read_config_byte(agp->pdev, ASM_GPIO_OUTPUT, &temp);
> ++      if (value)
> ++              temp |=3D BIT(offset);
> ++      else
> ++              temp &=3D ~BIT(offset);
> ++
> ++      pci_write_config_byte(agp->pdev, ASM_GPIO_OUTPUT, temp);
> ++      spin_unlock_irqrestore(&agp->lock, flags);
> ++      pci_config_pm_runtime_put(agp->pdev);
> ++      dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d set %d reg=3D%02=
x\n", offset, value, temp);
> ++}
> ++
> ++static int asm28xx_gpio_get(struct gpio_chip *chip, unsigned offset)
> ++{
> ++      struct asm28xx_gpio *agp =3D gpiochip_get_data(chip);
> ++      unsigned char temp;
> ++      unsigned long flags;
> ++
> ++      pci_config_pm_runtime_get(agp->pdev);
> ++      spin_lock_irqsave(&agp->lock, flags);
> ++      pci_read_config_byte(agp->pdev, ASM_GPIO_INPUT, &temp);
> ++      spin_unlock_irqrestore(&agp->lock, flags);
> ++      pci_config_pm_runtime_put(agp->pdev);
> ++
> ++      dev_dbg(chip->parent, "ASMEDIA-28xx/18xx GPIO Pin %d get reg=3D%0=
2x\n", offset, temp);
> ++      return (temp & BIT(offset)) ? 1 : 0;
> ++}
> ++
> ++static int asm28xx_gpio_dirout(struct gpio_chip *chip, unsigned offset,=
 int value)
> ++{
> ++      struct asm28xx_gpio *agp =3D gpiochip_get_data(chip);
> ++      unsigned char temp;
> ++      unsigned long flags;
> ++
> ++      pci_config_pm_runtime_get(agp->pdev);
> ++      spin_lock_irqsave(&agp->lock, flags);
> ++      pci_read_config_byte(agp->pdev, ASM_GPIO_CTRL, &temp);
> ++      temp |=3D BIT(offset);
> ++      pci_write_config_byte(agp->pdev, ASM_GPIO_CTRL, temp);
> ++      spin_unlock_irqrestore(&agp->lock, flags);
> ++      pci_config_pm_runtime_put(agp->pdev);
> ++      dev_dbg(chip->parent, "ASMEDIA-28xx/18xx dirout gpio %d  reg=3D%0=
2x\n", offset, temp);
> ++
> ++      return 0;
> ++}
> ++
> ++static int asm28xx_gpio_dirin(struct gpio_chip *chip, unsigned offset)
> ++{
> ++      struct asm28xx_gpio *agp =3D gpiochip_get_data(chip);
> ++      unsigned char temp;
> ++      unsigned long flags;
> ++
> ++      pci_config_pm_runtime_get(agp->pdev);
> ++      spin_lock_irqsave(&agp->lock, flags);
> ++      pci_read_config_byte(agp->pdev, ASM_GPIO_CTRL, &temp);
> ++      temp &=3D ~BIT(offset);
> ++      pci_write_config_byte(agp->pdev, ASM_GPIO_CTRL, temp);
> ++      spin_unlock_irqrestore(&agp->lock, flags);
> ++      pci_config_pm_runtime_put(agp->pdev);
> ++      dev_dbg(chip->parent, "ASMEDIA-28xx/18xx dirin gpio %d  reg=3D%02=
x\n", offset, temp);
> ++
> ++      return 0;
> ++}
> ++
> ++static struct asm28xx_gpio gp =3D {
> ++      .chip =3D {
> ++              .label          =3D "ASM28XX-18XX GPIO",
> ++              .owner          =3D THIS_MODULE,
> ++              .ngpio          =3D 8,
> ++              .request        =3D asm28xx_gpio_request,
> ++              .free           =3D asm28xx_gpio_free,
> ++              .set            =3D asm28xx_gpio_set,
> ++              .get            =3D asm28xx_gpio_get,
> ++              .direction_output =3D asm28xx_gpio_dirout,
> ++              .direction_input =3D asm28xx_gpio_dirin,
> ++      },
> ++};
> ++
> ++static int __init asm28xx_gpio_init(void)
> ++{
> ++      int err =3D -ENODEV;
> ++      struct pci_dev *pdev =3D NULL;
> ++      const struct pci_device_id *ent;
> ++      u8 temp;
> ++      unsigned long flags;
> ++      int type;
> ++
> ++      for_each_pci_dev(pdev) {
> ++              ent =3D pci_match_id(pci_tbl, pdev);
> ++              if (ent) {
> ++                      /* Because GPIO Registers only work on Upstream p=
ort. */
> ++                      type =3D pci_pcie_type(pdev);
> ++                      if (type =3D=3D PCI_EXP_TYPE_UPSTREAM) {
> ++                              dev_info(&pdev->dev, "ASMEDIA-28xx/18xx I=
nit Upstream detected\n");
> ++                              goto found;
> ++                      }
> ++              }
> ++      }
> ++
> ++      /* ASMEDIA-28xx/18xx GPIO not found. */
> ++      dev_info(&pdev->dev, "ASMEDIA-28xx/18xx Init GPIO not detected\n"=
);
> ++      goto out;
> ++
> ++found:
> ++      gp.pdev =3D pdev;
> ++      gp.chip.parent =3D &pdev->dev;
> ++
> ++      spin_lock_init(&gp.lock);
> ++
> ++      err =3D gpiochip_add_data(&gp.chip, &gp);
> ++      if (err) {
> ++              dev_err(&pdev->dev, "GPIO registering failed (%d)\n", err=
);
> ++              goto out;
> ++      }
> ++
> ++      pci_config_pm_runtime_get(pdev);
> ++
> ++      /* Set PCI_CFG_Switch bit =3D 1,then we can access GPIO Registers=
. */
> ++      spin_lock_irqsave(&gp.lock, flags);
> ++      pci_read_config_byte(pdev, ASM_REG_SWITCH, &temp);
> ++      temp |=3D ASM_REG_SWITCH_CTL;
> ++      pci_write_config_byte(pdev, ASM_REG_SWITCH, temp);
> ++      pci_read_config_byte(pdev, ASM_REG_SWITCH, &temp);
> ++      spin_unlock_irqrestore(&gp.lock, flags);
> ++
> ++      pci_config_pm_runtime_put(pdev);
> ++      dev_err(&pdev->dev, "ASMEDIA-28xx/18xx Init SWITCH =3D 0x%x\n", t=
emp);
> ++out:
> ++      return err;
> ++}
> ++
> ++static void __exit asm28xx_gpio_exit(void)
> ++{
> ++      unsigned long flags;
> ++
> ++      pci_config_pm_runtime_get(gp.pdev);
> ++
> ++      spin_lock_irqsave(&gp.lock, flags);
> ++      /* Set GPIO Registers to default value. */
> ++      pci_write_config_byte(gp.pdev, ASM_GPIO_OUTPUT, ASM_GPIO_DEFAULT)=
;
> ++      pci_write_config_byte(gp.pdev, ASM_GPIO_INPUT, ASM_GPIO_DEFAULT);
> ++      pci_write_config_byte(gp.pdev, ASM_GPIO_CTRL, ASM_GPIO_DEFAULT);
> ++      /* Clear PCI_CFG_Switch bit =3D 0,then we can't access GPIO Regis=
ters. */
> ++      pci_write_config_byte(gp.pdev, ASM_REG_SWITCH, ASM_GPIO_DEFAULT);
> ++      spin_unlock_irqrestore(&gp.lock, flags);
> ++      pci_config_pm_runtime_put(gp.pdev);
> ++
> ++      gpiochip_remove(&gp.chip);
> ++}

While I admit I'm not familiar with the PCI subsystem, this is surely
not the way you want to do this. What you want to do here is define a
struct pci_driver with appropriate probe callback and register it
using module_pci_driver().

Bartosz

> ++
> ++module_init(asm28xx_gpio_init);
> ++module_exit(asm28xx_gpio_exit);
> ++
> ++MODULE_LICENSE("GPL");
> ++MODULE_AUTHOR("Richard Hsu <Richard_Hsu@asmedia.com.tw>");
> ++MODULE_DESCRIPTION("Asmedia 28xx 18xx GPIO Driver");
> ++
> ++

Stray newline.

> +diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/dri=
vers/gpio/Kconfig linux-5.7.0-rc6-patch/drivers/gpio/Kconfig
> +--- linux-5.7.0-rc6/drivers/gpio/Kconfig       2020-05-22 11:54:00.86264=
4198 +0800
> ++++ linux-5.7.0-rc6-patch/drivers/gpio/Kconfig 2020-05-22 11:55:13.68027=
0929 +0800
> +@@ -113,6 +113,14 @@ config GPIO_AMDPT
> +         driver for GPIO functionality on Promontory IOHub
> +         Require ACPI ASL code to enumerate as a platform device.
> +
> ++config GPIO_ASM28XX
> ++      tristate "Asmedia 28XX/18XX GPIO support"
> ++      depends on PCI
> ++      select GPIO_GENERIC
> ++      help
> ++        driver for GPIO functionality on Asmedia 28XX and 18XX PCI-E Br=
idge.

Capitalize the first word of help text.

> ++
> ++
> + config GPIO_ASPEED
> +       tristate "Aspeed GPIO support"
> +       depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
> +diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/dri=
vers/gpio/Makefile linux-5.7.0-rc6-patch/drivers/gpio/Makefile
> +--- linux-5.7.0-rc6/drivers/gpio/Makefile      2020-05-22 11:54:00.86264=
4198 +0800
> ++++ linux-5.7.0-rc6-patch/drivers/gpio/Makefile        2020-05-22 11:55:=
13.680270929 +0800
> +@@ -176,3 +176,4 @@ obj-$(CONFIG_GPIO_XTENSA)          +=3D gpio-xtens
> + obj-$(CONFIG_GPIO_ZEVIO)              +=3D gpio-zevio.o
> + obj-$(CONFIG_GPIO_ZX)                 +=3D gpio-zx.o
> + obj-$(CONFIG_GPIO_ZYNQ)                       +=3D gpio-zynq.o
> ++obj-$(CONFIG_GPIO_ASM28XX)            +=3D gpio-asm28xx-18xx.o

We use alphabetical order in the Makefile.

> --
> 2.17.1
>
