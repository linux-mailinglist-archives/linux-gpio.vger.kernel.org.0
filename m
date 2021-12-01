Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E1E4649AE
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 09:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347968AbhLAId1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 03:33:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347985AbhLAId1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 03:33:27 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68736C061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 00:30:06 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id g14so98316478edb.8
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 00:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zpgYJD3YxI8dBU8ofXI3MsOnTyaZoAovtNv9b6jm6tU=;
        b=JaIGqR5ZelTeaHZ6cMxx0fu2Af7jnMQ+jpM3kTC+OIgsNBZHGMtSEGd9j07G+YCdBM
         0+ONFN70OAladPUTMd0gjCjS41Xgvm9nYPc4vLUj5ctwzpfG4YNIEX444MEuwo/DsJ8z
         /VtMt1CJJ719Tg+SU9wVtZUoPAKvlM/yaBu6+10HML7kEAgcCPQDPo08QksWax5Y+ROG
         KvWOgVM0h6y+SOGoVMOOzNfNMqI4KdWowQWLskpY2tFaoTsn0hni69/bh0QftQIG2xJg
         fX0OK2i3qqYz7BAbuuMCU6CieChtagZnpBn+C8ZmdcffbmnFpOU798vaTcn3iF0+QC0Z
         u8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zpgYJD3YxI8dBU8ofXI3MsOnTyaZoAovtNv9b6jm6tU=;
        b=bjtj8zHFsapEREIDzQvs80u2ZrMY1/LuHBiMn491rO8DZ791Tk3qOGe+2FrqMIQAX7
         FNgGoi4esaGMSdQBt10AqpxZyQ+62kPfIdozdkg+7ONaG5lU8r4nUMKHQM046rRfCGWG
         bRmVb0RXxVvP4nacjPh0mplPUaCQZZREqZJPEqLBAOKsxf1r4U48wb4IqnYGwk6uV02V
         Pr1LPtgPwy8U0WO0Xxa5HhRpQ75nLDOYWLmioN1cOq8GiXtHMGTOvF/XB50TRicPkxn3
         1GYz+vsNsjvq7Jl5j5iNj0gAeqCOXv5RbQ8yxm6bKl+EGkgSffHwW4RfteYSyx8W8eNI
         Q+sg==
X-Gm-Message-State: AOAM533129KQF10iosZS/7zPROCIqceqRFiLjompZqQNBdODRr0qba5l
        oqUjJW0ll6FoD4i+hlzgIWVwWJrUPp8+ZMcVvBwIPw==
X-Google-Smtp-Source: ABdhPJyt9U14RAJHbQGYYdGNmgXFT1rMg7PMwGOnZjXy9Cx7d+U/S8Bxpwy38TYDFvT8FeP3SvnVb410ywmo356FX1M=
X-Received: by 2002:a17:907:9847:: with SMTP id jj7mr5299629ejc.508.1638347405004;
 Wed, 01 Dec 2021 00:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20211130164956.37540-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211130164956.37540-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Dec 2021 09:29:54 +0100
Message-ID: <CAMRc=MfC0wwa+T40eqUTx5w_X6ioqDbL3a7nnOTogpE2j4HVOg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: dwapb: clarify usage of the register file version
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 30, 2021 at 5:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> First of all, it's obvious that different versions can't be provided
> simultaneously. Hence, versions can't be bit masks.
>
> Second, due to above we have to mask out the version field in the flags
> and only that can be evaluated against the certain version.
>
> Clarify all above by:
>  - introducing GPIO_REG_OFFSET_V1 and GPIO_REG_OFFSET_MASK
>  - replacing conditional to mask out bits and compare to a version
>
> Luckily there is no functional change (at least intended), so no need
> to backport this.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index f98fa33e1679..ec0767d7800d 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -53,7 +53,9 @@
>  #define GPIO_SWPORT_DR_STRIDE  0x0c /* register stride 3*32 bits */
>  #define GPIO_SWPORT_DDR_STRIDE 0x0c /* register stride 3*32 bits */
>
> +#define GPIO_REG_OFFSET_V1     0
>  #define GPIO_REG_OFFSET_V2     1
> +#define GPIO_REG_OFFSET_MASK   BIT(0)
>
>  #define GPIO_INTMASK_V2                0x44
>  #define GPIO_INTTYPE_LEVEL_V2  0x34
> @@ -141,7 +143,7 @@ static inline u32 gpio_reg_v2_convert(unsigned int offset)
>
>  static inline u32 gpio_reg_convert(struct dwapb_gpio *gpio, unsigned int offset)
>  {
> -       if (gpio->flags & GPIO_REG_OFFSET_V2)
> +       if ((gpio->flags & GPIO_REG_OFFSET_MASK) == GPIO_REG_OFFSET_V2)
>                 return gpio_reg_v2_convert(offset);
>
>         return offset;
> @@ -668,15 +670,15 @@ static int dwapb_get_clks(struct dwapb_gpio *gpio)
>  }
>
>  static const struct of_device_id dwapb_of_match[] = {
> -       { .compatible = "snps,dw-apb-gpio", .data = (void *)0},
> +       { .compatible = "snps,dw-apb-gpio", .data = (void *)GPIO_REG_OFFSET_V1},
>         { .compatible = "apm,xgene-gpio-v2", .data = (void *)GPIO_REG_OFFSET_V2},
>         { /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dwapb_of_match);
>
>  static const struct acpi_device_id dwapb_acpi_match[] = {
> -       {"HISI0181", 0},
> -       {"APMC0D07", 0},
> +       {"HISI0181", GPIO_REG_OFFSET_V1},
> +       {"APMC0D07", GPIO_REG_OFFSET_V1},
>         {"APMC0D81", GPIO_REG_OFFSET_V2},
>         { }
>  };
> --
> 2.33.0
>

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

Please send it with your PR.

Bart
