Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E782271380
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Sep 2020 13:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgITLXc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Sep 2020 07:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgITLXa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Sep 2020 07:23:30 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C949C061755;
        Sun, 20 Sep 2020 04:23:30 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d9so6545489pfd.3;
        Sun, 20 Sep 2020 04:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rBsdTiTbpyOmMgOvP3FrhuqYxd42+28jQIlyRSG6IGE=;
        b=G8gfezd48gHhUM6uExvGjTLu4NYtMNICyiZyQB912p7OvgEiRAYJJraKTb4TWVcjke
         ze6r205KKkLSuTYcSEEeumS0dWCdE7B7MozQI2+U8NxyzdlEbLp+GO2D0VpkQ6IJC6B3
         3/CLNI1qWtfxB4oLvKvJlo2CenAW1xulrICI5Fds4um79Y4OESNk7qQtKOIxslLEZiuU
         0tA/h1TiglhoQIv1wZyDPBYuYG2eT9N+VZ41s9gKdZ9DtdRjFLxY1IyMEJVRWBCUrQXy
         VyDl5+B6d2Y/OYO5zNWbHtqZkGmukpH7lFG96rDErYDtnERbq8YBK2iBUtFm8eewLnD4
         cvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rBsdTiTbpyOmMgOvP3FrhuqYxd42+28jQIlyRSG6IGE=;
        b=aS/aig/9oooGDYhjroaU5Rt65Oc+G6n1QpgZp2AeiNdCRhjhmcBu2fjphI6NxH+8qX
         SIsPVFaDX5MKBsIZnoxtqKyuVqIAIBrkJ168e9DWfbf80+Kd0fQ/8T3PpwQTyjXSIGCC
         6krqBIG0EpsNDT9RWQDd0cUo+klvG/nf7PDAOt/sF6ToUcXaqXVYIVgXyjLe18Tjdexq
         4fKX86mfnWQFgiqZ6Ep6DjkidhFxvjVl2bOrcwnsS2kFdmZztgMTNtfFFASm9qnoWRdi
         ijB0VNketplLuVOF4pUABHJ3+D0Lf7FzFD+7jShicpPGcn5p/6cw4+w7HAMc8k1QDHbe
         Gchg==
X-Gm-Message-State: AOAM533dWTkU6KT9w1sjXXrFln9VsCF4OxVH146WmgWTccUq+4ffg8Lc
        CrKsQP2XXQDXqzlnXRp8Yq4=
X-Google-Smtp-Source: ABdhPJx/ER2okEZj50CJMSZGcIEn5Ov9bEkYk0Lenn7RpxfvdFlMr0jxQrJhgoOguXy4mdoLgWlg6A==
X-Received: by 2002:aa7:9850:0:b029:142:2501:34f0 with SMTP id n16-20020aa798500000b0290142250134f0mr23189951pfq.73.1600601009662;
        Sun, 20 Sep 2020 04:23:29 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id q190sm9362323pfc.176.2020.09.20.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 04:23:28 -0700 (PDT)
Date:   Sun, 20 Sep 2020 19:23:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 09/20] gpiolib: cdev: support edge detection for uAPI
 v2
Message-ID: <20200920112323.GC793608@sol>
References: <20200909102640.1657622-1-warthog618@gmail.com>
 <20200909102640.1657622-10-warthog618@gmail.com>
 <CAHp75VcyuPYqXTk7-yBd1dR3BitXQnz1YVkD+PuJRWVOu+1ueQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcyuPYqXTk7-yBd1dR3BitXQnz1YVkD+PuJRWVOu+1ueQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 01:39:41PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 9, 2020 at 1:33 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for edge detection to lines requested using
> > GPIO_V2_GET_LINE_IOCTL.
> >
> > The edge_detector implementation is based on the v1 lineevent
> > implementation.
> 
> ...
> 
[snip]
> > +
> > +       /*
> > +        * We may be running from a nested threaded interrupt in which case
> > +        * we didn't get the timestamp from edge_irq_handler().
> > +        */
> 
> > +       if (!line->timestamp) {
> 
> Can it be positive conditional?
> 

Not sure what you mean - switch the order of the if/else?

> > +               le.timestamp = ktime_get_ns();
> > +               if (lr->num_lines != 1)
> > +                       line->req_seqno = atomic_inc_return(&lr->seqno);
> > +       } else {
> > +               le.timestamp = line->timestamp;
> > +       }
> > +       line->timestamp = 0;
> > +
> > +       if (line->eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
> > +                            GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
> > +               int level = gpiod_get_value_cansleep(line->desc);
> > +
> > +               if (level)
> > +                       /* Emit low-to-high event */
> > +                       le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> > +               else
> > +                       /* Emit high-to-low event */
> > +                       le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
> > +       } else if (line->eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) {
> > +               /* Emit low-to-high event */
> > +               le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> > +       } else if (line->eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) {
> > +               /* Emit high-to-low event */
> > +               le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
> > +       } else {
> > +               return IRQ_NONE;
> > +       }
> > +       line->line_seqno++;
> > +       le.line_seqno = line->line_seqno;
> > +       le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
> > +       le.offset = gpio_chip_hwgpio(line->desc);
> > +
> > +       ret = kfifo_in_spinlocked_noirqsave(&lr->events, &le,
> > +                                           1, &lr->wait.lock);
> > +       if (ret)
> > +               wake_up_poll(&lr->wait, EPOLLIN);
> > +       else
> 
> > +               pr_debug_ratelimited("event FIFO is full - event dropped\n");
> 
> Oh, can we really avoid printf() in IRQ context?
> 

Even in the IRQ thread?  Would a tracepoint be preferable?

Btw, this is drawn from the v1 implmentation.

> > +
> > +static void edge_detector_stop(struct line *line)
> > +{
> 
> > +       if (line->irq) {
> > +               free_irq(line->irq, line);
> > +               line->irq = 0;
> > +       }
> 
> Perhaps
> 
> if (!line->irq)
>   return;
> 
> ?
> 

No - the function is extended in subsequent patches.  I usually make a
note of cases like this in the commentary, but missed this one.

> > +       if (!eflags)
> > +               return 0;
> > +
> > +       irq = gpiod_to_irq(line->desc);
> > +       if (irq <= 0)
> 
> > +               return -ENODEV;
> 
> Why shadowing actual error code?
> 

Another one drawn from the v1 implementation, so not sure.
gpiod_to_irq() can potentially return EINVAL, which is definitely not
appropriate to return, or ENXIO, which is actually more appropriate??

Cheers,
Kent.
