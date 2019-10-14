Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D292AD632D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 14:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730403AbfJNM7H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 08:59:07 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40183 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730331AbfJNM7G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 08:59:06 -0400
Received: by mail-pl1-f196.google.com with SMTP id d22so7989780pll.7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=F4HBJxYj+UWJy4YPGT0PLDlnjLY0kr90KTepy4S5EnI=;
        b=kJ6NpuydCsJKVRGS3HSzUXL34Dgs20yxJVODrLt2X3FnravrhmLZBktEWNln17o+yN
         TuO6E0c4d7CD/5zDY1HIQ5hVPuiRhHMEroT1KLcBFGEroMbCpKUZdLJEdN4A6d4fpOH8
         1uoQOAZClDFtrwRlf7sC0C/bwsYuECsRedxcQNvIlko9OvPeIEWzuLUH0RA0ZuRUl9XK
         /7PSbMJcM1+cJQmNPT7oVP9Ja+ewt+vJwM9z29ov60KAO9agSLrKq3Z/vM+LRqDmr1wr
         DRT7MSo5fChrECknmVPdng3gaki7AvdXjk8RWfzMvMSKnV3nM/TepZh+qkK508Wyc2JO
         4u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=F4HBJxYj+UWJy4YPGT0PLDlnjLY0kr90KTepy4S5EnI=;
        b=fNUvNhAv7+wGP/bV8aY0nX6426bUIAuNM1fTFAkFw7RLPH9WroX2HMlqhgGqGaJJQ3
         GVK0iQVrUhQGkef9tJ3yq2yaMkue6jjquWXHSXrTTwu6KzHhRVfI/r89lxFS5FRZZ6mW
         pAyVf9HGHY6J63dOMRyT8g6lM/IwNyZ6qEeCU/bl+3S7QwSfq1fl15P5cV7UPSynI0YZ
         fmqPxhCCSxFPjkea1EP3sIjSnyiBwYLoetst3SUgQVpHqFdKW7lF9H6vgOi6bUc5OJe+
         D6SAvgDEKwMdvFmJoE2BxSFjgaZWj6cT03yq5vTl7HVQ+KxkNRJmIzPIAzO4xlG0qHzs
         9U1g==
X-Gm-Message-State: APjAAAUy2B27Z2SAyA2PAbS+Tq0vXhpKVHDxzYpWnMmIy0y1r86E+LIg
        X+1IedyLQMqGGmnbFouN38s=
X-Google-Smtp-Source: APXvYqym8WPyN3KDRqMocUVOhkogCzq6ZNpUTj6pgsOMi0eUuYYfsz2zRlQ2vCv4DIaGo+Pt4BUw2A==
X-Received: by 2002:a17:902:9f94:: with SMTP id g20mr13589739plq.319.1571057945766;
        Mon, 14 Oct 2019 05:59:05 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id t125sm21909125pfc.80.2019.10.14.05.59.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 05:59:05 -0700 (PDT)
Date:   Mon, 14 Oct 2019 20:58:59 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 2/6] gpiolib: add support for pull up/down to
 lineevent_create
Message-ID: <20191014125859.GB28012@sol>
References: <20191012015628.9604-1-warthog618@gmail.com>
 <20191012015628.9604-3-warthog618@gmail.com>
 <CAMRc=McVXbZHbRATN9A6ffDgjB8Bc=gGRYLpbfeqzrNLVeNReg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McVXbZHbRATN9A6ffDgjB8Bc=gGRYLpbfeqzrNLVeNReg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 02:35:38PM +0200, Bartosz Golaszewski wrote:
> sob., 12 paź 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > This patch adds support for pull up/down to lineevent_create.
> > Use cases include receiving asynchronous presses from a
> > push button without an external pull up/down.
> >
> > Move all the flags sanitization before any memory allocation in
> > lineevent_create() in order to remove a couple unneeded gotos.
> > (from Bartosz Golaszewski <bgolaszewski@baylibre.com>)
> >
> 
> The patch you pulled in into your commit already sits in my for-next branch.
> I didn't know you would be modifying the code I touched earlier. In this case
> you can rebase the series on top of gpio/for-next from my tree[1]
> 
You explicitly told me to rebase it onto the latest release candidate,
and to squash the incomplete changes from your branch into my changes.
How did you think that was going to pan out?

> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  drivers/gpio/gpiolib.c | 60 +++++++++++++++++++++++++-----------------
> >  1 file changed, 36 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 9d2a5e2f6e77..053847b6187f 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -905,6 +905,38 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> >         if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
> >                 return -EFAULT;
> >
> > +       offset = eventreq.lineoffset;
> > +       lflags = eventreq.handleflags;
> > +       eflags = eventreq.eventflags;
> > +
> > +       if (offset >= gdev->ngpio)
> > +               return -EINVAL;
> > +
> > +       /* Return an error if a unknown flag is set */
> > +       if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
> > +           (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS))
> > +               return -EINVAL;
> > +
> > +       /* This is just wrong: we don't look for events on output lines */
> > +       if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
> > +           (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> > +           (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
> > +               return -EINVAL;
> > +
> > +       /* PULL_UP and PULL_DOWN flags only make sense for input mode. */
> > +       if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
> > +           ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
> > +            (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > +               return -EINVAL;
> > +
> > +       /*
> > +        * Do not allow both pull-up and pull-down flags to be set as they
> > +        *  are contradictory.
> > +        */
> > +       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > +           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > +               return -EINVAL;
> > +
> >         le = kzalloc(sizeof(*le), GFP_KERNEL);
> >         if (!le)
> >                 return -ENOMEM;
> > @@ -922,30 +954,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> >                 }
> >         }
> >
> > -       offset = eventreq.lineoffset;
> > -       lflags = eventreq.handleflags;
> > -       eflags = eventreq.eventflags;
> > -
> > -       if (offset >= gdev->ngpio) {
> > -               ret = -EINVAL;
> > -               goto out_free_label;
> > -       }
> > -
> > -       /* Return an error if a unknown flag is set */
> > -       if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
> > -           (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS)) {
> > -               ret = -EINVAL;
> > -               goto out_free_label;
> > -       }
> > -
> > -       /* This is just wrong: we don't look for events on output lines */
> > -       if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
> > -           (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> > -           (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)) {
> > -               ret = -EINVAL;
> > -               goto out_free_label;
> > -       }
> > -
> >         desc = &gdev->descs[offset];
> >         ret = gpiod_request(desc, le->label);
> >         if (ret)
> > @@ -955,6 +963,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> >
> >         if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
> >                 set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> > +       if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
> > +               set_bit(FLAG_PULL_DOWN, &desc->flags);
> > +       if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
> > +               set_bit(FLAG_PULL_UP, &desc->flags);
> >
> 
> Correct me if I'm wrong but this looks like it should be part of
> Drew's patch (1/6) in this series right? You can modify it and add
> your Signed-off-by tag. In fact your Signed-off-by is needed anyway if
> you're sending someone else's patches.
> 
No problem - you are wrong.  Drew's patch added support on handle requests.
This patch adds support on event requests.

Or are you do you want me to squash the whole series down to 2 - gpiolib
and mockup?

