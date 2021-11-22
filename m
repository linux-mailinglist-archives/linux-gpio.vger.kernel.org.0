Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C660458BE3
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 10:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhKVKAR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 05:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhKVKAR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 05:00:17 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0068CC061714
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 01:57:10 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id l25so57752423eda.11
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 01:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pTSYVLeh/yXoJu2Zf4MZKwy5izFdU2MnMx2Yvekckkg=;
        b=WYzfylaxM2cUnx+ATjtwY2j0ElBwvtd5QyE0/ztAl98zf0T+l7suWoxZQOPGqsVOOz
         Ouf23dR0fBWTiAuWV+d9KFWphlpbN40dAQ2j9DVptkdLIQzkToWqTYUrvRx6qI1BWkze
         ajuPNB6SgdICdKiM4VwSpJGio2UFjb2H65xoyyi6qPgU8bSXfaWF8h4Earrv7pOHYh67
         brHBEqJCgSxnPzAIBRP3s9uhj5CmWDbmL1r6HFrfNUUBKOACDCbNdliXBl5bNKmjJ7KW
         zAQMuJWXnY3czYb0xlUBBicgXjXye+f2PQXjikvQr+yXW5AlZvy3FbJFa9dVQQYcMvoc
         Gg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pTSYVLeh/yXoJu2Zf4MZKwy5izFdU2MnMx2Yvekckkg=;
        b=f6iIZbP5oxYPDHHpTZNlEJguihTiHPVkvvOKNW97VPIJ0FK+JgscDgYDwgpAf9dX1w
         t3/lKupUNuSJmsFrLnpP9GkKzXSVDHQbfjyaYdk2qCtYEFRHfwKjtf95SLUiVIQHhLSk
         tHyy27iHV9Hf9SvRXySbmeg6C9uyMr+Y///hjFcOVXl0lW0Ymdvqm7rSdfOyBMaJO/n4
         7HzPs6lNHFpW7MybMfdsoAtJgZ6jCgNbbJDEiCqFJdGqZHluCjUhtAlEuC2pM20t/LNU
         dUG1mJPEN0AgPQIxXZIqGkrbWdkC00C1BuduLflom4Plzbymk0XLN+sbD24+SrZgudg+
         6yag==
X-Gm-Message-State: AOAM532Rp9b9g2GzkhisOADsE2D3l2hh6OrYFGwdOKTv5dDGItBcubGD
        m8Jo9tcE1sVVPYPa4omWqgu/ji57j6lf5UQ3Jjz28w==
X-Google-Smtp-Source: ABdhPJwTYtcGZ5yqcOmIyTe+ojQ5tNYK7OL2XSCnAAVWmc/tXIguj1fKYRNX2ETGv64xWB9ML3i7Mhl7Y3fbi/umBhE=
X-Received: by 2002:a05:6402:50d4:: with SMTP id h20mr63158558edb.52.1637575029592;
 Mon, 22 Nov 2021 01:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20211118145142.14519-1-brgl@bgdev.pl> <CACRpkdbn=govgPeiEEtVF_+bMYD1Oi1yC+diZ2-owO4O6-oCwg@mail.gmail.com>
In-Reply-To: <CACRpkdbn=govgPeiEEtVF_+bMYD1Oi1yC+diZ2-owO4O6-oCwg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 22 Nov 2021 10:56:58 +0100
Message-ID: <CAMRc=MfRN_jcyEo0MFUyrxvyrsuMPf0a=fPfWh46+_9Hn0jxhw@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] gpio-sim: configfs-based GPIO simulator
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 22, 2021 at 1:02 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Nov 18, 2021 at 3:51 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > v8 -> v9:
> > - dropped the patches implementing committable-items and reworked the
> >   driver to not use them
> > - reworked the gpio-line-names property and configuring specific lines
> >   in general
> > - many smaller tweaks here and there
>
> The series:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Let's go with this.
>
> Yours,
> Linus Walleij

Thanks but Kent and Andy are right, I'm about to send another version
that synchronously waits during `echo 1 > live` for the device to come
on-line.

Bart
