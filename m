Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081FC292719
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 14:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgJSMSF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 08:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgJSMSC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 08:18:02 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601F8C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 05:18:01 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id b15so8774653iod.13
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JKG+vaApyASZneDun7CxhWb6zKPfMkm8Cjo4oPIcdoI=;
        b=IPkgqFPuZuC5ZjqM5i8p6FyGPSRT8Q8ZZi0gjO0XFcgkgFKNnuWyq4FDzBMbfz3DVV
         q8G7MMI9tKtFDa+3IY7FkeLxqIWaouM91kX4ut8mAkzA6I7stViM2d6DtNTX2BL+lwet
         oof6xmYhCotIn4O6e3y3AirV16gaW2WttdsiPBhDjuStHrOBQRx5ejRaVvOE2pJjkHIx
         D+U2fBPxK49IWxJR/omdG5hJBDQAsti3keCX7Q7P9//vp1UoT21cdAbfhpWu2uyW1Hnt
         d7CuR3vfNVPWK98rZtvIGkNil+MCdyKOys2UJbBYl8MI7vTq2UgvKkEmnwdbtzdPpCiA
         OH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JKG+vaApyASZneDun7CxhWb6zKPfMkm8Cjo4oPIcdoI=;
        b=P9/yu2Cc1zEuL4Jkg6tHEmibCEsaavjwaS4TeEDfdmU4leAXNWP2zJs+/EcD8M7AyZ
         im80oJ3tk62IkWq4IpGeAlItzECBKG6fC1PycJUFhqldTEDx83DLMHe684Vsi1kRMwmV
         t3VRpGUgWpdsSTXTgIa9yzu+GkRTzD8Y+9kIT8j6PWiBdwhSgns+a4TxAG9qIRnDv9gL
         M8+ogUk8+KEi1u+/Dp+FbPqdJ1G/RqIFawfh84eFvQulRReVYyAcNTQAnJS7/YZnPna0
         IRiqD8FMl8arZ+8h9GUfpFsB4OET7c1hpJB6ppxVDSSuV3cxh/jWsf5xGUiTD33KWHuV
         T43Q==
X-Gm-Message-State: AOAM531mn/ClJv2Xlojyr4y4cwF/edYANgs1SHO1ug1Hc0GgzUQZ5vfP
        RBjoxqDwMTC/yrAOaK3gpU2SYabpQjIQ2p9UR08v+JTTeV4=
X-Google-Smtp-Source: ABdhPJw7SMr1xZGMXZN8PSbhw+WEVK4t+nbgIMljAEVl67dV0DNHvV4FoARMclkUfe2u7jgJt2BrV/3v09NPIXQVDpw=
X-Received: by 2002:a6b:8bd7:: with SMTP id n206mr10210379iod.13.1603109880833;
 Mon, 19 Oct 2020 05:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201016090949.24456-1-brgl@bgdev.pl> <20201016102937.GA22245@laureti-dev>
 <CAMRc=Md1RxGiv+v27dZOSsGX4v1OEc=E-EJvd-4_8tMjgFicoA@mail.gmail.com>
In-Reply-To: <CAMRc=Md1RxGiv+v27dZOSsGX4v1OEc=E-EJvd-4_8tMjgFicoA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 19 Oct 2020 14:17:49 +0200
Message-ID: <CAMRc=MfjBai0PECzvXjLN9w_sP-ZE4QBxGL0-puow2zDKJd+Uw@mail.gmail.com>
Subject: Re: [libgpiod][RFC PATCH] bindings: cxx: demote the line's parent
 chip reference to a weak_ptr
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 3:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Oct 16, 2020 at 12:29 PM Helmut Grohne <helmut.grohne@intenta.de> wrote:
> >
>
> [snip]
>
> > > +chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
> > > +     : _m_chip(chip_ptr)
> > > +{
> > > +
> > > +}
> > > +
> >
> > I think what happens here is that you upgrade a weak_ptr to a
> > shared_ptr. Wouldn't it be more natural to request a
> >
> >     ::std::shared_ptr<::gpiod_chip> &&
> >
> > here and thus make the ownership-taking more explicit? It would be done
> > on the caller-side and thus be more transparent. Stuffing weak_ptrs
> > should continue to work.
> >
>
> Sure, sounds good.
>

After a second look - I'm not sure if this is actually better. By
taking weak_ptr reference as argument we benefit from implicit
conversion to shared_ptr via shared_ptr's constructor taking weak_ptr
as argument. What you propose would require us to always instantiate a
shared_ptr in the argument list when calling the chip's constructor
and makes code uglier in the end IMO.

Bartosz
