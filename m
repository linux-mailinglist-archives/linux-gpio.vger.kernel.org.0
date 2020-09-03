Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6055E25BE79
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 11:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgICJb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 05:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgICJb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 05:31:26 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D73BC061244;
        Thu,  3 Sep 2020 02:31:26 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u20so1874336pfn.0;
        Thu, 03 Sep 2020 02:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+sd9erymWD13Cu188GljsOgb+/pwjw6f4RPyPst8OkY=;
        b=J/OxbLk24+mWs+zAdfKaJvLOQ/2cBymrYF8hpD4EbkzEsMAD5eZQv6+g2I1UcC4tjL
         OQtWr/BkAtnRpcx2YvcbZcdYMP3Q4vQgJ7Vt9CN8G4h93rqrprc16hutf82PaTl9SPpC
         MDw7cdmI2V4dV6SD11qKcESfhzmc5Ae4OGqiWqD6wied1AG9KPcTxoLFvZm6jM1jJQA+
         qhpcJEvTOjOttnuLxEBKPnEL2KPS9lieYo3PsREIP3SoN2EcS2nH9RrhSwkZNJ6MD6hv
         hpk9kIIVPwGdrjluOubDR4X7yWL4JNxOGutUSXOfo8mWYlpJzVXShrXGFHRlPygpm8Td
         E+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+sd9erymWD13Cu188GljsOgb+/pwjw6f4RPyPst8OkY=;
        b=sRii/9jz8v1GQITUS9qtXsUxBXkoBLTOItQt8liKYodf8XdtR1lEeDymGFv1eMh7lH
         JnJFU1NkXeM6LfWxAVdMHUnDwRnvaa4kdCocWl5u0+U6doA2wEx6Qctl5OfLbLu6jep2
         pY620OnKQzityVVqZd5je1B7XbGvx4EYq84mQdhoTZb2BJcdDPeH//X4IsfeJvJ0cP17
         bgrgoNu20NRmonhFzk/+ntZeEXMpw2DA6ku/rluAZ3XPvOoHtTq7dm/vSdfL4smbKC17
         tdgmBfK/SW/IOy0Yr2NOOnbRftTUPl5r7OjBEIM7jlf3lJNlSONT1Pay+iZmWUKj/nv3
         dgkg==
X-Gm-Message-State: AOAM530u/Djv34h+D+7Bplx83INfcZ3salDYOinYlhoxxQXZ7xa1CEsR
        gqbD6kqHbqqBhhO4P2NmbK9kOn1bISo=
X-Google-Smtp-Source: ABdhPJwgnRZElPmZmJR5LdkBVJrAiBtK8Op8FIRVjeAuifsDebTsFbK6LvC4WS6a/BKY9P8woy4Rwg==
X-Received: by 2002:a62:7fd1:: with SMTP id a200mr2964557pfd.175.1599125485626;
        Thu, 03 Sep 2020 02:31:25 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id d1sm1873301pjs.17.2020.09.03.02.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 02:31:24 -0700 (PDT)
Date:   Thu, 3 Sep 2020 17:31:20 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 11/20] gpiolib: cdev: support
 GPIO_V2_LINE_SET_VALUES_IOCTL
Message-ID: <20200903093120.GA160697@sol>
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <20200831032006.1019978-12-warthog618@gmail.com>
 <CAMpxmJWYpDQsvKCsNudb6p3zAey=6EuNpb3wQ3dpCJVCTjjBsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWYpDQsvKCsNudb6p3zAey=6EuNpb3wQ3dpCJVCTjjBsg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 03, 2020 at 09:59:17AM +0200, Bartosz Golaszewski wrote:
> On Mon, Aug 31, 2020 at 5:23 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  drivers/gpio/gpiolib-cdev.c | 59 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index 936b8c9958dd..9f05bbd2161e 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -777,6 +777,63 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
> >         return 0;
> >  }
> >
> > +static long linereq_set_values_unlocked(struct linereq *lr,
> > +                                       struct gpio_v2_line_values *lv)
> > +{
> > +       DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> > +       struct gpio_desc **descs;
> > +       unsigned int i, didx, num_set;
> > +       int ret;
> > +
> > +       bitmap_zero(vals, GPIO_V2_LINES_MAX);
> > +       for (num_set = 0, i = 0; i < lr->num_lines; i++) {
> > +               if (lv->mask & BIT_ULL(i)) {
> > +                       if (!test_bit(FLAG_IS_OUT, &lr->lines[i].desc->flags))
> > +                               return -EPERM;
> > +                       if (lv->bits & BIT_ULL(i))
> > +                               __set_bit(num_set, vals);
> > +                       num_set++;
> > +                       descs = &lr->lines[i].desc;
> > +               }
> > +       }
> > +       if (num_set == 0)
> > +               return -EINVAL;
> > +
> > +       if (num_set != 1) {
> > +               /* build compacted desc array and values */
> > +               descs = kmalloc_array(num_set, sizeof(*descs), GFP_KERNEL);
> 
> Missing retval check.
> 

Arrgh, that has been there since PATCH v2!
And subsequently got propagated into patch 07 :-(.

Kent.
