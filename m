Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA7B30F064
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 11:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235341AbhBDKUE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 05:20:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbhBDKUC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 05:20:02 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF91BC061573;
        Thu,  4 Feb 2021 02:19:21 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id h12so3682796lfp.9;
        Thu, 04 Feb 2021 02:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DmOf9Q9nv5yl458FD7khePN/mPl2hnaoJzy3oYiWP5E=;
        b=OmVLmitCu9F1SW5JMwZRspF1QF1JIqsVOL0Q1m51m3mx4equeobKFLtoOmm4eH8qwF
         i3KL3ekO2yiAt9ojoOvQ94Jx+okdT+8R8EF8YlJZwcZ/vzoxbtfFks83EKrJxkTHqqZP
         ic0IBVNuShhmWZvszxoVYhNy3kvmpJYivtlbk99dEE85LP35UPzyJ+kUPtD/EHCeTcBf
         7gbb6V51rLK07n6J3HPw3p80YYirVjeuGT8Vxd8TYCV9rOLnOCYE2g3l+rLAhBmKQYbz
         DD8Vk4phNomq+f0944uQjuz/jhmMpmlVy9g8wCnDrGvDnXbMLE3p9cYKwEo1B//xnHhV
         uDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DmOf9Q9nv5yl458FD7khePN/mPl2hnaoJzy3oYiWP5E=;
        b=O7O4907+7jH0W+I7wsCZpMUhaEfdC+XiZITaumkf0yAQdmnlxxTauaRbG0duFTL1OO
         JXrX9abXlWjO+q8gu5Wn/F6bNojPlr9QEIEEEKhFKRYZSXuXaDTPUuCYbF8UiPw6K3Ki
         VOGK8TkJzbmvJzCRcy6pfebY/XfnnkTjW61dzpf9aheG3sQvH+WUD/iJR+QsRQYu2CtL
         oc9dKZCTE4lIIxMmEGb2xIlVzqtO4Ti2TrZpXWnxrPzRZaXNottMcj2VrlpZ1cm57vkS
         KWysZAaQmVliLFpPQmcmtUmhBv/rh7kh5w2YTbKYMd9ofeJMmSkWTzmbtVbSQaaPtouh
         h3jw==
X-Gm-Message-State: AOAM533TxTYcWZdllZHRC+s7me1ZRQIR/lCK07UrIzxxeod9B7VFqTHb
        L/CWgdtuIc8moxXwQ4lWJzrtKwa4X1Tgep09YCk=
X-Google-Smtp-Source: ABdhPJw5OSPGCNncHxl6YjwckXPWxFeIbjOxGRJyfwUxKFr43c9oUoW+HvVFoYSnBrGyBTyq8+ax001vRqwXhsyfNIg=
X-Received: by 2002:a19:c56:: with SMTP id 83mr4507061lfm.325.1612433960442;
 Thu, 04 Feb 2021 02:19:20 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
In-Reply-To: <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Thu, 4 Feb 2021 11:19:09 +0100
Message-ID: <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
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

On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> > On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Hi guys,
> > >
> > > This is first part of Intel MID outdated platforms removal. It's collected into
> > > immutable branch with a given tag, please pull to yours subsystems.
> >
> > Hi Andy,
> > Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > then I should probably start looking at removing the corresponding
> > parts in GMA500.
>
> I have noticed new commits in DRM against GMA500 and it seems now in a
> conflict with my immutable branch. Are you sure you don't forget to
> pull it?

Hi Andy, sorry I missed pulling the immutable branch before taking the
gma500 medfield removal. I was unsure how to do that through drm-misc
and it's tools so I got sidetracked. What would be the correct way to
fix this?

-Patrik


>
> --
> With Best Regards,
> Andy Shevchenko
