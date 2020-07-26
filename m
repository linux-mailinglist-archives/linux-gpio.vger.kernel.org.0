Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB2822E322
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 00:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgGZWc1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 18:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgGZWc1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2020 18:32:27 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E177C0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:32:27 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id x9so15174311ljc.5
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8Uj9DqY9mbv3zlczdmjdbMvg00+ndnvIXaEDqWHCCR4=;
        b=F6FHkRMQuJKwtea1bJ86D04J6jIdi+5VWFDof7XpeNDsdXQ92aCmdj3vTMoYn/vLKB
         13bwk/jpxBKiWUm15hkg3T0pG1Z/OReA9NsZVRxitXkuHNT5pCpAeV+T9h89q7SpK03j
         YTdZzxKPmssuzWoZBUaqD0mkr7EzrmXwgg6PA137JnoODiv1wEM9vaZTbRknSHKbCx03
         IcJbd4KjZqSoFhAQWgoH4KmZJ3lELeZywZydkjEHEGapXqElJ/mJRnrl2I4uj1tAVPrr
         R8xLsCNhB6fLq+7vaRD1MlMnHQzplW5ybvgtbflvNzEgG4fx4ZK1gVuiO+bQD52QNa+7
         r9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8Uj9DqY9mbv3zlczdmjdbMvg00+ndnvIXaEDqWHCCR4=;
        b=ap+nr5Am1jO4SrZWdEJmWTSCFlGTWHUJYO6IsATlajL3BsTIQ/iXbeF2CTBBGdz8ce
         CEaKYThSCKjU6nxCEqz1tVQ7DcoidxamW4ll9Um45s9TK611viXyQaPVEBx4QUFLVAuo
         qGko7glkDcnmdEBiu0ESocUhqHa7plW8CRAnFuALfp1CW6jhrmVL9a6eHJkH9/ZQeb3b
         oksIDGo9es8yU+82mvWMDnpaW2OUkNvJ8Cmb/3MdsSH5FgKmhkhZJYpheMFBpMADXn8y
         EKPtX/TzPNd0SjFLVF67TclqFHz7AvawrpVir8EfH6RU0nkSgeJwIYsGT4F18OMJjkg6
         H/oA==
X-Gm-Message-State: AOAM5318kNr6qlHzJrpEtt9gKXPuTPVsd6Qbs2WdQRm4D1CrPCvk/m/t
        EO0zsypNct6ysMOEseNO7A1XQIdgnymEjNXHkBq0iA==
X-Google-Smtp-Source: ABdhPJw8sYQi3t1BK0+yGx3Vr8EZXHdPL7d3BpO2c9vuD8+6udJ5snlavvb2VTsG1o0tbi5iBbi4M1Im2qFdwvmx8U4=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr9244310ljj.283.1595802745456;
 Sun, 26 Jul 2020 15:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
 <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
 <190bca20-946f-52f9-64f8-8971da17d38b@inbox.ru> <CAHp75VfQdTtbiHjhBuf3czdKAgmiQeALo7CaqW36oEkSGSHUBA@mail.gmail.com>
 <20200718042548.GA43247@sol> <7a22761d-c930-3597-6bf1-c799f70a47f8@inbox.ru>
 <CAMRc=MdSMMd5SN2HeicgdHkKsBTHTB_5Cn0cYG5EPggn0Mcukg@mail.gmail.com> <20200725035203.GA8572@sol>
In-Reply-To: <20200725035203.GA8572@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jul 2020 00:32:14 +0200
Message-ID: <CACRpkda-LT9_=Qb0hcCcjDcKpzomy6nOp5pYTCA+3P4EoS5Pxg@mail.gmail.com>
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
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

Let's let this land upstream in the merge window and then we can consider
backports for performance regressions.

Yours,
Linus Walleij
