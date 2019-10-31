Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F41EAAFA
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 08:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfJaHe6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 03:34:58 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45636 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfJaHe6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 03:34:58 -0400
Received: by mail-pf1-f196.google.com with SMTP id c7so3695883pfo.12
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 00:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=R1G3mFN/LThtAgmOXlGSjewnBDdfV+aGjSUudaD9LIg=;
        b=vgmdfakV5EsExQ+6inoPqmVbM4Y2QH24KOlnME31oZPluA75FTawHYdGqU3CnxNx+N
         SHc6OlKwul93jMF6F5/lsLAQei0jaWq8XBqlkypQmTXKFVrN7Hp4OxR1dLSPh/B82V2o
         yVmKJQ43bzHCdP4/9w8wyOCcS+Wc71V7ZyexYRoLsKZ6iZVP79+MLXSLrE3YClPqgoST
         z5Opduf1WIV1CfwovpsolirD7De71XBQzNH3+2cMjI2tbB344LmFRQ7/9dz6i+P6KCWZ
         96IeCVSVqR0huh0wcgJTBWgh19iWXpM+jXGe9KFt2A1YW3UfwBT7HgqbI1kj3viR7yJK
         DqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=R1G3mFN/LThtAgmOXlGSjewnBDdfV+aGjSUudaD9LIg=;
        b=Y7+29oFtaYF8aD1a25DhOShnOv0Hd/YDfZTVCrSf2F/Xh75GyYF99AZsKSYJvlw5K5
         0BMn3NEXcTdhbb9fqkPh7VElHklOAuvcR3jKyUEuwCcv/8aONr59ukDrTHIxA/9pRQ0Q
         PFPWKlUEl0nH2k9iLEdy7F5j/K0ge+tzg2OrEIFZi1nl7Eco9lTK2vbKKZ0QxgA21YWi
         V7ZTurojDOJbozgYnfYWLTPG/TjSuSOHrRAJdvvCtspUHNHei9MrTagLKRWQs2u7Etq3
         soB+N//xNFYllY4/dY7K8f9H/t2azXeTCzBSgVKU65AeJVXt+cz+ec0PtSW5J+jynZHo
         6e9g==
X-Gm-Message-State: APjAAAXVsrdcCPbAzP0NVG4MgyHSxrLoCYB9iIyN4RUbX71ghCirOlh3
        mHnt5CeN+3Ow6JY9z5wiKmPUFZvKEeg=
X-Google-Smtp-Source: APXvYqzxpDHPOSW/Bji3RZCTLrFJZ08tDujemYQ4s/a1ArTBiN4KHjqiiCUHOKG4Gf/b9J2O3KuV1Q==
X-Received: by 2002:a62:b419:: with SMTP id h25mr4771092pfn.196.1572507297343;
        Thu, 31 Oct 2019 00:34:57 -0700 (PDT)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id e26sm2744907pgb.48.2019.10.31.00.34.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 00:34:56 -0700 (PDT)
Date:   Thu, 31 Oct 2019 15:34:52 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add new SET_CONFIG ioctl() to gpio chardev
Message-ID: <20191031073452.GB25839@sol>
References: <20191028073912.25743-1-warthog618@gmail.com>
 <CAMpxmJWb=6QQqMWNsDTJKMEr=cd8h1pq+zewc16cFfosFRwmDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJWb=6QQqMWNsDTJKMEr=cd8h1pq+zewc16cFfosFRwmDQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 31, 2019 at 08:11:00AM +0100, Bartosz Golaszewski wrote:
