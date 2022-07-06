Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87C39568803
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 14:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbiGFMMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 08:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbiGFMMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 08:12:19 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03372A72A
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 05:11:54 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id x10so11667201edd.13
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 05:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N8SiADVZ0KBDLxFo+fo8QUS4MOh1gf7B6JuJMFLC4bk=;
        b=HgxVzYvDle/d1CEh6AG1GZUcPYT+1KA3sTSEjmLiflVXdHAaXsIUJQdpd/Cft0ENun
         8QtJSxn0ieSoNkiZId7FUOQ056DX62vamfJMe52Qw4gJf8jRLqYQ3w7bdramuFqlSF2U
         SehjyB8iiTiR5st1Ohxe1wKDAJFmMVYuu4Xqe070npzAQ4BUwENQuyHhuXd3Ira0yEhm
         ao5HiRtOJcVYKfQo2MYmOTxpSpPFGMkEOzRtHuTq/wnF6pL6dTwJtpMr+nzdZL2WX+2P
         ufPUiA8LaRWPF1W1S7LgnawXvspOtjS2XezEDVrZFmFOVX9qRKgC1W0nLgoSBWK0YF2P
         267g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N8SiADVZ0KBDLxFo+fo8QUS4MOh1gf7B6JuJMFLC4bk=;
        b=O508Z8ASJnHW1MbuyfURGurAUSO8OiMoFuKPleBwxMaRoXawljXn8M6CHIPWO3w8KY
         0iCR8vjKY9HbMNs9d2LcihNbQM8ZGYyWIk0IHjgcAzmHbSr8etYa6V5BsjxpCjscbw4Y
         nZzlzhTEz6BGQEcqWlgfiHbWVV7Bq6NrAVXwlnMXcf+B/8O6K6EPO9XKtXaF5R8jJxI9
         uEsK7qELw/onbs6flfUGQCYkOXKTFNVc71UCIVo5ofl8QrK0q2imUVtyEPeS/5xOhD1o
         LmzYHFerk6MTLqqt6ZnbkZYBP3vC8K3Zd+XQcJwcKYtcmSXWnCCFZkTkGg9F//e58e+Z
         2ZrA==
X-Gm-Message-State: AJIora8+dNBqJZED2O1vui1xXEwugSmg2FHQaB6e52aXBM2hBgux5IVQ
        vxQaIgEr5uGdbyNzUrMqm/Hag73BtOlQFcS3rNAxIA==
X-Google-Smtp-Source: AGRyM1vpuAqdUfAJusRdAhecce32zUigq0oPHC1Ch9CEbzZkxlWq1NVJqHyNIpP2zeYxH8v4AApd5lRVPX29zGcOApI=
X-Received: by 2002:a05:6402:42c3:b0:43a:46f6:ebd2 with SMTP id
 i3-20020a05640242c300b0043a46f6ebd2mr23832628edc.213.1657109513100; Wed, 06
 Jul 2022 05:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220705171835.4923-1-brgl@bgdev.pl> <CAHp75Ve3sPhFOZhL=_2p+1avuo96CP995KD+bi+Pn3gyj1F9TA@mail.gmail.com>
In-Reply-To: <CAHp75Ve3sPhFOZhL=_2p+1avuo96CP995KD+bi+Pn3gyj1F9TA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Jul 2022 14:11:42 +0200
Message-ID: <CAMRc=MekRvEVjRKJn6CWpbk9GJWS0Y+kB9MYpGFSN9WSSzWC7A@mail.gmail.com>
Subject: Re: [PATCH] gpio: pxa: schedule a devm action for the clock struct
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>, Yuan Can <yuancan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 6, 2022 at 1:49 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
s>
> On Tue, Jul 5, 2022 at 7:29 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > The clock is never released after probe(). Schedule devm actions for
> > putting and disabling the clock.
>
> ...
>
> > Reported-by: Signed-off-by: Yuan Can <yuancan@huawei.com>
>
> Me puzzled.
>

Yuan Can sent the following patch:
https://patchwork.ozlabs.org/project/linux-gpio/patch/20220704130323.104294-1-yuancan@huawei.com/

I responded that it was not complete and sent this instead.

>
> ...
>
> > +       ret = devm_add_action_or_reset(&pdev->dev, pxa_gpio_clk_put, clk);
> > +       if (ret)
> > +               return ret;
> > +
> >         ret = clk_prepare_enable(clk);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = devm_add_action_or_reset(&pdev->dev,
> > +                                      pxa_gpio_clk_disable_unprepare, clk);
> > +       if (ret)
> >                 return ret;
>
> Can we use recently introduced clk APIs for that? Maybe Stephen has an
> immutable branch you may reuse?

Sure, sounds good! Stephen, would you mind providing me with a branch for that?

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
