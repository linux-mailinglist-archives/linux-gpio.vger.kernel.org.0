Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7AA3000AD
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 11:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbhAVKuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 05:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbhAVKtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 05:49:31 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F718C061793
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:46:59 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id j13so6026870edp.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u5nsrbSttbI62LqfNAhFmXFCK5KJfWxvDX+/IVy8Lk0=;
        b=pKbBMV/1WWHwuVhKyKb3uusCRh9jdENIFG0vOpbYPOrkABtGCQZnYbMD0Av5M5eKBA
         hXbwfEeUFRnVxyziZx+MzJ/q+sA/Z5/kurXpCDb5N6vkXgRfHxx64FqERVqCeklPg1l8
         2CMpgfvBI0m2w8wLjcrmuaoUMY1+4j86ihK51kKoEayTo84TmtNXm8mIjPW55qrNJhEH
         VTKoFvLK02yIUBEYiqt3OKFEUbIo+mS4XXlUjRWADizjAPlhb73Lpg3pXIwi8YH03T6L
         zN1BxMbj0iQU4Ft3QrCEx9Y3TB4sVNIU7qyKwitVZt6w7dBNqOlDcTHUPAfIJh7e0nsG
         AGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u5nsrbSttbI62LqfNAhFmXFCK5KJfWxvDX+/IVy8Lk0=;
        b=jccIBAzXlv7H7MdVyHtAsEMNCBr+9WmtNGoQUwes+ywplZePwcmCprX1ZQvNinV8E7
         /uaXL8rPTtIqXu5JAIXC168RtDlf9k18Zk2qp1fG2vdWD5b8ec+Luzlw3vp1DMiiXF1W
         jb75y6FN59ackV4WD90cGBreff7ZIUMxFItJJebE1VrUWja0Bj3BsPuVZ/HP/4ViIc4h
         LZH3BuEcQRtRVR9u2TK0L1fTvkMvuObJbsgMiFAUJMHeAwmQf0+J79xVZA4nDIFLFwS0
         7KLOu/G+H2jpatG09RxPDeBu9ckY16kxfeREvQ4/RsziQTg/ZEDJtnnd6+3xQ8e6iUbR
         tvbg==
X-Gm-Message-State: AOAM5308o8u+JMfveEaRq8MuP5X8mDNC2vb7rBAacXTJRANN0QYAsCSj
        aAE6RsIiHiT24i43ml/+Z7uMgVyuy2bCbKsAiGBYqIXMXsiE6w==
X-Google-Smtp-Source: ABdhPJwPDrEIltdstQGXPLDvXS7BasOziEGbmuY4Ww7IFlEMcuM8iy9Ew3PNtm8dblUiQm6xcDlLaw1Kfa/yce4fmr0=
X-Received: by 2002:a05:6402:134b:: with SMTP id y11mr2683361edw.88.1611312418396;
 Fri, 22 Jan 2021 02:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com> <20210120214547.89770-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210120214547.89770-5-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 11:46:47 +0100
Message-ID: <CAMpxmJXYJ+fanuHbEQ159ajLH=BoEfdmnqRUm=Zhqw=1GCOivw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] gpio: aggregator: Remove trailing comma in
 terminator entries
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Remove trailing comma in terminator entries to avoid potential
> expanding an array behind it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> index 40a081b095fb..0cab833fbd81 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -244,7 +244,7 @@ static DRIVER_ATTR_WO(delete_device);
>  static struct attribute *gpio_aggregator_attrs[] = {
>         &driver_attr_new_device.attr,
>         &driver_attr_delete_device.attr,
> -       NULL,
> +       NULL
>  };
>  ATTRIBUTE_GROUPS(gpio_aggregator);
>
> @@ -518,7 +518,7 @@ static const struct of_device_id gpio_aggregator_dt_ids[] = {
>          * Add GPIO-operated devices controlled from userspace below,
>          * or use "driver_override" in sysfs
>          */
> -       {},
> +       {}
>  };
>  MODULE_DEVICE_TABLE(of, gpio_aggregator_dt_ids);
>  #endif
> --
> 2.29.2
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
