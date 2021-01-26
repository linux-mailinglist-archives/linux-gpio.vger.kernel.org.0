Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752A8304303
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 16:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392769AbhAZPvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 10:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392031AbhAZPvn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 10:51:43 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB4DC061D73;
        Tue, 26 Jan 2021 07:51:02 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id j21so5383821pls.7;
        Tue, 26 Jan 2021 07:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1wIxfZ2pa94U6ERVc2TBu1sPL7/ZYPSJAmu9tbJ7iw=;
        b=fInUUBW/u2yZkKQ9i4u1tJ4c+stOkTJCJtSFcDLZ7m/xs9cZT542Eb2J5XlAOl8xPv
         DtHadV5tMMfxNK6aBMVjHNggIwvNKjBxXQJORTHKRarKVjBMRj4aZ2ZFbdCSu6m/QBiJ
         8WEOou3Sj7ixxzifYtQN/LX5gb98Of28SIfvk8keig14TyEK02m0ZM9sX5KjF+raFYRX
         i9zNWhK5pY/8Qa/Ywd0D5gQzpd6FaQMM6bM69oPwHXiDxOmf7yaNaO9ibFdCQIUWeb70
         PLaqHLpZ9cFYa9GvvdBBgHTZw2e6bySE0pNTApwJTaDkDEd/egu/gBGsb12p/44eYqRY
         gXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1wIxfZ2pa94U6ERVc2TBu1sPL7/ZYPSJAmu9tbJ7iw=;
        b=aSwpLjMzOaZSydQoU2DoupjjU74RYSVy1ktDdvMSO1Sfs1NI/X1Z3TFIg9Erx24gm7
         zdbtfXkgSBvn3I3lKzhnzEyjPkVj52y3byefejl7966VcU4vc+QXeqdH+hi6fZQNr7fK
         nXwfRfYSFsejYhBMcnuVLQpi/L66W2iRlr5mKnOeTgeGFbPcxgVO4pcWP9euL1xC6kRt
         GOT1SAIwTuAcwB+G1njOvgIKmkGty2wOHJFlyZcD8YnhUw4kpfEc+9eE0zVZ6ECqXKHY
         3hDjArDs2EWPUmpdjdSEk97mwyH3QGIjfKc6ZH/F3oAPcFKeZ/u8t6CIWX380J0CDy8e
         K4Lw==
X-Gm-Message-State: AOAM5301zX7du/pS4/x3rKYYBd38IsiR+09z88mJoG9zQdXLIXymw84A
        D4ANM0429pG6NS33Rh+iL+pvTae+vb9tPKDZyyg=
X-Google-Smtp-Source: ABdhPJx5glss0sqleRtDBlXmNqPnxXWh5zBE4ZdTKEjL+tUMNHRV8Ts7oKcmyySbHPNP8WfNZVvgavGou2cpAroNDx4=
X-Received: by 2002:a17:90a:c84:: with SMTP id v4mr423673pja.228.1611676262312;
 Tue, 26 Jan 2021 07:51:02 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
In-Reply-To: <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 26 Jan 2021 17:51:51 +0200
Message-ID: <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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

On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Hi guys,
> >
> > This is first part of Intel MID outdated platforms removal. It's collected into
> > immutable branch with a given tag, please pull to yours subsystems.
>
> Hi Andy,
> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> then I should probably start looking at removing the corresponding
> parts in GMA500.

Nope. It is related to only Medfield / Clovertrail platforms.

There are other (MID) platforms that may / might utilize this driver
in the future.

I.o.w. we probably can remove the oldest stuff in the driver WRT above
mentioned platforms, but leave the driver for the rest.
I wouldn't be in a hurry with this though, display drivers are easy to
remove, but really hard to get back on velocity after that.

-- 
With Best Regards,
Andy Shevchenko
