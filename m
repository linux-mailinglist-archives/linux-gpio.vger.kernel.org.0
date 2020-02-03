Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8625C1504DC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 12:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgBCLFL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 06:05:11 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:40111 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgBCLFL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2020 06:05:11 -0500
Received: by mail-qv1-f66.google.com with SMTP id dp13so6569685qvb.7
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2020 03:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OEJ+A4YOxXmg2doai7LuIU0V5wHQ//U/Mj3H+TVAh7c=;
        b=WpgPJuW5nI3+4Rfo01VjSKn6FJqckk1o757wWJDFicvI916HMhqZyF7IBM881Jn9r3
         ZlVLnmX3QUdGQxJWOE5TUldYoB4vfnvXnFbcdZ+cy1KhVd2mKDeSWluSRjHSmvoHjgoi
         wIvQRbDI0reAW4dvZqzgw3TmFKeH/9nqnUkiu3kyP0Mzyah0qLxEkDV1rl2kjAq6pzu3
         kFKOtL2ipKcSGe5AF7JCzJ8VklLxPsMpgAs/PchKxc3yAWhY1k/KWeZgDJWWJMVal572
         mWzqhEYgl15mncWY7lzOzzTmVCnJ6Q4ZYSKp64Jvns8ygRzFqq86NzQ4BVvsidxR/tnp
         EZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OEJ+A4YOxXmg2doai7LuIU0V5wHQ//U/Mj3H+TVAh7c=;
        b=pSNDSOcgWdUnQVeS8gJQswU86uMTeQv63WjkFMLuJVaz87vjUPutGOi7nXc+v9hLpr
         gJQyNR67s4seWtZYlzoqQEMn24ibLJwpjmYLB977/nBqNHsAJ62rWuPq2KEUCCzU/Aq9
         VyT5qK4XPntCiSLgetJBrYeUpDA/mMnWCaMoSIG/90gD5WpXVpWncAvcrqITOXSNOT/s
         6y6EwWNfr0UGcWUA/lHejyAZbv1Lv218SG6Bgm8IIqsVYb1CTiXUAeNy1A4jEOc3/iQb
         wgN68YPmDr+VwwQJDqgqApJhFV0ga+cKG2ykptw6kgbQWzQLD/CJk+PEP/Uchspq4LoM
         Cb5g==
X-Gm-Message-State: APjAAAX/8AXKnmardzigI6qIqMDMfCXxeSbYxkzYPajzbkbkQUVd+M+D
        67VES8nq7Prwp3KijWgN409dQFm5xqQmY8Xw4cYV2g==
X-Google-Smtp-Source: APXvYqy6eCOVQtmeClQ9s6Ork9hSmBPuNbq/dE8XHtgI6t13zQY19ElP+2IDJ5qdx3sh2GvUzHF40upVwXeHyLkdQJU=
X-Received: by 2002:a0c:f28f:: with SMTP id k15mr5153632qvl.76.1580727908949;
 Mon, 03 Feb 2020 03:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-3-brgl@bgdev.pl>
 <20200201195232.GA17364@roeck-us.net>
In-Reply-To: <20200201195232.GA17364@roeck-us.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 3 Feb 2020 12:04:57 +0100
Message-ID: <CAMpxmJU=wvONwure-MS9vb=0fuRgnf+wVshBQn2N=uwcZUG3Bw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] gpiolib: have a single place of calling set_config()
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 1 lut 2020 o 20:52 Guenter Roeck <linux@roeck-us.net> napisa=C5=82(a)=
:
>
> On Tue, Dec 24, 2019 at 01:06:58PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Instead of calling the gpiochip's set_config() callback directly and
> > checking its existence every time - just add a new routine that perform=
s
> > this check internally. Call it in gpio_set_config() and
> > gpiod_set_transitory(). Also call it in gpiod_set_debounce() and drop
> > the check for chip->set() as it's irrelevant to this config option.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> This patch made it into mainline, even though a regression was reported
> against it by Geert. Please note that it is not just a theoretic problem
> but _does_ indeed cause regressions.
>
> Guenter
>

Hi Guenter,

I'm sorry for this, I was still largely unavailable for the past two
weeks. I'll address it today, this time for real.

Best regards,
Bartosz Golaszewski
