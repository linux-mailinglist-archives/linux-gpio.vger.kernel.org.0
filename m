Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15CD6AB6CF
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 13:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbfIFLJw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 6 Sep 2019 07:09:52 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40942 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731527AbfIFLJv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 07:09:51 -0400
Received: by mail-ot1-f67.google.com with SMTP id y39so5341311ota.7;
        Fri, 06 Sep 2019 04:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YjIOTnA7AJrnGQlF0RtRVuR7iIuADp5iAhDiCUvFbDY=;
        b=RsTS3VcxF55/+90ijx30BBcgmTMDLDJcPW2gE/p8rcYNRNamg8aaKkVQldvzDht5PM
         7xuua/7XK8Nq+SbjZVOe901eYb6z54Eve0ioYJtlxvFf0eG0yjUmjAnNC+NT62Y1QzRB
         Jjk7hxGtGY8OVQE8cftrMhKIhEVLirmpD5OslKJdkt1Plhl0K+4EMGBawDIe6pPpeRjU
         R/pFbRQC+hNL42JWaC9LVwT1ae0H9i1Oigd0o7iURelqJDcvbKzE3z9BF71j8W+LAQ77
         uBiTc7ZECucv7fVDWXs5TkYy7fwe0/YfSrVIMId85UFnwpqDbNBiiHkdSo70T4T1lGKL
         G2ig==
X-Gm-Message-State: APjAAAWeEoU31d3ZGKoHuPQ5h6RoHE8wC/sPZ7dUG8noMbeJVtoUylBj
        oz8wBrYRMo3I98elF/eu9EcBf5v9PFqbx8LeDGo=
X-Google-Smtp-Source: APXvYqycNpCL4JLDQsajFhUn38P3soOaWnlH2I8lUg6IR7dOErT/aqJzV4mupZNPg2j96MybcS6x7VN9KphMVsGGLLA=
X-Received: by 2002:a05:6830:1196:: with SMTP id u22mr6795961otq.39.1567768190812;
 Fri, 06 Sep 2019 04:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
 <CAMpxmJXOrDLdw6ZPBHxzsDRYiLmhRNCb-s_Z=Gu=Ecg1XA5ONQ@mail.gmail.com>
 <CAMuHMdWdb0dcS8Nvk-Poz2dT7nuHjFhqpsRPZZnSKsc3VffcRA@mail.gmail.com> <CAMpxmJUF1s1zyXVtoUGfbV7Yk+heua4rNjY=DrX=jr-v8UfNxA@mail.gmail.com>
In-Reply-To: <CAMpxmJUF1s1zyXVtoUGfbV7Yk+heua4rNjY=DrX=jr-v8UfNxA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Sep 2019 13:09:39 +0200
Message-ID: <CAMuHMdXOhrc1o5Jh3TN+JT4VFSSMg8Wy-rsgH=b8hNZQd8rXiA@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 9, 2019 at 4:59 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pon., 8 lip 2019 o 12:24 Geert Uytterhoeven <geert@linux-m68k.org> napisał(a):
> > On Mon, Jul 8, 2019 at 11:45 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > pt., 5 lip 2019 o 18:05 Geert Uytterhoeven <geert+renesas@glider.be> napisał(a):
> > > > +static int gpio_virt_agg_set_config(struct gpio_chip *chip,
> > > > +                                   unsigned int offset, unsigned long config)
> > > > +{
> > > > +       struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> > > > +
> > > > +       chip = priv->desc[offset]->gdev->chip;
> > > > +       if (chip->set_config)
> > > > +               return chip->set_config(chip, offset, config);
> > > > +
> > > > +       // FIXME gpiod_set_transitory() expects success if not implemented
> >
> > BTW, do you have a comment about this FIXME?
>
> Ha! Interesting. I'll give it a thought and respond elsewhere as it's
> a different subject.
>
> > > > +       return -ENOTSUPP;

Upon closer look, this turns out to be a red herring: gpiod_set_transitory()
converts -ENOTSUPP to zero, so there is no issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
