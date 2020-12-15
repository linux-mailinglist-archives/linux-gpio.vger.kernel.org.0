Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBDC2DAA6B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 10:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgLOJtK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 04:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728492AbgLOJtD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 04:49:03 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EF4C0617A6;
        Tue, 15 Dec 2020 01:48:17 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id e2so3574097plt.12;
        Tue, 15 Dec 2020 01:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ffzwJt/+wBy6lMGtbT+qsUuCwVx4/Ps6eQ4TPUtfj5w=;
        b=NyCl81bipthfEmDO/eYeBRt+b0/Ae5P/69pNipdLzoA/yv7dK/Svbq5BSszLp6Lp6R
         bkoJn4s8P1i8dT0xzPabvE5NsTaWBD7qPu6DybW6gLaId8uZ2Cp2HVCE17SfF0bRwhT6
         LSWhi1tXZ5d3q8q/3kWti2WakSfSTqvJwz2OGqlkMcklTgzW2RlcgyNe8ifsdfCaEOU6
         i+4ZUVB1mFuEvy9Kp7PR718GAZoc0S4M2Ws8bV5quGKoXfAM5gfslVgQx3pDaxE1bh8+
         VsTg7fBLBE3HMH4j9p/IXb8SJsPMqqxP/+dEvsruI0HGCwgLfYAkdQp68NK+X0ZGqqc6
         U7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ffzwJt/+wBy6lMGtbT+qsUuCwVx4/Ps6eQ4TPUtfj5w=;
        b=OlslgY0e6UaXYlWjoHd4VKc4htgKr1BmuyUbCUJQ4vmwpifhTF1UTeXiQkToPNpF8g
         GZ2lzP8uFV1AMD0atrCRJoRABMPriuiJwLkVBEp+EVaCmVqXeitBpDxcE1/lh9shUei/
         3EaQSO/7qZBzoM83DTWg3Qbsz+MtSoIW6JHsap+CiMCcafe6rk9mwzKtkdROXQbn+tkI
         HPDA1mbsBMgvp9Lm3kNvdfrfl1atuJ/lKxHhFnU3XR9FFc8BfYpVpbcCMZ+trrgnEySu
         Luw9vVM0xv24K65Oee7pqRh6w/Y7WBEQEbN6HcL1InklATc5a+cb2A4/DCJRbESDf5H3
         wtvQ==
X-Gm-Message-State: AOAM530zu0Cz4a3lMfIWbD6euy7KUzeTp6Bz2xfZOGDrs1IX7WrNtvXE
        RTGSrqpRrz4zUDVbmY+Ih4CfthbTxqT9NXpkM+I=
X-Google-Smtp-Source: ABdhPJySHOXN1RWHB588qOl3V9AjE3NZWB+6fHDU9boPEkcrRnad9e7n/RaXj70QPinD/ydGzOqPy8v8rCrdQcAdT1I=
X-Received: by 2002:a17:90b:a17:: with SMTP id gg23mr29917684pjb.129.1608025697388;
 Tue, 15 Dec 2020 01:48:17 -0800 (PST)
MIME-Version: 1.0
References: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com>
 <1607934255-52544-2-git-send-email-luojiaxing@huawei.com> <CACRpkdZSQSCO3dWcjUZtUMDK+Jjdnc9ORxpR9qiopgMk-o=Ryg@mail.gmail.com>
 <20201214165812.GL4077@smile.fi.intel.com> <CACRpkdYvBrqHZt28fyHD6F6a4ecbzvfGknpfwr8HFdtYodaYgg@mail.gmail.com>
In-Reply-To: <CACRpkdYvBrqHZt28fyHD6F6a4ecbzvfGknpfwr8HFdtYodaYgg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Dec 2020 11:49:05 +0200
Message-ID: <CAHp75VcN-_neGnO0U4eceLi40cAE5xVYe69AKy63sxZkU+WUdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Luo Jiaxing <luojiaxing@huawei.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Garry <john.garry@huawei.com>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 15, 2020 at 12:37 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Dec 14, 2020 at 5:57 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Dec 14, 2020 at 10:11:23AM +0100, Linus Walleij wrote:
> > > On Mon, Dec 14, 2020 at 9:24 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:
> > >
> > > > This GPIO driver is for HiSilicon's ARM SoC.
> > >
> > > Patch applied, any further issues can certainly be fixed in-tree.
> >
> > I just sent two :-)
>
> Thanks Andy!
>
> Actually I kind like this in a way because then you also get some
> credit for the heavy review work that you do on new drivers and
> so often go uncredited.

You are welcome!

> I'm sometimes tempted to even add "Co-developed-by" for the
> vast improvements you bring up. (Like on my YAS530 driver.)

With the CdB tag the SoB must go (per documentation) and I can't give
you the latter one for your contribution for obvious reasons. OTOH
feel free to give credit in a free form in the cover letter / commit
message if you think it's good to have.

-- 
With Best Regards,
Andy Shevchenko
