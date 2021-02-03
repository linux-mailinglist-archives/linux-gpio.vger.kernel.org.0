Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C8330D969
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 13:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbhBCMBA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 07:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234444AbhBCMAv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 07:00:51 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F024EC061788;
        Wed,  3 Feb 2021 04:00:10 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id y142so8510665pfb.3;
        Wed, 03 Feb 2021 04:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Q1P72jDkAiYrJpjzWAvpbntKoausolrxBiuy4JKYsU=;
        b=fDrx5Or5VRpfg0J7QHIKpfwG6BvxR2ERJWWHPjDfAaUejJVu1+Lphwm60HsVkuikLe
         e1sHT1hZMPRRZ3ovKgUGew1dkaqdw4pBNiPnmB8yen/BctrP7HnMPXz/SbdK+Dp9x7vW
         uPEYy2kznc4sybpKeRDjxyxaQgKUyb1Th9jiUpN7xJz2FGsasLJTXsT/vwA1NLWNzLJ+
         KAcSG8Q5GXuMvXhOcivvt2fglEyHG2Ld6dZ1ym2InitH+U9vX2IJhgtkpeBWVRZsOpOO
         dIpO0eQT9n283bMo/cN/iky+WD/FJi9DKoYX4aVStwDqZBZGFD3PCKQU9hsDwSdU36Ya
         L01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Q1P72jDkAiYrJpjzWAvpbntKoausolrxBiuy4JKYsU=;
        b=RXiZpETvF+DV8HNul5Vvj2oKjj5lxuWTjCAMuEONN9sj82hxwYVTp9YX8U06LfKh1U
         1YFOFQgNpseRJgQ/x/3IQQj9pLVyLPxSfEyfPRNvJHYPUeSdTl06OjB0H/GkwCEhGJeb
         XmELl/oNlnI6UCGBxj8UU7ubNgZHp4WNpk8kuUGUKzZbeIb7uwReIUSg2ApDT8X2/EvH
         nwgCcR0tump+sJ3pevTngGo1xB2ipimACldNFZKgOv3AnpHL8ebIycpLEI5ups7tiV/5
         l2XqpP5oKAmnpy2SkX+vb92cfHE6DFqKxsKxG/QiqiSvRQe3n80ewj8UXXpxM5uaFUFF
         JxSw==
X-Gm-Message-State: AOAM533qtcN2Lg3S5aMtTV/fp9lUJ8EDH2wmA0c51Qv/umfyVZ0WKAHI
        9X2OMzw4Pn+3IH+kLuQqWGF18d71gukkHK2H+Ms=
X-Google-Smtp-Source: ABdhPJwMYgHV+Be/xu9zUBwCMnm5ihAYrPPMqvnQFLvWfX6DEWf/Ni/nWT3r+LTx0J8aXQZzhafNyDhVWll2iLr9nUU=
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr2753818pfb.7.1612353610466; Wed, 03
 Feb 2021 04:00:10 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
In-Reply-To: <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Feb 2021 13:59:54 +0200
Message-ID: <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
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

I have noticed new commits in DRM against GMA500 and it seems now in a
conflict with my immutable branch. Are you sure you don't forget to
pull it?

-- 
With Best Regards,
Andy Shevchenko
