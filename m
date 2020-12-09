Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2302D3FFE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 11:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbgLIKd0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 05:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729907AbgLIKdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 05:33:24 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D33CC061793
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 02:32:44 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id t37so911732pga.7
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 02:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HvRbYcwuo4jmxfQOqHDPi4zQI/oTCCYrVmYSMG2Sx3I=;
        b=nBetCAH9fWXTehoHreBj58ioNxeHOZIusimVXz1RkBbplz7S0cNKPUnaLwlzgAUp9U
         TabpGyDwHn/JL1dTY/9kX+Qh/qAqeGpgs5FT0WtwMTOUMklDfySIsgBUzYWDHqupYqf3
         14dlk6qWXs6GPqnMuH6ocMhAjKoLsj6kadP8tS8CNTqXvY12NB6c0ZcLh57QqUct8w4M
         1iEeJpmErBlt1VFU4GD03hLH8gvhBcLBHPqA04U6HjdxO49aWrpj43a725tXuDpEo6NJ
         ErCTGlM8RPx3Q8H6f8yWamzTsLmk5Z6XksNGWlPeDYJwgCrVOWDko9vXapuclcWhs+Tj
         PwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HvRbYcwuo4jmxfQOqHDPi4zQI/oTCCYrVmYSMG2Sx3I=;
        b=uN6J5q4sq9BWTqPHNsLGmXj0AKBxe8TPTAYuKTaCuJcCMoeR/F2uR+Fy8FJB6IT0GJ
         t8ulCfWaIK+xfpnPEzJcqB8zF6rzQEelMJBATGGGPPDGxa2kTCQuPLLqeJBR8GyIU8bn
         IM1NO3S5u8IzOwvs//eOvtdZb3SnDaJf05U5ORWKRqI5zFnFKqITPQP3o7reOMGu3JWd
         rM7l2O8XcHjc/Ar6kY0eovUWMu6XV7p6bCmhVQ0wKsfnjoYy1iNj7LnjbmkpR5Tu8+y1
         2pVJZ3Q37JCr8Is+3mNgUWXJrzVHsEZ4ZySvWD01iab5lryL8v/GSNXiM2bdfHYljAKE
         +IPA==
X-Gm-Message-State: AOAM5304el/pkPMJ6i8l6qNpljCVBbyV9f5T7PGvrF6z4chu57WEGLqu
        48YU/HF6V9EhBtO1UPoSzB2vBSC2k157oYTmOwjE2t5aQEM=
X-Google-Smtp-Source: ABdhPJyJuuJCpfVMQMfumNd1zoymxeKh7iTVHbOEKj6Zz3lMWc2ENjGT2O/0xLkXpJ2fjihkMKovZJx2XNUc8ueo7AM=
X-Received: by 2002:a62:19cc:0:b029:19e:321b:a22e with SMTP id
 195-20020a6219cc0000b029019e321ba22emr1745284pfz.73.1607509963584; Wed, 09
 Dec 2020 02:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20201209095248.22408-1-brgl@bgdev.pl> <CACRpkdZgK3dmjM32BYAWFvHOhBUsQbNbCSNMaebvRr+Jnes=Ww@mail.gmail.com>
 <CAMRc=Mdq7LBTAbUguuLH=f5_vfo5pc95BCveqSvApBTC26aNQQ@mail.gmail.com> <CACRpkdYM2knogZLRp+AAdE5ssvhULDZ6xr8yGrO8rvSMrZuScw@mail.gmail.com>
In-Reply-To: <CACRpkdYM2knogZLRp+AAdE5ssvhULDZ6xr8yGrO8rvSMrZuScw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Dec 2020 12:33:32 +0200
Message-ID: <CAHp75VefreUB1KvdPGYUqmd7jq+hEWuPoq7nRG4RxLP6YpPRLA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.11-rc1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 12:22 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Dec 9, 2020 at 11:13 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Wed, Dec 9, 2020 at 11:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Wed, Dec 9, 2020 at 10:52 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > > These are the patches I collected over this release cycle. Nothing all
> > > > too exciting - mainly just updates to drivers and refactoring of the
> > > > core code. Please pull.
> > >
> > > Nice!
> > >
> > > But I get a merge conflict in gpiolib-acpi.c! Since I said Andy should
> > > be maintaining that file it makes me a bit nervous.

Linus, no problem. This conflict can be easily resolved.
Do you want me to publish a test branch with an example of resolution?


-- 
With Best Regards,
Andy Shevchenko
