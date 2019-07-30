Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 810C67A306
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 10:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730171AbfG3IUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 04:20:07 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44972 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730161AbfG3IUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 04:20:07 -0400
Received: by mail-oi1-f196.google.com with SMTP id e189so47187624oib.11
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ztB3Q8DLzhhcyvyMNVMzNK6NebfDHAUbgflc/UJwuNo=;
        b=pIzDyP8+aLF6N+tvz+qRREtMKOxN8h9OLXktM72vNNuq0cwNn7ePJ87Oh3Bp7mcvK5
         e0LVy1Y/VpmFkZoEcUcJHJtqQO9N9lnl5L4JDyncWSS4z5CiFZK6u4oqT0gdUZenQlGs
         0U0QsWw6vyHM+mxKVCmcZQ5jiqWlSUvxoqz5Xmd9W/7hBJkZrjKZ+vBYH7ZpCisvDvBA
         KJ0pQ6DJ16a+ycW5MmGcFgEuVG2/HJM4tvyM1tGZljdhT5nA1nzYaJqpGSrzuLYEExWd
         Q53RlmbAlThY5R90DRzNBnbQEOFmcf4U6+zE/1fhY+kHnP/g+RAgRtugKnIEDfKYCJYW
         T7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ztB3Q8DLzhhcyvyMNVMzNK6NebfDHAUbgflc/UJwuNo=;
        b=spZy0PcLSGsVlO5TkiGvVrwZTC1P6RDXXLuPcYC2xSAGgi/tvcK6H7YwBOc7TruQlg
         FXOFCEadHP5Q5EvZLlj6QClB0jQFsgLK8yu0vSwigDgYrFb/VC5NTPih9sV2EpFdRDTj
         VvexIVjim/9J1ixuoU0fVJo4cMKM5Z/Ocyf8SfAmar++0JsU4ABrjfbrjCsclQCJ91oz
         5wq2vhl0VlhculVaJ1JZnFSHSksO1MXJS/RYNz9xYsWuIECK84gW0dCcRoJl0sa2WKG6
         erBo1jDEoMts0dowXCsYzHltmPkH0VpKldnJUSpoV6OeikXIPOpNP6Ewg5KDdxt+1V48
         Mt+w==
X-Gm-Message-State: APjAAAVcNbl6cQeh5EsJ9AI5aVxYm2G9rTtlPW08GGvzOIgHcdaXmGq0
        tbRB+8b2K7tTkSYdvWweJJtnOOC0SLXZ+q8WgPQqKA==
X-Google-Smtp-Source: APXvYqz+RixEWvkgIcYBCD7zC6WxuWv9SMmWyrq8EWEOxamd2YuP+D7WpHGAgjYXRXEneSmklCfHPPgwVMla8A43xk0=
X-Received: by 2002:aca:450:: with SMTP id 77mr21728053oie.114.1564474806601;
 Tue, 30 Jul 2019 01:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <1564410993-22101-1-git-send-email-info@metux.net>
In-Reply-To: <1564410993-22101-1-git-send-email-info@metux.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 30 Jul 2019 10:19:55 +0200
Message-ID: <CAMpxmJX6M38-q7-TuM_T9u+bTYLLs3RuoGhVXFF-zyh-Y7TUUw@mail.gmail.com>
Subject: Re: [PATCH] gpio: just plain warning when nonexisting gpio requested
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 29 lip 2019 o 16:41 Enrico Weigelt, metux IT consult
<info@metux.net> napisa=C5=82(a):
>
> From: Enrico Weigelt <info@metux.net>
>
> When trying to export an nonexisting gpio ID, the kernel prints
> outs a big warning w/ stacktrace, sounding like a huge problem.
> In fact it's a pretty normal situation, like file or device not
> found.
>
> So, just print a more relaxed warning instead.
>
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/gpio/gpiolib.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 3ee99d0..06eeedd 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1,4 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +

While adding pr_fmt would make sense for gpiolib in general, it
changes all the already existing pr_* log messages in gpiolib.c. This
has nothing to do with this patch. Please use a regular pr_warn() and
then we can think about simplifying the messages in general.

Bart

>  #include <linux/bitmap.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -121,7 +124,7 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
>         spin_unlock_irqrestore(&gpio_lock, flags);
>
>         if (!gpio_is_valid(gpio))
> -               WARN(1, "invalid GPIO %d\n", gpio);
> +               pr_warn("invalid GPIO %d\n", gpio);
>
>         return NULL;
>  }
> --
> 1.9.1
>
