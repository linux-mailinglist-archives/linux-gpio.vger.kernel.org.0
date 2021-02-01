Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FCF30B2B0
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 23:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhBAWTm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 17:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhBAWTl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 17:19:41 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825ABC06174A
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 14:19:00 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id c18so21627405ljd.9
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 14:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JoOcOIp9pmqrp1qTioUKGADrTN/MPY8QRHwxSL1dWME=;
        b=mwwZbRqIq8Hcb+1h/XSg+kPG6q81pRWM8dTT18sEWfxNYmnw2/jhQoSR/kO/m39EqP
         Ylh43BdjxKoY/iVdYdlnBWEujuFAnh+mEtVlzRGwEj4O/PC7wPJc+5bZDcKlZuVLWN2v
         +KrL43zpQLHSiZMc9rdBqH0WzRMU0/rA5JTprLylEZPOV0Wpxqs3vGPLChKsSg/B92tN
         jfdYD2swvZbgvMxuLiOdi8i0p0RsgDFzh0eMBqyQ6Ci+StGa4UsGngmDwfEgkdeViSpR
         fEbsblQ1a9TDaXEY8T89V8w/AkI/LTfnV5D7utjjDaZWQlMIPaTl2HSCwAKLO7E6UuSU
         Ai7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JoOcOIp9pmqrp1qTioUKGADrTN/MPY8QRHwxSL1dWME=;
        b=ckomaEGPE3AC0RVQCyxjPm77gUDD8s6f08Me/PrUySLZVmRPngg5Tzg4b9vyRyCqe1
         P+dApjKHTjo2Apmt+6wEN/iQyMHbHuq++GLWj92m+2Ca7m9At9E7RzeDOZeGaGMRDv6L
         oKum7QphTCaBJKARLEw6rAolHm04MKRQ6BmT5W4rySjjwFHmlG2lZ4DH7QmyiDrVOA3r
         5G4LxNNChQxluN98KHcLpE8/+neJ4eq0icn9OFNceXMFqqYD5fkZ//6TvetlN8Lhn/Zt
         jjmEq6suUVD36jy3aOBnYPqen2EgCZsyqU24BKwBs6zCEuGPZJXZ3STYuYzKYovA8R2g
         AvdA==
X-Gm-Message-State: AOAM53006IAi3o0/XV/k5JcSIJ5gcLrqV79I6475yuoX9843GwoDgy+b
        tIWAjFLJ9L+4GfIr3PRFJPAVWeL/nafdE2djTwjVRg==
X-Google-Smtp-Source: ABdhPJwRklxnAxEoSAqER14OWeL4bolZvN8fDvJFrKp45Cr7zVMecgwvlYGDXTZMgdnRvD99CMSW7TgpgGhfN1zdO7E=
X-Received: by 2002:a2e:9ec3:: with SMTP id h3mr11318983ljk.200.1612217939017;
 Mon, 01 Feb 2021 14:18:59 -0800 (PST)
MIME-Version: 1.0
References: <YBAd2HT9LFIugxEo@black.fi.intel.com> <CACRpkdb149uAwygJHEvwnjMPp=zXNTGTuf0HziE47CHXAGrQew@mail.gmail.com>
 <CAHp75Vd-_FnA+-f7+BDS3zV2kEaAGCb32A3Si02FnLDXuG=AoQ@mail.gmail.com>
In-Reply-To: <CAHp75Vd-_FnA+-f7+BDS3zV2kEaAGCb32A3Si02FnLDXuG=AoQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 1 Feb 2021 23:18:48 +0100
Message-ID: <CACRpkdYxvORq4isDPG65=_5HHiHbrGm7anPgNKKxyyrn5A+-dg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.12-1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 4:53 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Jan 26, 2021 at 4:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Jan 26, 2021 at 2:49 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:
> > >
> > >   Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)
> > >
> > > are available in the Git repository at:
> > >
> > >   git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.12-1
> > >
> > > for you to fetch changes up to 0e793a4e283487378e9a5b7db37bc1781bc72fd7:
> > >
> > >   pinctrl: tigerlake: Add Alder Lake-P ACPI ID (2021-01-08 16:04:50 +0200)
> >
> > Thanks Andy, I merged in v5.11-rc2 and then pulled this on top!
>
> JFYI: when you merge a branch that has been based on newer rc you
> don't need to merge that rc first.

True, it just gives me a feeling of understanding how the merges go when
I do that, so I see there was first a really large diffstat "hm what is that..
hmm seems to be based on -rc2 and my stuff is on -rc, OK I merge -rc2
and voila OK the diffstat is small, now I understand the merges".

Just my little dance to convince myself that I'm doing the right thing.

Yours,
Linus Walleij
