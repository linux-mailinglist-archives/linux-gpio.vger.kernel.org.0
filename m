Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09DF361C8A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 11:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbfGHJpJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 05:45:09 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42995 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729179AbfGHJpJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 05:45:09 -0400
Received: by mail-ot1-f68.google.com with SMTP id l15so15533152otn.9
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2019 02:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ONq1aOGiESkpOw8KKZA0wWCvipUgxT9YZPmKzFDcUbg=;
        b=oLt30YsnST3uVHN3J2+6k9jsQSWRMW17LErLg01e8yXSO1cGg3Leo4wmFh5zdo8SeZ
         PtKQYcemVCxwmOkmr6ppF549IMsJXyVNBGtRDIwrQOY3Bzo/W9HIlqWQctSY/AdFzXhx
         u86qqZfMVAIWi8sPswrqu7QlJcVELyQhCfq85GwRFoesUkv4YBJYuHbvRp8oV9gK08U6
         Lbc/e1azLNWh7EcpOyfhANF0tEZUc6gyN1gmTQoQVGor+vSWRALAI53+zKWiM2XVDIIG
         Qu1qqPL/yFQfcHM3p4IByIkJdjTXRX15o9w6JE19dI0F/jfrCNntJNAGPbMi8NuhY8Gn
         UHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ONq1aOGiESkpOw8KKZA0wWCvipUgxT9YZPmKzFDcUbg=;
        b=AWEhfWgnPi/tqTw2eHvGqFjQxL9JTqVFXYvdhv1+YLvr0Qg914W+H/a7JfSQfQUcSo
         xUvaQd/zkDwEVrnxSJ7y8sTt6lTpKbyBmsu8mYvStZ4BgaGUPK0asE/wIQVFhykQqlGh
         69PdDXytNvTrYBfC+pCAEBuaCFMaSCieUnts3bkwEF+LfuBku6r1ifNPv8mmygToh5Ep
         CR0R4zEMkulzoSMJ7MBDBDluqtVfe+FQg2/qehoXDZykZGRleKoQnsGSG/mZbN8aTU4W
         8mVPTHqAEFXwG38BU2htesEYga3pwVtEsDETfZZ6m5PlkWKyPTF+w3Ih3ejeNupJDpqU
         y6DA==
X-Gm-Message-State: APjAAAXYfP23ir2YQufYIfS5+pDzifyfQUjn9pAZBF1drFyYa7YD0cKK
        8QZVuOt8exGdE5mvCCW7/Jb489YkrJd8YGSG/rlXtw==
X-Google-Smtp-Source: APXvYqyof1jsbvomWBuqYakw6QWpgZTqIMgpOsfRdDRnmnqKZCUvyTdQwDlsVeIMvFIioZTAljBNS933W5PYHJ2LzyY=
X-Received: by 2002:a05:6830:1291:: with SMTP id z17mr14086219otp.194.1562579107299;
 Mon, 08 Jul 2019 02:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
