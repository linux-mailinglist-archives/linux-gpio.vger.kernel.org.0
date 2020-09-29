Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 807D327C17B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 11:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgI2Jm4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 05:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgI2Jm4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 05:42:56 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063A0C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 02:42:56 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w2so3951624wmi.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ofBo1DHZJAYOAfdvKdc+JIzoJ7spso5qBxDDaOUD8P0=;
        b=fTyuu6u3qm+M2poqn0Gh7usMFQPyTseW+CABT/qMsrjz9vOA8ceeD4o7RmCWOO26dW
         oEaa7rL+447KXdmCLIYEt0xHiW6wdJTKY/qI1uMQxBs0Nd5zdu0trrBr1m0YFgNNt6rG
         8oGSRaxE7XwJ8CME7sbQRGm4iczVVBYCbzkuAwleDfDszVa5s/EtrWW9nrBvClGfiQpM
         KjjsFT2izPU0BbVZrdZjX8npp+iXjBHsJ3db51ZC+kXY09b9YgK7ziZgel3ZOKf/ncTe
         QjmfoEa7fSN+S1tCyKDwsN/YF7tyGjJPBAUeuQltd45vLTSOPaqTGd74EXDsdziiCEDc
         /IfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ofBo1DHZJAYOAfdvKdc+JIzoJ7spso5qBxDDaOUD8P0=;
        b=pycMFcX/jahGnHd1EBeNyxT4tZ1BFKdNzNXGUSdgCt3kYQosmPI8sr95aAUOUMMj4t
         JWNUYLwvuRpgPcj0S0pkVTBGa3XP0YU19VHYtnUEaRNtUxq9E48tOIHcGNfD7mBygJYU
         SghKULU31NvhksD4NCHUjeX67JzN5Ai/c7b6vB/uITMr37cHXOUUzL+Iq6zI9uWUftDI
         OBkPRAOMuR9c9O/CBvwJe0BQDvgekVL/EHmR47Eg88CT27nsye9K/FMBV4I/e9AAWZXH
         HPYAEa2+FfsxfS3vGCjJ0FZV6iR6qpzglnwFs7yvFaa3wZBnqJlFEkF+dtMKnDmymzsN
         uzrQ==
X-Gm-Message-State: AOAM533KZkYH57VoOxy7DMg43ZZq4sSMjtvmlg8DnugNI6NcZm1pV1pz
        3wjQhs8fT8klqtvmV07WRDpIOQofbsx3ODRLlF4oFw==
X-Google-Smtp-Source: ABdhPJy8aJk0Qe5jx6T1KNmqaPSZNL92RWZshamoYqVLfPSR/i7AzMct9OcCvBPhw+CDlfdfUemPaLx4dXCGXWCh5xA=
X-Received: by 2002:a05:600c:22d1:: with SMTP id 17mr3540326wmg.58.1601372574620;
 Tue, 29 Sep 2020 02:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200928104155.7385-1-brgl@bgdev.pl> <20200928104155.7385-2-brgl@bgdev.pl>
 <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
 <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
 <12317bbc7712d96be8f52a3bf574e47628830191.camel@perches.com>
 <3ba6779e11684ec8bc32638aa67ab952@AcuMS.aculab.com> <20200929084912.GZ3956970@smile.fi.intel.com>
In-Reply-To: <20200929084912.GZ3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 29 Sep 2020 11:42:43 +0200
Message-ID: <CAMpxmJV84C9KTj+z8+BBE2zaiMhRSRcybBO52P7VEc008Pb6yg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     David Laight <David.Laight@aculab.com>,
        Joe Perches <joe@perches.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 10:49 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 29, 2020 at 08:10:10AM +0000, David Laight wrote:
> > From: Joe Perches
> > > Sent: 28 September 2020 17:07
> > >
> > > On Mon, 2020-09-28 at 18:02 +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Sep 28, 2020 at 5:59 PM Joe Perches <joe@perches.com> wrote:
> > > > > On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > >
> > > > > > There's a common pattern of dynamically allocating an array of char
> > > > > > pointers and then also dynamically allocating each string in this
> > > > > > array. Provide a helper for freeing such a string array with one call.
> > > > >
> > > > > Isn't this also common for things like ring buffers?
> > > > > Why limit this to char *[]?
> > > > >
> > > >
> > > > I don't want to add APIs nobody is using. What do you suggest?
> > >
> > > Change the argument to void** and call it
> > >
> > > void kfree_array(void **array, int count);
> >
> > Does help, void doesn't work that way.
>
> Actually good catch. void * and void ** have a big difference in the implicit
> casting behaviour. I was stumbled over this while playing with some
> experimental stuff locally.
>

I'll keep kfree_strarray() then.

Bart
