Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0D829E784
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 10:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgJ2JjT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 05:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgJ2JjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 05:39:18 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDECC0613D2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 02:39:18 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id za3so2891973ejb.5
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 02:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yq/HD2p2UXGt7TQ9bcMnJo/aX/+JkANs44100D8poYQ=;
        b=A+JUmcBH2PhQSHni38Yxh3pG6TqbFemyrIAYCY1MG5RLVEr+yA0yzKBmUu8qhq1TFy
         cS7CZR95snp+Ha7KBoP0aBh7jgLpf0WjJHX/nUvAntNcKoV09MLSVF5DDqzVM4OeCP1y
         LTlOMAnrGkv7y2R6lCVPu/cKvvi9Gjn/55l+SRAvFrg3BuHClNQ19vEnskRJ1VThh91f
         MQM82F6GxMsBPOvv7Lk/IKl4mJ6CB9MvbK80jq1cOyPBfVleVqjIu9ZZvTmzwqFP/N11
         j1Qsp37eK0fQcJ9sNN2khgzxkBA5D2CchIJFJj2BCECDKNuNoGdeV93Uc5SxEhEsxlKa
         kszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yq/HD2p2UXGt7TQ9bcMnJo/aX/+JkANs44100D8poYQ=;
        b=HEMF3WlGoqnwkIj8xHMGhmIagw/mXP+tFW0ybY+E2Haty6KBYaRBV4uw6R0bFrl3EX
         w38MBqDrvepUpk2xczB5LswJc5W3KFE8FPc+iu6pgA9F4PM3cJb89HqFP36R7EFzJGTi
         YkUXBMycCGChA3knX3HxhQ6wOT0K+ez1sLw+zRr5SFFcVF0iKGizz1Z9lls9DyWqXWaB
         Jf1Os62hN4ipHSmoSWI/bilHZRCG8L3TUUnKe1Cp6qIkWt/jQqfLiI0N6oIJC42KLeh/
         fpi788bnmrYNyKZ26MRjG38EMWuvsfxrmins+UzWTQGPtCmFv9Tw7y0gncaIZ9WVlc+h
         /jpQ==
X-Gm-Message-State: AOAM532nsj4BFqiA7zCampFPobAVZQlZo30bfLdEY1tCzXVQK2wqKnNK
        ++pC+msLGhf1O09xuCXlt5MJiHMx84UImtDXVmO9ZQ==
X-Google-Smtp-Source: ABdhPJwWymxfR0/4rAZDytp49JcdctiVba5N4hxgUi1rToKg1gydZNn27K2SWrNNvvcrcQZdWmXe+2PnuprHEKSpTQ4=
X-Received: by 2002:a17:906:14d:: with SMTP id 13mr3119677ejh.516.1603964356832;
 Thu, 29 Oct 2020 02:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201029081721.9593-1-vincent.whitchurch@axis.com>
In-Reply-To: <20201029081721.9593-1-vincent.whitchurch@axis.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 29 Oct 2020 10:39:06 +0100
Message-ID: <CAMpxmJVen+7NM8dfjiwSjRLxV6XpE9GtrfJdq_GnEJQ3cZ70Lg@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: mockup: Allow probing from device tree
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>, kernel@axis.com,
        linux-devicetree <devicetree@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 9:17 AM Vincent Whitchurch
<vincent.whitchurch@axis.com> wrote:
>
> Allow the mockup driver to be probed via the device tree without any
> module parameters, allowing it to be used to configure and test higher
> level drivers like the leds-gpio driver and corresponding userspace
> before actual hardware is available.
>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>
> Notes:
>     v4:
>     - Remove of_match_ptr() to fix unused variable warning with W=1
>     - Include linux/mod_devicetable.h instead of linux/of.h
>
>     v3:
>     - Keep includes sorted alphabetically
>     - Drop CONFIG_OF ifdefs
>
>     v2:
>     - Remove most of the added code, since the latest driver doesn't need it.
>     - Drop DT binding document, since Rob Herring was OK with not documenting this:
>       https://lore.kernel.org/linux-devicetree/5baa1ae6.1c69fb81.847f2.3ab1@mx.google.com/
>
> Range-diff against v3:
> 1:  1e9b8f36676d ! 1:  4e8fdcfe1a47 gpio: mockup: Allow probing from device tree
>     @@ Commit message
>
>
>       ## Notes ##
>     +    v4:
>     +    - Remove of_match_ptr() to fix unused variable warning with W=1
>     +    - Include linux/mod_devicetable.h instead of linux/of.h
>     +
>          v3:
>          - Keep includes sorted alphabetically
>          - Drop CONFIG_OF ifdefs
>     @@ Notes
>
>       ## drivers/gpio/gpio-mockup.c ##
>      @@
>     + #include <linux/irq.h>
>       #include <linux/irq_sim.h>
>       #include <linux/irqdomain.h>
>     ++#include <linux/mod_devicetable.h>
>       #include <linux/module.h>
>     -+#include <linux/of.h>
>       #include <linux/platform_device.h>
>       #include <linux/property.h>
>     - #include <linux/slab.h>
>      @@ drivers/gpio/gpio-mockup.c: static int gpio_mockup_probe(struct platform_device *pdev)
>         return 0;
>       }
>     @@ drivers/gpio/gpio-mockup.c: static int gpio_mockup_probe(struct platform_device
>       static struct platform_driver gpio_mockup_driver = {
>         .driver = {
>                 .name = "gpio-mockup",
>     -+          .of_match_table = of_match_ptr(gpio_mockup_of_match),
>     ++          .of_match_table = gpio_mockup_of_match,
>         },
>         .probe = gpio_mockup_probe,
>       };
>

Please don't do the above.

>  drivers/gpio/gpio-mockup.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 67ed4f238d43..28b757d34046 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -15,6 +15,7 @@
>  #include <linux/irq.h>
>  #include <linux/irq_sim.h>
>  #include <linux/irqdomain.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> @@ -460,9 +461,16 @@ static int gpio_mockup_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> +static const struct of_device_id gpio_mockup_of_match[] = {
> +       { .compatible = "gpio-mockup", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, gpio_mockup_of_match);
> +
>  static struct platform_driver gpio_mockup_driver = {
>         .driver = {
>                 .name = "gpio-mockup",
> +               .of_match_table = gpio_mockup_of_match,
>         },
>         .probe = gpio_mockup_probe,
>  };
> @@ -556,8 +564,7 @@ static int __init gpio_mockup_init(void)
>  {
>         int i, num_chips, err;
>
> -       if ((gpio_mockup_num_ranges < 2) ||
> -           (gpio_mockup_num_ranges % 2) ||
> +       if ((gpio_mockup_num_ranges % 2) ||
>             (gpio_mockup_num_ranges > GPIO_MOCKUP_MAX_RANGES))
>                 return -EINVAL;
>
> --
> 2.28.0
>

Applied now, thanks!

Bartosz
