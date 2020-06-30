Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938B320F12F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 11:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731888AbgF3JIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 05:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731666AbgF3JIt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 05:08:49 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12339C03E979
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 02:08:49 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id p7so8938413qvl.4
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iK9bZflbG08ihQjRVcnie/mycSORKVkiSD9rdxO2fhk=;
        b=g6H5Mkbt5DNNC4mpM8Ol5Sb2XFAAVgz7dk+QHwtFzZVZNmtS7nCKUPcrX84jfbcdBE
         bUo/rHlBN4uFQuSRpShN17WBsTptjwVuG2PZBnqmo8xAyRdilDLUY/3lfIpU4iAhaqot
         Xy9y/J6p7X0nQNFcJ+aahou+oeMcbuaSI7EfivxPYsakS5wa329R/bHCeCgoOR0ra7vr
         xkJStDT3T984WOH8KXYf+jsirAHOCixX5rRq6veMsAQ5K5xjNLkXMVQOkpS/uSirKP0u
         5schmfSp19lHLwXGCMWiW9MlF6yGg0zUDoZtN64aUyRoZpPspbkRrVL5TLjCA0YZLvyA
         JRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iK9bZflbG08ihQjRVcnie/mycSORKVkiSD9rdxO2fhk=;
        b=Ds9hSMphnlaO62nzzGCAcw4sq97y/bGFJk3j8Cu6IvaUyC4jMpzNlXXTr48zcDBoPD
         FjalYCwSw1AZgoLx0Kbx9FEQi0LOyx+9IE64ZchNDL+60mlhjgnnEc48jslGs0f57JiY
         KF4muqgaCHNoW+rtrOttRM35v3NIMhQyf7x2OcNojDvnUyOCiZxNAKfNuYfogsXeI3Aj
         jk+s2jQe48IjrJ2Gce8X2Ca16TyLnzCO/MmZUEYJLCgilUOjInEuMzBdTrcgww5s2c5T
         ROdxdvRfxGn8ezQZPmQobBg+cQArmmsjjhs168HdAbAgiqMWVL7ybKQQ/uHEwC/cmuY3
         0dqg==
X-Gm-Message-State: AOAM532nZMNuDdr4nnxHkPfUU8rD3FaNMcNmcZvSJOoBo6W08+WKUb2/
        wTVW3u081o8op8A87DUUweANFaz4/HCeK/TG7UrBUw==
X-Google-Smtp-Source: ABdhPJwkBKiwHoQTkPDwgHkZOpEnSHjYxqckozTuh5xOgGjTCbFXW4/OwVL4K9CtiMFwbAzSCK7mZVJT+JVxeCNGWvE=
X-Received: by 2002:a0c:bd15:: with SMTP id m21mr19505914qvg.61.1593508128336;
 Tue, 30 Jun 2020 02:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-9-warthog618@gmail.com>
 <CAMpxmJVbiH9mh2c8aAS+GG9a76w9c0Nrrv-VDVhpo+wSyQ2NeQ@mail.gmail.com>
 <20200624140806.GA7569@sol> <CAMpxmJXbzFvR9h4fXvCwDMz4t6N16o2Y88K94aPwu6MFuCzqrg@mail.gmail.com>
 <20200625100126.GA18788@sol>
In-Reply-To: <20200625100126.GA18788@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 30 Jun 2020 11:08:37 +0200
Message-ID: <CAMpxmJXbp_JYg8pX6StMy3578O4MZuatDTd-Ki6ydVY8u32+fw@mail.gmail.com>
Subject: Re: [PATCH 08/22] gpiolib: cdev: complete the irq/thread timestamp handshake
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 12:01 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Jun 25, 2020 at 11:44:30AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jun 24, 2020 at 4:08 PM Kent Gibson <warthog618@gmail.com> wrot=
e:
> > >
> > > On Wed, Jun 24, 2020 at 04:00:42PM +0200, Bartosz Golaszewski wrote:
> > > > wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> [ snip ]
> > >
> > > I'm not totally sure myself, as my understanding of how interrupts ar=
e
> > > shared in the kernel is pretty sketchy, but my concern is that if we
> > > are sharing the irq then whoever we are sharing with may release the =
irq
> > > and we go from nested to unnested.  Or vice versa.  Not sure if that =
is
> > > valid, but that was my concern, and it seemed like a minor change to
> > > cover it just in case.
> > >
> >
> > It's my understanding that a shared interrupt must be explicitly
> > requested as shared by all previous users or request_irq() will fail.
> > In this case: we call request_threaded_irq() without the IRQF_SHARED
> > flag so it's never a shared interrupt. Even if someone previously
> > requested it as shared - our call will simply fail.
> >
>
> OK.  Is there a reason not to share the interrupt?
>

If nobody requested this yet, I'd say: let's not touch it. :)

In theory, we check if the line state changed so we should be fine but
in practice this sounds like a can of worms. That being said: I don't
have a reason not to do it. Just a feeling.

> > I still think that resetting the timestamp is fine because it's not
> > being set to 0 in hardirq context. We just need a different
> > explanation.
> >
>
> Or just drop it?

Yes, I think dropping this patch for now is fine.

Bart
