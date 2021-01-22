Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C262300398
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbhAVM7t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbhAVM7o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 07:59:44 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA27CC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:59:03 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id n6so6421031edt.10
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IJRMyBa4Hn27zH6SoJpaMCuNCQ8I4sXJv8rChdjBtGQ=;
        b=q1W7E8fqVdpjVGGW65CI2Bp8mlkwJ8iQ3tBUfG/LXpsAT19qOUMYFVBCAV+lf345eU
         NqrSD/6UykgWB9Ceesij6Jp6XSlXuC8cBTGrJGHBTUrBGIY8DSVwlYaqG/gk6d+mKG8v
         TLAuFT96UPrc78Eq41NEVeakMvjVyJf92dldNukv0HVpGW5Yf0+ubwjzdMfaauoLENdi
         0bzhQufJ2IfaNggV+AMch11pcPZEBJwpy3AaxwO7H43XnZcd0dT55wrcfICebj/yqDCe
         JKw+H2aYY+zRRO3agvNBUOxB9N+rFzS724WD7wouX3SatRK4kh/rso1IyXD5s6qiDLJb
         Zegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJRMyBa4Hn27zH6SoJpaMCuNCQ8I4sXJv8rChdjBtGQ=;
        b=UCo4M8yhN92y2exI9wWGle4vt11mihBpfjZzZVlqYs8z4ol2aQXf+q+vjwKbRaVNUi
         e913RdgGUio30wDZixzBEpX83+2M4WaW89SarRoQ9b37E3m0VHf3SwvxuHktTrEbtlNO
         rmQfIEEYOg5j2fGHWIrEs7K8qT4MAUfCCLSwFLQv2vOrz7JvE15tOuSppzeCjHFekCsi
         8QuyDdDJj96+t/yUW8hHNfwYZcyXdHgml7G+2B/oyKqrfUrqkYR5G38aG0Yb/7vapsAV
         TcSNIQ1QMYc4LyHyNesIV0ePr/bSt/rfmxfK2kIDFADIHfZ7avq3SvgbrU4oNIYnfQIg
         8yUQ==
X-Gm-Message-State: AOAM533zL48/LrFs+Hs4V0iJPYesOoGMosfltpmw1tXT0XXYgqC6cLPH
        CYgiOLGBcILYY0NliyvL82TaB4QcFNZKI4KYQyWI6w==
X-Google-Smtp-Source: ABdhPJxnKNA2uw8HWdjktdKovv7UoqyJ7GBzL61SPgknUbAGoD6BseGLdFOncqVlbzYTxOMUXe1NQyC3/w8aQEPKASk=
X-Received: by 2002:a05:6402:35ca:: with SMTP id z10mr3161191edc.186.1611320342667;
 Fri, 22 Jan 2021 04:59:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610364681.git.baruch@tkos.co.il> <ba8d5d482a98690140e02c3a35506490e0c6ecb4.1610364681.git.baruch@tkos.co.il>
In-Reply-To: <ba8d5d482a98690140e02c3a35506490e0c6ecb4.1610364681.git.baruch@tkos.co.il>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 13:58:51 +0100
Message-ID: <CAMpxmJUGHqJ0C9A84LBF_xzwjbqwFnUnYqFTGBg2CXhKUWd-zg@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] gpio: mvebu: add pwm support for Armada 8K/7K
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Ralph Sennhauser <ralph.sennhauser@gmail.com>,
        linux-pwm@vger.kernel.org, linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 12:47 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Use the marvell,pwm-offset DT property to store the location of PWM
