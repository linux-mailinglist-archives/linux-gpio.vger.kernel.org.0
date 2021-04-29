Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A358F36EC69
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 16:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239669AbhD2Obt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 10:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240062AbhD2Obs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Apr 2021 10:31:48 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2E0C06138D;
        Thu, 29 Apr 2021 07:31:01 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id z6-20020a17090a1706b0290155e8a752d8so2574671pjd.4;
        Thu, 29 Apr 2021 07:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gM15QUkmCL61arKv4TJmkBywGeLy1a6WBcc423w2M78=;
        b=SBAe889bwBcsB1PdkCZEjGE4TnD6wffDb1KHz9xgY35Hqy2Z2pKQefkX7rpyQ4MO1m
         MfV8AHIZ0M9kEJyoVVFK24Ak/b6zkR60ZvNvgYQNA3AiPaIi0Sc3mlvFPxrGwCZyI1sh
         PgLQr2klLLI0GgFw1KMIi6KGQr9iKxSQJ4CnsmsyxR2VrZz1LODE+DpJ30hOL3YFBHEO
         +5GXXTx5mbOa3GIMD46m7vbT8qH/XDwLOFszoOwQuaNaNRgMoOVr7sTbZq+J4F2aTGg3
         2dMq9Pz4QIWtsfbrw7ITLDEARsqWTYedefSygUDUAkfYf54Skag+A0KJQc5aJEAqB7wl
         xDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gM15QUkmCL61arKv4TJmkBywGeLy1a6WBcc423w2M78=;
        b=BOO2MbbSAsbLqbBGhkClOAnN1oF5b24KDvQF8glYMtCqwfJSeDvLFnha18NEYcf9Ii
         eoYXH8GnvQIhUJTi0BjPFGmElTl/NIpSPejML3WHMSWHgHUxKmZjASfMMArvAAobJ2/f
         cl/BuorbLAfP4i4epBiiKZ30dvGnkAaQGX6KIbz8+i43Bd/4XFEnDDtgX5Di6EPrz/iB
         NWLM38SODVwTN+MJT6OBO19qMGYwZaOHLmfuZIWGqXeJAC2s2WRY7Zp/8qBmJV7D337T
         Ts1E/OsGIZpyT9vY1QimBj88xOX9Afzqo3Db+1+OlCyxpzcekEhAGzHF6kC5fEd8kF9A
         Bl3Q==
X-Gm-Message-State: AOAM530L5pSU9dbZDfCRH6IONScgT3jKudyg4NHLKdJXhlR/vRvsTDMO
        aLAvyrdq9mUdcmrWdyJ1+LStzRak9MPDCDF5jMc=
X-Google-Smtp-Source: ABdhPJySjxzlV0LFy/FZRATOYJyqhsFwamdSD4f63FMLktnbIUx4WM4lxuxkvo+cJG0tzT5yTVi7RlIgo7m7z4S2k7A=
X-Received: by 2002:a17:902:e546:b029:ec:a7f5:2a88 with SMTP id
 n6-20020a170902e546b02900eca7f52a88mr36218371plf.21.1619706661355; Thu, 29
 Apr 2021 07:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJU+K6C_xbQPT=9QKtLLTnajJQbgJH0A2QqbGjCV+b9Z_g@mail.gmail.com>
 <YIP9ltcdf7mNtYRd@smile.fi.intel.com> <BL0PR02MB537807ED9F079ABF6F34B086AF5F9@BL0PR02MB5378.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB537807ED9F079ABF6F34B086AF5F9@BL0PR02MB5378.namprd02.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 29 Apr 2021 17:30:44 +0300
Message-ID: <CAHp75VfxzP60fC4v4KeHWROD9uxxtLTKdh9mB+BfYF5VpuM6dg@mail.gmail.com>
Subject: Re: [RFT, PATCH v1 0/5] gpio: xilinx: convert to use bitmap API
To:     Srinivas Neeli <sneeli@xilinx.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 29, 2021 at 5:00 PM Srinivas Neeli <sneeli@xilinx.com> wrote:
>
> Hi Bartosz,
>
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Saturday, April 24, 2021 4:45 PM
> > To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: linux-gpio <linux-gpio@vger.kernel.org>; arm-soc <linux-arm-
> > kernel@lists.infradead.org>; LKML <linux-kernel@vger.kernel.org>;
> > Shubhrajyoti Datta <shubhraj@xilinx.com>; Srinivas Neeli
> > <sneeli@xilinx.com>; Michal Simek <michals@xilinx.com>; Linus Walleij
> > <linus.walleij@linaro.org>; Yury Norov <yury.norov@gmail.com>; Rasmus
> > Villemoes <linux@rasmusvillemoes.dk>; Syed Nayyar Waris
> > <syednwaris@gmail.com>; William Breathitt Gray <vilhelm.gray@gmail.com>
> > Subject: Re: [RFT, PATCH v1 0/5] gpio: xilinx: convert to use bitmap API
> >
> > On Fri, Apr 23, 2021 at 10:41:26PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Apr 8, 2021 at 4:55 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > The change in the series has been inspired by [1], which, I think,
> > > > can be improved. Here I present the view how it can be done.
> > > >
> > > > The series marked as RFT since I have no hardware and I perform
> > > > compile test only.
> > > >
> > > > The patches 1 and 2 can be (independently) applied for v5.13, but
> > > > I'm not in hurry with the series, due to above (lack of real
> > > > testing). So I'm flexible in a way how it can be proceed.
> >
> > > >   bitmap: Make bitmap_remap() and bitmap_bitremap() available to
> > users
> > > >   gpio: xilinx: Correct kernel doc for xgpio_probe()
> >
> > Bart, thanks for the warm words, just pointing out that patches 1 and 2 has
> > been reviewed and may be applied for v5.13 cycle. Up to you.
> >
> > > I usually trust Andy with his work but is there any chance we can get
> > > a Tested-by before the merge window?
>
> Patches tested. Functionality working fine.
>
> Tested-by: Neeli Srinivas <sneeli@xilinx.com>

Thank you very much! I'll send a v2 with your tags after v5.13-rc1 is out.

-- 
With Best Regards,
Andy Shevchenko
