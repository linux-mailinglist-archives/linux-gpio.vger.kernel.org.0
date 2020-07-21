Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAAE2281C1
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgGUOR0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbgGUORZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:17:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B3DC061794;
        Tue, 21 Jul 2020 07:17:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id f16so1750273pjt.0;
        Tue, 21 Jul 2020 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m4GsPHZyk8E9rIvszeaYK+xEIiDv3WvKuEBaWrAzMWU=;
        b=eUBqKxjkFUVcesI2w5FhhmzGM9tAMnI9BCMIsqqWxkeFFL95H0wXuDi55EhpXRGSQ3
         D2BG4a3jUdRNSS7zNyU2o/D8bhlRO4+O1epu6dyDztRuPXbGXzYkFbQ95LhjzMb6ZfSB
         Qfc6nHEDEWmJI9967/YD4/T7GUMtZaTXpLoNbPaCc6ENpy4R1+q8b/9AUWocEmh0kM8x
         WDdE8xnHFI8utjA4lRmeJU49I8R+Spl5izsSzPBnpsmCwJhM8YgahbTyppZ1b3HG2/Gl
         wlZuu/dj3MjDa+w/t3ecKLY9vhFVdLucTzdlrB1E/p6QFR66j7KTCCLdK0rbM1ktm6gX
         2LJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m4GsPHZyk8E9rIvszeaYK+xEIiDv3WvKuEBaWrAzMWU=;
        b=VL3+YnH7MrnuO2m2ZzCi//DhjMKY1hhNDBSwLemS6KPxvtdQf38zwZRETnm5GJ2nIC
         /gPOwCp9GDmwpTOxin002rmM5q3RY6bcwICILIuGDgSrCYmihpqwvLlOj79tRkQ8hHck
         3O10ztg+6jZ96ZfC1e+8P+kvYlSsYysrr4prf6uO/XlChN2P+m1qBqmRdnRDba63bDwE
         QnMtOnvoNLbLEd1Vf47LINvu9uHxTajEI6d5o1R1iomYNegBes9SRDhAHFp5OLzoiYI+
         dcl1ugg2PauHGyTfiOUZpSl9Ai2Ot1LR//IHiib8iUB/A59FzxvuMiu8ZNnremmyOmyB
         P3Hg==
X-Gm-Message-State: AOAM5327AckdMOjh+ayNGVIEQ3UCzWQ9KQAcgbPoRSO+IyH0EyxRbEic
        mxRv5K7VKN2I19LsvUQGZTYnmY8Hc9l5BjKO0w0=
X-Google-Smtp-Source: ABdhPJxK6u7B3eAzAVcj8lZ00tLyFweue+hs/uM0bN3GU/6+NZXmjVoLefPoKofbEgieU/pbC7adiHuKP2HyKRuVWEg=
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr22019443plo.262.1595341045198;
 Tue, 21 Jul 2020 07:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200721140233.2063475-1-drew@beagleboard.org> <20200721141034.GA2064533@x1>
In-Reply-To: <20200721141034.GA2064533@x1>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 17:17:10 +0300
Message-ID: <CAHp75VdfjYuau0cPES7LUy-jN_RLX-L3kspVRMP+1OSZVocmFA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: core: print gpio in pins debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 5:10 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Tue, Jul 21, 2020 at 04:02:34PM +0200, Drew Fustini wrote:
> > If there is a gpio range mapping for the pin, then print out the gpio
> > chip and line index for the pin in the debugfs 'pins' file with the
> > format: "[gpiochip-label]:line-[index] "
> >
> > For example, here is a section of 'pins' the PocketBeagle (AM3358):
> > /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins
> >
> > pin 25 (PIN25) gpio-32-63:line-25 44e10864 00000037 pinctrl-single
> > pin 26 (PIN26) gpio-32-63:line-26 44e10868 00000037 pinctrl-single
> > pin 27 (PIN27) gpio-32-63:line-27 44e1086c 00000037 pinctrl-single
> > pin 28 (PIN28) NA 44e10870 00000036 pinctrl-single
> > pin 29 (PIN29) NA 44e10874 00000006 pinctrl-single
> > pin 30 (PIN30) gpio-32-63:line-28 44e10878 00000027 pinctrl-single
> > pin 31 (PIN31) gpio-32-63:line-29 44e1087c 00000037 pinctrl-single
> > pin 32 (PIN32) gpio-32-63:line-30 44e10880 00000037 pinctrl-single
> > pin 33 (PIN33) gpio-32-63:line-31 44e10884 00000037 pinctrl-single
> > pin 34 (PIN34) gpio-64-95:line-0 44e10888 00000037 pinctrl-single
> > pin 35 (PIN35) gpio-64-95:line-1 44e1088c 00000037 pinctrl-single

Because line is integer and label is string it is better (from parsing
of view) to put it other way around, i.e.

%u:%s, label, line

...

> Apologies - I should not have put the change log in the commit message.
> Please let me know if I should resubmit.

Since the above comment, I guess it would be good.
Thanks for doing this!

-- 
With Best Regards,
Andy Shevchenko
