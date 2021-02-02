Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AF630BD55
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 12:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhBBLnf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 06:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhBBLn0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2021 06:43:26 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE35C061573
        for <linux-gpio@vger.kernel.org>; Tue,  2 Feb 2021 03:42:45 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id i5so320928edu.10
        for <linux-gpio@vger.kernel.org>; Tue, 02 Feb 2021 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pqN0zFRmJW8Gqigf/zUwV38ptYjIUFnna4GI6ugSeJ8=;
        b=QW2+8wuH5KfDKE3/e9Y6iuGfBgb60gUGfCrIQR4VoaBInlVv1xWDR/xKga2Ja0e+jM
         FIW5q953OGlhh/mhZdD6dkrHoLdeK2qt3WgTI7z+PLwj95OPWkK9F7E+UPIN+mlO533e
         OjF58EgRa4kn61FOocTiD/vAnrludxeES1rTped0WtvHCWWBh4Z54SeNvGosiGhA5Q2I
         MKVeI8/nBQWroaaohv/2LK3O/rsMLv3DiRQedNqYhnrEAgG1+Dd1Udo9R+f5kx5+rNwQ
         HLXAMMccmVVKoPCyxVSb0lscTvYzhRidA8j5LCqyC+DOfsKfKdTDpw3+2ZZpUIq2eQt3
         ORTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pqN0zFRmJW8Gqigf/zUwV38ptYjIUFnna4GI6ugSeJ8=;
        b=LeX8jkMnCKtDkC4igmgkbgZGAzT1EFDTocIkTDglcpgJPtLY7wvYPeoffM/jaFy7/F
         LILnqiYVbr1DmT1XVyMCJlk4sy0Az/Vvp/uS6YOaw6ssqMWrPzn2hvq48Me/8joOQCFk
         4cZz/kBvPXtInkWje8py6OZlJ27jBcHnIf+NZVEW7h6HLyl5BqXD7j4Q8X7dmasxUByx
         iGNiwIR6/i5yoDgkQ0F8vVXPTsHarFSCGeth3ZteOssdBg7sjGteyQniHtlJe5JbU5qI
         YvLwWxNll+c40RKGh0g6mmBxmwjG197MTm3aiu4G1ErwA+N+Q4N0ap3PRJPfYmgCFQu/
         Zm3w==
X-Gm-Message-State: AOAM531BP7/s0S5rdj/TVSdvX3FPqZVOHaTNtTWFArg/2JCaXL/mWkf6
        +x2ECpKWSCOigAzZtRKNt7xdsQn7NuDHlv91iTCLrA==
X-Google-Smtp-Source: ABdhPJy7zKSJGzB+D2e78E5vv3Q72Apq5iTISJaxQpTfJXn6Htc5FXyCWjKIGqiQoyiMAm5UjeODfsXJEF1WLLIXwvM=
X-Received: by 2002:aa7:d401:: with SMTP id z1mr23359063edq.213.1612266164416;
 Tue, 02 Feb 2021 03:42:44 -0800 (PST)
MIME-Version: 1.0
References: <20210128153601.153126-1-alban.bedel@aerq.com>
In-Reply-To: <20210128153601.153126-1-alban.bedel@aerq.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 2 Feb 2021 12:42:33 +0100
Message-ID: <CAMpxmJXACfOkRB6m-_n_EmUf=6zLjQAie-UcQw+MNr-rTRC2SA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: add support for open drain pins on PCAL6524
To:     Alban Bedel <alban.bedel@aerq.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2021 at 4:36 PM Alban Bedel <alban.bedel@aerq.com> wrote:
>
> From a quick glance at various datasheet the PCAL6524 seems to be the
> only chip in this familly that support setting the drive mode of
> single pins. Other chips either don't support it at all, or can only
> set the drive mode of whole banks, which doesn't map to the GPIO API.
>
> Add a new flag, PCAL6524, to mark chips that have the extra registers
> needed for this feature. Then mark the needed register banks as
> readable and writable, here we don't set OUT_CONF as writable,
> although it is, as we only need to read it. Finally add a function
> that configure the OUT_INDCONF register when the GPIO API set the
> drive mode of the pins.
>
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 64 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 61 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 825b362eb4b7..db0b3dab1490 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -64,6 +64,8 @@
>  #define PCA_INT                        BIT(8)
>  #define PCA_PCAL               BIT(9)
>  #define PCA_LATCH_INT          (PCA_PCAL | PCA_INT)
> +#define PCAL6524               BIT(10)


Maybe call it PCAL6524_TYPE for consistency with the ones below?

> +

No need for this newline.

