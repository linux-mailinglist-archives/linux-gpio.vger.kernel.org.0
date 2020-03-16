Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 811D41868FC
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2020 11:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730599AbgCPK2S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Mar 2020 06:28:18 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:40663 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730550AbgCPK2R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Mar 2020 06:28:17 -0400
Received: by mail-il1-f196.google.com with SMTP id p12so1243327ilm.7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2020 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TxPRfk6sibY6hpJglSupQUWB4+HiT17NTnwoa76dgxM=;
        b=NS8QyZzH0cEZAFqfqWtUf3zJCYnpsnhJjKa5s3AUlVWCrMS2r7XYcDufh6I1YFVumW
         m7Zp0uUr+kFRhuKC2BDSDlFXQK/chRvliVzCKQ+nvCDYDyL/fcgNfgPuyroJRHceRZHw
         mQgHMR+kpAaA2GSHPEiI6IFtgIWPYuZq0SEIPhAu8vFNcWoJEIwQt2tibUWQ8+73SHuA
         GU5Mrzd4DvirYUXKFM3Pay0gwYbTUwOvECoWWYu94azUBXk+a/jkbhyWUMGOFOilyA9k
         TqbbBbQzW8N1ot7huNmMyKI5GF9YGRYXmT93bXOsnNcV6d9WPmjmpoBmR63a+MP32Scr
         Y7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TxPRfk6sibY6hpJglSupQUWB4+HiT17NTnwoa76dgxM=;
        b=c9duWwGpNfJOCyyVrFZpcuq7buY+9r/AeHsV0PWyR+LF+d+ytKS3JEQZQ4+5YCLTeG
         lnGGN656MW5uQMlZ/WOYACC1ENKYq8fQ4dFzP1v5VCzhFIAB4aXnLI9nrYrNn9/Hw6R+
         mzDxhIkz7rqSHTxtNW34Kei0+9xQD9fOjlWZtzub7HmVx6SnrkqC0WEiGlwtNjB+1sTG
         cfjSTkkYvXtyMuZPXQdi/ATZIAm8R5PuXzIsQ8C24g3FUxB94Xws4Yp9jQpCg0nyPm77
         +9tyIabeVT7ttH8HWEFPSsStVKXuXQsMRTvHqElgUYDxtQBSSq2xDfwXIlIUuR+lwcLF
         NKWA==
X-Gm-Message-State: ANhLgQ1pGM9Jj7EOUFMHcz8pHwZ5BdQ9dAy0iQtmdBUNaIsyKYR8oAXW
        +pwmt3FZ330zdaRiEeum7GPQFzujr6BKVISlisd5Ow==
X-Google-Smtp-Source: ADFU+vsGVHx5bpn0+ubycNUe48ocy51bgN7prtIEKTgKxls3K76EhhgDAeT/EfgqdKb2LN6no63jMXRb45trrW4Gu/Y=
X-Received: by 2002:a92:8c42:: with SMTP id o63mr25215708ild.189.1584354496594;
 Mon, 16 Mar 2020 03:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <64270a8cc4bfca77ef4e280e5ab4623f4525ff39.1584290011.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <64270a8cc4bfca77ef4e280e5ab4623f4525ff39.1584290011.git.mirq-linux@rere.qmqm.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Mar 2020 11:28:05 +0100
Message-ID: <CAMRc=Me8ceOfP2cH-35qTsVSQq0tTKgW8+kW0u7WOhwWs4sAfQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: gpio_name_to_desc: factor out !name check
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 15 mar 2020 o 17:34 Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm=
.pl>
napisa=C5=82(a):
>
> Since name =3D=3D NULL can't ever match, move the check out of
> IRQ-disabled region.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/gpio/gpiolib.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 175c6363cf61..20fbeffbdd91 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -301,6 +301,9 @@ static struct gpio_desc *gpio_name_to_desc(const char=
 * const name)
>         struct gpio_device *gdev;
>         unsigned long flags;
>
> +       if (!name)
> +               return NULL;
> +
>         spin_lock_irqsave(&gpio_lock, flags);
>
>         list_for_each_entry(gdev, &gpio_devices, list) {
> @@ -309,7 +312,7 @@ static struct gpio_desc *gpio_name_to_desc(const char=
 * const name)
>                 for (i =3D 0; i !=3D gdev->ngpio; ++i) {
>                         struct gpio_desc *desc =3D &gdev->descs[i];
>
> -                       if (!desc->name || !name)
> +                       if (!desc->name)
>                                 continue;
>
>                         if (!strcmp(desc->name, name)) {
> --
> 2.20.1
>

Patch applied, thanks!

Bartosz
