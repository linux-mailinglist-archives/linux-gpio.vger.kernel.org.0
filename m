Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D7E3E3D23
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 01:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhHHXKj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Aug 2021 19:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbhHHXKi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Aug 2021 19:10:38 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C693C061760
        for <linux-gpio@vger.kernel.org>; Sun,  8 Aug 2021 16:10:19 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso3447765pjy.5
        for <linux-gpio@vger.kernel.org>; Sun, 08 Aug 2021 16:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=buE9OT7smem/0uBqDtX2bGBwBzJPb8RjYqkei4Ibrc0=;
        b=Z6soBGy7C6b6u/HQ3ZtKpbhuFYn084HsudVc1zHNe1nuSSA9gZ49/oGen/7ad8p85u
         IRTBRpfqAkxCj6e5ibkuTjZb+9mcpTe4WuQCepMClG1ob2kQduuYEzNonufr83Sia9Xk
         H6oFwKA6dxKbRyVF6qdsZ2SlkP6CRvgxyUr7A131eOfJyWsHIvBOgFh/pF523SUMZIUH
         O+Q8ETzGmtd+dbD5FXe9943KXlQ7SWuIG5GjmDV+YR8sfyhwKEuj8Rq7W4YXkq62CQu+
         L/QbqCwNmAfNsfriTBKy8MugR0GsAkGzXiODdfm3ZX/vJ+lZquUgS1qbKm4pZ2zhllMW
         qVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=buE9OT7smem/0uBqDtX2bGBwBzJPb8RjYqkei4Ibrc0=;
        b=PXZVTgoq7cvbaHz83DYYCEEAT3aFCJJyCEhJO4Asj1UbNigPEhANNZISg5sWk34KV7
         5KaMXaEICUyZpt1MVg+TAjN3H9Br9xTsk+r9htQxEhUYLWzy5TiO/NBYFosZAe1IzyVQ
         DvHqoFxWu4cY3sM2pWw8TkCMYu+2iIRUVjqwjJwIjSS0s6btCYBf0zVDb+JWtocYPTIQ
         mFjFPSRoA4WDzOu+s3cql3driXwrT+XMJoKYDRDGJeWhJyNo2f/6oU2DMYEe858pxZpk
         dRqxa487E8HKb7IxRkedgRkzQADDutiFJdfZFNKqnAWE40VZPaDYaUObl2PWPeMbeDZ9
         kZWA==
X-Gm-Message-State: AOAM533i/OPGCoPCP/dCus/xnwUh7oY9EzKUx9NFoGGdnLbSwQr3mlnl
        jEN0suw+9KBEuCxTyzgkkdw=
X-Google-Smtp-Source: ABdhPJxYcL4yMzQjw9XJNFVpJeiK12P8SHxJsSnQJEgGzl3clafjPy4o7ivjFSX5X8NXvvQ2RWa/mA==
X-Received: by 2002:a17:902:a609:b029:12b:858e:d116 with SMTP id u9-20020a170902a609b029012b858ed116mr17941168plq.25.1628464218563;
        Sun, 08 Aug 2021 16:10:18 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id fh2sm15790190pjb.12.2021.08.08.16.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 16:10:17 -0700 (PDT)
Date:   Mon, 9 Aug 2021 07:10:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
Message-ID: <20210808231012.GA6224@sol>
References: <20210806132810.23556-1-brgl@bgdev.pl>
 <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 08, 2021 at 09:11:14PM +0200, Bartosz Golaszewski wrote:
> On Sat, Aug 7, 2021 at 10:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Aug 06, 2021 at 03:28:10PM +0200, Bartosz Golaszewski wrote:
> > > Kent suggested that we may want to add getters for the config objects in
> > > his reviews under the C++ patches. Indeed when working on Python bindings
> > > I noticed it would be useful for implementing __str__ and __repr__
> > > callbacks. In C++ too we could use them for overloading stream operators.
> > >
> > > This extends the config objects with getters. They are straightforward for
> > > the request config but for the line config, they allow to only read
> > > per-offset values that would be used if the object was used in a request
> > > at this moment. We also add getters for the output values: both taking
> > > the line offset as argument as well as ones that take the index and allow
> > > to iterate over all configured output values.
> > >
> > > The sanitization of input for the getters has subsequently been changed
> > > so that we never return invalid values. The input values are verified
> > > immediately and if an invalid value is passed, it's silently replaced
> > > by the default value for given setting.
> > >
> > > This patch also adds the reset function for the line config object - it
> > > can be used to reset all stored configuration if - for example - the
> > > config has become too complex.
> > >
> > > As this patch will be squashed into the big v2 patch anyway, I allowed
> > > myself to include some additional changes: some variable renames and
> > > other minor tweaks.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> >
> > A few minor nit-picks in the gpiod.h documentation below...
> >
> > Cheers,
> > Kent.
> >
> 
> Thanks,
> 
> With that fixed, do you think it's good to be applied?
> 

Sure.

I was also wondering if anything could be done to simplify the
structures in line-config.c, but that isn't specific to this patch.
Not having access to the offsets, or even num_lines, and doing the
allocation up-front makes it rather painful.  Especially if the most
common case is only one or two lines.
But, as long as you are happy with the external API, that is just
implementation detail that can be optimised later.

Cheers,
Kent.