>  #define PCA953X_TYPE           BIT(12)
>  #define PCA957X_TYPE           BIT(13)
>  #define PCA_TYPE_MASK          GENMASK(15, 12)
> @@ -88,7 +90,7 @@ static const struct i2c_device_id pca953x_id[] = {
>         { "pca9698", 40 | PCA953X_TYPE, },
>
>         { "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
> -       { "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
> +       { "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT | PCAL6524, },
>         { "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
>         { "pcal9554b", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
>         { "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
> @@ -265,6 +267,9 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
>  #define PCAL9xxx_BANK_PULL_SEL BIT(8 + 4)
>  #define PCAL9xxx_BANK_IRQ_MASK BIT(8 + 5)
>  #define PCAL9xxx_BANK_IRQ_STAT BIT(8 + 6)
> +#define PCAL9xxx_BANK_OUT_CONF BIT(8 + 7)
> +

No need for the newline here either.

> +#define PCAL6524_BANK_INDOUT_CONF BIT(8 + 12)
>
>  /*
>   * We care about the following registers:
> @@ -288,6 +293,10 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
>   *     Pull-up/pull-down select reg    0x40 + 4 * bank_size    RW
>   *     Interrupt mask register         0x40 + 5 * bank_size    RW
>   *     Interrupt status register       0x40 + 6 * bank_size    R
> + *     Output port configuration       0x40 + 7 * bank_size    R
> + *
> + *   - PCAL6524 with individual pin configuration
> + *     Individual pin output config    0x40 + 12 * bank_size   RW
>   *
>   * - Registers with bit 0x80 set, the AI bit
>   *   The bit is cleared and the registers fall into one of the
> @@ -336,9 +345,12 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
>         if (chip->driver_data & PCA_PCAL) {
>                 bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
>                         PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK |
> -                       PCAL9xxx_BANK_IRQ_STAT;
> +                       PCAL9xxx_BANK_IRQ_STAT | PCAL9xxx_BANK_OUT_CONF;
>         }
>
> +       if (chip->driver_data & PCAL6524)
> +               bank |= PCAL6524_BANK_INDOUT_CONF;
> +
>         return pca953x_check_register(chip, reg, bank);
>  }
>
> @@ -359,6 +371,9 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
>                 bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
>                         PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;
>
> +       if (chip->driver_data & PCAL6524)
> +               bank |= PCAL6524_BANK_INDOUT_CONF;
> +
>         return pca953x_check_register(chip, reg, bank);
>  }
>
> @@ -618,6 +633,46 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
>         return ret;
>  }
>
> +static int pcal6524_gpio_set_drive_mode(struct pca953x_chip *chip,
> +                                       unsigned int offset,
> +                                       unsigned long config)
> +{
> +       u8 out_conf_reg = pca953x_recalc_addr(
> +               chip, PCAL953X_OUT_CONF, 0);

This line fits within the 80 characters limit.

> +       u8 out_indconf_reg = pca953x_recalc_addr(
> +               chip, PCAL6524_OUT_INDCONF, offset);

And this could be broken like this:

    u8 out_indconf_reg = pca953x_recalc_addr(chip, PCAL6524_OUT_INDCONF,
                                             offset);

Which is visually more pleasing.

> +       u8 mask = BIT(offset % BANK_SZ), val;
> +       unsigned int out_conf;
> +       int ret;
> +
> +       /* configuration requires PCAL6524 extended registers */
> +       if (!(chip->driver_data & PCAL6524))
> +               return -ENOTSUPP;
> +
> +       if (config == PIN_CONFIG_DRIVE_OPEN_DRAIN)
> +               val = mask;
> +       else if (config == PIN_CONFIG_DRIVE_PUSH_PULL)
> +               val = 0;
> +       else
> +               return -EINVAL;
> +
> +       mutex_lock(&chip->i2c_lock);
> +
> +       /* Invert the value if ODENn is set */
> +       ret = regmap_read(chip->regmap, out_conf_reg, &out_conf);
> +       if (ret)
> +               goto exit;
> +       if (out_conf & BIT(offset / BANK_SZ))
> +               val ^= mask;
> +
> +       /* Configure the drive mode */
> +       ret = regmap_write_bits(chip->regmap, out_indconf_reg, mask, val);
> +
> +exit:
> +       mutex_unlock(&chip->i2c_lock);
> +       return ret;
> +}
> +
>  static int pca953x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
>                                    unsigned long config)
>  {
> @@ -627,6 +682,9 @@ static int pca953x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
>         case PIN_CONFIG_BIAS_PULL_UP:
>         case PIN_CONFIG_BIAS_PULL_DOWN:
>                 return pca953x_gpio_set_pull_up_down(chip, offset, config);
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +               return pcal6524_gpio_set_drive_mode(chip, offset, config);
>         default:
>                 return -ENOTSUPP;
>         }
> @@ -1251,7 +1309,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
>         { .compatible = "nxp,pca9698", .data = OF_953X(40, 0), },
>
>         { .compatible = "nxp,pcal6416", .data = OF_953X(16, PCA_LATCH_INT), },
> -       { .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_LATCH_INT), },
> +       { .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_LATCH_INT | PCAL6524), },
>         { .compatible = "nxp,pcal9535", .data = OF_953X(16, PCA_LATCH_INT), },
>         { .compatible = "nxp,pcal9554b", .data = OF_953X( 8, PCA_LATCH_INT), },
>         { .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_LATCH_INT), },
> --
> 2.25.1
>

Bart
