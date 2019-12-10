Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23849118A7D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 15:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfLJOLY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 09:11:24 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:35392 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727272AbfLJOLY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 09:11:24 -0500
Received: by mail-il1-f196.google.com with SMTP id g12so16246487ild.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 06:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B2D3Qyl+CwEJ45ada86WIyLvrr4ccx3M8jqZypSwAH4=;
        b=pD2UzuXZbkpf0sMWJFiX6bgUR5KEaxD9P2Yt1cXm4D0vXt+bVxawCksIZu7jsPCOYn
         qx7TsRGaq8G9OrHx/dYkHvnen0oKgHN85Q9QH1uydQ5ODdNZmTiW1rNLjgjDwzyGyojr
         XpI7BqXabgC4zw5xpi4Vw1Yaf8I8kGMZgI995YCY9dzEieBRe7jJ4SYqE+LnAk92UzNg
         xO2v0IWBY2kxI3RXX1Ma7znE5R5aUHW/ZiIJGJXcDOZLt1z/OeKW1Bpwb4/dPUNgli73
         yaXAWmM2e1I8VHxY/9UN9l3JJtxn/IIKnxjU/wCcSfb0MZKiZqQQt5KfCVFPVJqYGj0N
         9RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B2D3Qyl+CwEJ45ada86WIyLvrr4ccx3M8jqZypSwAH4=;
        b=IojRLnIm6M02WIFWLdQm6AuuJaRtafIIpkyxWzrtrOVwfRBwvWqURSh05FEz78jr3F
         m6xWJQA+MtIH514lSenHYDSpcxBEvNc8FiEqLqHp4y2kkQsTU8prvXIJCgZ9n3L8kI6N
         gYJT+hNDMwEqKXqO5OI87uObzrgiZAcn8xRRmSKhuheiHlR6Fh4yMoMta655HWLsBb0h
         ZuWjfhwPZSGkBJcxDquxYyOP24sZXjdm6/NjQhGyKqQXhvuli44juOscMQX2vxDLBr1u
         PXwS7Ae3kafOkjq5djPQW7yqDoNsiIQZceAzeCHOkl5w6d7XEnPw5Ulfanw3bgO+GT8U
         fANQ==
X-Gm-Message-State: APjAAAUVde++LIePpMU4FkoMAZp72GfgvL+O5V8Aob0suuyPIuulZOmC
        y1Jp6YsDZ2lyLBRvq5VNk0htrprITNWP5CrhzdFaEA==
X-Google-Smtp-Source: APXvYqz77/tNrfDrJzKlU1Z8nBr6FZXWg9w2drB9REe0e0/oWbhzgPRAk7Tql+RF8fA3qEobiSrZ/r5PcuLUof3Nr40=
X-Received: by 2002:a05:6e02:5c8:: with SMTP id l8mr34653892ils.287.1575987083100;
 Tue, 10 Dec 2019 06:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20191210021525.13455-1-warthog618@gmail.com>
In-Reply-To: <20191210021525.13455-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Dec 2019 15:11:12 +0100
Message-ID: <CAMRc=Md4PmbcGAKxP1LG08bREtWCtsXbt=ZgL50PrizF4F4pxg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-mockup: Fix usage of new GPIO_LINE_DIRECTION
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 10 gru 2019 o 03:15 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Restore the external behavior of gpio-mockup to what it was prior to the
> change to using GPIO_LINE_DIRECTION.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Fix a regression introduced in v5.5-rc1.
>
> The change to GPIO_LINE_DIRECTION reversed the polarity of the
> dir field within gpio-mockup.c, but overlooked inverting the value on
> initialization and when returned by gpio_mockup_get_direction.
> The latter is a bug.
> The former is a problem for tests which assume initial conditions,
> specifically the mockup used to initialize chips with all lines as inputs=
.
> That superficially appeared to be the case after the previous patch due
> to the bug in gpio_mockup_get_direction.
>
>  drivers/gpio/gpio-mockup.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 56d647a30e3e..c4fdc192ea4e 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -226,7 +226,7 @@ static int gpio_mockup_get_direction(struct gpio_chip=
 *gc, unsigned int offset)
>         int direction;
>
>         mutex_lock(&chip->lock);
> -       direction =3D !chip->lines[offset].dir;
> +       direction =3D chip->lines[offset].dir;
>         mutex_unlock(&chip->lock);
>
>         return direction;
> @@ -395,7 +395,7 @@ static int gpio_mockup_probe(struct platform_device *=
pdev)
>         struct gpio_chip *gc;
>         struct device *dev;
>         const char *name;
> -       int rv, base;
> +       int rv, base, i;
>         u16 ngpio;
>
>         dev =3D &pdev->dev;
> @@ -447,6 +447,9 @@ static int gpio_mockup_probe(struct platform_device *=
pdev)
>         if (!chip->lines)
>                 return -ENOMEM;
>
> +       for (i =3D 0; i < gc->ngpio; i++)
> +               chip->lines[i].dir =3D GPIO_LINE_DIRECTION_IN;
> +
>         if (device_property_read_bool(dev, "named-gpio-lines")) {
>                 rv =3D gpio_mockup_name_lines(dev, chip);
>                 if (rv)
> --
> 2.24.0
>

Hi Kent,

I was applying and testing your libgpiod series and noticed that the
gpio-tools tests fail after applying patches 16 & 17 (with linux
v5.5-rc1). Is this fix related to this?

Bart
