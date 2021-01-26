Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D193C30511A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 05:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239368AbhA0El4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 23:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388200AbhAZXUo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 18:20:44 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C016EC06174A;
        Tue, 26 Jan 2021 15:19:32 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id v200so249984ybe.1;
        Tue, 26 Jan 2021 15:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yG8TN3kSOy/r5C1fLciwDAgyrhAMN8G3ZSfNxn4LKwI=;
        b=JGn9UVd1WL6oLaAIgsVyZFefcVBcfaNKnNmOKOUyzbrJVYPNvDflHiTqTCWbm08KKm
         cHN3UA9Qctcy/zocpr/AYU08cR4RovIIz4JlaEWXZxBMFL7ThTcs/Xw7vAn5YKV9F6bS
         Ovrxi5Oqb0xAcSldXg7BPjJ7e8IrIwVj7lashPMbLmBoH+ir0sIVOOgNZRTTXJMWihA5
         aBH8+0LeIHQz5MZkI5ksYuuMbyMEKaAIyhlG64IipkZUPMFKbeYo+0C5IyD9IBsL+mgu
         NXmYmPsFaDDfqufP8ivVnzJswuQdVImtIfytTHJaKUTtTMsOam8GbSNJKsqKsz3Wlfh9
         WIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yG8TN3kSOy/r5C1fLciwDAgyrhAMN8G3ZSfNxn4LKwI=;
        b=VQzjlGnjwwKXGtmg6M3zPDHX9hCe0FvY+1Msdl0oVJ5vHLuE+4qGmnWBI57mXUva7y
         o2zvi+FzAv5LA0fyQ2mFNkirTYcUWFu6rtB7y5CuUU4H9/r/LFnGD1Sv3W3ipeMUgpVn
         gVl90qg9KKqVNQ3arWXLYJUM0cKycEa4WSavMk0jeUuAKupGWS1KEmrQ4RVJQ2jClT8h
         GGRhhVet7wd2XwpYaDkDGNHSiZYxluzuJ0AglniaJcwBGjTUoxFClli+Ka4hndHpGl1T
         u2kRQ3x+sNihGyWuJLyVokibcXkad+Y98a+yijURkntQVA/ThsgygVbv2L34g6aImJ/a
         FnWA==
X-Gm-Message-State: AOAM533BgN2PQxauxeOIdYNK6Ug0jpmGKfmcMDPWlukyubKw8RusOpJ5
        JvyaszjypAx1sHDpQ/44uzA0VLDYSZaaDdIuolM=
X-Google-Smtp-Source: ABdhPJzBIh/uw8fHMxIPrq4i5pm0L5Jnoe2iN2FtZdlZzW9R7RDH1coLX0c8arxTOhBav4i1zaEHR/zAQGpitgryc7o=
X-Received: by 2002:a25:9b81:: with SMTP id v1mr10594112ybo.168.1611703172052;
 Tue, 26 Jan 2021 15:19:32 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
 <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
 <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
 <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com> <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
In-Reply-To: <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Wed, 27 Jan 2021 00:19:17 +0100
Message-ID: <CAMeQTsZMK9E4=qB-Kxnt9i4RGDFRkVMAgyYSck_tmk7C7yTH2A@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
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

On Tue, Jan 26, 2021 at 9:53 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jan 26, 2021 at 8:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 1/26/21 6:14 PM, Andy Shevchenko wrote:
> > > On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
> > > <patrik.r.jakobsson@gmail.com> wrote:
> > >> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
> > >> <andy.shevchenko@gmail.com> wrote:
> > >>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> > >>> <patrik.r.jakobsson@gmail.com> wrote:
> > >>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > >>>> <andriy.shevchenko@linux.intel.com> wrote:
> > >>>>>
> > >>>>> Hi guys,
> > >>>>>
> > >>>>> This is first part of Intel MID outdated platforms removal. It's collected into
> > >>>>> immutable branch with a given tag, please pull to yours subsystems.
> > >>>>
> > >>>> Hi Andy,
> > >>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > >>>> then I should probably start looking at removing the corresponding
> > >>>> parts in GMA500.
> > >>>
> > >>> Nope. It is related to only Medfield / Clovertrail platforms.
> > >>>
> > >>> There are other (MID) platforms that may / might utilize this driver
> > >>> in the future.
> > >>
> > >> Right, there's still Oaktrail / Moorestown with hardware in the wild.
> > >
> > > Actually Moorestown had to be removed a few years ago (kernel won't
> > > boot on them anyway from that date when Alan removed support under
> > > arch/x86 for it).

Ok. I lump Moorestown and Oaktrail together since they have the same
Z6xx series CPU/GPU (GMA600). I still have a working Oaktrail device
so that support should stay in gma500.

> > >
> > > I'm talking about Merrifield and Moorefield that can utilize it and
> > > also some other platforms that are not SFI based (Cedar something...
> > > IIRC).
> >
> > Yes at least there are some 64 bit capable SoCs with GMA500 which were
> > used in NAS like devices. These NAS-es actually have a VGA output
> > (and maybe also DVI?) which is attached to the GMA500.

Yes these should be Cedarview/Cedartrail. Some of them are 64-bit and
some are 32-bit. I think it came down to if bios enabled it or not.
Cedarview comes with VGA, DVI and eDP/DP. Quite a few Cedarview
devices exist in the wild.

>
> Since you are talking about 64-bit, definitely they are *not*
> Moorestown, Medfield, Clovertrail since the mentioned never were
> 64-bit. But it would be nice to see the CPU model number to be sure.
>
> > I know people are running Fedora on these, so we should at least keep
> > these supported.
>
> Is it possible to gather the CPU model number from them? (Or at least
> the exact device/box name)

Yes, it would be interesting to know more about Clovertrail. gma500
only supports up to the Cedarview GPUs but Clovertrail might also use
a Cedarview GPU.

-Patrik
