Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8343B3057C6
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S316754AbhAZXJ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 18:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405684AbhAZUyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 15:54:05 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9475DC0613D6;
        Tue, 26 Jan 2021 12:53:25 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id l18so2978569pji.3;
        Tue, 26 Jan 2021 12:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbiGPK10hMkVPDroKMLJ5oV5M7XFgnNXGS2BK8hWuOo=;
        b=rn/iGPtlK1tCt3ZcyGP0CCdw67MmANd7aV9K8V8aeKMW0OCHolf5rM2iIe3r4DjsNZ
         F2fnJ6AdLLZDovpjn78dQoAwggG434OjHr5DX8MOMH7+Vl/IPf5JiUKCtosaapLQlE5Y
         woQ/JsbLBBtAD/Q5HH6Xv3+NbWnByvdyZYrTsvi3vOD9YvZpTS7ffThCt9h0I79+HV+r
         b/uEZSTH2DnvGIsEOObtjToqzcJZUUYNqmjR4Yt0w2cR9OdaBdi4O9fNBq7dohr/2tLW
         zM6jUprpc/hFKn6hHnZiyRKWcD6SprVWgRYGxGKRTAmGJxOlkCdfcAsr1j89x+5wiViQ
         Khcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbiGPK10hMkVPDroKMLJ5oV5M7XFgnNXGS2BK8hWuOo=;
        b=i6tyKPLyzcFEQCADGpTP9onWXOFToxJdTnaqtSz9UgDACTI/uSGuOgihOY3/uvlaCq
         C6WY9TrSwzFPPPTKq2et4Cwn10qsN8v6JySdq/7+7D/GcpL/t1qMIxUmzDNYXXBQaJAD
         BLvi6x7bGtwrvLdbHkCbDU98XV3ucxlf/KeIPNuaY1zWO9QPjOPxdllLZHNIS7eqlC+y
         zXhZ9Csn97v6cUC8XBfBdgnzm5aXxuxxZ8fJlpNLbZsNg13S2ErYN2zwngnHMYFfuh50
         Yvudm/L78JCSkXmHaUJRebJGWjoaUL6DAAI5ztXkAYOcfbNwAxWKG8ExxSWnfOO9kFd2
         iZpg==
X-Gm-Message-State: AOAM533WckD9vDEuUTFdCPObqFgRL9IA8vNrWmdLy6u0ws8DJGvJQZyA
        m+LBVMdmypfB+W4WvYOiUK3aUmlmwxSk///yLDc=
X-Google-Smtp-Source: ABdhPJwJydNn/+NYM8T4H1FZKTUZv+sFSaTn9sxHcmr1VIRqWPJz3yxipJEpIX89bzwIqva5/GylV4FLSr9ScI9Y40k=
X-Received: by 2002:a17:90a:ca98:: with SMTP id y24mr1713563pjt.181.1611694405124;
 Tue, 26 Jan 2021 12:53:25 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
 <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
 <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com> <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com>
In-Reply-To: <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 26 Jan 2021 22:54:14 +0200
Message-ID: <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 8:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/26/21 6:14 PM, Andy Shevchenko wrote:
> > On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> >> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:
> >>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> >>> <patrik.r.jakobsson@gmail.com> wrote:
> >>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> >>>> <andriy.shevchenko@linux.intel.com> wrote:
> >>>>>
> >>>>> Hi guys,
> >>>>>
> >>>>> This is first part of Intel MID outdated platforms removal. It's collected into
> >>>>> immutable branch with a given tag, please pull to yours subsystems.
> >>>>
> >>>> Hi Andy,
> >>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> >>>> then I should probably start looking at removing the corresponding
> >>>> parts in GMA500.
> >>>
> >>> Nope. It is related to only Medfield / Clovertrail platforms.
> >>>
> >>> There are other (MID) platforms that may / might utilize this driver
> >>> in the future.
> >>
> >> Right, there's still Oaktrail / Moorestown with hardware in the wild.
> >
> > Actually Moorestown had to be removed a few years ago (kernel won't
> > boot on them anyway from that date when Alan removed support under
> > arch/x86 for it).
> >
> > I'm talking about Merrifield and Moorefield that can utilize it and
> > also some other platforms that are not SFI based (Cedar something...
> > IIRC).
>
> Yes at least there are some 64 bit capable SoCs with GMA500 which were
> used in NAS like devices. These NAS-es actually have a VGA output
> (and maybe also DVI?) which is attached to the GMA500.

Since you are talking about 64-bit, definitely they are *not*
Moorestown, Medfield, Clovertrail since the mentioned never were
64-bit. But it would be nice to see the CPU model number to be sure.

> I know people are running Fedora on these, so we should at least keep
> these supported.

Is it possible to gather the CPU model number from them? (Or at least
the exact device/box name)

-- 
With Best Regards,
Andy Shevchenko
