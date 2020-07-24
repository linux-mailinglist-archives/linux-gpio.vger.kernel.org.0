Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48EE22CEB9
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 21:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgGXTgP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 15:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgGXTgO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 15:36:14 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4B7C0619D3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 12:36:14 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id k23so10897288iom.10
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 12:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4b2ky/jjyuJcael1tFMR6VIbTe7MvSnV90a7pmAAqcU=;
        b=hmdvfDuy8IaeFgp3WiBi7T0SslwLYT8K4F77LJSRacY08OJ/A/Bd+p+5Eqed2S51kT
         L6TIrztiX/pa0XslDIGyky8BhQ7yUh6do22t7pEJj7HwYdHMl3Tqprvu8AkI0IbAL7Qh
         G0GmqQ0ppo9iV9Dx9r3i5cjT+jLkFAwDkoRz6oVei3hQh6XqVhi6ej7C95cLxOs3DAAu
         Fi+q16LVzX2b2AF2/HuIOREJjM4mHY179mG6sTwQZ8uhCBiksUYHRU/1jDbFbT7Awcd/
         WKM1EhW/KYFcDsol/45LDXXVMZKSetZ3qL6mkXyCI8am9yZ/pR6oJPcStvU1W2fdNOwH
         6HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4b2ky/jjyuJcael1tFMR6VIbTe7MvSnV90a7pmAAqcU=;
        b=qDPL2vesQ+FlAo4W/bTUaI0yy95NM3VnuF9cgDOmHrKtOyIzdqX6p4l5yuaVpYk/NY
         NBJRQa2YPRFiV1t8xct4zocKJ2dO3l3FAfB3i1EXLBLXaGYkJTNvDq7lPe6Age81pUNs
         wSRkdRGN/mV4HSfV8fPapvWspgG1GL+czUXDgB/1cqwZ7dBaeldwKy7ZrNlnPMRlF2fR
         ewpUnWel028fRxuN04A9ZcCahKHerMAbj0Q5NacJSaId9oJYxvaUZgZ4Ul3CIZgDBkAv
         OhOiIYFyqVtytyyFaDZM1UFWlGs0KTM51BV2yWpzt7m0jLdFG4tPBWI4/e8oh+58To4T
         1VNw==
X-Gm-Message-State: AOAM530p9yPK6CU9wIxHCukGpybVys/JCzv5nLmXi3oFP4tQ13THB1wU
        HpfrRyh6TRRXOEVKwoTs/Qcm9vOMf0nRvNbg1ig+KQ==
X-Google-Smtp-Source: ABdhPJzWHxfBHhDyYxzJImEu08AMLSxp0dqm+02czHLGKYhTpQcVYMeSq5wn0tQuirndX1Z1bgP1fvTyNgpwbICa8U0=
X-Received: by 2002:a6b:5c0a:: with SMTP id z10mr11838746ioh.131.1595619374052;
 Fri, 24 Jul 2020 12:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
 <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
 <190bca20-946f-52f9-64f8-8971da17d38b@inbox.ru> <CAHp75VfQdTtbiHjhBuf3czdKAgmiQeALo7CaqW36oEkSGSHUBA@mail.gmail.com>
 <20200718042548.GA43247@sol> <7a22761d-c930-3597-6bf1-c799f70a47f8@inbox.ru>
In-Reply-To: <7a22761d-c930-3597-6bf1-c799f70a47f8@inbox.ru>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 24 Jul 2020 21:36:03 +0200
Message-ID: <CAMRc=MdSMMd5SN2HeicgdHkKsBTHTB_5Cn0cYG5EPggn0Mcukg@mail.gmail.com>
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
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

On Mon, Jul 20, 2020 at 10:14 AM Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
> It works fine with this patch. Thank you so much!
>
> 18.07.2020 07:25, Kent Gibson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jul 17, 2020 at 06:07:04PM +0300, Andy Shevchenko wrote:
> >> On Fri, Jul 17, 2020 at 5:17 PM Maxim Kochetkov <fido_max@inbox.ru> wr=
ote:
> >>>
> >>> I need a small userspace program to do some GPIO magic to communicate
> >>> other hardware like devmem. This program takes about 2,5 seconds just=
 to
> >>> find GPIO lines by name.
> >>>
> >>> replacing synchronize_rcu to synchronize_rcu_expedited in
> >>> atomic_notifier_chain_unregister gives the same boost as removing
> >>> synchronize_rcu
> >>
> >> Have you tried to replace an atomic notifier call with a regular one?
> >> IIRC it's still not clear why atomic is used there.
> >>
> >
> > Indeed, I recently submitted a patch to switch the
> > atomic_notifier_call_chain to blocking_notifier_call_chain, as some of
> > the chained calls can sleep.
> > Not sure if that is related, or if the change would make this case bett=
er
> > or worse, but it would be interesting to find out.
> > The patch is in the current gpio/devel, btw.
> >
> > Cheers,
> > Kent.
> >

Linus,

I think we should consider submitting this patch for stable then
because this slow-down was affects previously existing use-cases.

Bartosz
