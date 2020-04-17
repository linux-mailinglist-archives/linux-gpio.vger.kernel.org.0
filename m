Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFB31AD9FE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 11:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbgDQJcB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 17 Apr 2020 05:32:01 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40265 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730233AbgDQJcA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Apr 2020 05:32:00 -0400
Received: by mail-oi1-f193.google.com with SMTP id t199so1543589oif.7;
        Fri, 17 Apr 2020 02:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xdw7qE++WbJcYYYVLLUf8m1JuzUUrBMPMGWetZ3yNmk=;
        b=umjJwxwdZaZ9suhke1DqinrYaXbobkasW/nYM7VcjfUZssTXIpgDBJ4S7TzzzcCIbU
         3pOBuyrUOza3erBxhjDDROKuSmyQnkU5OD5JmUNHoOd4pL7qBKQ1+FE+GD2+X+TJsRg8
         GelTKUOF0UwvvI8488HYvh6MqT0c7fiSo7lk+1R9dkCqWBqY2aER34VPCq+oC83SQghm
         xJ0r9h1Dvr75ISlOkz9zB1v0LmXWmjCDYILCkFyX7bNVuYBXJzHnoKZ5yhJvFiBmsieR
         6wETxkCiuNHJPxTWo+uSNN5OURyGsa/uiG8XGy4UdEZX04rMmufBwbLYz/KWTeRRbp1g
         VN3g==
X-Gm-Message-State: AGi0PuZcsWfKsnF4IkGOOuBUPMTYo0QvIQYsJpvuIxG8UA5UG7Yhwgs4
        eQk6eM2AQOrNuaItQI7drBO+J+bjDhfPHnERFUA=
X-Google-Smtp-Source: APiQypLK2MzhwAlU5maq3OzaoFcwlxith+KDd7vNSYpfBpMujUQxyS1N38HvpPJg+83Xryx07p4rjzYgxCDw7EU0uIE=
X-Received: by 2002:a05:6808:8cf:: with SMTP id k15mr1541313oij.54.1587115918339;
 Fri, 17 Apr 2020 02:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200417092042.11994-1-yanaijie@huawei.com>
In-Reply-To: <20200417092042.11994-1-yanaijie@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Apr 2020 11:31:46 +0200
Message-ID: <CAMuHMdUfwbsfLNSxJLqkwTNEQims1RHBn_EwBvBUqEZshHZHdQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rza1: remove unused 'rza1l_swio_pins'
To:     Jason Yan <yanaijie@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>,
        Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jason,

On Fri, Apr 17, 2020 at 10:54 AM Jason Yan <yanaijie@huawei.com> wrote:
> Fix the following gcc warning:
>
> drivers/pinctrl/pinctrl-rza1.c:401:35: warning: ‘rza1l_swio_pins’
> defined but not used [-Wunused-const-variable=]
>  static const struct rza1_swio_pin rza1l_swio_pins[] = {
>                                    ^~~~~~~~~~~~~~~
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Thanks for your patch!

> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -398,15 +398,6 @@ static const struct rza1_bidir_pin rza1l_bidir_pins_p9[] = {
>         { .pin = 5, .func = 3 },
>  };
>
> -static const struct rza1_swio_pin rza1l_swio_pins[] = {
> -       { .port = 2, .pin = 8, .func = 2, .input = 0 },
> -       { .port = 5, .pin = 6, .func = 3, .input = 0 },
> -       { .port = 6, .pin = 6, .func = 3, .input = 0 },
> -       { .port = 6, .pin = 10, .func = 3, .input = 0 },
> -       { .port = 7, .pin = 10, .func = 2, .input = 0 },
> -       { .port = 8, .pin = 2, .func = 3, .input = 0 },
> -};
> -
>  static const struct rza1_bidir_entry rza1l_bidir_entries[RZA1_NPORTS] = {
>         [1] = { ARRAY_SIZE(rza1l_bidir_pins_p1), rza1l_bidir_pins_p1 },
>         [3] = { ARRAY_SIZE(rza1l_bidir_pins_p3), rza1l_bidir_pins_p3 },

rza1l_swio_pins[] is unused because rza1l_swio_entries[] refers to the
wrong array. So I'd rather see a patch to fix that instead.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
