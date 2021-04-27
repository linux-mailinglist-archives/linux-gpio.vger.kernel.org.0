Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAF936C529
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 13:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235800AbhD0LeE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 07:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235099AbhD0LeD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 07:34:03 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CD4C061574
        for <linux-gpio@vger.kernel.org>; Tue, 27 Apr 2021 04:33:20 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 130so25092294ybd.10
        for <linux-gpio@vger.kernel.org>; Tue, 27 Apr 2021 04:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lw23nfmWqVriVGK3/XB6PR3bEvWpn+m/Rvh9hTRDTtA=;
        b=dBVVKqSGsvYs0wXooeoT3TmjplzCzWtUnyuS9qS83f8+EyODqKDOOGiv5ZXk/3RrLV
         bH3UcfevrCi+nHmi2AVyA7bB0p1OrnjYfZ39Rljb4z/pVbJIP01fTTURAOCCIXbuNRRp
         Nid07/kTsDKp36Y+dYZSVw+MVNx51T7GNRWE8wOtqD0FE0Rl1L8BBkcVIeOBl1ora/7k
         yyE4/UIBbvJDU1ZYkrhZvQwAk9Vq278/B3yGpMD+GBtC135e/ZGcMHN9nKn+ctwt1THF
         WkKcfzqAHDKydJLprMnraSh/lC+bqeCArAIF/4Le5oG9fU4zeINRpV+uaFKNX2jWbvfs
         C9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lw23nfmWqVriVGK3/XB6PR3bEvWpn+m/Rvh9hTRDTtA=;
        b=NhRfVlFQXmuJc/ActBvMsmgis2I+3/1AebctcTeLTxO3TK4HMVoGYn7U1bKn/oLTEp
         +jchPVcaXg+mfRB/+CkEL4jKb88zrQsaQVqWqWAS6k+2SRw44o/GMqTG+P0QBLliTbkN
         Za/gfjIxNfHf96eV3xMB8z5UtGG7iN07Blk5J7lFUilu89c/d7oT2cVDjVbecyaSUDB7
         OeHgFXza4w14E3bsmu8GvmmFhv7uRCduhdNn8AIibqN6kJbQ9h/BTu6+MHDagHY1W/xj
         WKazl4JLefLqpzGVhe6+5MybbCTl1QD0BpftIVxY6KUgw4tXcfbIrKM+OpwmZ19Rk84Z
         2DMw==
X-Gm-Message-State: AOAM53247d2ArVEzrerTGMqRNQYagqZ7XCD/Er0ZmBu1MS/CgIUACTFr
        MKwVcwqRms/kvx2ZZwB1ed603vaxGny6eyK3Ub/wrxKA2bwoNQ==
X-Google-Smtp-Source: ABdhPJyA/zIjInLWcP/GIfBpdeHqyt3GJkS3J7irVtSmj0CTUl2YFN3eeHr7YvBv5Ph96jI/SWrzuLo5P5BSZmIvhnE=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr31412357ybp.366.1619523199720;
 Tue, 27 Apr 2021 04:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210427102427.11066-1-colin.king@canonical.com>
In-Reply-To: <20210427102427.11066-1-colin.king@canonical.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 27 Apr 2021 13:33:09 +0200
Message-ID: <CAMpxmJX-Qkn_REScDJqHvBL6J8veFmzM5o2hmZVOu=iTAu1PUg@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: sim: Fix dereference of free'd pointer config
To:     Colin King <colin.king@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 27, 2021 at 12:24 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The error return of config->id dereferences the kfree'd object config.
> Fix this by using a temporary variable for the id to avoid this issue.
>
> Addresses-Coverity: ("Read from pointer aftyer free")
> Fixes: a49d14276ac4 ("gpio: sim: allocate IDA numbers earlier")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpio/gpio-sim.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 2e2e6399e453..7bba5783a043 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -751,8 +751,10 @@ gpio_sim_config_make_item(struct config_group *group, const char *name)
>
>         config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
>         if (config->id < 0) {
> +               int id = config->id;
> +
>                 kfree(config);
> -               return ERR_PTR(config->id);
> +               return ERR_PTR(id);
>         }
>
>         config_item_init_type_name(&config->item, name,
> --
> 2.30.2
>

Thanks! Can you do something like this:

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 2e2e6399e453..b21541c0b700 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -744,20 +744,22 @@ static struct config_item *
 gpio_sim_config_make_item(struct config_group *group, const char *name)
 {
  struct gpio_sim_chip_config *config;
+ int id;

  config = kzalloc(sizeof(*config), GFP_KERNEL);
  if (!config)
  return ERR_PTR(-ENOMEM);

- config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
- if (config->id < 0) {
+ id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
+ if (id < 0) {
  kfree(config);
- return ERR_PTR(config->id);
+ return ERR_PTR(id);
  }

  config_item_init_type_name(&config->item, name,
     &gpio_sim_chip_config_type);
  config->num_lines = 1;
+ config->id = id;
  mutex_init(&config->lock);

  return &config->item;


I think this looks more elegant without the local variable inside the if.

Bart
