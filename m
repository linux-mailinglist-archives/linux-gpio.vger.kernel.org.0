Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F2749AB7B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jan 2022 06:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236874AbiAYFAX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jan 2022 00:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S248361AbiAYD6W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 22:58:22 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3329DC0612F1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 18:22:16 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id n10so44403957edv.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 18:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5kH1TIEddaaGY73gbmDdXNhSWHVrPM0a8sUWqNg84R8=;
        b=QLogUX9wx8fWiclTr57Ed9jBH+bXu54lQJkOaeb2IznquHZvXtGayvlZkN+U2l7Vre
         ZRkLfiQfw4clkcfaySVCiVrVeQk7jIYKcqBls9q7FUidiY5AIhQ7dCnl6b7NFcCfModU
         64X/AkOSgVIQAfnA4GSttnxERJg8GkDvicB2JpsbYhoQNwaRGIJXezdT/pjEJ2g1BlzH
         Q4q92ILXK2C249jtAcMb8dfDHRn+5km879/Wd6CK45ceCNBMIMfL4OzmwXxVIcuA6WO5
         LQG0AyQH0RJPrBCs4b1+VgfIWSqVZqOg4X8Rms3mWb+AkocvfQubojmxBwcaICcEr4dV
         7Hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5kH1TIEddaaGY73gbmDdXNhSWHVrPM0a8sUWqNg84R8=;
        b=HhCM1EwrTz+iJWjaPj51byLb60WINHWyjzbom7I3OywloP/7okbEpGMzofi+u7JHZ8
         3SOH2KeOmQziWzL39HbzXV9jnUUZZn/uIRLY5Z3UFwKyleiMgtOLBMaTntB5E54iyAui
         xsiW8FzmBfAYBDzX9pJ1vEv+x8OnDl1yFV8+iz391nhHTPq1N9NIaKRn123lM4SgiMvj
         /9b9fSwuQQnfCY5R7Xr2tC5dwGDBglQuqaIPoXn9QTf9/nzUGPjKEJleFJjjeY2oy/gt
         WRaDF/dCYijQcIGxU+O2FlA35NrLji+egcVOqjm6a9hGw98gQ6dwz6QZTdOL8zClnQfZ
         y3xQ==
X-Gm-Message-State: AOAM533pl6D2AIhagJ7A6PA1MrNMVNjapV8FL3eeCjR4sOnAmWP/wTqM
        psxJd2lNjuOkCW7qjNDdzd/5u+OuISz35Bp1ZgQ=
X-Google-Smtp-Source: ABdhPJxOYIJaffc4RqiWDyQZispz6mk8A8TTlf+Z1MP232WwWHgsytbWgTdG+CwQPnZ1NN5pwBDUM9/9M42fZZwK6no=
X-Received: by 2002:aa7:c79a:: with SMTP id n26mr18911943eds.350.1643077334051;
 Mon, 24 Jan 2022 18:22:14 -0800 (PST)
MIME-Version: 1.0
References: <20220125003741.492954-1-linus.walleij@linaro.org>
In-Reply-To: <20220125003741.492954-1-linus.walleij@linaro.org>
From:   Dmitry Baryshkov <dbaryshkov@gmail.com>
Date:   Tue, 25 Jan 2022 05:22:02 +0300
Message-ID: <CALT56yN39Xa3suNS6i1VnOTHvG82qGFsQha=PkcsyoeFJ=kDRQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM/pxa/mfd/power/sound: Switch Tosa to GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Dirk Opfer <dirk@opfer-online.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=D0=B2=D1=82, 25 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 03:39, Linus Walle=
ij <linus.walleij@linaro.org>:
>
> The Tosa device (Sharp SL-6000) has a mishmash driver set-up
> for the Toshiba TC6393xb MFD that includes a battery charger
> and touchscreen and has some kind of relationship to the SoC
> sound driver for the AC97 codec. Other devices define a chip
> like this but seem only half-implemented, not really handling
> battery charging etc.
>
> This patch switches the Toshiba MFD device to provide GPIO
> descriptors to the battery charger and SoC codec. As a result
> some descriptors need to be moved out of the Tosa boardfile
> and new one added: all SoC GPIO resources to these drivers
> now comes from the main boardfile, while the MFD provide
> GPIOs for its portions.
>
> As a result we can request one GPIO from our own GPIO chip
> and drop two hairy callbacks into the board file.
>
> This platform badly needs to have its drivers split up and
> converted to device tree probing to handle this quite complex
> relationship in an orderly manner. I just do my best in solving
> the GPIO descriptor part of the puzzle. Please don't ask me
> to fix everything that is wrong with these driver to todays
> standards, I am just trying to fix one aspect. I do try to
> use modern devres resource management and handle deferred
> probe using new functions where appropriate.
>
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Reviewed-by: Dmitry Baryshkov <dbaryshkov@gmail.com>

Minor nit bellow.

> Cc: Dirk Opfer <dirk@opfer-online.de>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rebase on v5.17-rc1
> - Collect some ACKs.
> - Drop comments on includes.
> - Replace defined TOSA_GC_NAME with explicit string
> - Add a macro GPIO_LOOKUP_SINGLE() and use it in the patch
> - As we removed the only users of the .setup() and .teardown()
>   callbacks in struct tc6393xb_platform_data these members
>   can be removed.
> Merging strategy: please provide ACKs and I will attempt
> to merge this through the SoC tree.
> ---
>  arch/arm/mach-pxa/eseries.c           |   2 -
>  arch/arm/mach-pxa/include/mach/tosa.h |  18 ---
>  arch/arm/mach-pxa/tosa.c              |  68 +++-------
>  drivers/mfd/tc6393xb.c                | 130 ++++++++++++++------
>  drivers/power/supply/tosa_battery.c   | 171 ++++++++++++++++----------
>  include/linux/gpio/machine.h          |  12 ++
>  include/linux/mfd/tc6393xb.h          |   3 -
>  sound/soc/pxa/tosa.c                  |  20 ++-
>  8 files changed, 241 insertions(+), 183 deletions(-)
>
> diff --git a/arch/arm/mach-pxa/eseries.c b/arch/arm/mach-pxa/eseries.c
> index f37c44b6139d..9e9b5c78f8ad 100644
> --- a/arch/arm/mach-pxa/eseries.c
> +++ b/arch/arm/mach-pxa/eseries.c
> @@ -699,7 +699,6 @@ static struct tc6393xb_platform_data e750_tc6393xb_in=
fo =3D {
>         .irq_base       =3D IRQ_BOARD_START,
>         .scr_pll2cr     =3D 0x0cc1,
>         .scr_gper       =3D 0,
> -       .gpio_base      =3D -1,
>         .suspend        =3D &eseries_tmio_suspend,
>         .resume         =3D &eseries_tmio_resume,
>         .enable         =3D &eseries_tmio_enable,
> @@ -918,7 +917,6 @@ static struct tc6393xb_platform_data e800_tc6393xb_in=
fo =3D {
>         .irq_base       =3D IRQ_BOARD_START,
>         .scr_pll2cr     =3D 0x0cc1,
>         .scr_gper       =3D 0,
> -       .gpio_base      =3D -1,
>         .suspend        =3D &eseries_tmio_suspend,
>         .resume         =3D &eseries_tmio_resume,
>         .enable         =3D &eseries_tmio_enable,
> diff --git a/arch/arm/mach-pxa/include/mach/tosa.h b/arch/arm/mach-pxa/in=
clude/mach/tosa.h
> index 8bfaca3a8b64..3b3efa0a0e22 100644
> --- a/arch/arm/mach-pxa/include/mach/tosa.h
> +++ b/arch/arm/mach-pxa/include/mach/tosa.h
> @@ -54,24 +54,6 @@
>  /* GPIO Direction   1 : output mode / 0:input mode */
>  #define TOSA_SCOOP_JC_IO_DIR (TOSA_SCOOP_JC_CARD_LIMIT_SEL)
>
> -/*
> - * TC6393XB GPIOs
> - */
> -#define TOSA_TC6393XB_GPIO_BASE                (PXA_NR_BUILTIN_GPIO + 2 =
* 12)
> -
> -#define TOSA_GPIO_TG_ON                        (TOSA_TC6393XB_GPIO_BASE =
+ 0)
> -#define TOSA_GPIO_L_MUTE               (TOSA_TC6393XB_GPIO_BASE + 1)
> -#define TOSA_GPIO_BL_C20MA             (TOSA_TC6393XB_GPIO_BASE + 3)
> -#define TOSA_GPIO_CARD_VCC_ON          (TOSA_TC6393XB_GPIO_BASE + 4)
> -#define TOSA_GPIO_CHARGE_OFF           (TOSA_TC6393XB_GPIO_BASE + 6)
> -#define TOSA_GPIO_CHARGE_OFF_JC                (TOSA_TC6393XB_GPIO_BASE =
+ 7)
> -#define TOSA_GPIO_BAT0_V_ON            (TOSA_TC6393XB_GPIO_BASE + 9)
> -#define TOSA_GPIO_BAT1_V_ON            (TOSA_TC6393XB_GPIO_BASE + 10)
> -#define TOSA_GPIO_BU_CHRG_ON           (TOSA_TC6393XB_GPIO_BASE + 11)
> -#define TOSA_GPIO_BAT_SW_ON            (TOSA_TC6393XB_GPIO_BASE + 12)
> -#define TOSA_GPIO_BAT0_TH_ON           (TOSA_TC6393XB_GPIO_BASE + 14)
> -#define TOSA_GPIO_BAT1_TH_ON           (TOSA_TC6393XB_GPIO_BASE + 15)
> -
>  /*
>   * PXA GPIOs
>   */
> diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
> index 431709725d02..bead2ff44d3e 100644
> --- a/arch/arm/mach-pxa/tosa.c
> +++ b/arch/arm/mach-pxa/tosa.c
> @@ -616,6 +616,22 @@ static struct resource tc6393xb_resources[] =3D {
>         },
>  };
>
> +static struct gpiod_lookup_table tosa_battery_gpio_table =3D {
> +       .dev_id =3D "wm97xx-battery",
> +       .table =3D {
> +               GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_BAT0_CRG,
> +                           "main battery full", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_BAT1_CRG,
> +                           "jacket battery full", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_BAT0_LOW,
> +                           "main battery low", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_BAT1_LOW,
> +                           "jacket battery low", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_JACKET_DETECT,
> +                           "jacket detect", GPIO_ACTIVE_HIGH),
> +               { },
> +       },
> +};
>
>  static int tosa_tc6393xb_enable(struct platform_device *dev)
>  {
> @@ -709,31 +725,6 @@ static struct tmio_nand_data tosa_tc6393xb_nand_conf=
ig =3D {
>         .part_parsers =3D probes,
>  };
>
> -static int tosa_tc6393xb_setup(struct platform_device *dev)
> -{
> -       int rc;
> -
> -       rc =3D gpio_request(TOSA_GPIO_CARD_VCC_ON, "CARD_VCC_ON");
> -       if (rc)
> -               goto err_req;
> -
> -       rc =3D gpio_direction_output(TOSA_GPIO_CARD_VCC_ON, 1);
> -       if (rc)
> -               goto err_dir;
> -
> -       return rc;
> -
> -err_dir:
> -       gpio_free(TOSA_GPIO_CARD_VCC_ON);
> -err_req:
> -       return rc;
> -}
> -
> -static void tosa_tc6393xb_teardown(struct platform_device *dev)
> -{
> -       gpio_free(TOSA_GPIO_CARD_VCC_ON);
> -}
> -
>  #ifdef CONFIG_MFD_TC6393XB
>  static struct fb_videomode tosa_tc6393xb_lcd_mode[] =3D {
>         {
> @@ -778,9 +769,6 @@ static struct tc6393xb_platform_data tosa_tc6393xb_da=
ta =3D {
>         .scr_gper       =3D 0x3300,
>
>         .irq_base       =3D IRQ_BOARD_START,
> -       .gpio_base      =3D TOSA_TC6393XB_GPIO_BASE,
> -       .setup          =3D tosa_tc6393xb_setup,
> -       .teardown       =3D tosa_tc6393xb_teardown,
>
>         .enable         =3D tosa_tc6393xb_enable,
>         .disable        =3D tosa_tc6393xb_disable,
> @@ -821,26 +809,6 @@ static struct pxa2xx_spi_controller pxa_ssp_master_i=
nfo =3D {
>         .num_chipselect =3D 1,
>  };
>
> -static struct gpiod_lookup_table tosa_lcd_gpio_table =3D {
> -       .dev_id =3D "spi2.0",
> -       .table =3D {
> -               GPIO_LOOKUP("tc6393xb",
> -                           TOSA_GPIO_TG_ON - TOSA_TC6393XB_GPIO_BASE,
> -                           "tg #pwr", GPIO_ACTIVE_HIGH),
> -               { },
> -       },
> -};
> -
> -static struct gpiod_lookup_table tosa_lcd_bl_gpio_table =3D {
> -       .dev_id =3D "i2c-tosa-bl",
> -       .table =3D {
> -               GPIO_LOOKUP("tc6393xb",
> -                           TOSA_GPIO_BL_C20MA - TOSA_TC6393XB_GPIO_BASE,
> -                           "backlight", GPIO_ACTIVE_HIGH),
> -               { },
> -       },
> -};
> -
>  static struct spi_board_info spi_board_info[] __initdata =3D {
>         {
>                 .modalias       =3D "tosa-lcd",
> @@ -943,6 +911,8 @@ static void __init tosa_init(void)
>         /* enable batt_fault */
>         PMCR =3D 0x01;
>
> +       gpiod_add_lookup_table(&tosa_battery_gpio_table);
> +
>         gpiod_add_lookup_table(&tosa_mci_gpio_table);
>         pxa_set_mci_info(&tosa_mci_platform_data);
>         pxa_set_ficp_info(&tosa_ficp_platform_data);
> @@ -951,8 +921,6 @@ static void __init tosa_init(void)
>         platform_scoop_config =3D &tosa_pcmcia_config;
>
>         pxa2xx_set_spi_info(2, &pxa_ssp_master_info);
> -       gpiod_add_lookup_table(&tosa_lcd_gpio_table);
> -       gpiod_add_lookup_table(&tosa_lcd_bl_gpio_table);
>         spi_register_board_info(spi_board_info, ARRAY_SIZE(spi_board_info=
));
>
>         clk_add_alias("CLK_CK3P6MI", tc6393xb_device.name, "GPIO11_CLK", =
NULL);
> diff --git a/drivers/mfd/tc6393xb.c b/drivers/mfd/tc6393xb.c
> index 3d5b14c60e20..886006144896 100644
> --- a/drivers/mfd/tc6393xb.c
> +++ b/drivers/mfd/tc6393xb.c
> @@ -22,6 +22,8 @@
>  #include <linux/mfd/tmio.h>
>  #include <linux/mfd/tc6393xb.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/slab.h>
>
>  #define SCR_REVID      0x08            /* b Revision ID        */
> @@ -87,8 +89,10 @@
>
>  struct tc6393xb {
>         void __iomem            *scr;
> +       struct device           *dev;
>
>         struct gpio_chip        gpio;
> +       struct gpio_desc        *vcc_on;
>
>         struct clk              *clk; /* 3,6 Mhz */
>
> @@ -497,17 +501,93 @@ static int tc6393xb_gpio_direction_output(struct gp=
io_chip *chip,
>         return 0;
>  }
>
> -static int tc6393xb_register_gpio(struct tc6393xb *tc6393xb, int gpio_ba=
se)
> +/*
> + * TC6393XB GPIOs as used on TOSA, are the only user of this chip.
> + * The use of GPIOs 5, 8 and 14 is unknown.

2, 5, 8, 13 are not connected.

> + */
> +#define TOSA_GPIO_TG_ON                        0
> +#define TOSA_GPIO_L_MUTE               1
> +#define TOSA_GPIO_BL_C20MA             3
> +#define TOSA_GPIO_CARD_VCC_ON          4
> +#define TOSA_GPIO_CHARGE_OFF           6
> +#define TOSA_GPIO_CHARGE_OFF_JC                7
> +#define TOSA_GPIO_BAT0_V_ON            9
> +#define TOSA_GPIO_BAT1_V_ON            10
> +#define TOSA_GPIO_BU_CHRG_ON           11
> +#define TOSA_GPIO_BAT_SW_ON            12
> +#define TOSA_GPIO_BAT0_TH_ON           14
> +#define TOSA_GPIO_BAT1_TH_ON           15
> +
> +
> +GPIO_LOOKUP_SINGLE(tosa_lcd_gpio_lookup, "spi2.0", "tc6393xb",
> +                  TOSA_GPIO_TG_ON, "tg #pwr", GPIO_ACTIVE_HIGH);
> +
> +GPIO_LOOKUP_SINGLE(tosa_lcd_bl_gpio_lookup, "i2c-tos-bl", "tc6393xb",
> +                  TOSA_GPIO_BL_C20MA, "backlight", GPIO_ACTIVE_HIGH);
> +
> +GPIO_LOOKUP_SINGLE(tosa_audio_gpio_lookup, "tosa-audio", "tc6393xb",
> +                  TOSA_GPIO_L_MUTE, NULL, GPIO_ACTIVE_HIGH);
> +
> +static struct gpiod_lookup_table tosa_battery_gpio_lookup =3D {
> +       .dev_id =3D "wm97xx-battery",
> +       .table =3D {
> +               GPIO_LOOKUP("tc6393xb", TOSA_GPIO_CHARGE_OFF,
> +                           "main charge off", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("tc6393xb", TOSA_GPIO_CHARGE_OFF_JC,
> +                           "jacket charge off", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT0_V_ON,
> +                           "main battery", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT1_V_ON,
> +                           "jacket battery", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BU_CHRG_ON,
> +                           "backup battery", GPIO_ACTIVE_HIGH),
> +               /* BAT1 and BAT0 thermistors appear to be swapped */
> +               GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT1_TH_ON,
> +                           "main battery temp", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT0_TH_ON,
> +                           "jacket battery temp", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT_SW_ON,
> +                           "battery switch", GPIO_ACTIVE_HIGH),
> +               { },
> +       },
> +};
> +
> +static struct gpiod_lookup_table *tc6393xb_gpio_lookups[] =3D {
> +       &tosa_lcd_gpio_lookup,
> +       &tosa_lcd_bl_gpio_lookup,
> +       &tosa_audio_gpio_lookup,
> +       &tosa_battery_gpio_lookup,
> +};
> +
> +static int tc6393xb_register_gpio(struct tc6393xb *tc6393xb)
>  {
> -       tc6393xb->gpio.label =3D "tc6393xb";
> -       tc6393xb->gpio.base =3D gpio_base;
> -       tc6393xb->gpio.ngpio =3D 16;
> -       tc6393xb->gpio.set =3D tc6393xb_gpio_set;
> -       tc6393xb->gpio.get =3D tc6393xb_gpio_get;
> -       tc6393xb->gpio.direction_input =3D tc6393xb_gpio_direction_input;
> -       tc6393xb->gpio.direction_output =3D tc6393xb_gpio_direction_outpu=
t;
> -
> -       return gpiochip_add_data(&tc6393xb->gpio, tc6393xb);
> +       struct gpio_chip *gc =3D &tc6393xb->gpio;
> +       struct device *dev =3D tc6393xb->dev;
> +       int ret;
> +
> +       gc->label =3D "tc6393xb";
> +       gc->base =3D -1; /* Dynamic allocation */
> +       gc->ngpio =3D 16;
> +       gc->set =3D tc6393xb_gpio_set;
> +       gc->get =3D tc6393xb_gpio_get;
> +       gc->direction_input =3D tc6393xb_gpio_direction_input;
> +       gc->direction_output =3D tc6393xb_gpio_direction_output;
> +
> +       ret =3D devm_gpiochip_add_data(dev, gc, tc6393xb);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add GPIO chip\n=
");
> +
> +       /* Register descriptor look-ups for consumers */
> +       gpiod_add_lookup_tables(tc6393xb_gpio_lookups, ARRAY_SIZE(tc6393x=
b_gpio_lookups));
> +
> +       /* Request some of our own GPIOs */
> +       tc6393xb->vcc_on =3D gpiochip_request_own_desc(gc, TOSA_GPIO_CARD=
_VCC_ON, "VCC ON",
> +                                                    GPIO_ACTIVE_HIGH, GP=
IOD_OUT_HIGH);
> +       if (IS_ERR(tc6393xb->vcc_on))
> +               return dev_err_probe(dev, PTR_ERR(tc6393xb->vcc_on),
> +                                    "failed to request VCC ON GPIO\n");
> +
> +       return 0;
>  }
>
>  /*----------------------------------------------------------------------=
----*/
> @@ -617,6 +697,7 @@ static int tc6393xb_probe(struct platform_device *dev=
)
>                 ret =3D -ENOMEM;
>                 goto err_kzalloc;
>         }
> +       tc6393xb->dev =3D &dev->dev;
>
>         raw_spin_lock_init(&tc6393xb->lock);
>
> @@ -676,22 +757,12 @@ static int tc6393xb_probe(struct platform_device *d=
ev)
>                         tmio_ioread8(tc6393xb->scr + SCR_REVID),
>                         (unsigned long) iomem->start, tc6393xb->irq);
>
> -       tc6393xb->gpio.base =3D -1;
> -
> -       if (tcpd->gpio_base >=3D 0) {
> -               ret =3D tc6393xb_register_gpio(tc6393xb, tcpd->gpio_base)=
;
> -               if (ret)
> -                       goto err_gpio_add;
> -       }
> +       ret =3D tc6393xb_register_gpio(tc6393xb);
> +       if (ret)
> +               goto err_gpio_add;
>
>         tc6393xb_attach_irq(dev);
>
> -       if (tcpd->setup) {
> -               ret =3D tcpd->setup(dev);
> -               if (ret)
> -                       goto err_setup;
> -       }
> -
>         tc6393xb_cells[TC6393XB_CELL_NAND].platform_data =3D tcpd->nand_d=
ata;
>         tc6393xb_cells[TC6393XB_CELL_NAND].pdata_size =3D
>                                                 sizeof(*tcpd->nand_data);
> @@ -705,15 +776,8 @@ static int tc6393xb_probe(struct platform_device *de=
v)
>         if (!ret)
>                 return 0;
>
> -       if (tcpd->teardown)
> -               tcpd->teardown(dev);
> -
> -err_setup:
>         tc6393xb_detach_irq(dev);
> -
>  err_gpio_add:
> -       if (tc6393xb->gpio.base !=3D -1)
> -               gpiochip_remove(&tc6393xb->gpio);
>         tcpd->disable(dev);
>  err_enable:
>         clk_disable_unprepare(tc6393xb->clk);
> @@ -738,14 +802,8 @@ static int tc6393xb_remove(struct platform_device *d=
ev)
>
>         mfd_remove_devices(&dev->dev);
>
> -       if (tcpd->teardown)
> -               tcpd->teardown(dev);
> -
>         tc6393xb_detach_irq(dev);
>
> -       if (tc6393xb->gpio.base !=3D -1)
> -               gpiochip_remove(&tc6393xb->gpio);
> -
>         ret =3D tcpd->disable(dev);
>         clk_disable_unprepare(tc6393xb->clk);
>         iounmap(tc6393xb->scr);
> diff --git a/drivers/power/supply/tosa_battery.c b/drivers/power/supply/t=
osa_battery.c
> index 32cc31cd4761..272d3ee44769 100644
> --- a/drivers/power/supply/tosa_battery.c
> +++ b/drivers/power/supply/tosa_battery.c
> @@ -12,7 +12,7 @@
>  #include <linux/delay.h>
>  #include <linux/spinlock.h>
>  #include <linux/interrupt.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>
>  #include <asm/mach-types.h>
>  #include <mach/tosa.h>
> @@ -28,22 +28,23 @@ struct tosa_bat {
>         struct mutex work_lock; /* protects data */
>
>         bool (*is_present)(struct tosa_bat *bat);
> -       int gpio_full;
> -       int gpio_charge_off;
> +       struct gpio_desc *gpiod_full;
> +       struct gpio_desc *gpiod_charge_off;
>
>         int technology;
>
> -       int gpio_bat;
> +       struct gpio_desc *gpiod_bat;
>         int adc_bat;
>         int adc_bat_divider;
>         int bat_max;
>         int bat_min;
>
> -       int gpio_temp;
> +       struct gpio_desc *gpiod_temp;
>         int adc_temp;
>         int adc_temp_divider;
>  };
>
> +static struct gpio_desc *jacket_detect;
>  static struct tosa_bat tosa_bat_main;
>  static struct tosa_bat tosa_bat_jacket;
>
> @@ -51,15 +52,15 @@ static unsigned long tosa_read_bat(struct tosa_bat *b=
at)
>  {
>         unsigned long value =3D 0;
>
> -       if (bat->gpio_bat < 0 || bat->adc_bat < 0)
> +       if (!bat->gpiod_bat || bat->adc_bat < 0)
>                 return 0;
>
>         mutex_lock(&bat_lock);
> -       gpio_set_value(bat->gpio_bat, 1);
> +       gpiod_set_value(bat->gpiod_bat, 1);
>         msleep(5);
>         value =3D wm97xx_read_aux_adc(dev_get_drvdata(bat->psy->dev.paren=
t),
>                         bat->adc_bat);
> -       gpio_set_value(bat->gpio_bat, 0);
> +       gpiod_set_value(bat->gpiod_bat, 0);
>         mutex_unlock(&bat_lock);
>
>         value =3D value * 1000000 / bat->adc_bat_divider;
> @@ -71,15 +72,15 @@ static unsigned long tosa_read_temp(struct tosa_bat *=
bat)
>  {
>         unsigned long value =3D 0;
>
> -       if (bat->gpio_temp < 0 || bat->adc_temp < 0)
> +       if (!bat->gpiod_temp || bat->adc_temp < 0)
>                 return 0;
>
>         mutex_lock(&bat_lock);
> -       gpio_set_value(bat->gpio_temp, 1);
> +       gpiod_set_value(bat->gpiod_temp, 1);
>         msleep(5);
>         value =3D wm97xx_read_aux_adc(dev_get_drvdata(bat->psy->dev.paren=
t),
>                         bat->adc_temp);
> -       gpio_set_value(bat->gpio_temp, 0);
> +       gpiod_set_value(bat->gpiod_temp, 0);
>         mutex_unlock(&bat_lock);
>
>         value =3D value * 10000 / bat->adc_temp_divider;
> @@ -136,7 +137,7 @@ static int tosa_bat_get_property(struct power_supply =
*psy,
>
>  static bool tosa_jacket_bat_is_present(struct tosa_bat *bat)
>  {
> -       return gpio_get_value(TOSA_GPIO_JACKET_DETECT) =3D=3D 0;
> +       return gpiod_get_value(jacket_detect) =3D=3D 0;
>  }
>
>  static void tosa_bat_external_power_changed(struct power_supply *psy)
> @@ -166,23 +167,23 @@ static void tosa_bat_update(struct tosa_bat *bat)
>                 bat->full_chrg =3D -1;
>         } else if (power_supply_am_i_supplied(psy)) {
>                 if (bat->status =3D=3D POWER_SUPPLY_STATUS_DISCHARGING) {
> -                       gpio_set_value(bat->gpio_charge_off, 0);
> +                       gpiod_set_value(bat->gpiod_charge_off, 0);
>                         mdelay(15);
>                 }
>
> -               if (gpio_get_value(bat->gpio_full)) {
> +               if (gpiod_get_value(bat->gpiod_full)) {
>                         if (old =3D=3D POWER_SUPPLY_STATUS_CHARGING ||
>                                         bat->full_chrg =3D=3D -1)
>                                 bat->full_chrg =3D tosa_read_bat(bat);
>
> -                       gpio_set_value(bat->gpio_charge_off, 1);
> +                       gpiod_set_value(bat->gpiod_charge_off, 1);
>                         bat->status =3D POWER_SUPPLY_STATUS_FULL;
>                 } else {
> -                       gpio_set_value(bat->gpio_charge_off, 0);
> +                       gpiod_set_value(bat->gpiod_charge_off, 0);
>                         bat->status =3D POWER_SUPPLY_STATUS_CHARGING;
>                 }
>         } else {
> -               gpio_set_value(bat->gpio_charge_off, 1);
> +               gpiod_set_value(bat->gpiod_charge_off, 1);
>                 bat->status =3D POWER_SUPPLY_STATUS_DISCHARGING;
>         }
>
> @@ -251,18 +252,18 @@ static struct tosa_bat tosa_bat_main =3D {
>         .full_chrg =3D -1,
>         .psy =3D NULL,
>
> -       .gpio_full =3D TOSA_GPIO_BAT0_CRG,
> -       .gpio_charge_off =3D TOSA_GPIO_CHARGE_OFF,
> +       .gpiod_full =3D NULL,
> +       .gpiod_charge_off =3D NULL,
>
>         .technology =3D POWER_SUPPLY_TECHNOLOGY_LIPO,
>
> -       .gpio_bat =3D TOSA_GPIO_BAT0_V_ON,
> +       .gpiod_bat =3D NULL,
>         .adc_bat =3D WM97XX_AUX_ID3,
>         .adc_bat_divider =3D 414,
>         .bat_max =3D 4310000,
>         .bat_min =3D 1551 * 1000000 / 414,
>
> -       .gpio_temp =3D TOSA_GPIO_BAT1_TH_ON,
> +       .gpiod_temp =3D NULL,
>         .adc_temp =3D WM97XX_AUX_ID2,
>         .adc_temp_divider =3D 10000,
>  };
> @@ -273,18 +274,18 @@ static struct tosa_bat tosa_bat_jacket =3D {
>         .psy =3D NULL,
>
>         .is_present =3D tosa_jacket_bat_is_present,
> -       .gpio_full =3D TOSA_GPIO_BAT1_CRG,
> -       .gpio_charge_off =3D TOSA_GPIO_CHARGE_OFF_JC,
> +       .gpiod_full =3D NULL,
> +       .gpiod_charge_off =3D NULL,
>
>         .technology =3D POWER_SUPPLY_TECHNOLOGY_LIPO,
>
> -       .gpio_bat =3D TOSA_GPIO_BAT1_V_ON,
> +       .gpiod_bat =3D NULL,
>         .adc_bat =3D WM97XX_AUX_ID3,
>         .adc_bat_divider =3D 414,
>         .bat_max =3D 4310000,
>         .bat_min =3D 1551 * 1000000 / 414,
>
> -       .gpio_temp =3D TOSA_GPIO_BAT0_TH_ON,
> +       .gpiod_temp =3D NULL,
>         .adc_temp =3D WM97XX_AUX_ID2,
>         .adc_temp_divider =3D 10000,
>  };
> @@ -294,36 +295,20 @@ static struct tosa_bat tosa_bat_bu =3D {
>         .full_chrg =3D -1,
>         .psy =3D NULL,
>
> -       .gpio_full =3D -1,
> -       .gpio_charge_off =3D -1,
> +       .gpiod_full =3D NULL,
> +       .gpiod_charge_off =3D NULL,
>
>         .technology =3D POWER_SUPPLY_TECHNOLOGY_LiMn,
>
> -       .gpio_bat =3D TOSA_GPIO_BU_CHRG_ON,
> +       .gpiod_bat =3D NULL,
>         .adc_bat =3D WM97XX_AUX_ID4,
>         .adc_bat_divider =3D 1266,
>
> -       .gpio_temp =3D -1,
> +       .gpiod_temp =3D NULL,
>         .adc_temp =3D -1,
>         .adc_temp_divider =3D -1,
>  };
>
> -static struct gpio tosa_bat_gpios[] =3D {
> -       { TOSA_GPIO_CHARGE_OFF,    GPIOF_OUT_INIT_HIGH, "main charge off"=
 },
> -       { TOSA_GPIO_CHARGE_OFF_JC, GPIOF_OUT_INIT_HIGH, "jacket charge of=
f" },
> -       { TOSA_GPIO_BAT_SW_ON,     GPIOF_OUT_INIT_LOW,  "battery switch" =
},
> -       { TOSA_GPIO_BAT0_V_ON,     GPIOF_OUT_INIT_LOW,  "main battery" },
> -       { TOSA_GPIO_BAT1_V_ON,     GPIOF_OUT_INIT_LOW,  "jacket battery" =
},
> -       { TOSA_GPIO_BAT1_TH_ON,    GPIOF_OUT_INIT_LOW,  "main battery tem=
p" },
> -       { TOSA_GPIO_BAT0_TH_ON,    GPIOF_OUT_INIT_LOW,  "jacket battery t=
emp" },
> -       { TOSA_GPIO_BU_CHRG_ON,    GPIOF_OUT_INIT_LOW,  "backup battery" =
},
> -       { TOSA_GPIO_BAT0_CRG,      GPIOF_IN,            "main battery ful=
l" },
> -       { TOSA_GPIO_BAT1_CRG,      GPIOF_IN,            "jacket battery f=
ull" },
> -       { TOSA_GPIO_BAT0_LOW,      GPIOF_IN,            "main battery low=
" },
> -       { TOSA_GPIO_BAT1_LOW,      GPIOF_IN,            "jacket battery l=
ow" },
> -       { TOSA_GPIO_JACKET_DETECT, GPIOF_IN,            "jacket detect" }=
,
> -};
> -
>  #ifdef CONFIG_PM
>  static int tosa_bat_suspend(struct platform_device *dev, pm_message_t st=
ate)
>  {
> @@ -343,19 +328,83 @@ static int tosa_bat_resume(struct platform_device *=
dev)
>  #define tosa_bat_resume NULL
>  #endif
>
> -static int tosa_bat_probe(struct platform_device *dev)
> +static int tosa_bat_probe(struct platform_device *pdev)
>  {
>         int ret;
>         struct power_supply_config main_psy_cfg =3D {},
>                                    jacket_psy_cfg =3D {},
>                                    bu_psy_cfg =3D {};
> +       struct device *dev =3D &pdev->dev;
> +       struct gpio_desc *dummy;
>
>         if (!machine_is_tosa())
>                 return -ENODEV;
>
> -       ret =3D gpio_request_array(tosa_bat_gpios, ARRAY_SIZE(tosa_bat_gp=
ios));
> -       if (ret)
> -               return ret;
> +       /* Main charging control GPIOs */
> +       tosa_bat_main.gpiod_charge_off =3D devm_gpiod_get(dev, "main char=
ge off", GPIOD_OUT_HIGH);
> +       if (IS_ERR(tosa_bat_main.gpiod_charge_off))
> +               return dev_err_probe(dev, PTR_ERR(tosa_bat_main.gpiod_cha=
rge_off),
> +                                    "no main charger GPIO\n");
> +       tosa_bat_jacket.gpiod_charge_off =3D devm_gpiod_get(dev, "jacket =
charge off", GPIOD_OUT_HIGH);
> +       if (IS_ERR(tosa_bat_jacket.gpiod_charge_off))
> +               return dev_err_probe(dev, PTR_ERR(tosa_bat_jacket.gpiod_c=
harge_off),
> +                                    "no jacket charger GPIO\n");
> +
> +       /* Per-battery output check (routes battery voltage to ADC) */
> +       tosa_bat_main.gpiod_bat =3D devm_gpiod_get(dev, "main battery", G=
PIOD_OUT_LOW);
> +       if (IS_ERR(tosa_bat_main.gpiod_bat))
> +               return dev_err_probe(dev, PTR_ERR(tosa_bat_main.gpiod_bat=
),
> +                                    "no main battery GPIO\n");
> +       tosa_bat_jacket.gpiod_bat =3D devm_gpiod_get(dev, "jacket battery=
", GPIOD_OUT_LOW);
> +       if (IS_ERR(tosa_bat_jacket.gpiod_bat))
> +               return dev_err_probe(dev, PTR_ERR(tosa_bat_jacket.gpiod_b=
at),
> +                                    "no jacket battery GPIO\n");
> +       tosa_bat_bu.gpiod_bat =3D devm_gpiod_get(dev, "backup battery", G=
PIOD_OUT_LOW);
> +       if (IS_ERR(tosa_bat_bu.gpiod_bat))
> +               return dev_err_probe(dev, PTR_ERR(tosa_bat_bu.gpiod_bat),
> +                                    "no backup battery GPIO\n");
> +
> +       /* Battery full detect GPIOs (using PXA SoC GPIOs) */
> +       tosa_bat_main.gpiod_full =3D devm_gpiod_get(dev, "main battery fu=
ll", GPIOD_IN);
> +       if (IS_ERR(tosa_bat_main.gpiod_full))
> +               return dev_err_probe(dev, PTR_ERR(tosa_bat_main.gpiod_ful=
l),
> +                                    "no main battery full GPIO\n");
> +       tosa_bat_jacket.gpiod_full =3D devm_gpiod_get(dev, "jacket batter=
y full", GPIOD_IN);
> +       if (IS_ERR(tosa_bat_jacket.gpiod_full))
> +               return dev_err_probe(dev, PTR_ERR(tosa_bat_jacket.gpiod_f=
ull),
> +                                    "no jacket battery full GPIO\n");
> +
> +       /* Battery temperature GPIOs (routes thermistor voltage to ADC) *=
/
> +       tosa_bat_main.gpiod_temp =3D devm_gpiod_get(dev, "main battery te=
mp", GPIOD_OUT_LOW);
> +       if (IS_ERR(tosa_bat_main.gpiod_temp))
> +               return dev_err_probe(dev, PTR_ERR(tosa_bat_main.gpiod_tem=
p),
> +                                    "no main battery temp GPIO\n");
> +       tosa_bat_jacket.gpiod_temp =3D devm_gpiod_get(dev, "jacket batter=
y temp", GPIOD_OUT_LOW);
> +       if (IS_ERR(tosa_bat_jacket.gpiod_temp))
> +               return dev_err_probe(dev, PTR_ERR(tosa_bat_jacket.gpiod_t=
emp),
> +                                    "no jacket battery temp GPIO\n");
> +
> +       /* Jacket detect GPIO */
> +       jacket_detect =3D devm_gpiod_get(dev, "jacket detect", GPIOD_IN);
> +       if (IS_ERR(jacket_detect))
> +               return dev_err_probe(dev, PTR_ERR(jacket_detect),
> +                                    "no jacket detect GPIO\n");
> +
> +       /* Battery low indication GPIOs (not used, we just request them) =
*/
> +       dummy =3D devm_gpiod_get(dev, "main battery low", GPIOD_IN);
> +       if (IS_ERR(dummy))
> +               return dev_err_probe(dev, PTR_ERR(dummy),
> +                                    "no main battery low GPIO\n");
> +       dummy =3D devm_gpiod_get(dev, "jacket battery low", GPIOD_IN);
> +       if (IS_ERR(dummy))
> +               return dev_err_probe(dev, PTR_ERR(dummy),
> +                                    "no jacket battery low GPIO\n");
> +
> +       /* Battery switch GPIO (not used just requested) */
> +       dummy =3D devm_gpiod_get(dev, "battery switch", GPIOD_OUT_LOW);
> +       if (IS_ERR(dummy))
> +               return dev_err_probe(dev, PTR_ERR(dummy),
> +                                    "no battery switch GPIO\n");
>
>         mutex_init(&tosa_bat_main.work_lock);
>         mutex_init(&tosa_bat_jacket.work_lock);
> @@ -363,7 +412,7 @@ static int tosa_bat_probe(struct platform_device *dev=
)
>         INIT_WORK(&bat_work, tosa_bat_work);
>
>         main_psy_cfg.drv_data =3D &tosa_bat_main;
> -       tosa_bat_main.psy =3D power_supply_register(&dev->dev,
> +       tosa_bat_main.psy =3D power_supply_register(dev,
>                                                   &tosa_bat_main_desc,
>                                                   &main_psy_cfg);
>         if (IS_ERR(tosa_bat_main.psy)) {
> @@ -372,7 +421,7 @@ static int tosa_bat_probe(struct platform_device *dev=
)
>         }
>
>         jacket_psy_cfg.drv_data =3D &tosa_bat_jacket;
> -       tosa_bat_jacket.psy =3D power_supply_register(&dev->dev,
> +       tosa_bat_jacket.psy =3D power_supply_register(dev,
>                                                     &tosa_bat_jacket_desc=
,
>                                                     &jacket_psy_cfg);
>         if (IS_ERR(tosa_bat_jacket.psy)) {
> @@ -381,28 +430,28 @@ static int tosa_bat_probe(struct platform_device *d=
ev)
>         }
>
>         bu_psy_cfg.drv_data =3D &tosa_bat_bu;
> -       tosa_bat_bu.psy =3D power_supply_register(&dev->dev, &tosa_bat_bu=
_desc,
> +       tosa_bat_bu.psy =3D power_supply_register(dev, &tosa_bat_bu_desc,
>                                                 &bu_psy_cfg);
>         if (IS_ERR(tosa_bat_bu.psy)) {
>                 ret =3D PTR_ERR(tosa_bat_bu.psy);
>                 goto err_psy_reg_bu;
>         }
>
> -       ret =3D request_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG),
> +       ret =3D request_irq(gpiod_to_irq(tosa_bat_main.gpiod_full),
>                                 tosa_bat_gpio_isr,
>                                 IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLIN=
G,
>                                 "main full", &tosa_bat_main);
>         if (ret)
>                 goto err_req_main;
>
> -       ret =3D request_irq(gpio_to_irq(TOSA_GPIO_BAT1_CRG),
> +       ret =3D request_irq(gpiod_to_irq(tosa_bat_jacket.gpiod_full),
>                                 tosa_bat_gpio_isr,
>                                 IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLIN=
G,
>                                 "jacket full", &tosa_bat_jacket);
>         if (ret)
>                 goto err_req_jacket;
>
> -       ret =3D request_irq(gpio_to_irq(TOSA_GPIO_JACKET_DETECT),
> +       ret =3D request_irq(gpiod_to_irq(jacket_detect),
>                                 tosa_bat_gpio_isr,
>                                 IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLIN=
G,
>                                 "jacket detect", &tosa_bat_jacket);
> @@ -411,9 +460,9 @@ static int tosa_bat_probe(struct platform_device *dev=
)
>                 return 0;
>         }
>
> -       free_irq(gpio_to_irq(TOSA_GPIO_BAT1_CRG), &tosa_bat_jacket);
> +       free_irq(gpiod_to_irq(tosa_bat_jacket.gpiod_full), &tosa_bat_jack=
et);
>  err_req_jacket:
> -       free_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG), &tosa_bat_main);
> +       free_irq(gpiod_to_irq(tosa_bat_main.gpiod_full), &tosa_bat_main);
>  err_req_main:
>         power_supply_unregister(tosa_bat_bu.psy);
>  err_psy_reg_bu:
> @@ -425,15 +474,14 @@ static int tosa_bat_probe(struct platform_device *d=
ev)
>         /* see comment in tosa_bat_remove */
>         cancel_work_sync(&bat_work);
>
> -       gpio_free_array(tosa_bat_gpios, ARRAY_SIZE(tosa_bat_gpios));
>         return ret;
>  }
>
>  static int tosa_bat_remove(struct platform_device *dev)
>  {
> -       free_irq(gpio_to_irq(TOSA_GPIO_JACKET_DETECT), &tosa_bat_jacket);
> -       free_irq(gpio_to_irq(TOSA_GPIO_BAT1_CRG), &tosa_bat_jacket);
> -       free_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG), &tosa_bat_main);
> +       free_irq(gpiod_to_irq(jacket_detect), &tosa_bat_jacket);
> +       free_irq(gpiod_to_irq(tosa_bat_jacket.gpiod_full), &tosa_bat_jack=
et);
> +       free_irq(gpiod_to_irq(tosa_bat_main.gpiod_full), &tosa_bat_main);
>
>         power_supply_unregister(tosa_bat_bu.psy);
>         power_supply_unregister(tosa_bat_jacket.psy);
> @@ -445,7 +493,6 @@ static int tosa_bat_remove(struct platform_device *de=
v)
>          * unregistered now.
>          */
>         cancel_work_sync(&bat_work);
> -       gpio_free_array(tosa_bat_gpios, ARRAY_SIZE(tosa_bat_gpios));
>         return 0;
>  }
>
> diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
> index 2647dd10b541..4d55da28e664 100644
> --- a/include/linux/gpio/machine.h
> +++ b/include/linux/gpio/machine.h
> @@ -63,6 +63,18 @@ struct gpiod_hog {
>         int dflags;
>  };
>
> +/*
> + * Helper for lookup tables with just one single lookup for a device.
> + */
> +#define GPIO_LOOKUP_SINGLE(_name, _dev_id, _key, _chip_hwnum, _con_id, _=
flags) \
> +static struct gpiod_lookup_table _name =3D {                            =
 \
> +       .dev_id =3D _dev_id,                                             =
 \
> +       .table =3D {                                                     =
 \
> +               GPIO_LOOKUP(_key, _chip_hwnum, _con_id, _flags),        \
> +               {},                                                     \
> +       },                                                              \
> +}
> +
>  /*
>   * Simple definition of a single GPIO under a con_id
>   */
> diff --git a/include/linux/mfd/tc6393xb.h b/include/linux/mfd/tc6393xb.h
> index fcc8e74f0e8d..d336c541b7df 100644
> --- a/include/linux/mfd/tc6393xb.h
> +++ b/include/linux/mfd/tc6393xb.h
> @@ -27,9 +27,6 @@ struct tc6393xb_platform_data {
>         int     (*resume)(struct platform_device *dev);
>
>         int     irq_base;       /* base for subdevice irqs */
> -       int     gpio_base;
> -       int     (*setup)(struct platform_device *dev);
> -       void    (*teardown)(struct platform_device *dev);
>
>         struct tmio_nand_data   *nand_data;
>         struct tmio_fb_data     *fb_data;
> diff --git a/sound/soc/pxa/tosa.c b/sound/soc/pxa/tosa.c
> index 3b40b5fa5de7..c2b05896e284 100644
> --- a/sound/soc/pxa/tosa.c
> +++ b/sound/soc/pxa/tosa.c
> @@ -16,7 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/device.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
> @@ -33,6 +33,7 @@
>  #define TOSA_SPK_ON    0
>  #define TOSA_SPK_OFF   1
>
> +static struct gpio_desc *tosa_mute;
>  static int tosa_jack_func;
>  static int tosa_spk_func;
>
> @@ -128,7 +129,7 @@ static int tosa_set_spk(struct snd_kcontrol *kcontrol=
,
>  static int tosa_hp_event(struct snd_soc_dapm_widget *w,
>         struct snd_kcontrol *k, int event)
>  {
> -       gpio_set_value(TOSA_GPIO_L_MUTE, SND_SOC_DAPM_EVENT_ON(event) ? 1=
 : 0);
> +       gpiod_set_value(tosa_mute, SND_SOC_DAPM_EVENT_ON(event) ? 1 : 0);
>         return 0;
>  }
>
> @@ -222,8 +223,11 @@ static int tosa_probe(struct platform_device *pdev)
>         struct snd_soc_card *card =3D &tosa;
>         int ret;
>
> -       ret =3D gpio_request_one(TOSA_GPIO_L_MUTE, GPIOF_OUT_INIT_LOW,
> -                              "Headphone Jack");
> +       tosa_mute =3D devm_gpiod_get(&pdev->dev, NULL, GPIOD_OUT_LOW);
> +       if (IS_ERR(tosa_mute))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(tosa_mute),
> +                                    "failed to get L_MUTE GPIO\n");
> +       gpiod_set_consumer_name(tosa_mute, "Headphone Jack");
>         if (ret)
>                 return ret;
>
> @@ -233,24 +237,16 @@ static int tosa_probe(struct platform_device *pdev)
>         if (ret) {
>                 dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n=
",
>                         ret);
> -               gpio_free(TOSA_GPIO_L_MUTE);
>         }
>         return ret;
>  }
>
> -static int tosa_remove(struct platform_device *pdev)
> -{
> -       gpio_free(TOSA_GPIO_L_MUTE);
> -       return 0;
> -}
> -
>  static struct platform_driver tosa_driver =3D {
>         .driver         =3D {
>                 .name   =3D "tosa-audio",
>                 .pm     =3D &snd_soc_pm_ops,
>         },
>         .probe          =3D tosa_probe,
> -       .remove         =3D tosa_remove,
>  };
>
>  module_platform_driver(tosa_driver);
> --
> 2.34.1
>


--=20
With best wishes
Dmitry