In-Reply-To: <20190705160536.12047-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Jul 2019 11:44:56 +0200
Message-ID: <CAMpxmJXOrDLdw6ZPBHxzsDRYiLmhRNCb-s_Z=Gu=Ecg1XA5ONQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>, qemu-devel@nongnu.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 5 lip 2019 o 18:05 Geert Uytterhoeven <geert+renesas@glider.be> napisa=
=C5=82(a):
>
> GPIO controllers are exported to userspace using /dev/gpiochip*
> character devices.  Access control to these devices is provided by
> standard UNIX file system permissions, on an all-or-nothing basis:
> either a GPIO controller is accessible for a user, or it is not.
> Currently no mechanism exists to control access to individual GPIOs.
>
> Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> and expose them as a new gpiochip.  This is useful for implementing
> access control, and assigning a set of GPIOs to a specific user.
> Furthermore, it would simplify and harden exporting GPIOs to a virtual
> machine, as the VM can just grab the full virtual GPIO controller, and
> no longer needs to care about which GPIOs to grab and which not,
> reducing the attack surface.
>
> Virtual GPIO controllers are instantiated by writing to the "new_device"
> attribute file in sysfs:
>
>     $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
>            "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
>             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
>
> Likewise, virtual GPIO controllers can be destroyed after use:
>
>     $ echo gpio-virt-agg.<N> \
>             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Aggregating GPIOs and exposing them as a new gpiochip was suggested in
> response to my proof-of-concept for GPIO virtualization with QEMU[1][2].
>
> Sample session on r8a7791/koelsch:
>
>   - Disable the leds node in arch/arm/boot/dts/r8a7791-koelsch.dts
>
>   - Create virtual aggregators:
>
>     $ echo "e6052000.gpio 19 20" \
>             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
>
>     gpio-virt-agg gpio-virt-agg.0: GPIO 0 =3D> e6052000.gpio/19
>     gpio-virt-agg gpio-virt-agg.0: GPIO 1 =3D> e6052000.gpio/20
>     gpiochip_find_base: found new base at 778
>     gpio gpiochip8: (gpio-virt-agg.0): added GPIO chardev (254:8)
>     gpiochip_setup_dev: registered GPIOs 778 to 779 on device: gpiochip8 =
(gpio-virt-agg.0)
>
>     $ echo "e6052000.gpio 21, e6050000.gpio 20 21 22" \
>             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
>
>     gpio-virt-agg gpio-virt-agg.1: GPIO 0 =3D> e6052000.gpio/21
>     gpio-virt-agg gpio-virt-agg.1: GPIO 1 =3D> e6050000.gpio/20
>     gpio-virt-agg gpio-virt-agg.1: GPIO 2 =3D> e6050000.gpio/21
>     gpio-virt-agg gpio-virt-agg.1: GPIO 3 =3D> e6050000.gpio/22
>     gpiochip_find_base: found new base at 774
>     gpio gpiochip9: (gpio-virt-agg.1): added GPIO chardev (254:9)
>     gpiochip_setup_dev: registered GPIOs 774 to 777 on device: gpiochip9 =
(gpio-virt-agg.1)
>
>   - Adjust permissions on /dev/gpiochip[89] (optional)
>
>   - Control LEDs:
>
>     $ gpioset gpiochip8 0=3D0 1=3D1 # LED6 OFF, LED7 ON
>     $ gpioset gpiochip8 0=3D1 1=3D0 # LED6 ON, LED7 OFF
>     $ gpioset gpiochip9 0=3D0     # LED8 OFF
>     $ gpioset gpiochip9 0=3D1     # LED8 ON
>
>   - Destroy virtual aggregators:
>
>     $ echo gpio-virt-agg.0 \
>             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
>     $ echo gpio-virt-agg.1 \
>             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
>
> Thanks for your comments!
>

Hi Geert,

I like the general idea and the interface looks mostly fine. Since
this is new ABI I think it needs to be documented as well.

I'm having trouble building this module:

  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  Kernel: arch/arm/boot/Image is ready
  Building modules, stage 2.
  MODPOST 235 modules
ERROR: "gpiod_request" [drivers/gpio/gpio-virt-agg.ko] undefined!
ERROR: "gpiochip_get_desc" [drivers/gpio/gpio-virt-agg.ko] undefined!
ERROR: "gpiod_free" [drivers/gpio/gpio-virt-agg.ko] undefined!
scripts/Makefile.modpost:91: recipe for target '__modpost' failed
make[1]: *** [__modpost] Error 1
Makefile:1287: recipe for target 'modules' failed
make: *** [modules] Error 2
make: *** Waiting for unfinished jobs....

I'm not sure what the problem is.

