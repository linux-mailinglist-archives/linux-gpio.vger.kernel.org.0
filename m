Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B5A2A67FC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730377AbgKDPpX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbgKDPpW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:45:22 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2266CC0613D3
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 07:45:21 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id p5so30429441ejj.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 07:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=301FEJMfRdYT4JQEwH4FCOAr+TJIAAj4pMznGG/09vY=;
        b=yTvGKGoV6x5UXlNACKUXPt7LqlkEvIUpU+wRaUOh8ctU/YHUixo8o00dRbvEGX0eeU
         GMMrWgKQLx8bjgzPQ1jNRh20COiPLM4R5f4YJK8ASaKBBToLWaILqxFlCjrti2z5PPbb
         miRA8JgSYYZhZHqs4vIcEnm3u4cbnOO4zJVUytcdKErD74FLDzbHulNzR5tlOLV7wX+R
         85mwbvtaeMHR+uZjb8j6T4gTplWZ21PLhKgXHpev7I5AclnTY13Hooer5k+D3M8QASVR
         wxvjs6VIjS+ALRTgzyNbJaR7QPp9UqF/EmQw+CvlZxWj9MvdIxseqPPuZe2proKSPv5P
         6Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=301FEJMfRdYT4JQEwH4FCOAr+TJIAAj4pMznGG/09vY=;
        b=Mo47JC19Qj/hiv4cSIvedv1RRSi6jpMJOpYoS08sdV/d4/lkx7f1kh7KuqwgKJuyfL
         a2aa6rsmup8QAQOZ0CT+Nh8uiE0yCHfhiS7ZNA5fq2R2FyVzP+5cuyfJdlpCrVUWJVOA
         njOdU4uh/nwCBMabklewwWNVj2yxQjajq+unly0wdzdEjThjo452A4DzVhVSTeqQlJNq
         yG10bBfUB0ql9ayZ0WUsud88Y3Ob5kwDXesTxPq0OWDZsGCojxpAick5sppSYBJvygir
         r1mUvawsMCaxHJzhTGNtugtH2tJ+PgZZFSqn5xSB9LyS2YJBbDKRxUlquCFBz0P459iI
         b//Q==
X-Gm-Message-State: AOAM531hpD70uPwy4/G0yymUNd22VfrNHrZHaNHIWQPJl60kqoadM5Ed
        8YnITt+V1eXl+JDpBxBtt+yesF86bc4OHUAuS7ximfRbG68=
X-Google-Smtp-Source: ABdhPJyxsiKpQbjq3xhZDhp0cUNvCdePoXfZmiqB+8ekz0x1lIIkIsMOkAWxF2HhsbUzuLujXmOu1W7TqCEF/nceNPE=
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr24405072eje.363.1604504717926;
 Wed, 04 Nov 2020 07:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20201016090949.24456-1-brgl@bgdev.pl> <20201016102937.GA22245@laureti-dev>
 <CAMRc=Md1RxGiv+v27dZOSsGX4v1OEc=E-EJvd-4_8tMjgFicoA@mail.gmail.com>
 <CAMRc=MfjBai0PECzvXjLN9w_sP-ZE4QBxGL0-puow2zDKJd+Uw@mail.gmail.com>
 <20201019123801.GA5116@laureti-dev> <CAMpxmJU0y5Zze3we-NjnLi1fCG69v38fMwvTgCe0JXGK+RxLNQ@mail.gmail.com>
 <20201020055714.GA10256@laureti-dev> <CAMRc=Meo5vcCo9hoA8-nbr_f7WHLL=AP87uwAZgMRiTmxVqxBw@mail.gmail.com>
In-Reply-To: <CAMRc=Meo5vcCo9hoA8-nbr_f7WHLL=AP87uwAZgMRiTmxVqxBw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Nov 2020 16:45:07 +0100
Message-ID: <CAMpxmJU_LLQ0GqtvneOp2gSVRcajS7NwfYOD8E=un7_z7yhDTQ@mail.gmail.com>
Subject: Re: [libgpiod][RFC PATCH] bindings: cxx: demote the line's parent
 chip reference to a weak_ptr
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 20, 2020 at 8:59 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Oct 20, 2020 at 7:57 AM Helmut Grohne <helmut.grohne@intenta.de> wrote:
> >
> > On Mon, Oct 19, 2020 at 03:06:18PM +0200, Bartosz Golaszewski wrote:
> > > But this still forces us to do
> > >
> > >     return chip(::std::shared_ptr<::gpiod_chip>(this->_m_owner));
> > >
> > > instead of a much more elegant
> > >
> > >     return chip(this->_m_owner);
> > >
> > > in line.cpp and there's an even less elegant thing in iter.cpp. Or am
> > > I missing something?
> >
> > I confirm the behaviour you see. My intuition that the conversion would
> > happen implicitly was wrong.
> >
> > Still the sticking point is this: Your constructor should allow for most
> > flexibility to the caller and in this case that means it should consume
> > a shared_ptr by value.
> >
> > In order to make the case with a weak_ptr bearable, I suggest adding a
> > delegating constructor:
> >
> >     chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr) :
> >         chip(::std::shared_ptr<::gpiod_chip>(chip_ptr)) {}
> >
> > That way your desired way of calling should continue to work while not
> > forcing callers to convert a real shared_ptr to weak_ptr and back.
> >
> > Sorry for the confusion about this.
>
> This is a private constructor though and it's not meant to be exposed
> to callers of library interfaces. Only internal users will call it and
> they'll pass a weak_ptr to it alright. I really think it's fine the
> way it is now.
>
> Bartosz

I applied this for now in its current form as I want to start working
on the PImpl changes. We can tweak it later.

Bartosz
