Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49741304669
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 19:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbhAZRWr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 12:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731101AbhAZQ4k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 11:56:40 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3880EC061D7D;
        Tue, 26 Jan 2021 08:56:00 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id b26so23618682lff.9;
        Tue, 26 Jan 2021 08:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IUDDZRZxdmyV3zHbIgFV/f+pJvlpZPQNewiwbQaO6tE=;
        b=lW8J7gdCPRMweOQw8pwNhFi4aRG/l+tBBUD0aanYKeGqx5yQ1nLZ7amwTrNZHy6vU2
         V9wwSXUgUvgm4WHsgQysRp7Qdnkj7lv13RJkpJmXiHgv2vptiA6hb/h3zaYrFtGVwNnB
         wp0favvJMQzNKEyLe/ecQt4MU1Y4BDQ3+CCBSvfEouaXwPVNEjIMQaAm/INI0V4d4EYR
         Euctr81IITXkASr5McZpLWSUZxaj+GPouo/1cYqAlGbcxNNFf46cYkjGnSmBVeBb3I4t
         CHAgzgNNdr4nM29pWXKyRFzV2kGPi9FpD5hWu07RxVRd70ZvB5sgyWWcNPRMllyENxG9
         800Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IUDDZRZxdmyV3zHbIgFV/f+pJvlpZPQNewiwbQaO6tE=;
        b=O+IzDx/R5ply9lEv35ei1unhLF3QYjDeuIYvzGQfiWiF87wsenSAkYO6FpwABMX3Ru
         0xp7N1Jo6dYj3eKAgqzIC+1xMACy3ys0W1AGWW0q3bUIkKevD0Och9oOM/coUU5bLfRX
         /nH4voJzJoN1keIo0BNnCR9KhWMcofF87SJ8vpMQh6n4cSw/ACRwdWhZanCa8r1M+C1Y
         IalR1nxjWJtqffvvxVAXPs8t3drkFN+BM62ZPfFX8sAZc1FXIV/ZSGmDSw+tkpf+9ds7
         XhCyV3lquhdNHdXV8IhPaQYW1xz68OseUUxbRGg511FN5k7W/ECDkIfWk9qYGXBU9V6O
         deVw==
X-Gm-Message-State: AOAM530JYyAGWFrUSOZ09yN0WvOX+hCGP/wRgXULqPxylsy5Evy+bCxd
        daJeIpWfsX0lR+mFEEGDMRecAPW04mHGqFgJx68=
X-Google-Smtp-Source: ABdhPJy9dl1Tk9pVWPFcSjiX8vKJgMaCDnwogfliEKqUrmBFXH5j360/BhKOOcxo7U7KWVqbda7Zg9HYVSXc7AKyd7I=
X-Received: by 2002:ac2:515b:: with SMTP id q27mr2948208lfd.516.1611680158749;
 Tue, 26 Jan 2021 08:55:58 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
In-Reply-To: <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Tue, 26 Jan 2021 17:55:47 +0100
Message-ID: <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
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

On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
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
> Nope. It is related to only Medfield / Clovertrail platforms.
>
> There are other (MID) platforms that may / might utilize this driver
> in the future.

Right, there's still Oaktrail / Moorestown with hardware in the wild.

>
> I.o.w. we probably can remove the oldest stuff in the driver WRT above
> mentioned platforms, but leave the driver for the rest.
> I wouldn't be in a hurry with this though, display drivers are easy to
> remove, but really hard to get back on velocity after that.

Ok, I'll have a look at removing Medfield. That code should have been
removed a long time ago.

-Patrik
