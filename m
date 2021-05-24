Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12E038E174
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 09:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbhEXHXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 03:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbhEXHXA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 03:23:00 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09608C061756
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 00:21:32 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id o192so13739217vsd.7
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 00:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q9optjELGGE/yo65RX7aE+4P5JsAxC90Oa22sr1MR3U=;
        b=eqjethxm3stGXVFYIbqtC/i944yZy5WCk5w5yeOccFG7SpB4oMGJIoyK55+UongDLF
         Thj7uaOi+gx9oAA23xzNHjx355I/Z8SY8kD385MvXo4/OBDDR0tR4dNd9FX2hQv4iSW9
         vEvt8DSMhedO4f34cC5h3XLodL69S+afXSWDBTZ/nMZ4aQqdOdxLjXpTOwR933OQn33H
         +OjCIM2PqxhhPhBMAXAx+r2cuTep8htw9PuaatuZqvm0FcwVSlYU+eaD89cGL55IiWR1
         V1Dr1iO2TbR4I0RlpPH0zPaO9oNLgj+KsBfXt41Vlp9JzrZyrSmiHN18hy7bWdFtleks
         CSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q9optjELGGE/yo65RX7aE+4P5JsAxC90Oa22sr1MR3U=;
        b=f6NJpCTTyErz2gcitour2ahSSNbNLziUJknIuPcU7mFcV7xL/DNqGuFXdcfHqTFO0I
         T/ZjzXlKYS4K8et+WctG/usejFcC8WY5XTNrpOZteK+VRs6ebslZgW06vM0k4Udw+F60
         xnMpajGoWl0OhFaBr4uRIrHEDnexWr69hi4HRXom5S7YuGjhDg5V/C306jvjgT0tYlaA
         npaWFh4q6DoM9Q5h36r65lZAk1B9dDAyLJ7V8OUOu4+1RzdiJLO8iTplGlbldAd/ejSO
         Vu9675XO7/AHKmGj8TcZLXpFRvs+l6OhFyW158bfqnvcciG85i8JMcFrICh2FPTnyDg0
         4h6w==
X-Gm-Message-State: AOAM532gGhMMzqBjErCxUTBVAoW11S0E4flmNpjUyoIBsz1FpaOTsZQr
        3emZ1EwOPffQ2bOG2e9r9pAy2NKcIY1Maagi6o8Iqw==
X-Google-Smtp-Source: ABdhPJxRZyK30UO9EkCv+1hq3sj8BoCtl7s93CCU/nrkc+Hg7BZWBt66ORrYI1kIoOk9tN+NJaUiVWRUYhiBgomZ/AI=
X-Received: by 2002:a67:7d85:: with SMTP id y127mr19264486vsc.43.1621840890897;
 Mon, 24 May 2021 00:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210521181042.7726-1-aardelean@deviqon.com> <CAMpxmJW1Q-m_W+n28V9sEqvnb4ZVTGq_55DedhuJxu5icuD9sQ@mail.gmail.com>
In-Reply-To: <CAMpxmJW1Q-m_W+n28V9sEqvnb4ZVTGq_55DedhuJxu5icuD9sQ@mail.gmail.com>
From:   Alexandru Ardelean <aardelean@deviqon.com>
Date:   Mon, 24 May 2021 10:21:20 +0300
Message-ID: <CAASAkoZWeQ3xSB3P-fLrym+_0b23HRuvaw3LW2Zgy9CVKr3AWQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-xgene: simplify probe, return
 devm_gpiochip_add_data() directly
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 23 May 2021 at 21:31, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Fri, May 21, 2021 at 8:10 PM Alexandru Ardelean
> <aardelean@deviqon.com> wrote:
> >
> > The handling of the return value from devm_gpiochip_add_data() is a bit
> > redundant. It prints messages on error and success cases.
> > While the success message may be useful, it is more in the area of log
> > spam, and these can be printed with other forms of kernel logging.
> >
> > This change does a direct return with devm_gpiochip_add_data() in the probe
> > function.
> >
> > The platform_set_drvdata() is needed, as this driver uses the stored
> > private date in the PM suspend/resume routines.
> >
> > Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> > ---
> >  drivers/gpio/gpio-xgene.c | 11 +----------
> >  1 file changed, 1 insertion(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
> > index 532b0df8a1f2..fb4b0c67aeef 100644
> > --- a/drivers/gpio/gpio-xgene.c
> > +++ b/drivers/gpio/gpio-xgene.c
> > @@ -159,7 +159,6 @@ static SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
> >  static int xgene_gpio_probe(struct platform_device *pdev)
> >  {
> >         struct xgene_gpio *gpio;
> > -       int err = 0;
> >
> >         gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> >         if (!gpio)
> > @@ -183,15 +182,7 @@ static int xgene_gpio_probe(struct platform_device *pdev)
> >
> >         platform_set_drvdata(pdev, gpio);
> >
> > -       err = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> > -       if (err) {
> > -               dev_err(&pdev->dev,
> > -                       "failed to register gpiochip.\n");
> > -               return err;
> > -       }
> > -
> > -       dev_info(&pdev->dev, "X-Gene GPIO driver registered.\n");
> > -       return 0;
> > +       return devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> >  }
> >
> >  static const struct of_device_id xgene_gpio_of_match[] = {
> > --
> > 2.31.1
> >
>
> Applied, thanks.
>
> For the future: the subject should be: "gpio: xgene: ..." here and
> everywhere else.

ack
will keep that in mind

thanks :)
Alex

>
> Bart