> signal duration registers.
>
> Since we have more than two GPIO chips per system, we can't use the
> alias id to differentiate between them. Use the offset value for that.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/gpio/gpio-mvebu.c | 101 +++++++++++++++++++++++++-------------
>  1 file changed, 68 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 4261e3b22b4e..6bd45c59056a 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -70,7 +70,12 @@
>   */
>  #define PWM_BLINK_ON_DURATION_OFF      0x0
>  #define PWM_BLINK_OFF_DURATION_OFF     0x4
> +#define PWM_BLINK_COUNTER_B_OFF                0x8
>
> +/* Armada 8k variant gpios register offsets */
> +#define AP80X_GPIO0_OFF_A8K            0x1040
> +#define CP11X_GPIO0_OFF_A8K            0x100
> +#define CP11X_GPIO1_OFF_A8K            0x140
>
>  /* The MV78200 has per-CPU registers for edge mask and level mask */
>  #define GPIO_EDGE_MASK_MV78200_OFF(cpu)          ((cpu) ? 0x30 : 0x18)
> @@ -93,6 +98,7 @@
>
>  struct mvebu_pwm {
>         struct regmap           *regs;
> +       u32                      offset;
>         unsigned long            clk_rate;
>         struct gpio_desc        *gpiod;
>         struct pwm_chip          chip;
> @@ -283,12 +289,12 @@ mvebu_gpio_write_level_mask(struct mvebu_gpio_chip *mvchip, u32 val)
>   */
>  static unsigned int mvebu_pwmreg_blink_on_duration(struct mvebu_pwm *mvpwm)
>  {
> -       return PWM_BLINK_ON_DURATION_OFF;
> +       return mvpwm->offset + PWM_BLINK_ON_DURATION_OFF;
>  }
>
>  static unsigned int mvebu_pwmreg_blink_off_duration(struct mvebu_pwm *mvpwm)
>  {
> -       return PWM_BLINK_OFF_DURATION_OFF;
> +       return mvpwm->offset + PWM_BLINK_OFF_DURATION_OFF;
>  }
>
>  /*
> @@ -775,51 +781,80 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
>         struct device *dev = &pdev->dev;
>         struct mvebu_pwm *mvpwm;
>         void __iomem *base;
> +       u32 offset;
>         u32 set;
>
> -       if (!of_device_is_compatible(mvchip->chip.of_node,
> -                                    "marvell,armada-370-gpio"))
> -               return 0;
> -
> -       /*
> -        * There are only two sets of PWM configuration registers for
> -        * all the GPIO lines on those SoCs which this driver reserves
> -        * for the first two GPIO chips. So if the resource is missing
> -        * we can't treat it as an error.
> -        */
> -       if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwm"))
> +       if (of_device_is_compatible(mvchip->chip.of_node,
> +                                   "marvell,armada-370-gpio")) {
> +               /*
> +                * There are only two sets of PWM configuration registers for
> +                * all the GPIO lines on those SoCs which this driver reserves
> +                * for the first two GPIO chips. So if the resource is missing
> +                * we can't treat it as an error.
> +                */
> +               if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwm"))
> +                       return 0;
> +               offset = 0;
> +       } else if (mvchip->soc_variant == MVEBU_GPIO_SOC_VARIANT_A8K) {
> +               int ret = of_property_read_u32(dev->of_node,
> +                                              "marvell,pwm-offset", &offset);
> +               if (ret < 0)
> +                       return 0;
> +       } else {
>                 return 0;
> +       }
>
>         if (IS_ERR(mvchip->clk))
>                 return PTR_ERR(mvchip->clk);
>
> -       /*
> -        * Use set A for lines of GPIO chip with id 0, B for GPIO chip
> -        * with id 1. Don't allow further GPIO chips to be used for PWM.
> -        */
> -       if (id == 0)
> -               set = 0;
> -       else if (id == 1)
> -               set = U32_MAX;
> -       else
> -               return -EINVAL;
> -       regmap_write(mvchip->regs,
> -                    GPIO_BLINK_CNT_SELECT_OFF + mvchip->offset, set);
> -
>         mvpwm = devm_kzalloc(dev, sizeof(struct mvebu_pwm), GFP_KERNEL);
>         if (!mvpwm)
>                 return -ENOMEM;
>         mvchip->mvpwm = mvpwm;
>         mvpwm->mvchip = mvchip;
> +       mvpwm->offset = offset;
> +
> +       if (mvchip->soc_variant == MVEBU_GPIO_SOC_VARIANT_A8K) {
> +               mvpwm->regs = mvchip->regs;
> +
> +               switch (mvchip->offset) {
> +               case AP80X_GPIO0_OFF_A8K:
> +               case CP11X_GPIO0_OFF_A8K:
> +                       /* Blink counter A */
> +                       set = 0;
> +                       break;
> +               case CP11X_GPIO1_OFF_A8K:
> +                       /* Blink counter B */
> +                       set = U32_MAX;
> +                       mvpwm->offset += PWM_BLINK_COUNTER_B_OFF;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       } else {
> +               base = devm_platform_ioremap_resource_byname(pdev, "pwm");
> +               if (IS_ERR(base))
> +                       return PTR_ERR(base);
>
> -       base = devm_platform_ioremap_resource_byname(pdev, "pwm");
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> +               mvpwm->regs = devm_regmap_init_mmio(&pdev->dev, base,
> +                                                   &mvebu_gpio_regmap_config);
> +               if (IS_ERR(mvpwm->regs))
> +                       return PTR_ERR(mvpwm->regs);
>
> -       mvpwm->regs = devm_regmap_init_mmio(&pdev->dev, base,
> -                                           &mvebu_gpio_regmap_config);
> -       if (IS_ERR(mvpwm->regs))
> -               return PTR_ERR(mvpwm->regs);
> +               /*
> +                * Use set A for lines of GPIO chip with id 0, B for GPIO chip
> +                * with id 1. Don't allow further GPIO chips to be used for PWM.
> +                */
> +               if (id == 0)
> +                       set = 0;
> +               else if (id == 1)
> +                       set = U32_MAX;
> +               else
> +                       return -EINVAL;
> +       }
> +
> +       regmap_write(mvchip->regs,
> +                    GPIO_BLINK_CNT_SELECT_OFF + mvchip->offset, set);

Hi Baruch!

Can you confirm that this line is on purpose and that it should be
executed even for chips that use a separate regmap for PWM?

Bartosz

>
>         mvpwm->clk_rate = clk_get_rate(mvchip->clk);
>         if (!mvpwm->clk_rate) {
> --
> 2.29.2
>