> References:
>   - [1] "[PATCH QEMU POC] Add a GPIO backend"
>         (https://lore.kernel.org/linux-renesas-soc/20181003152521.23144-1=
-geert+renesas@glider.be/)
>   - [2] "Getting To Blinky: Virt Edition / Making device pass-through
>          work on embedded ARM"
>         (https://fosdem.org/2019/schedule/event/vai_getting_to_blinky/)
> ---
>  drivers/gpio/Kconfig         |   9 +
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-virt-agg.c | 390 +++++++++++++++++++++++++++++++++++
>  3 files changed, 400 insertions(+)
>  create mode 100644 drivers/gpio/gpio-virt-agg.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index f1f02dac324e52b6..8aff4d9626dee110 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1475,3 +1475,12 @@ config GPIO_MOCKUP
>           it.
>
>  endif
> +
> +config GPIO_VIRT_AGG
> +       tristate "GPIO Virtual Aggregator"
> +       depends on GPIOLIB
> +       help
> +         This enabled the GPIO Virtual Aggregator, which provides a way =
to
> +         aggregate existing GPIOs into a new virtual GPIO device.
> +         This is useful for assigning a collection of GPIOs to a user, o=
r
> +         exported them to a virtual machine.
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 0a494052c1e845ee..32e885b7f3aa4eee 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -152,6 +152,7 @@ obj-$(CONFIG_GPIO_UCB1400)          +=3D gpio-ucb1400=
.o
>  obj-$(CONFIG_GPIO_UNIPHIER)            +=3D gpio-uniphier.o
>  obj-$(CONFIG_GPIO_VF610)               +=3D gpio-vf610.o
>  obj-$(CONFIG_GPIO_VIPERBOARD)          +=3D gpio-viperboard.o
> +obj-$(CONFIG_GPIO_VIRT_AGG)            +=3D gpio-virt-agg.o
>  obj-$(CONFIG_GPIO_VR41XX)              +=3D gpio-vr41xx.o
>  obj-$(CONFIG_GPIO_VX855)               +=3D gpio-vx855.o
>  obj-$(CONFIG_GPIO_WHISKEY_COVE)                +=3D gpio-wcove.o
> diff --git a/drivers/gpio/gpio-virt-agg.c b/drivers/gpio/gpio-virt-agg.c
> new file mode 100644
> index 0000000000000000..20e5f22beed9d385
> --- /dev/null
> +++ b/drivers/gpio/gpio-virt-agg.c
> @@ -0,0 +1,390 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// GPIO Virtual Aggregator
> +//
> +// Copyright (C) 2019 Glider bvba
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include "gpiolib.h"
> +
> +#define DRV_NAME       "gpio-virt-agg"
> +#define MAX_GPIOS      32

Do we really need this limit? I see it simplifies the code, but maybe
we can allocate the relevant arrays dynamically and not limit users?

> +
> +struct gpio_virt_agg_entry {
> +       struct platform_device *pdev;
> +};
> +
> +struct gpio_virt_agg_priv {
> +       struct gpio_chip chip;
> +       struct gpio_desc *desc[MAX_GPIOS];
> +};
> +
> +static DEFINE_MUTEX(gpio_virt_agg_lock);       /* protects idr */
> +static DEFINE_IDR(gpio_virt_agg_idr);
> +
> +static int gpio_virt_agg_get_direction(struct gpio_chip *chip,
> +                                      unsigned int offset)
> +{
> +       struct gpio_virt_agg_priv *priv =3D gpiochip_get_data(chip);
> +
> +       return gpiod_get_direction(priv->desc[offset]);
> +}
> +
> +static int gpio_virt_agg_direction_input(struct gpio_chip *chip,
> +                                        unsigned int offset)
> +{
> +       struct gpio_virt_agg_priv *priv =3D gpiochip_get_data(chip);
> +
> +       return gpiod_direction_input(priv->desc[offset]);
> +}
> +
> +static int gpio_virt_agg_direction_output(struct gpio_chip *chip,
> +                                         unsigned int offset, int value)
> +{
> +       struct gpio_virt_agg_priv *priv =3D gpiochip_get_data(chip);
> +
> +       return gpiod_direction_output(priv->desc[offset], value);
> +}
> +
> +static int gpio_virt_agg_get(struct gpio_chip *chip, unsigned int offset=
)
> +{
> +       struct gpio_virt_agg_priv *priv =3D gpiochip_get_data(chip);
> +
> +       return gpiod_get_value(priv->desc[offset]);
> +}
> +
> +static int gpio_virt_agg_get_multiple(struct gpio_chip *chip,
> +                                     unsigned long *mask, unsigned long =
*bits)
> +{
> +       struct gpio_virt_agg_priv *priv =3D gpiochip_get_data(chip);
> +       DECLARE_BITMAP(values, MAX_GPIOS) =3D { 0 };
> +       struct gpio_desc *desc[MAX_GPIOS];
> +       unsigned int i, j =3D 0;
> +       int ret;
> +
> +       for_each_set_bit(i, mask, priv->chip.ngpio)
> +               desc[j++] =3D priv->desc[i];
> +
> +       ret =3D gpiod_get_array_value(j, desc, NULL, values);
> +       if (ret)
> +               return ret;
> +
> +       for_each_set_bit(i, mask, priv->chip.ngpio)
> +               __assign_bit(i, bits, test_bit(j++, values));
> +
> +       return 0;
> +}
> +
> +static void gpio_virt_agg_set(struct gpio_chip *chip, unsigned int offse=
t,
> +                             int value)
> +{
> +       struct gpio_virt_agg_priv *priv =3D gpiochip_get_data(chip);
> +
> +       gpiod_set_value(priv->desc[offset], value);
> +}
> +
> +static void gpio_virt_agg_set_multiple(struct gpio_chip *chip,
> +                                      unsigned long *mask,
> +                                      unsigned long *bits)
> +{
> +       struct gpio_virt_agg_priv *priv =3D gpiochip_get_data(chip);
> +       DECLARE_BITMAP(values, MAX_GPIOS);
> +       struct gpio_desc *desc[MAX_GPIOS];
> +       unsigned int i, j =3D 0;
> +
> +       for_each_set_bit(i, mask, priv->chip.ngpio) {
> +               __assign_bit(j, values, test_bit(i, bits));
> +               desc[j++] =3D priv->desc[i];
> +       }
> +
> +       gpiod_set_array_value(j, desc, NULL, values);
> +}
> +
> +static int gpio_virt_agg_set_config(struct gpio_chip *chip,
> +                                   unsigned int offset, unsigned long co=
nfig)
> +{
> +       struct gpio_virt_agg_priv *priv =3D gpiochip_get_data(chip);
> +
> +       chip =3D priv->desc[offset]->gdev->chip;
> +       if (chip->set_config)
> +               return chip->set_config(chip, offset, config);
> +
> +       // FIXME gpiod_set_transitory() expects success if not implemente=
d
> +       return -ENOTSUPP;
> +}
> +
> +static int gpio_virt_agg_init_valid_mask(struct gpio_chip *chip)
> +{
> +       struct gpio_virt_agg_priv *priv =3D gpiochip_get_data(chip);
> +       unsigned int i;
> +
> +       for (i =3D 0; i < priv->chip.ngpio; i++) {
> +               if (gpiochip_line_is_valid(priv->desc[i]->gdev->chip,
> +                                          gpio_chip_hwgpio(priv->desc[i]=
)))
> +                       set_bit(i, chip->valid_mask);
> +       }
> +
> +       return 0;
> +}
> +
> +static int gpiochip_match_label(struct gpio_chip *chip, void *data)
> +{
> +       return !strcmp(chip->label, data);
> +}
> +
> +static struct gpio_chip *gpiochip_find_by_label(const char *label)
> +{
> +       return gpiochip_find((void *)label, gpiochip_match_label);
> +}
> +
> +static ssize_t new_device_store(struct device_driver *driver, const char=
 *buf,
> +                               size_t count)
> +{
> +       struct gpio_virt_agg_entry *gva;
> +       struct platform_device *pdev;
> +       int res, id;
> +
> +       gva =3D kzalloc(sizeof(*gva), GFP_KERNEL);
> +       if (!gva)
> +               return -ENOMEM;
> +
> +       mutex_lock(&gpio_virt_agg_lock);
> +       id =3D idr_alloc(&gpio_virt_agg_idr, gva, 0, 0, GFP_KERNEL);
> +       mutex_unlock(&gpio_virt_agg_lock);
> +
> +       if (id < 0) {
> +               res =3D id;
> +               goto free_gva;
> +       }
> +
> +       /* kernfs guarantees string termination, so count + 1 is safe */
> +       pdev =3D platform_device_register_data(NULL, DRV_NAME, id, buf,
> +                                            count + 1);
> +       if (IS_ERR(pdev)) {
> +               res =3D PTR_ERR(pdev);
> +               goto remove_idr;
> +       }
> +
> +       gva->pdev =3D pdev;
> +       return count;
> +
> +remove_idr:
> +       mutex_lock(&gpio_virt_agg_lock);
> +       idr_remove(&gpio_virt_agg_idr, id);
> +       mutex_unlock(&gpio_virt_agg_lock);
> +free_gva:
> +       kfree(gva);
> +       return res;
> +}
> +
> +static DRIVER_ATTR_WO(new_device);
> +
> +static ssize_t delete_device_store(struct device_driver *driver,
> +                                  const char *buf, size_t count)
> +{
> +       struct gpio_virt_agg_entry *gva;
> +       int id;
> +
> +       if (strncmp(buf, DRV_NAME ".", strlen(DRV_NAME ".")))
> +               return -EINVAL;
> +
> +       id =3D simple_strtoul(buf + strlen(DRV_NAME "."), NULL, 10);
> +
> +       mutex_lock(&gpio_virt_agg_lock);
> +       gva =3D idr_remove(&gpio_virt_agg_idr, id);
> +       mutex_unlock(&gpio_virt_agg_lock);
> +
> +       if (!gva) {
> +               pr_info("Cannot find %s.%d\n", DRV_NAME, id);
> +               return -ENOENT;
> +       }
> +
> +       platform_device_unregister(gva->pdev);
> +       kfree(gva);
> +       return count;
> +}
> +static DRIVER_ATTR_WO(delete_device);
> +
> +static struct attribute *gpio_virt_agg_attrs[] =3D {
> +       &driver_attr_new_device.attr,
> +       &driver_attr_delete_device.attr,
> +       NULL,
> +};
> +ATTRIBUTE_GROUPS(gpio_virt_agg);
> +
> +static int gpio_virt_agg_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       const char *param =3D dev_get_platdata(dev);
> +       struct gpio_virt_agg_priv *priv;
> +       const char *label =3D NULL;
> +       struct gpio_chip *chip;
> +       struct gpio_desc *desc;
> +       unsigned int offset;
> +       int error, i;

This 'i' here is reported as possibly not initialized:

drivers/gpio/gpio-virt-agg.c: In function =E2=80=98gpio_virt_agg_probe=E2=
=80=99:
drivers/gpio/gpio-virt-agg.c:230:13: warning: =E2=80=98i=E2=80=99 may be us=
ed
uninitialized in this function [-Wmaybe-uninitialized]
  int error, i;
             ^

> +       char *s;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv) {
> +               error =3D -ENOMEM;
> +               goto fail;
> +       }
> +
> +       for (i =3D 0; i < MAX_GPIOS; i++) {
> +               if (*param =3D=3D '\0' || *param =3D=3D '\n')
> +                       break;
> +
> +               if (*param =3D=3D ',') {
> +                       if (label) {
> +                               devm_kfree(dev, label);
> +                               label =3D NULL;
> +                       }
> +                       for (param++; *param =3D=3D ' '; param++) ;
> +               }
> +
> +               if (!label) {
> +                       s =3D strchr(param, ' ');
> +                       if (!s) {
> +                               dev_info(dev, "Missing gpiochip\n");
> +                               error =3D -EINVAL;
> +                               goto fail;
> +                       }
> +                       label =3D devm_kasprintf(dev, GFP_KERNEL, "%.*s",
> +                                              (int)(s - param), param);
> +                       if (!label) {
> +                               error =3D -ENOMEM;
> +                               goto fail;
> +                       }
> +
> +                       chip =3D gpiochip_find_by_label(label);
> +                       if (!chip) {
> +                               dev_info(dev, "Cannot find gpiochip %s\n"=
,
> +                                        label);
> +                               error =3D -ENODEV;
> +                               goto fail;
> +                       }
> +
> +                       for (param =3D s + 1; *param =3D=3D ' '; param++)=
 ;
> +               }
> +
> +               offset =3D simple_strtoul(param, &s, 10);
> +
> +               desc =3D gpiochip_get_desc(chip, offset);
> +               if (IS_ERR(desc)) {
> +                       error =3D PTR_ERR(desc);
> +                       dev_info(dev, "Cannot get GPIO %s/%u: %d\n", labe=
l,
> +                                offset, error);
> +                       goto fail;
> +               }
> +
> +               error =3D gpiod_request(desc, dev_name(dev));
> +               if (error) {
> +                       dev_info(dev, "Cannot request GPIO %s/%u: %d\n", =
label,
> +                                offset, error);
> +                       goto fail;
> +               }
> +
> +               dev_dbg(dev, "GPIO %u =3D> %s/%u\n", i, label, offset);
> +               priv->desc[i] =3D desc;
> +
> +               if (gpiod_cansleep(desc))
> +                       priv->chip.can_sleep =3D true;
> +               if (desc->gdev->chip->set_config)
> +                       priv->chip.set_config =3D gpio_virt_agg_set_confi=
g;
> +               if (desc->gdev->chip->need_valid_mask) {
> +                       priv->chip.need_valid_mask =3D true;
> +                       priv->chip.init_valid_mask =3D
> +                               gpio_virt_agg_init_valid_mask;
> +               }
> +
> +               for (param =3D s; *param =3D=3D ' '; param++) ;
> +       }
> +       if (i =3D=3D MAX_GPIOS)
> +               dev_warn(&pdev->dev,
> +                        "Too many gpios specified, truncating to %u\n",
> +                        MAX_GPIOS);
> +
> +       priv->chip.label =3D dev_name(dev);
> +       priv->chip.parent =3D dev;
> +       priv->chip.owner =3D THIS_MODULE;
> +       priv->chip.get_direction =3D gpio_virt_agg_get_direction;
> +       priv->chip.direction_input =3D gpio_virt_agg_direction_input;
> +       priv->chip.direction_output =3D gpio_virt_agg_direction_output;
> +       priv->chip.get =3D gpio_virt_agg_get;
> +       priv->chip.get_multiple =3D gpio_virt_agg_get_multiple;
> +       priv->chip.set =3D gpio_virt_agg_set;
> +       priv->chip.set_multiple =3D gpio_virt_agg_set_multiple;
> +       priv->chip.base =3D -1;
> +       priv->chip.ngpio =3D i;
> +       platform_set_drvdata(pdev, priv);
> +
> +       error =3D gpiochip_add_data(&priv->chip, priv);
> +       if (error)
> +               goto fail;
> +
> +       return 0;
> +
> +fail:
> +       while (i-- > 0)
> +               gpiod_free(priv->desc[i]);
> +
> +       return error;
> +}
> +
> +static int gpio_virt_agg_remove(struct platform_device *pdev)
> +{
> +       struct gpio_virt_agg_priv *priv =3D platform_get_drvdata(pdev);
> +       unsigned int i;
> +
> +       gpiochip_remove(&priv->chip);
> +
> +       for (i =3D 0; i < priv->chip.ngpio; i++)
> +               gpiod_free(priv->desc[i]);
> +
> +       return 0;
> +}

