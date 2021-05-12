Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE6937BC01
	for <lists+linux-gpio@lfdr.de>; Wed, 12 May 2021 13:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhELLnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 07:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbhELLnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 07:43:41 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACEBC061574
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:42:32 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id g38so30322831ybi.12
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eilI8uf7yE4YJkIfTryb8TKzxxfc/G7BjXHs27nl4o8=;
        b=r+pGipL72wot2acHAHtYA7Zjx7wc8vqcwn6a/AKeeqJRileScQhMAs1yJvpMzLNVUX
         L0075pL7ygo2mCZHMIw2r/tmW8R+lRVo7Ab5MsbqywfFXGzWZ6X5Dc5DP+wtbEJ9t2tm
         lPNjpb/2ZlyeqYBlWjJo4WoHLaIsEPzOP/R2KDTUTaotnoBUvYJZ1AiNKAYb9MVE5u/N
         HTdPCGf8qMyCOMeAlGtUfty52ZT4v3Tz5HctL3E4VNq5G91y7OasSA+wkBVdjyvrZEmH
         T8etEFf4GfFMn2MfeQgAOZXsPnvEmwgylc1VaTtP6UIveR7xCjLtSzSzjyTaAsGai9OO
         bKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eilI8uf7yE4YJkIfTryb8TKzxxfc/G7BjXHs27nl4o8=;
        b=F7hPYov62zH/Pj5/wF/HLhYd9O9BnLXuOKbMUGR6YLVVruUOxtQ+xPqlb8qYdROYwj
         btI2VhxHIWVe26TK6Py9Tb4US09IRQGjV4liQe9WzaqVPdo3QzV7fviHDpJUEEa1K5Q6
         XcTefvN5VIoa3rEXEVZduQRiSe/THrCuSdFdpleJxnE8w5gWSuHT0P79PLzunFfAtSxv
         rVQ31f/7sBoT/dnrws3eedryBB+/5XNUyjGV/XpEhIdHtpdSLNmId6PcPxFW/Gc9lSws
         0mc1NaJ0ef9PVebhWWzU36GGm36d6ors965iGWL9af/beAfirUR/CXPyZDXCYzfE2GGZ
         E1LA==
X-Gm-Message-State: AOAM532TZ8gvsF4yNYItRH2iPxyWB8coa5VRhwny82ImQluloetgkJuv
        GbIT7P3XfisfTesHPo6oujvUsKGWP0zeMbF+hP2Wjw==
X-Google-Smtp-Source: ABdhPJyp2eDEepl1vx7Ei3PheStHyNWy67v8RCZpHAO09ffVQvOwbAcKn0MvPxz7Xly7KN2pwFPa8/3J772OGLt4pig=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr45845552ybp.366.1620819751872;
 Wed, 12 May 2021 04:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210510195252.12512-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510195252.12512-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 12 May 2021 13:42:21 +0200
Message-ID: <CAMpxmJUvSUKrAmDyDjHYWQ8M5EC9740KwWm2qK-65Ab5HneO8A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mockup: Switch to use gpiochip_get_desc()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 9:52 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Switch to use gpiochip_get_desc() helper.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-mockup.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index d7e73876a3b9..0a9d746a0fe0 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -144,12 +144,9 @@ static void gpio_mockup_set_multiple(struct gpio_chip *gc,
>  static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
>                                   unsigned int offset, int value)
>  {
> +       struct gpio_chip *gc = &chip->gc;
> +       struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
>         int curr, irq, irq_type, ret = 0;
> -       struct gpio_desc *desc;
> -       struct gpio_chip *gc;
> -
> -       gc = &chip->gc;
> -       desc = &gc->gpiodev->descs[offset];
>
>         mutex_lock(&chip->lock);
>
> @@ -369,7 +366,7 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
>
>                 priv->chip = chip;
>                 priv->offset = i;
> -               priv->desc = &gc->gpiodev->descs[i];
> +               priv->desc = gpiochip_get_desc(gc, i);
>
>                 debugfs_create_file(name, 0200, chip->dbg_dir, priv,
>                                     &gpio_mockup_debugfs_ops);
> --
> 2.30.2
>

Patch applied, thanks!

Bartosz
