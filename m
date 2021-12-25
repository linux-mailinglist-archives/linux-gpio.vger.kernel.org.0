Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18ECA47F374
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Dec 2021 15:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhLYOpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Dec 2021 09:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhLYOp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Dec 2021 09:45:29 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F09C061401;
        Sat, 25 Dec 2021 06:45:29 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id bm14so43579605edb.5;
        Sat, 25 Dec 2021 06:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAcWNF3AxGWXkGPDMRf0g8Q8lAf/jqO+ynYQrviXkSY=;
        b=DX20hXICw9RCt52BB26O2dwv6mRDQfWNtQxrhiXWrUOBZ1oR7fkx7ou2w7LDBfdA9I
         fV5hGKY5j/1L0Zi5ECrecI+e5kX90CfQRa7lh0eQU+Bdr/Etaqkq9p7TvHmdT4HLVrH9
         Six/ZqrCSdxH78sSv+NzZlNduvrChP9S4E3/tr/fYmGSrs4f4yas7wUCbqEZ43bdFn1P
         db4L2gzZOUSiJhj1/f8dgziRbF53jVfR0rUqH5w1moTkqGsJMJjsst5L+g+Ya+UdUQd2
         OAdfMYkMaWvQdJ5SzVPqnVDiBOrm23OUTRoylLzCUA3RZnzI8K7/mPYumb3w2r3vj8z7
         qgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAcWNF3AxGWXkGPDMRf0g8Q8lAf/jqO+ynYQrviXkSY=;
        b=HHa4w2KKTRcMsuM1h7uRCpF9E8AvHZHtiBw+PEEtAjLw4XK1jDDZnEZ2ZRTY8b+PZY
         DdDNpprr7FmDfIttnCMgkkVjhyzYe7TjifOEpl910I6jtm6EjFHbfHGQNVwbul+vEdEh
         Rz1k28GiWO3l3DWiYeWHWbgaaJ/RME6sf3e4JVNgVqAqb418A629YgUhw2eg9dfU2Q5+
         Oe8/47KFpSu1Lu5ivGYBH+3bcNTPkzFMG7HAsbJtLZWV6fSIYeIetXKZH9D6nKMSbGmd
         K5K8H7rZFYxIdDPMkfCzrfCTCMbE3E/fexZOw2jNL3CRviWBB26U0tjivmZx8LItpprc
         WyaQ==
X-Gm-Message-State: AOAM531GZFJxKTwqqd8HakZh0KBiEyYiD3j6M2YCAtELGnXcoLR6I8cm
        H697AHCbuwrL5jdOXnpap3bCCt1dXI5u1IrZvJs=
X-Google-Smtp-Source: ABdhPJxXb3AozzYbxTDPXtSZbPfSiAYrjzOpa/ygD+HDxpxJY7Fg6OzZ8Lu11bxuSdiUNqF8ufViAtUIfl66BsyYbLg=
X-Received: by 2002:a17:906:ced9:: with SMTP id si25mr9011520ejb.77.1640443528027;
 Sat, 25 Dec 2021 06:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20211225120026.95268-1-hdegoede@redhat.com> <20211225120026.95268-2-hdegoede@redhat.com>
In-Reply-To: <20211225120026.95268-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 25 Dec 2021 16:44:51 +0200
Message-ID: <CAHp75Vd5shpgHFUacof_ythr-ZcgPY+CV58wcZ37jNyF-0PFcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: crystalcove: Set IRQ domain bus token to DOMAIN_BUS_WIRED
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 25, 2021 at 2:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> For the CRC PMIC we end up with multiple irq-domains with the same fwnode.
> One for the irqchip which demultiplexes the actual PMIC interrupt into
> interrupts for the various cells (known as the level 1 interrupts);
>
> And 2 more for the irqchips which are part of the crystal_cove_gpio
> and crystal_cove_charger cells.
>
> This leads to the following error being printed when
> CONFIG_GENERIC_IRQ_DEBUGFS is enabled:
>  debugfs: File '\_SB.I2C7.PMIC' in directory 'domains' already present!
>
> Set the bus token of the main IRQ domain to DOMAIN_BUS_WIRED to avoid
> this error, this also allows irq_find_matching_fwspec() to find the
> right domain if necessary.
>
> Note all 3 domain registering drivers need to set the IRQ domain bus token.
> This is necessary because the IRQ domain code defaults to creating
> the debugfs dir with just the fwnode name and then renames it when
> the bus token is set. So each one starts with the same default name and
> all 3 must be given a different name to avoid problems when one of the
> other drivers loads and starts with the same default name.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpio/gpio-crystalcove.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
> index 5a909f3c79e8..b55c74a5e064 100644
> --- a/drivers/gpio/gpio-crystalcove.c
> +++ b/drivers/gpio/gpio-crystalcove.c
> @@ -370,7 +370,14 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>                 return retval;
>         }
>
> -       return devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
> +       retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
> +       if (retval)
> +               return retval;
> +
> +       /* Distuingish IRQ domain from others sharing (MFD) the same fwnode */
> +       irq_domain_update_bus_token(cg->chip.irq.domain, DOMAIN_BUS_WIRED);
> +
> +       return 0;
>  }
>
>  static struct platform_driver crystalcove_gpio_driver = {
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko
