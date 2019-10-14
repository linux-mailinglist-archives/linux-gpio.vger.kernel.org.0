Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73C5CD634D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 15:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732168AbfJNNEe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 09:04:34 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42959 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730762AbfJNNEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 09:04:34 -0400
Received: by mail-pf1-f193.google.com with SMTP id q12so10377795pff.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+G81+F5BsRQH74WW/c7wk1CYFreYQ61KdPUk0Zdevh0=;
        b=Bw2W5QzHvoWy48yN9DAzfVOV5DsmJUg3V9HY5xOZCSuBnZ0YtPH47Q3daTWcVNY3In
         GLfwF0fI1Q9wac8HpjvToxklCJYbwICTOvJHUFVBS3FHpwrtGAMc+Bu1zme7kjA8jDBv
         izLT7ItzYBf4zRVsLswB1zvw5Jb3+lvZdYKqBZjFp/Nd4XG9V7NUGZKfIlDEPwnzdOMO
         XEqyY455dRisVpq3u1TBzV64bpi/BWbl5K7YZS+NHkOMbbYPZD22thM3q90BqXWuFIUo
         bYa71zZiH3NvGV+kiewc4IM7oTLge/jxOw3tkC5nAcJLUCKnCnxfMXDJCdWaxbxV4wyq
         1W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+G81+F5BsRQH74WW/c7wk1CYFreYQ61KdPUk0Zdevh0=;
        b=BSR+vReapDXFp0kQbcuXG0oMRnNt1v9QbtqFk7E055dcFuqTD8Btyw4yaRWQMs2YJS
         NLeQhWgdGgReictkxrlQQXWDLcFEkNi9rRV05qZpraSPu0ijQap281ocAzpSslCdsZQu
         ai819En1GNK4Oxl48+6zv0bh9m1trqo8GYJfdevaWtIquPtTHsq8r+nCdymCkXtSZ3Jx
         u8PiGvU5S/pZ3GJuRPOEmDYzcSJY1N1pyUDrp2cxeC5cRacVNIh9I+gj0xKD3IJ/okx7
         2k88JJ/Mydp8hkuLOr0Yoiqp8+6VaXbSqLuH1cnHs+HKpNC0hrbZPvtX/GjHL7NQdIB6
         I5zw==
X-Gm-Message-State: APjAAAUUv7adneIbU04uh0ZSwkZ95QcfHJrvJZWNZ1Ylm8Blw15pKqIx
        tdS8UBRDx223l+v0zpZMz1o=
X-Google-Smtp-Source: APXvYqwPuM63gukYX4U4F39TsiXEs3DRI2Z3Y9PKGRh9CMdByXBEsXt0mm9iUdv2xGVmjwfnQWhxNA==
X-Received: by 2002:a17:90a:376d:: with SMTP id u100mr35406472pjb.23.1571058271775;
        Mon, 14 Oct 2019 06:04:31 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id u13sm15380117pgk.88.2019.10.14.06.04.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 06:04:31 -0700 (PDT)
Date:   Mon, 14 Oct 2019 21:04:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down
 are both set
Message-ID: <20191014130425.GC28012@sol>
References: <20191012015628.9604-1-warthog618@gmail.com>
 <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski wrote:
> sob., 12 paź 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > This patch allows pull up/down bias to be disabled, allowing
> > the line to float or to be biased only by external circuitry.
> > Use case is for where the bias has been applied previously,
> > either by default or by the user, but that setting may
> > conflict with the current use of the line.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> >  1 file changed, 7 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 647334f53622..f90b20d548b9 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> >                 return -EINVAL;
> >
> > -       /* Same with pull-up and pull-down. */
> > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > -               return -EINVAL;
> > -
> >         /*
> >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
> >          * the hardware actually supports enabling both at the same time the
> > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> >                 return -EINVAL;
> >
> > -       /*
> > -        * Do not allow both pull-up and pull-down flags to be set as they
> > -        *  are contradictory.
> > -        */
> > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > -               return -EINVAL;
> > -
> >         le = kzalloc(sizeof(*le), GFP_KERNEL);
> >         if (!le)
> >                 return -ENOMEM;
> > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
> >         unsigned arg;
> >
> >         switch (mode) {
> > +       case PIN_CONFIG_BIAS_DISABLE:
> >         case PIN_CONFIG_BIAS_PULL_DOWN:
> >         case PIN_CONFIG_BIAS_PULL_UP:
> >                 arg = 1;
> > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *desc)
> >         if (ret == 0)
> >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> >
> > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > +                               PIN_CONFIG_BIAS_DISABLE);
> > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> 
> From looking at the code: user-space can disable bias when setting
> both PULL_UP and PULL_DOWN flags. I don't understand why it's done in
> this implicit way? Why not a separate flag?

An extra flag would waste a bit and add nothing but more sanity checking.

Kent.
> Also: I don't like that
> this patch deletes code added by earlier patches in this series. If we
> really need this, then it should be rearranged.
> 
> Bart
> 
> >                 gpio_set_config(chip, gpio_chip_hwgpio(desc),
> >                                 PIN_CONFIG_BIAS_PULL_UP);
> >         else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> > @@ -4462,7 +4454,7 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
> >
> >         if (lflags & GPIO_PULL_UP)
> >                 set_bit(FLAG_PULL_UP, &desc->flags);
> > -       else if (lflags & GPIO_PULL_DOWN)
> > +       if (lflags & GPIO_PULL_DOWN)
> >                 set_bit(FLAG_PULL_DOWN, &desc->flags);
> >
> >         ret = gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
> > --
> > 2.23.0
> >
