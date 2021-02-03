Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396AB30D6CB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 10:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbhBCJzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 04:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbhBCJzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 04:55:50 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEF9C061573;
        Wed,  3 Feb 2021 01:55:10 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id o7so16990157pgl.1;
        Wed, 03 Feb 2021 01:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+bo/zgaVjQeP7++vzeOAe4Vhz68x/IDfWUtflXKD340=;
        b=O6lYx4v2jphlo088w60X2hiEUW5E/zcyh633GTmFsfaT5i3JtT5bZGKEO+JmqgkcoR
         x16/HDNdVq6+5Y/pMS+FThkXRWulfkixEV51at1SueD+vP2OC4Oxo+jaGxyUvtSThho2
         0HkK4G3dYjHuD7wNvsRY7Fw9BNfgQvVfG/CsEhksnv0V4TmdpVZ/suKPOESKmapOxpFJ
         zdhOD7IKpo2pLYKFX5sZtx5HxpmrPTXNqQjtPp63C8/GZlC/AWx9b+91cHf7ZcOiSlk+
         pmqhd1YxamddduYVXrOogtItXuwa44siN0e2quXllFavSWH6bzIV/EaGKCvW3JkHg59k
         OgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+bo/zgaVjQeP7++vzeOAe4Vhz68x/IDfWUtflXKD340=;
        b=dyS5quCFnNdlvvpzvAPe8tJweIsOiosjz/1fcNjtq1dBdtbRgeMrvL/kakfUJtapyt
         Mj4bLJqI6m2wvb/UewLjRJJxK97lLjVNokRRNSXjtgS1QtDCNFNtTewX706fsbXltMT4
         sEYua94IdFjImI3jk0iPYDFZhUi+oPTUIrxVOWGjHE6TQ80QgsgWws+q3GN5KjmO4pXr
         K1mhhvUjccY5Vrksc/a/hw0SvJLznx7CfnZsZSiqx/o9od25joMVIYuExUSjkV17Mtq/
         3Cov6D530VEeBC50TNQfZCz4B23BM17PPtPzxH5iT0BtBRchz15lmRgSSIpnM8I9V+2E
         L7aw==
X-Gm-Message-State: AOAM533UfwBwD7fx4Q1gK3a5WEalSgnPC66fX96/qD6x/nYfC1we8ihS
        tMxbIMz4OW3TLYcZYlK33tS0iZpK2JSeDtqfBhc=
X-Google-Smtp-Source: ABdhPJxELw6TjyxQIIVK+eBpxR00dR7Zy9TYfwhTJoq2bK39kzfeWtfoP5QIJmXXcm7/0q3ZJfdqsSfEpedo/Np5TNw=
X-Received: by 2002:a63:e50:: with SMTP id 16mr2766950pgo.74.1612346109732;
 Wed, 03 Feb 2021 01:55:09 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
In-Reply-To: <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Feb 2021 11:54:53 +0200
Message-ID: <CAHp75VeFvwE64zX8Wu8XvMMJ6vgxAaoYpvH2rJ_FD3CCnFZNHA@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
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

On Tue, Jan 26, 2021 at 4:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/26/21 1:38 PM, Andy Shevchenko wrote:
> > Hi guys,
> >
> > This is first part of Intel MID outdated platforms removal. It's collected into
> > immutable branch with a given tag, please pull to yours subsystems.
> >
> > (All changes are tagged by the respective maintainers)

> Erm, I already have this 2 in platform-drivers-x86/for-next since you said that
> these 2 could be merged independently.
>
> Anyways I just did a test-merge and there is no conflict, so everything is ok.
>
> From my pov this looks good and I plan to merge this into platform-drivers-x86/for-next
> before the merge-window.
>
> I'm going to hold off on doing that for a bit for now in case one of the other
> subsys maintainers has any objections.

Any news on this? Have you pulled it somewhere (I don't see it in Linux next)?

-- 
With Best Regards,
Andy Shevchenko
