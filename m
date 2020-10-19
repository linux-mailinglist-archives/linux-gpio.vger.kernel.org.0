Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B742927DF
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 15:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgJSNGb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 09:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgJSNGb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 09:06:31 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2227C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:06:30 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id p13so10151119edi.7
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O05x5Be2QaoMSPkmjuvhtBr9jqtM7kA23N+7NRUa5+o=;
        b=xsDNNg2Mg5MUYDc+TA4Npuzhj78ixYb8BCKCrDXHLTTALfTS7S9wg91k6pWfT/wODa
         QUTOgRSTBaqJAhKo+iKdJgYJPk6CcnOdxVOsBchHO2POuUuwxPfxyktTY2PEdZSCsily
         ZuOQEWxJr7ld9BoQjQ44RPtDHuhnpu9WbBPlXAV1WcMC54FgCpdjss1vbUTscJoKplOA
         +b/BIMEaveyAtzgp/aXFEi8Pb3PfPToOfmq4HOBBUGaUirYK7mOiSUxHPsVmSPURXPqE
         92Qjiw2CVBxXhsra2KNTZwVugEWrwWkCvXZb4EZO3rDshu2eKH70AR1QG+UKhdMWfLKT
         GvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O05x5Be2QaoMSPkmjuvhtBr9jqtM7kA23N+7NRUa5+o=;
        b=Ovt7yxCe0PFh/MBushai3FMZF4ipp57ght9WORCX1MFO6aKbN+1tAj5ghq+JbXHjZR
         g4EFHjp6F/mGAyHAgIeN0cOPhi6pHe3u81CkNhcS/vDFG4CYCrVCjZw77vrg2xqTTZtM
         PXChnX/wKirr2rAsfmDV9395zwir64xo/rz1EvP+4vbWn32zmqmF4a1pMjF1d3jS+SY4
         pUZz5w9PYcBRvuHYHOcATkJD7+Sxok3/4qiYLmi43ca5nYRhnimaTb7eotUPtWjHUcrD
         Il/8OV8ezr54lFMv54Y+qS1ibLRSj7OiPaX5Ds0k8Zr/eAClPlvzYU9haJiHQp5Va0DL
         AbNQ==
X-Gm-Message-State: AOAM532qdonQq6Sc4qhXgBy2RZt3LP+1LHZ0Lx0pw9IE7igl8sKe7eRd
        6X+QQzAlRekR4Oh400RTyISbPYTWNysRfXZfrIEDHw==
X-Google-Smtp-Source: ABdhPJyWTovl0IBhodM/R35c4VGResfHVYt52nlQ1ptkBz08jv5WdUPKyX5K2+rZmC9aYOx7rXybvcG8BcVhKqwTY40=
X-Received: by 2002:aa7:d29a:: with SMTP id w26mr17479752edq.59.1603112789556;
 Mon, 19 Oct 2020 06:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201016090949.24456-1-brgl@bgdev.pl> <20201016102937.GA22245@laureti-dev>
 <CAMRc=Md1RxGiv+v27dZOSsGX4v1OEc=E-EJvd-4_8tMjgFicoA@mail.gmail.com>
 <CAMRc=MfjBai0PECzvXjLN9w_sP-ZE4QBxGL0-puow2zDKJd+Uw@mail.gmail.com> <20201019123801.GA5116@laureti-dev>
In-Reply-To: <20201019123801.GA5116@laureti-dev>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 19 Oct 2020 15:06:18 +0200
Message-ID: <CAMpxmJU0y5Zze3we-NjnLi1fCG69v38fMwvTgCe0JXGK+RxLNQ@mail.gmail.com>
Subject: Re: [libgpiod][RFC PATCH] bindings: cxx: demote the line's parent
 chip reference to a weak_ptr
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 2:38 PM Helmut Grohne <helmut.grohne@intenta.de> wrote:
>
> On Mon, Oct 19, 2020 at 02:17:49PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Oct 16, 2020 at 3:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > On Fri, Oct 16, 2020 at 12:29 PM Helmut Grohne <helmut.grohne@intenta.de> wrote:
> > > >
> > >
> > > [snip]
> > >
> > > > > +chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
> > > > > +     : _m_chip(chip_ptr)
> > > > > +{
> > > > > +
> > > > > +}
> > > > > +
> > > >
> > > > I think what happens here is that you upgrade a weak_ptr to a
> > > > shared_ptr. Wouldn't it be more natural to request a
> > > >
> > > >     ::std::shared_ptr<::gpiod_chip> &&
> > > >
> > > > here and thus make the ownership-taking more explicit? It would be done
> > > > on the caller-side and thus be more transparent. Stuffing weak_ptrs
> > > > should continue to work.
> > > >
> > >
> > > Sure, sounds good.
> > >
> >
> > After a second look - I'm not sure if this is actually better. By
> > taking weak_ptr reference as argument we benefit from implicit
> > conversion to shared_ptr via shared_ptr's constructor taking weak_ptr
> > as argument. What you propose would require us to always instantiate a
> > shared_ptr in the argument list when calling the chip's constructor
> > and makes code uglier in the end IMO.
>
> On a second look, the use of an rvalue reference is suboptimal indeed.
> The idea behind my change was this: Since chip stores a shared_ptr, it
> can as well consume one. Instead of what I proposed, it should simply
> take it by value (not rvalue):
>
>     ::std::shared_ptr<::gpiod_chip>
>
> An existing shared_ptr can be moved into the constructor and then moved
> into the member variable. Doing so allows passing a shared_ptr around
> without touching reference counts (which are prone to cache line
> bouncing). When passing it by value, the implicit conversion from
> weak_ptr should work again. Thus the caller would increase the reference
> count and the chip would merely gain ownership of the shared_ptr and
> move it around.
>
> For reference, see Scott Myers' Effective Modern C++ "Item 41: Consider
> pass by value for copyable parameters that are cheap to move and always
> copied."
>
> So yeah, it doesn't work the way I wrote initially, because I added the
> rvalue reference.
>
> Helmut

But this still forces us to do

    return chip(::std::shared_ptr<::gpiod_chip>(this->_m_owner));

instead of a much more elegant

    return chip(this->_m_owner);

in line.cpp and there's an even less elegant thing in iter.cpp. Or am
I missing something?

Bartosz
