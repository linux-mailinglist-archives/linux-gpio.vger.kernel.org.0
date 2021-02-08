Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7B2312A54
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 07:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhBHF7o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 00:59:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhBHF7m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 00:59:42 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A70C06174A
        for <linux-gpio@vger.kernel.org>; Sun,  7 Feb 2021 21:59:02 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id w1so22649945ejf.11
        for <linux-gpio@vger.kernel.org>; Sun, 07 Feb 2021 21:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tYtyn0t74f5TG7BO7dszPSjwDHfBRH5yigTfJIbsbfM=;
        b=aeWwn0BgbGbDRQBcI8/6eoluPE32h4S3EtIGByH6JDWiCeGU3K5T+8F/B97iALgSra
         f+BFFf+Tor0wO9iE6ZS5gVJa0dU+RcU1qManRecots4AbHQXSfvff35Kr4pTcJb6c9hX
         q/SlYArWRJwvolJ8nJR1PbyZAjIwpDO6Zd8f4kJ/3t8jDi7NjCtfq/anS5eO5eLlRjBY
         xGQiMwwb1NLgMbm/H2hrYeDeSooxd/1zywdN6lbriIxVAXpdmhsq5t+MkrBTPX8DGj4h
         yVn8KuUUnPco8OGsiij+QHwkMBd45v5XjZmESkfBXv9AsmqsblSnNcTHJftF12jrBYEI
         CnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tYtyn0t74f5TG7BO7dszPSjwDHfBRH5yigTfJIbsbfM=;
        b=hfHV9rxGbMLJ5ehV+tB9eSW21NEYcBxEdl5lITT4JoHNfKRKBKzRbW+J7Zp6Z45k0k
         P0eSF7G41uqS8HE9k7obRD3grT5b4YATxjBrCbMEcZfyCpx1vvNghSyG6QkrFUiUx0q2
         TuSBj3qrJho9j3y4eHTiLQXevHb+vrU+NFcKeL85cHW0Khlnd3cmVnkCM3PiH5dpai7l
         t+7tKt9+ucc78W6vY78H92qTWnrM1w/prbJfAYjrIHivNGwrzGc4O9VLKyKd+DZpiYq4
         qgY6SICIwmzLjEETqgl0h8zX4hZzs+mEcKhWmcqtrtkqRaSvUqqa0cwKzN5JXLssilyt
         yE6w==
X-Gm-Message-State: AOAM532a2KyABX6cefb+8bjs0mVXE+JCqJEFR+RSC3ksL+65RbplGiv+
        UWoQxf1PAQmTXlmAk9bzAHdKPdDa5pG1lK/NH9VfAQ==
X-Google-Smtp-Source: ABdhPJyTFOhTTEtE5CPLaZeX4AgDIqlLIdsxLW0RKMO4iPrPn5IUXGo7YJ5f2lAGr+DPh+XOu986MmDSfMRNwUlz4sg=
X-Received: by 2002:a17:906:4707:: with SMTP id y7mr15220218ejq.445.1612763941155;
 Sun, 07 Feb 2021 21:59:01 -0800 (PST)
MIME-Version: 1.0
References: <1612688430-54282-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1612688430-54282-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Feb 2021 06:58:50 +0100
Message-ID: <CAMpxmJU568mCzEo1MShA7rgp1bWh_3j44hQw3oMWggczj31f8w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: convert stream-like files from
To:     Yang Li <yang.lee@linux.alibaba.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Feb 7, 2021 at 10:00 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the following coccicheck warning:
> ./drivers/gpio/gpiolib-cdev.c:2307:7-23: WARNING: gpio_fileops: .read()
> has stream semantic; safe to change nonseekable_open -> stream_open.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 1631727..bad68ef 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2304,7 +2304,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
>         get_device(&gdev->dev);
>         file->private_data = cdev;
>
> -       ret = nonseekable_open(inode, file);
> +       ret = stream_open(inode, file);
>         if (ret)
>                 goto out_unregister_notifier;
>
> --
> 1.8.3.1
>

I think you have a false positive here - we don't even take the offset
argument into account so I don't see how the line_watch_read callback
could be interpreted as seekable.

Bart
