Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD12219F0AA
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2020 09:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgDFHRp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Apr 2020 03:17:45 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44488 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgDFHRp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Apr 2020 03:17:45 -0400
Received: by mail-qt1-f193.google.com with SMTP id x16so12031566qts.11
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2020 00:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PtEAqQfzqsPhJBWIZEDxbG8AYLCv32dohXIjGg2I++4=;
        b=E8n7J0Uw9MHC5dm9rpjWBa2eDmSYuOfwKKSPcMvSjfJ4ftD1jyv1cpxAsKoyDeS01D
         bhOSYlPwr7cJXrvnoUoKNU38P2YowJa8bsy52aTqQ1PE9yTYn0PwrDTVT51D7JweWLvL
         iFsK+kKuQOWJBNT5r2IScqqQ5+vgwvl91fjBSgSlN+EPj8a93632JrKbOXGSFv7b/Fio
         XiVMNb7N4SnhV7LkAA3bYWlEJoIFwVxpzQn6gjq2CFaKMpox7i7F8rVI+jLsKze8onIl
         BTPP/c5BwFP3akw9sl5QMkZq/denzwwHPQXYzl+m7AeoG3j8tgUYHX2w079Yh6MW7v2A
         Otew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PtEAqQfzqsPhJBWIZEDxbG8AYLCv32dohXIjGg2I++4=;
        b=Q1rRzrR4e2W6/UhD+WIRxgM+MtV3rKqDHJOqkdzW6vqHuUXbtOGZmbJDMJX5YGIMA5
         tGW+EtevR806PpqiNqZcH4JEeSuMFJitGbof4WjvLUtVhTR1PLNUeVfADZKfLWOojqNS
         rarLUeDl/Cwi/7kvqL1BSojiaruUT0eFghXK3XK0G19tg7JfBkP99pcSe/418leVH4i0
         eAzOFZMY+wZJyBBxR7X/DRosub80fxpnUf5QKD1CelXyOv/K/RxvsOZClVJKWUesssJD
         zpyvoeVuXxGCB2O3DJrwjg0xVneQ1DrmgI4AFV8PiLm6H4U0yZEPxJ+NsHq5WT9ws/X3
         y20Q==
X-Gm-Message-State: AGi0PuYszuXQdxwUKdAq+xnzZt9nxoC1/xGczNLGMMSBnIhKk9RIxirq
        onNnd2XgKCCqnzsaAKQfu1HCK1DlafLAtsGj7Bw++LGU
X-Google-Smtp-Source: APiQypJP2R6c2sGk5OD8Jok+1/FSRzFI1fkKSrsKSESql1p99CHlxt0sTWdCTLfROAnrYVs0+7T3+OqpdvOMwBSw8Uo=
X-Received: by 2002:ac8:568b:: with SMTP id h11mr1677906qta.197.1586157463869;
 Mon, 06 Apr 2020 00:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200402192145.17239-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200402192145.17239-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 6 Apr 2020 09:17:33 +0200
Message-ID: <CAMpxmJXszy4Djjb8tstNGJg+3hBPfkM7RpneHaSzF6ELSRRPnw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: Extend TODO to cover code duplication avoidance
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 2 kwi 2020 o 21:21 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> It appears at least two drivers has a lot of duplication code in
> GPIO subsystem. To avoid adding more and get rid of existing duplication
> extend TODO.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/TODO | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
> index 3a44e6ae52bd..b989c9352da2 100644
> --- a/drivers/gpio/TODO
> +++ b/drivers/gpio/TODO
> @@ -99,6 +99,10 @@ similar and probe a proper driver in the gpiolib subsy=
stem.
>  In some cases it makes sense to create a GPIO chip from the local driver
>  for a few GPIOs. Those should stay where they are.
>
> +At the same time it makes sense to get rid of code duplication in existi=
ng or
> +new coming drivers. For example, gpio-ml-ioh should be incorporated into
> +gpio-pch. In similar way gpio-intel-mid into gpio-pxa.
> +
>
>  Generic MMIO GPIO
>
> --
> 2.25.1
>

Patch applied, thanks!

Bartosz
