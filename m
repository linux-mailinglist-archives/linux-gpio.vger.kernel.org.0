Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EAA22DE1D
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jul 2020 13:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgGZLFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 07:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgGZLFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2020 07:05:08 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E183C0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 04:05:08 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id b18so5541421ilo.12
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 04:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ps1vxDJf8BpsSh7MphmkiMDb0xKy3f0zZPufJ2cosqQ=;
        b=ePhIwyXmqCAJ2wLxdtz7cTfIyCFZ0HOXBTz7PaGEvdHH0TK484bDRSN66Mel/aW4jP
         l2ruqItqgdJ2p0uLmO1rlHTtLEmMNSY1nOubu3LsLO8Ici1B4Yg5ZGLwh+Vzm6GMTWVR
         wCPGvvZbHxUYZpkz/t7oHoDnXHPebdEoAv75imwwtp5uVm8TfpK/9IGbsWlJPUDyUXaT
         34h6Hiy8Yq1RwSXsdn/1ZA9cAHuNPEPEPa8cI7eeOvFYWR08cJN1o3VNMvJWbFJfa+Qd
         g5ITigksiKuSaxAgvPDePx1ISXOZN7j2w8+1su7jx310avO193OqmBswGRXmkQiFtoGs
         1jKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ps1vxDJf8BpsSh7MphmkiMDb0xKy3f0zZPufJ2cosqQ=;
        b=UQ4BRnq1mtvGReTeyZyBmfzrshgoLuA2bo7twQquHwF3G8IRtbBcYifuMdGzRxi4WC
         /jTdgWxlFazvyOy1cEhXdZOB+FeHRuBkhSz/fNmyF8loGLn84aFSoB/4LudVnYnMfDcF
         vV3QHAFoH94K+xf+K0HLz3xNnpHXrbVkMIzc0Rnfsj6ORjJwtys6L5MTF3dxjs6Scohz
         rbisseN2k53rUrza8c9I/5e7Wpv3AOxKBgjbk/BNtbSwHXRe06v83n3RdcHwNgYpfUNR
         2BUJV/N3ktUklKfvpGk3XQcIYYiu9lHqWwuTrdfnVbTX2ofzovOX/CPAK8Wmu1XL1npr
         nu1w==
X-Gm-Message-State: AOAM531Li9BGZEtUIUAogJkRKTsIUbm5f1NlAI1HBloRalkgDecf4KMy
        mv13BmRZPRO+jG02a0wQ54FlT0PvHSZC0aOM63ZI7mXL
X-Google-Smtp-Source: ABdhPJwADO1FrVNxEAgrP/BYSY2avm6mlAB54q78UODni6jazoKE1jihRuCg0dIchJdhHb2wVLO2oXM5XwJllC/nfBQ=
X-Received: by 2002:a92:9118:: with SMTP id t24mr6011964ild.220.1595761507767;
 Sun, 26 Jul 2020 04:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
 <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
 <190bca20-946f-52f9-64f8-8971da17d38b@inbox.ru> <CAHp75VfQdTtbiHjhBuf3czdKAgmiQeALo7CaqW36oEkSGSHUBA@mail.gmail.com>
 <20200718042548.GA43247@sol> <7a22761d-c930-3597-6bf1-c799f70a47f8@inbox.ru>
 <CAMRc=MdSMMd5SN2HeicgdHkKsBTHTB_5Cn0cYG5EPggn0Mcukg@mail.gmail.com> <20200725035203.GA8572@sol>
In-Reply-To: <20200725035203.GA8572@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 26 Jul 2020 13:04:56 +0200
Message-ID: <CAMRc=MezeYSLCMpDdfZeUteg5ZXBO_1V+8R-mnDZYXZLZ3HDDQ@mail.gmail.com>
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 5:52 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jul 24, 2020 at 09:36:03PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jul 20, 2020 at 10:14 AM Maxim Kochetkov <fido_max@inbox.ru> wr=
ote:
> > >
> > > It works fine with this patch. Thank you so much!
> > >
> > > 18.07.2020 07:25, Kent Gibson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > On Fri, Jul 17, 2020 at 06:07:04PM +0300, Andy Shevchenko wrote:
> > > >> On Fri, Jul 17, 2020 at 5:17 PM Maxim Kochetkov <fido_max@inbox.ru=
> wrote:
> > > >>>
> > > >>> I need a small userspace program to do some GPIO magic to communi=
cate
> > > >>> other hardware like devmem. This program takes about 2,5 seconds =
just to
> > > >>> find GPIO lines by name.
> > > >>>
> > > >>> replacing synchronize_rcu to synchronize_rcu_expedited in
> > > >>> atomic_notifier_chain_unregister gives the same boost as removing
> > > >>> synchronize_rcu
> > > >>
> > > >> Have you tried to replace an atomic notifier call with a regular o=
ne?
> > > >> IIRC it's still not clear why atomic is used there.
> > > >>
> > > >
> > > > Indeed, I recently submitted a patch to switch the
> > > > atomic_notifier_call_chain to blocking_notifier_call_chain, as some=
 of
> > > > the chained calls can sleep.
> > > > Not sure if that is related, or if the change would make this case =
better
> > > > or worse, but it would be interesting to find out.
> > > > The patch is in the current gpio/devel, btw.
> > > >
> > > > Cheers,
> > > > Kent.
> > > >
> >
> > Linus,
> >
> > I think we should consider submitting this patch for stable then
> > because this slow-down was affects previously existing use-cases.
> >
>
> That patch is post the cdev split, so it certainly wont apply to an
> older kernel.  I'm happy to backport it if you need it - just
> nominate the branch you want it for.
>
> Cheers,
> Kent.

Linus' devel branch is fine - I haven't picked up new patches in past weeks=
.

Bartosz