You shouldn't need this function at all. It's up to users to free descripto=
rs.

Best regards,
Bartosz Golaszewski

> +
> +static struct platform_driver gpio_virt_agg_driver =3D {
> +       .probe =3D gpio_virt_agg_probe,
> +       .remove =3D gpio_virt_agg_remove,
> +       .driver =3D {
> +               .name =3D DRV_NAME,
> +               .groups =3D gpio_virt_agg_groups,
> +       },
> +};
> +
> +static int __init gpio_virt_agg_init(void)
> +{
> +       return platform_driver_register(&gpio_virt_agg_driver);
> +}
> +module_init(gpio_virt_agg_init);
> +
> +static int __exit gpio_virt_agg_idr_remove(int id, void *p, void *data)
> +{
> +       struct gpio_virt_agg_entry *gva =3D p;
> +
> +       platform_device_unregister(gva->pdev);
> +       kfree(gva);
> +       return 0;
> +}
> +
> +static void __exit gpio_virt_agg_exit(void)
> +{
> +       mutex_lock(&gpio_virt_agg_lock);
> +       idr_for_each(&gpio_virt_agg_idr, gpio_virt_agg_idr_remove, NULL);
> +       idr_destroy(&gpio_virt_agg_idr);
> +       mutex_unlock(&gpio_virt_agg_lock);
> +
> +       platform_driver_unregister(&gpio_virt_agg_driver);
> +}
> +module_exit(gpio_virt_agg_exit);
> +
> +MODULE_AUTHOR("Geert Uytterhoeven <geert+renesas@glider.be>");
> +MODULE_DESCRIPTION("GPIO Virtual Aggregator");
> +MODULE_LICENSE("GPL v2");
> --
> 2.17.1
>
