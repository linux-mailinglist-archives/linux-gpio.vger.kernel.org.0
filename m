Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0B81B2037
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 09:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgDUHrU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 03:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDUHrT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2020 03:47:19 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A715C061A0F
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 00:47:19 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id i3so13983747ioo.13
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 00:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OeY1D5X0JTe+X4nNccsTmfIHAJbVoZEYQTxgNeqW028=;
        b=NCdIJS3I3tyMbQF5olMC+eUV6oQEQKyGdY9AXUQLfpzFEDXi6k5GMbZK/iNrkE/LFj
         MHjHx8MCqFEjTe3OpSCjvgjswdR/xfdxAqaaktflmnX6Q3uE5egmYuO+Pe4lXlkWCjFw
         sthcMkuVk0Fb7zK9/r6LjPM8k98RNebHHT69pVnq6068yJgGfd3wmKbHpEuGQzpMDH+L
         N6Q5w96ta8azjJdeXVIYLRGqS2Q+QZVinSjajx/yZMgrmUhg+kRF0JTSF7QXI2BcwAI/
         kRQ+vo5H1vhvrUu/wAXPwh/JBDtfAftYF3eLMdM/E4hPhZ89+WEy1cekgin+66XU6Kw+
         puTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OeY1D5X0JTe+X4nNccsTmfIHAJbVoZEYQTxgNeqW028=;
        b=F6qOvfn4qlVRG9hUQ/PrL7X//j8jcZmxuMbaOWo2byflb/InFvYrIOq9qMixm6acTO
         cnIyCMnLeD65gwFUI8BQ9W4grmafaieoazU1HTM8vQjgPJR5rxg3mEUoGDhflmeUzLB5
         bcSCUwtis8vN/IZAblNSg2YXMT6IBenkMeiw8jDFK9m4/FrNaLuG924KZyUwStXmo9bQ
         R/VG8zRqElPRkBHQBlQ1qk+HrXTbG4V+qvgep3/Octp3wksaw4Lv2KqAR+vHzDPmT1KB
         kKFWJHfRMh6G4l7s/VWkdNEVyzXB8C5rm8gUQmfCGVkSxwbkaDj+gioPhnRSeaTQUvMS
         uTXg==
X-Gm-Message-State: AGi0PubwKNL+NJtFNM+p5vcFnE+Sg/yuIXSEe+WdyluDUveyLS5WKr9F
        wRINo92ncbC8nZuD7dhUD0hKhY8H9iCRgycnSWGJwQ==
X-Google-Smtp-Source: APiQypK8Fgiv9fuxZ96YyuvwHZijN8BQ7LGwA3Vk2+rHhZNpoJL5ML+jbbE9xAFzb+UsDPsxi8UytpkHJxDB0QJRJng=
X-Received: by 2002:a05:6602:199:: with SMTP id m25mr19489799ioo.13.1587455238413;
 Tue, 21 Apr 2020 00:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200417080549.23751-1-brgl@bgdev.pl> <20200417080549.23751-2-brgl@bgdev.pl>
 <CAHp75Vf_kBfb_oLB2Dp48iYiDgs2k_RgzpudTvQMoxNYGMz3TA@mail.gmail.com>
In-Reply-To: <CAHp75Vf_kBfb_oLB2Dp48iYiDgs2k_RgzpudTvQMoxNYGMz3TA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 21 Apr 2020 09:47:07 +0200
Message-ID: <CAMRc=MdopCtsB23bk058iHd2LGqecqot1nAsi5S8x72U4wiGCg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] irq: make irq_domain_reset_irq_data() available
 even for non-V2 users
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 17 kwi 2020 o 12:50 Andy Shevchenko <andy.shevchenko@gmail.com> napisa=
=C5=82(a):
>
> On Fri, Apr 17, 2020 at 11:13 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > irq_domain_reset_irq_data() doesn't modify the parent data, so it can b=
e
> > made available even if irq domain hierarchy is not being built. We'll
> > subsequently use it in irq_sim code.
>
>
> > @@ -475,7 +476,6 @@ extern int __irq_domain_alloc_irqs(struct irq_domai=
n *domain, int irq_base,
> >  extern void irq_domain_free_irqs(unsigned int virq, unsigned int nr_ir=
qs);
> >  extern int irq_domain_activate_irq(struct irq_data *irq_data, bool ear=
ly);
> >  extern void irq_domain_deactivate_irq(struct irq_data *irq_data);
> > -
> >  static inline int irq_domain_alloc_irqs(struct irq_domain *domain,
> >                         unsigned int nr_irqs, int node, void *arg)
> >  {
>
> Seems extra hunk slipped to the patch.
>
> --
> With Best Regards,
> Andy Shevchenko

Indeed, I'll wait for more reviews though before resending.

Bart
