Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46795304044
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 15:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390779AbhAZO23 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 09:28:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404318AbhAZO0l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 09:26:41 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE277C061A29;
        Tue, 26 Jan 2021 06:25:53 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id n25so11554477pgb.0;
        Tue, 26 Jan 2021 06:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NPSOH8Y62ukMN0OaTHNJQcHEYySsxlPH5TqLsLYLoQg=;
        b=SkFBEQRuNzx7oNacOenVNqjxOYIRojAVRIrMayGeOAl0djFSeR8oH6C199qfpE2FEG
         Ol9dnrqkN29SpK2qgA9Lc27eNLNVTDTm7wsLeBGrfoVgQ2mPQOESMbwkojG+H87p6Sw+
         BBNjxJCkN1b5aIBYXTRaAgzHHgotUpU/LQ1qqf89ihNcqH6MbBn3ldQ50AhAgf4dhF6+
         atpiPndRtmVrHzUhY2rYPoKph+N3GpQeKnyUkd12t7jHWKQ5EEXm4x+FI8XR25U++nrh
         PKtAVBXkOOA8UF5YNs/k0QMDaIqaK+nEN/YZVzewMomb4Wf/OSidoT1ppzR1f8U1d2Es
         evZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NPSOH8Y62ukMN0OaTHNJQcHEYySsxlPH5TqLsLYLoQg=;
        b=C57kn80VWt6clqJomRSg38pYOUpv1u9EcvU2sXfX7HG5ghD5bmifBY6o8erP5WYwC7
         iKrgENjjvSp9HcaQ5L5QXidYq2Szd6QRVsv6yRgSAAKNCfq0QAjh63RhjfqQ/SPzlCwn
         vkRAKoh0xzv9AzqD7EA8Uu2En261yMv0SejtqJU4gCs1B9w8/oHOQKSFS9VHYoi8IXpf
         14iRv2LJPTrc4ulMxPR9cSoSh4T+DGUi7f80ftCwqeO5JUi+Ja9Dbs+93v9rSyZas2Ql
         +omUbnN/96WlI832LCvbOj/f+ywVTiIm6N/5tjYl8DDd8k/V5MRiFtB30KZ5w2V0hYGU
         nkwg==
X-Gm-Message-State: AOAM530df4mDJsIhse+ZDvMPEGEv3BK4c/J+WJYAu27RlrrmhJTbBLfL
        L7fm2DxuSX7DDf4jsUyHSHFjcRbotviS4QMXbUw=
X-Google-Smtp-Source: ABdhPJyqWaX+Pth+W5prJc8n9EUN7utWiThsOSD+IU9DjuKJij5MhYt+nVXG/9mfOEsVcVWVJZY13r0DrIoqdfte8f8=
X-Received: by 2002:a63:e50:: with SMTP id 16mr5867228pgo.74.1611671153433;
 Tue, 26 Jan 2021 06:25:53 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
In-Reply-To: <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 26 Jan 2021 16:26:42 +0200
Message-ID: <CAHp75Vde=dN-9dj2d9pxNeg1ODzp6tV0truHPtHJycbjWA=akQ@mail.gmail.com>
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
>
> Hi,
>
> On 1/26/21 1:38 PM, Andy Shevchenko wrote:
> > Hi guys,
> >
> > This is first part of Intel MID outdated platforms removal. It's collected into
> > immutable branch with a given tag, please pull to yours subsystems.
> >
> > (All changes are tagged by the respective maintainers)

...

> >       platform/x86: intel_mid_thermal: Remove driver for deprecated platform
> >       platform/x86: intel_mid_powerbtn: Remove driver for deprecated platform
>
> Erm, I already have this 2 in platform-drivers-x86/for-next since you said that
> these 2 could be merged independently.

Yes, you may merge this on top, shouldn't be any conflicts.
But this mail originally was sent a couple of days ago, I had a
problem with my email setup.

> Anyways I just did a test-merge and there is no conflict, so everything is ok.

Yep. That's how it works :)

> From my pov this looks good and I plan to merge this into platform-drivers-x86/for-next
> before the merge-window.
>
> I'm going to hold off on doing that for a bit for now in case one of the other
> subsys maintainers has any objections.

Noted and thanks!

-- 
With Best Regards,
Andy Shevchenko
