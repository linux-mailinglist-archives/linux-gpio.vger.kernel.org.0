Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4F8278442
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 11:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgIYJnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 05:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbgIYJnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 05:43:41 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3C3C0613CE;
        Fri, 25 Sep 2020 02:43:41 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w7so2646547pfi.4;
        Fri, 25 Sep 2020 02:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kd1Z8gBTc4MyNT/1+V29FDlb/DnWMDcFmRoEHZGx92U=;
        b=usc4NeKT/Tj79PzSUQEKqMy4kSo0al9U90ujieWvMOTaH1cRRdCUiGDTkkAQZrC6Jk
         dAt2aaX+3N5/CDKs+xJbAwLYchcGsxpOIj5cKeshljgWZu+/YHdn51qzACdrlHs/lPZB
         GnowUc7yY9ywA27QTx+V4jWnjQuZVS7YUi3WBljI+UK6zOXwkHN50TWwGrpE8flpwSMr
         UIiX4NrQnJhpWYi5nqXvH6nral+FIO4Sq0e6eDEicgO1wFueBGDOGEltpw2qEKltb9Af
         CMXGntmDgb9txxuC9rI4KRLANDUUJqIGRlLGIenYlWOH6btGpWQX18oDdMq5kYqVqyx0
         AE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kd1Z8gBTc4MyNT/1+V29FDlb/DnWMDcFmRoEHZGx92U=;
        b=cOoWGyJEjkXiRCy1y+G3ECAG/0gLyDLLSBCJMJdV7iXCTkT8vm/xtGJaOq9XHBzXk2
         uUwtyujH8CE87ZmxQ4GfwWN1THkXyy+UPLxnxTF8z6FBHIkX5jG+EEsjnxq48JgBNNVa
         sccYEIO1R2qGb5MALidfXVz+hYL7nHqzzaapdgLmjV7vkDpg8EpbMTsiVYA/pNp/wMI8
         dtL4MTuo0l1ui0/FpWJZZ9AjSEJlnaP7/Ak1ZbMwBeb2Js2VY6aN7Bc/cv6b2CDSQRFo
         BGah5xYiBcGq0P3HEp1pCHL6MZ7DZZJgZoG2qE+SU9Z3vQFrQyht7WJYVWCBMRrhz109
         293A==
X-Gm-Message-State: AOAM531+Qc85Mb1/goql8QtrgmoIuNdK9FoYK0kqDf/IhCXZUof4Zo8F
        9UmhRNoCoxvwwi03inYdybdWqKCU5rZY36nxRmw=
X-Google-Smtp-Source: ABdhPJzaRbhvusZAowhup6TwX2V9lX22H6/DLbqoSKeFDQV0wHdRusUpdXnn297U6ZEa2VertdzogY8lKp+eGFmGF68=
X-Received: by 2002:a62:7b55:0:b029:13e:7367:2b2e with SMTP id
 w82-20020a627b550000b029013e73672b2emr3203381pfc.7.1601027020634; Fri, 25 Sep
 2020 02:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-13-warthog618@gmail.com>
 <CAHp75VchWpH0tH_RoewFwqk0vGfasArYTnf1dbeCiOdyqT-9MA@mail.gmail.com> <20200924074857.GB17562@sol>
In-Reply-To: <20200924074857.GB17562@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Sep 2020 12:43:22 +0300
Message-ID: <CAHp75VfUxuRTFfMOCymrfD2W3JEVC5yK1L6ZrsKeDoWpRmxn7Q@mail.gmail.com>
Subject: Re: [PATCH v9 12/20] gpiolib: cdev: support setting debounce
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 10:49 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Sep 23, 2020 at 07:27:37PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2020 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> > Shouldn't we rather return 0/1 guaranteed?
> >
> > Perhaps
> >
> >  if (active_low)
> >   return !value;
> >
> > return !!value;
> >
> > ?
> >
>
> Or just make the return value a bool?

If it's good enough.

...

> > > +       /* switch from physical level to logical - if they differ */
> > > +       if (test_bit(FLAG_ACTIVE_LOW, &line->desc->flags))
> > > +               level = !level;
> >
> > Seems to me a good candidate to have
> >
> > static inline bool convert_with_active_low_respected(desc, value)
> > {
> >   if (active_low)
> >    return !value;
> >  return !!value;
> > }

> Not sure it is worth the effort - it would only be used twice - here
> and in debounced_value() - which is only a couple of lines itself.

I'm thinking about possible candidates to use this...
gpiod_direction_output()
gpiod_get_array_value_complex()
gpiod_get_value()
gpiod_set_value_nocheck()
gpiod_get_value_cansleep()
...I stopped here...

I agree that not all of them are good to be converted (b/c few flags
being tested and it will bring inconsistency), but many deserve the
perhaps separate patch to introduce the above mentioned helper.

-- 
With Best Regards,
Andy Shevchenko
