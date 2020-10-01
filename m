Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A95027FA45
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 09:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730415AbgJAH1U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 03:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731607AbgJAH1N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 03:27:13 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2CAC0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 00:27:11 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id n22so4552819edt.4
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 00:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ejMczuP1PEjQX+IUoxEv4UT90DsLgJ++ZLsUWbzp9Bw=;
        b=CMLTabmyQh85q1gYfR/cVxpAHZvf5Adv/ZFU6zlXDnPl+75te7meJnVSGR8adjdKMC
         9odxMrZHyVDTUihs8b5/rSno10YdvqkwX4hmyZbcYHPLORCUNkn16glVlCQqJx5K5jJm
         Lz7kissyj3TED4zDoByBmKhLEBRpzXIYOWpaJktzrXn/oK4CzJ58SilDYw7Dz7SxGaT2
         R9Buc/6+zCEhF7mUvegtBb0HO6iIpgo9w8caadzI+BsmLNwqvpCXmjmCUCqP43hmen6g
         gZTUR+c/Bn/R/HCy/Tl7hL20LTxK/RmYmUd54VYV9H8n4mEqIYaCUEwp45aePw9CoK4U
         9DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ejMczuP1PEjQX+IUoxEv4UT90DsLgJ++ZLsUWbzp9Bw=;
        b=sVfa6zCEhEhGMWFR5GqidJybRvtKHveOqGNbOmcX+Nhfc/YD/OoOjM6bzT0cbJAwMS
         oJBo2F+8u2z7HBerMHZ4BUBoJE0EKdpz/LJxWr/sdbFDQKEcAYOwLLd+WCltE7iq2d8B
         rrm+YAOB1DKC8d2wpbjAAbu1tAxlNAvfUHp70bv2FqSK3AwwadKk3zo5EGwSl65avxkA
         U4QF6W9mc1mOS7Zy7TFvd67yhRU4dAz5ddJ/kFFyR1lvB1eBGR1K0/zgZym3UFHTz+W4
         ikZ6I8TaP363zUc/2sbANmOSylHEZgWh3VkzWzx0xkyluP87FUEbVZunkW/YbJbuw0XY
         r7/A==
X-Gm-Message-State: AOAM531xgO/J6HGDKDwS0Dqz8QkCW6wHTc/QwCKNWnCHvquSlxHXaaku
        wMYnI/3Z7YvkBaIRzq2HYsU1I7OV+l+am3Wi68QVPg==
X-Google-Smtp-Source: ABdhPJxW/1kYgmgTar2gG1jLrw4QxdbyEuk9obZ6hHUTTgWgUB/3qpKnH5BI7ivRHeMUvqLgr/7U2FpQ3ZD1DwBArTY=
X-Received: by 2002:a50:99d5:: with SMTP id n21mr6784121edb.88.1601537230217;
 Thu, 01 Oct 2020 00:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200930142013.59247-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200930142013.59247-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 1 Oct 2020 09:26:59 +0200
Message-ID: <CAMpxmJUrEeuJBf2fwMp8HfNi3sm6c-_g6_dL8OjfM9gQXtunMw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: pca953x: Use bitmap API over implicit GCC extension
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 4:20 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> In IRQ handler we have to clear bitmap before use. Currently
> the GCC extension has been used for that. For sake of the consistency
> switch to bitmap API. As expected bloat-o-meter shows no difference
> in the object size.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 0a49ab62cbbd..3f24cfabb1d7 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -814,10 +814,12 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
>  {
>         struct pca953x_chip *chip = devid;
>         struct gpio_chip *gc = &chip->gpio_chip;
> -       DECLARE_BITMAP(pending, MAX_LINE) = {};
> +       DECLARE_BITMAP(pending, MAX_LINE);
>         int level;
>         bool ret;
>
> +       bitmap_zero(pending, MAX_LINE);
> +
>         mutex_lock(&chip->i2c_lock);
>         ret = pca953x_irq_pending(chip, pending);
>         mutex_unlock(&chip->i2c_lock);
> --
> 2.28.0
>

Makes sense.

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