> pon., 28 paź 2019 o 08:39 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Add the GPIOHANDLE_SET_CONFIG_IOCTL to the gpio chardev.
> > The ioctl allows some of the configuration of a requested handle to be
> > changed without having to release the line.
> > The primary use case is the changing of direction for bi-directional
> > lines.
> >
> > Based on initial work by Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >
> > The patch is against Bart's gpio/for-next branch[1] with v4 of my bias
> > patch series "gpio: expose line bias flags to userspace" applied.
> > This is necessary to support setting of the bias flags introduced
> > there.
> >
> > The patch has been successfully tested against gpio-mockup using the
> > feature/pud_set_config branch of my Go gpiod library[2], as libgpiod has
> > not yet been updated with the uAPI change.
> >
> >  drivers/gpio/gpiolib.c    | 163 ++++++++++++++++++++++++++------------
> >  include/uapi/linux/gpio.h |  18 +++++
> >  2 files changed, 132 insertions(+), 49 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index df27f05f9b8d..62a74e27ad02 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -427,23 +427,74 @@ struct linehandle_state {
> >         GPIOHANDLE_REQUEST_OPEN_DRAIN | \
> >         GPIOHANDLE_REQUEST_OPEN_SOURCE)
> >
> > +static int linehandle_validate_flags(u32 flags)
> > +{
> > +       /* Return an error if an unknown flag is set */
> > +       if (flags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
> > +               return -EINVAL;
> > +
> > +       /*
> > +        * Do not allow both INPUT & OUTPUT flags to be set as they are
> > +        * contradictory.
> > +        */
> > +       if ((flags & GPIOHANDLE_REQUEST_INPUT) &&
> > +           (flags & GPIOHANDLE_REQUEST_OUTPUT))
> > +               return -EINVAL;
> > +
> > +       /*
> > +        * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
> > +        * the hardware actually supports enabling both at the same time the
> > +        * electrical result would be disastrous.
> > +        */
> > +       if ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) &&
> > +           (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
> > +               return -EINVAL;
> > +
> > +       /* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mode. */
> > +       if (!(flags & GPIOHANDLE_REQUEST_OUTPUT) &&
> > +           ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> > +            (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
> > +               return -EINVAL;
> > +
> > +       /* Bias flags only allowed for input or output mode. */
> > +       if (!((flags & GPIOHANDLE_REQUEST_INPUT) ||
> > +             (flags & GPIOHANDLE_REQUEST_OUTPUT)) &&
> > +           ((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
> > +            (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
> > +            (flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
> > +               return -EINVAL;
> > +
> > +       /* Only one bias flag can be set. */
> > +       if (((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
> > +            (flags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
> > +                       GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
> > +           ((flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
> > +            (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
> > +               return -EINVAL;
> > +
> > +       return 0;
> > +}
> > +
> 
> This is great but I'd prefer that it be put into a separate patch with
> its own description that would come before the other changes.
> 

Will do.

> >  static long linehandle_ioctl(struct file *filep, unsigned int cmd,
> >                              unsigned long arg)
> >  {
> >         struct linehandle_state *lh = filep->private_data;
> >         void __user *ip = (void __user *)arg;
> >         struct gpiohandle_data ghd;
> > +       struct gpiohandle_config gcnf;
> > +       struct gpio_desc *desc;
> >         DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
> > -       int i;
> > +       int i, ret;
> > +       u32 lflags;
> >
> >         if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
> >                 /* NOTE: It's ok to read values of output lines. */
> > -               int ret = gpiod_get_array_value_complex(false,
> > -                                                       true,
> > -                                                       lh->numdescs,
> > -                                                       lh->descs,
> > -                                                       NULL,
> > -                                                       vals);
> > +               ret = gpiod_get_array_value_complex(false,
> > +                                                   true,
> > +                                                   lh->numdescs,
> > +                                                   lh->descs,
> > +                                                   NULL,
> > +                                                   vals);
> >                 if (ret)
> >                         return ret;
> >
> > @@ -477,6 +528,59 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
> >                                               lh->descs,
> >                                               NULL,
> >                                               vals);
> > +       } else if (cmd == GPIOHANDLE_SET_CONFIG_IOCTL) {
> > +               if (copy_from_user(&gcnf, ip, sizeof(gcnf)))
> > +                       return -EFAULT;
> > +
> > +               lflags = gcnf.flags;
> > +               ret = linehandle_validate_flags(lflags);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               for (i = 0; i < lh->numdescs; i++) {
> > +                       desc = lh->descs[i];
> > +                       if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
> > +                               set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> > +                       else
> > +                               clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
> > +                       if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
> > +                               set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> > +                       else
> > +                               clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
> > +                       if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
> > +                               set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> > +                       else
> > +                               clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
> > +                       if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
> > +                               set_bit(FLAG_PULL_UP, &desc->flags);
> > +                       else
> > +                               clear_bit(FLAG_PULL_UP, &desc->flags);
> > +                       if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
> > +                               set_bit(FLAG_PULL_DOWN, &desc->flags);
> > +                       else
> > +                               clear_bit(FLAG_PULL_DOWN, &desc->flags);
> > +                       if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
> > +                               set_bit(FLAG_BIAS_DISABLE, &desc->flags);
> > +                       else
> > +                               clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
> 
> Could you add some new lines between the if elses? I think it'll be
> more readable.
> 

Agreed.  I would prefer to call a function that atomically sets or clears
the flag bit based on the requested state, but there doesn't seem to be one.

Cheers,
Kent.

