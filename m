Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F5A268E81
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 16:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgINOzx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 10:55:53 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33775 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbgINOzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 10:55:50 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MS3zP-1k67tX3Po3-00TS5W for <linux-gpio@vger.kernel.org>; Mon, 14 Sep
 2020 16:55:49 +0200
Received: by mail-qk1-f174.google.com with SMTP id w12so355114qki.6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 07:55:48 -0700 (PDT)
X-Gm-Message-State: AOAM533g6KcaUr0fpXRbsg2kb7GLmiI1JDM0VbWjTTIrjZVI71t4Q5HD
        uEvpdCPD/SdHnAo89e3FSDF/DvZG5YeDkgx5FPo=
X-Google-Smtp-Source: ABdhPJwbsHB4Ol2CbBgKhBW74qGa34wHGe4ZzxAPKkGDtqRErPWjO+JSmPpndovKhEYgl3BuwvfxT2zwR+3juvQE6TE=
X-Received: by 2002:a37:a483:: with SMTP id n125mr12982222qke.286.1600095347709;
 Mon, 14 Sep 2020 07:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 14 Sep 2020 16:55:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Eh=UuGZSEduHvutK8VYyWJcovheoWYXykwRoQuWAqtQ@mail.gmail.com>
Message-ID: <CAK8P3a1Eh=UuGZSEduHvutK8VYyWJcovheoWYXykwRoQuWAqtQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Fix line event handling in syscall compatible mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:LfU845fKKCsAco8sNW1io/KqUsxnLeftPRPsUyPAYHfYH4x0wxv
 kWBMtkIIIdNZ+aVgLw931OfpRLH/0LgnP+UDtvQVXzUBG06We2TdaHOIXgC0NmUpOjZ9De1
 tEnYfZ0zQczLBcoQwGk+d1jXrZDIdBsEhz5mKuH/fLNnqYC2zjJk+qXOLB0V014weM1mMma
 jBVPczhFAqO8iLcoOhS+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uTeXFksmNgg=:a76AHjyBk9eDm56E+f0cex
 +hEkRrr6I/vpFGnhnd2ETpfR5M9rVVG5Px8UjoJqW/R38vBKixen9uImgsESzVpXVc7Of2t6m
 DugO0UZxnKQfsjM24/ri1LpdZeVjsTibRtCt2TvMSOgwbi3jCiK71FkpoH7P0s7oZD/SbjAQB
 YA118JUW68COcdm+KV2l/iv3WOw9BsBol1SOmZrMCdJ4hJP6BHCYGQj2xnuAcQMyFYO3yKMzY
 J1tL01oLSb5ekr20fwCMIAG3zgDLZXgy1GBWYsQqqGaeZP34NbQfOmNLUzPOVaJ8v3FLjjbGO
 s82Y+UeP+qBj44a7uCvHRL46OKvEynAEt5/6G/axJwns2aI8z+EqKRUJENQBwe3r+OefnzqK6
 SY5oRP6ekXJa8sbrqQnidI56/XUsxX4OKVy2moJgvMDzGNMkOurL4zpKXyy+iKleXKATux4fk
 Z62PcXd01wIoaEkoq84T6iGAsQYNkjf1Bk3LFNU86WnqSJvnDJ24AiN8l8UeG0W8NkgRYrnUl
 kF8QyKZhhQVI3EvsnjOyygrsb6UK1ceP47iPiMNwbWfcwOIPVlYr3jc+scpbMkQMu4YatCZ/z
 dCBVIq33JHWMcshkHgkmXb9lkLmRJnvY0r5Tmr2LD6pgTJj6FTqV4QqPPXdzkhQSLKqEoM4uw
 inmWSjqaLEu1cANQrHgqVUjjMtbUavXpTYGkUjfusdABovsTiYhYB9GZUWvACi8UsW9HnTk9W
 hkpQY1ixDbFca04Z9OnI7xTPa2yThIFlnWEY2HZgFXSZHgHqtAJGfncxJK4ZpPE0iJK6GPJap
 pf1tFbg9iplqYe9QWs5HRD6jLOnDIibe2AGziGOu8QG/KO9fBKEoSkhq7QMrIpB7W4KytnR
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 4:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The introduced line even handling ABI in the commit
>
>   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
>
> missed the fact that 64-bit kernel may serve for 32-bit applications.
> In such case the very first check in the lineevent_read() will fail
> due to alignment differences.
>
> To workaround this introduce lineeven_to_user() helper which returns actual
> size of the structure and copies its content to user if asked.
>
> Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index e6c9b78adfc2..95af4a470f1e 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -423,6 +423,21 @@ static __poll_t lineevent_poll(struct file *file,
>         return events;
>  }
>
> +static ssize_t lineevent_get_size(void)
> +{
> +#ifdef __x86_64__
> +       /* i386 has no padding after 'id' */
> +       if (in_ia32_syscall()) {

Christoph Hellwig has recently suggested adding a new macro for this
that would be always available and just evaluate to false on other
architectures.

I'd just merge your version for now and backport to to stable kernels,
but change this instance and a couple of others to use the new
macro in mainline afterwards.

Incidentally that would also address CONFIG_OABI_COMPAT
mode, if anyone cares.

      Arnd
