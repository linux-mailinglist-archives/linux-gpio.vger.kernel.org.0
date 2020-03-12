Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F0018322B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 14:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgCLN4b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 09:56:31 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41363 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgCLN4a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 09:56:30 -0400
Received: by mail-vs1-f67.google.com with SMTP id k188so3703047vsc.8
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 06:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6JRXwTxIAB5j1j2NCMCzDecPYeTmxsCx4GXTA9BYABo=;
        b=srPbt+3Nm45Swo/WvJq/xcZocTAX3qu3mZ3mKOg1oDFlqsbIVsGgXtrctkLHAauqce
         k1Hg+IPtfqpvwG/ABUKq8oxPpZor5Y5qjLq+ke77Yz/a+guNZwjOc3VqrJNSSEWaItvz
         cdK67hgqWvPCBp7oMco8JUX2sEckN41BAU+yjxZnnlRED7ce2+gGBt9CdWYBsaxS2RRg
         yLOnXNcvK592FBqKAn01hx4cwNa2O8vsjB0mh8hkFYoS7bXy8roviwrGXxIwtR/khaVZ
         KxYQVduEseN+FTWHhMUqF5tEXKgKxdj1Oynj0XdpU6TMmCRmxVHj8sOJGGNigQLSQLz2
         j2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6JRXwTxIAB5j1j2NCMCzDecPYeTmxsCx4GXTA9BYABo=;
        b=jC3aRF4z4GdK3mUm4jhLgsyHayE8Mg5abaITN/PTMHP18kQDJiJfFFmLiJXDAHlcfZ
         80AJl1Bep0dRK648O6Ue5ZpXRru7diEeBZ7J7rrkjJuc2VYCuvQ2BVe+rnYx+UtsRHjn
         GjgK5H3nRduRp2BZ5zLomZcHK7Drw3Yw7t8GIjBZfxnONky0/K+GM7iOBokVR5ZYfwCh
         d/HiSeZyqdnN0g923uJPa1/MrmjoeDz+htxNxnmI8cdPk1/0H0iryIi4tD8Nnaldfbfg
         oC0GdJnHpS9k/VQ0VaB8UBikvI5FBfMzIDqWC77GjDoLp9gQJnHlgEkkIWQpQZxVDFvR
         apDQ==
X-Gm-Message-State: ANhLgQ1bBqrcRCNW2Sj0T0d8kUgp8wPcNmDriRFzncl+Lj9p2lnA558x
        sLfWTAamJgHbgiXd2dxS4x97SVDovvm0snkcpQXFfxVp528=
X-Google-Smtp-Source: ADFU+vv2QE24rtdwpGiavUKVuK+pRsxP8SX+w/0TbmxxSMm2UJ3KpJcmCMQ1vu/oVFsf31gBRdaEmQG0MLPwFr39t0k=
X-Received: by 2002:a67:cb84:: with SMTP id h4mr5414843vsl.85.1584021388328;
 Thu, 12 Mar 2020 06:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132519.2AC268030797@mail.baikalelectronics.ru> <CACRpkdaU1f_RM8GDPxj_2qaiBsJ5JLnKp=ryZxAYMp2YhTDKWA@mail.gmail.com>
In-Reply-To: <CACRpkdaU1f_RM8GDPxj_2qaiBsJ5JLnKp=ryZxAYMp2YhTDKWA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 14:56:17 +0100
Message-ID: <CACRpkdYWWQXMhPxRR=tEShr8+=Y4mkEqRsiCg_qCK0qS2i6hBQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: dwapb: Add debounce reference clock support
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 12, 2020 at 2:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> Hi Sergey,
>
> thanks for your patch!
>
> On Fri, Mar 6, 2020 at 2:25 PM <Sergey.Semin@baikalelectronics.ru> wrote:
>
> > +       err = devm_clk_bulk_get_optional(&pdev->dev, DWAPB_NR_CLOCKS,
> > +                                        gpio->clks);
> > +       if (err) {
> > +               dev_info(&pdev->dev, "Cannot get APB/Debounce clocks\n");
>
> dev_err() again.
>
> > +       err = clk_bulk_prepare_enable(DWAPB_NR_CLOCKS, gpio->clks);
> >         if (err) {
> > -               dev_info(&pdev->dev, "Cannot enable APB clock\n");
> > +               dev_info(&pdev->dev, "Cannot enable APB/Debounce clocks\n");
>
> dev_err() again.

With that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
