Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C701C5D91
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2020 18:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730388AbgEEQ1y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 May 2020 12:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729981AbgEEQ1y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2020 12:27:54 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD75C061A10
        for <linux-gpio@vger.kernel.org>; Tue,  5 May 2020 09:27:53 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id b1so2473298qtt.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2020 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qEFIrk8I4x+Pe/UX6dmyNmgUh3ccSPdNfMqmW/bFJxY=;
        b=sk4WaohlKQtyYNrc6QHMgyHesOEY6lH9TMMmiBdrnAwFt1Wzv8LHqXzRwY632/F/st
         oVWWyF+7UeCucrHKMA4uvADq/Zdjnq9q0n+YTsLYRJ5bEaKr0nTjbHclZgSl/zNhahTc
         lrUpYQNR3z60hinHazOAPzNScS0hJ2fVJx7hJ6oHy/jf3gvgl23BRc5GDx9gJsK5/bwX
         pduBBIxWLIi4J0M5ovRTM14SGgzhuE7ZvurfFJ3IuQgY8HvWwKT75ItzgiDUEXkZXva5
         K48L3rHysP0gP3bAfjYM+gmh3s+ewgOt/R03WmJL1mcV4kPQ/Zf8Q+pqgFFNmlkIbh2V
         59Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qEFIrk8I4x+Pe/UX6dmyNmgUh3ccSPdNfMqmW/bFJxY=;
        b=FEALlaUYwd9OHcjMD2XuZ2ERAffjaurVtuxb117uf1o79uJsqOdZBwTPc77Rdkckn5
         jQnOPMssSU8nc1QRz1oW5FZhMmwNjNVotHj0oKg9fEGq8xgqUvA8h0h+RTQ7oyuXaPHD
         30VclNJnhb5GZ3aYHF45i94uD5waaZuyvdPUJCHwZJC3D/8r7pUJfW1SQWwXk0QwKVsb
         LnT2OxRoHBd4bDCividgicHJ0lUmo2IF6HVwh3qxM5Q++EgkS0ZtG3LaD6omLdWMPUGH
         Va4PMDHa7MqGnt2/q6XBpwrBQvswyZdqDmnC/vVPz7VryIE7Hx+x19Gg8q93J48t4VXi
         DRsA==
X-Gm-Message-State: AGi0PuZe6WXfKha1StyYcq9SK4/SZFxfe1VLDZvYSM8+HjRohXc8Gc9M
        fuhfVFjhlIp/yAg0bWRHMtEshltZCjCqu0DJhL9eJg==
X-Google-Smtp-Source: APiQypIDdY/RPDHOS6aSjrmaca8BOHQEL/JYupW+oHH4dRImVr5/u8HEH7uPOGlk6S2dC7Pdx6xiVkMu+uENsvuZl4s=
X-Received: by 2002:ac8:7b8b:: with SMTP id p11mr3528956qtu.131.1588696072959;
 Tue, 05 May 2020 09:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200430000916.8880-1-warthog618@gmail.com>
In-Reply-To: <20200430000916.8880-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 5 May 2020 18:27:42 +0200
Message-ID: <CAMpxmJXh6G0F1guJkPMJWwj_+Vk8D+k6y4MybVYOf7x9Cf-adA@mail.gmail.com>
Subject: Re: [PATCH] tools/gpio: add bias flags to lsgpio
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 30 kwi 2020 o 02:10 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> Add display of the bias flags.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tools/gpio/lsgpio.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
> index e1430f504c13..8a71ad36f83b 100644
> --- a/tools/gpio/lsgpio.c
> +++ b/tools/gpio/lsgpio.c
> @@ -49,6 +49,18 @@ struct gpio_flag flagnames[] =3D {
>                 .name =3D "open-source",
>                 .mask =3D GPIOLINE_FLAG_OPEN_SOURCE,
>         },
> +       {
> +               .name =3D "pull-up",
> +               .mask =3D GPIOLINE_FLAG_BIAS_PULL_UP,
> +       },
> +       {
> +               .name =3D "pull-down",
> +               .mask =3D GPIOLINE_FLAG_BIAS_PULL_DOWN,
> +       },
> +       {
> +               .name =3D "bias-disabled",
> +               .mask =3D GPIOLINE_FLAG_BIAS_DISABLE,
> +       },
>  };
>
>  void print_flags(unsigned long flags)
> --
> 2.26.2
>

Patch applied, thanks!

Bart
