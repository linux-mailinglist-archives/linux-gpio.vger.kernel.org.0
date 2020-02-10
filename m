Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31B9157226
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 10:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgBJJyt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 04:54:49 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:36679 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgBJJyt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 04:54:49 -0500
Received: by mail-io1-f67.google.com with SMTP id d15so6883642iog.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=20Wymewe+x5PqdgnKQr7ePARZqrWymwqXgpPdUZ5mPE=;
        b=K6SgVbTr7PiMCAWcIH6RdnOEBwLsaNXgTQ6ozCy9KGZZlwA410tGYPb0bOoi8agKbs
         4zxqB1IVwn/oa6RrhKLdFPZb4fmmHXqheGTuSNKodMdF8lxnZedoYcFiUqK5hXQ6fWCB
         9uLFinyl8Zcgrkm6HvS4Ox4SiIo9+BKKwbp8NIGLW1sb0OCz8BZ+tZHZ7PaIdCS86EkU
         fy6Px3yvHZn7mr0pl6ayPmeneaxPogbR18KHloluViytHj5Yg6H1k6fHZ8nVnzLQMrwr
         btrHMxHpLc+vpaCucRGtnn6ldet5czZ0KinnKNQpDHh0rEJOqLhmUuGK2JaOoB6GUlIZ
         ys+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=20Wymewe+x5PqdgnKQr7ePARZqrWymwqXgpPdUZ5mPE=;
        b=FtZOLM6g1WIp9UpMOYpT6ST78ie8Nb6mLd5vc90jMnHjzY6B2yBXLtQjj0b5x+fp36
         QOkPDq3adKI9UMqMK9nmfBdbGPCA2JbwY1KiLYsSi+2xBkLtueeZlLClamNq9zR/2eX4
         Q5F41uIqka/fkM+o8jpJoUkOe92aGXeFtvybf16CIN6EhKId0Y4v8f4C3cwYMZdwxoI/
         4U0YRw7JlzY/z0wTpkbtEpHW0CLL8d0OVtRYOD+Vgm09HzW8EFYzijRiVgU9RYekgV69
         ke9cDLVUTYVya6w0q5U5kXu4lKa/H6n4v8/oYlbTIPULwoWRKgfsY2byPDJMgf0AfqPj
         RuSA==
X-Gm-Message-State: APjAAAWIy6RBhmnKcwcI0EkkBeviXMAr50Aio63Lj7q1CtKKF2cS44bO
        7ks+wmJ913iOM7JCylNM3A6pnYZPjc+WmmBLOFDaQg==
X-Google-Smtp-Source: APXvYqymAdDtJCWNl3SDZzdgyjavx27Z2bVWg2q4rAtKgBJsi6CJ+1pzyujrN5nBkKwVd9SKHOt3S4i7PHkdum1Q9+4=
X-Received: by 2002:a5d:8952:: with SMTP id b18mr8614428iot.40.1581328488334;
 Mon, 10 Feb 2020 01:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20200209111620.97423-1-sachinagarwal@sachins-MacBook-2.local>
In-Reply-To: <20200209111620.97423-1-sachinagarwal@sachins-MacBook-2.local>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Feb 2020 10:54:37 +0100
Message-ID: <CAMRc=Md9gsrm3OXcMgxd7DuiuZUovBB=Bcqfs7zCLApmgV6A8Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: ich: fix a typo
To:     sachin agarwal <asachin591@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 9 lut 2020 o 12:16 sachin agarwal <asachin591@gmail.com> napisa=C5=
=82(a):
>
> From: sachin agarwal <asachin591@gmail.com>
>
> We had written "Mangagment" rather than "Management".
>
> Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
> ---
>  drivers/gpio/gpio-ich.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
> index 2f086d0aa1f4..9960bb8b0f5b 100644
> --- a/drivers/gpio/gpio-ich.c
> +++ b/drivers/gpio/gpio-ich.c
> @@ -89,7 +89,7 @@ static struct {
>         struct device *dev;
>         struct gpio_chip chip;
>         struct resource *gpio_base;     /* GPIO IO base */
> -       struct resource *pm_base;       /* Power Mangagment IO base */
> +       struct resource *pm_base;       /* Power Management IO base */
>         struct ichx_desc *desc; /* Pointer to chipset-specific descriptio=
n */
>         u32 orig_gpio_ctrl;     /* Orig CTRL value, used to restore on ex=
it */
>         u8 use_gpio;            /* Which GPIO groups are usable */
> --
> 2.24.1
>

I'm seeing that you have been sending a lot of these single typo
fixes. This is polluting the history and I'm not a fan of that.

Linus: what is your policy on this?

Bartosz
