Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA7C1CF2C2
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 12:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgELKn3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 06:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728371AbgELKn2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 06:43:28 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C82C061A0E
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 03:43:28 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id c24so4132582qtw.7
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=90JVe73i/s7Z9GUVzBQi0xV2WZvGBs6rUJMcUr4qmBc=;
        b=gXpfEIdMgQC9SYThaLjtF+JqTksuh2TpO3KwtRaD0Q/d8/sF3X0ZEzgSBYCSJvZBgb
         LfZq8BXeVObsfo7eI9HNitAYfiVa/foKQJOoDZPBx8SKbNJ8qjpSYYCrsWR7ZJhhJq/w
         uhjAJXQhseAaw7m8NNeOJMjc9NNHfC1s3CmzFbdnRp12CYtN1jgbemJRhEv1qCuMfTqk
         wLGqkroGqd7yh0IbTK3DmImx+XkHSk/9VwzGLane1nmKEVhHZ1X1JLHHRxdLW+vo1ubq
         TIPdRPbIXHtLQT2ahTZB/MN5+3gdERRz9tkXJK+EIdNB6wuhxOUbKNBteWju1XM/oWqo
         pZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=90JVe73i/s7Z9GUVzBQi0xV2WZvGBs6rUJMcUr4qmBc=;
        b=Acz5cas9FUNck8vW3eo6YyN0M3d+UDyLhki2GemPmjxnkwaLtKW+nfNXw1xVUfqmdV
         cYp8FbNPpixBrlR1+AxQNLkuukn5j3aUJjaOsJ7EjRrNRJd/wf5Bg1LPz4F5ktpW3/fs
         mgD9jSUt+VpTYeDk/G/WzLKQBF/tQ0aNfQ2ZpolHhg8m+busnq0eH4kRaIXheMAcxxuY
         xeTwnCg9vcx992UeoDTsen/lyFA/7Icmo/MrdC8vj6de/YNIeyBdHeXRxFLmq4Y2788l
         B6TGCeAHMxLSzHnTfpmJRoZ9csY/w0dQjL27LfkfE4jSLGWQxl1H9wYa2FZtmJP7ud7e
         QL4g==
X-Gm-Message-State: AGi0PuZ8oCYd2XGNQJ5ij9KBIQzdZHT2+xE1g7dR2CCY39BwfF/I4qBy
        FMQhGTIP3SV2m3dObswN1BRT4dJ+G/5au6/Ln9dZ7Q==
X-Google-Smtp-Source: APiQypKvEybCvnJT5+PUzpjSf4oc/1mLHh8BoCicYfxDxeaUTImC0dhwBykDH5TFNpdykQ05fDusxKJ6udAceZJmYpw=
X-Received: by 2002:ac8:5209:: with SMTP id r9mr20680327qtn.57.1589280207508;
 Tue, 12 May 2020 03:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200511101828.30046-1-geert+renesas@glider.be>
In-Reply-To: <20200511101828.30046-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 May 2020 12:43:16 +0200
Message-ID: <CAMpxmJXD9WgrFnKvS2a=iOCVuYiqdTGwp+r2BjOv2RJH2R=s1Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Document that GPIO line names are not globally unique
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 11 maj 2020 o 12:18 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> gpiochip_set_desc_names() no longer rejects GPIO line name collisions.
> Hence GPIO line names are not guaranteed to be globally unique.
> In case of multiple GPIO lines with the same name, gpio_name_to_desc()
> will return the first match found.
>
> Update the comments for gpio_name_to_desc() and
> gpiochip_set_desc_names() to match reality.
>
> Fixes: f881bab038c9667d ("gpio: keep the GPIO line names internal")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpio/gpiolib.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 99533f4cb5d332a9..98822412f565073a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -296,6 +296,9 @@ static int gpiodev_add_to_list(struct gpio_device *gd=
ev)
>
>  /*
>   * Convert a GPIO name to its descriptor
> + * Note that there is no guarantee that GPIO names are globally unique!
> + * Hence this function will return, if it exists, a reference to the fir=
st GPIO
> + * line found that matches the given name.
>   */
>  static struct gpio_desc *gpio_name_to_desc(const char * const name)
>  {
> @@ -329,10 +332,12 @@ static struct gpio_desc *gpio_name_to_desc(const ch=
ar * const name)
>  }
>
>  /*
> - * Takes the names from gc->names and checks if they are all unique. If =
they
> - * are, they are assigned to their gpio descriptors.
> + * Take the names from gc->names and assign them to their GPIO descripto=
rs.
> + * Warn if a name is already used for a GPIO line on a different GPIO ch=
ip.
>   *
> - * Warning if one of the names is already used for a different GPIO.
> + * Note that:
> + *   1. Non-unique names are still accepted,
> + *   2. Name collisions within the same GPIO chip are not reported.
>   */
>  static int gpiochip_set_desc_names(struct gpio_chip *gc)
>  {
> --
> 2.17.1
>

This makes me wonder whether I should do something about this in
libgpiod? Looks to me like gpiod_chip_find_line() and the global
gpiod_line_find() are no longer reliable and should probably return
all lines whose names match.

Bart
