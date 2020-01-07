Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 763131326CD
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgAGM5P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:57:15 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33372 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbgAGM5P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:57:15 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so38820474lfl.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oNgwDBtA/tTrh9zrPV6+es+206sk4kdESZvdMawSVPY=;
        b=C98N7PqfhpnHkhM6Gwc1A+EaotJeLY+j05J84Zzs0uDh4X/KTZYZhQq/L+/ee502RW
         0YnLtrYZUMKEl7fNKljOk3PlZ1ilpiPOyBfwkd1vr+VRgnPoAEh553NTAQHtoCAR4OaR
         rhqwSy2VuI7wSEWscWR+M3Ke4SL8MVyqS3ObsoQR8OxHOhOuUsZMlBIJOGP1KAZ5pEZd
         1CbpSt92pPKv6kB0VKQnTx1DsGEtvk5jdAXZIRlkxIDqnLOTvgxCU3L8Ml052r/TC+d9
         XZ8ITozFLg6ZK/AptYUIlmKOXtj5TKW5cPgKjVz6JTk/LDIkJrS8nduNEcIk6ARBOSef
         3wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oNgwDBtA/tTrh9zrPV6+es+206sk4kdESZvdMawSVPY=;
        b=R2lpNjR6lyOlHz/Rq7BlgW89+GofVh4NIsuxrpwHDTu4W/xJOKAs810z3GdPB2ciXF
         b0/DH2UmSAlwEqwObDpTTCiLwC1oEw0sRpHWW7U/6RodZgEY5NxV0UEqZ0+xw04Khi7v
         XVFHWytf5TwPpX3V79q29V5gHs88Wn1zNLTpmxvBHpvYSrT2KRbKABsZzCiNUnhW+KYV
         WXpQRg6FwCMc5VbmNLlDmNFjQtkHHELawq1VD5eAcrY2Wyaupsr+heHZ8FuIWEOrkNtZ
         2FU9gi7Cj/hxa2e8C7cmfV47Hbf6UIxhi5J+2re9Qn8P01Ap9NGY/M6T0uQBSCoCGveJ
         patQ==
X-Gm-Message-State: APjAAAXLAmE+0ZMGGn4jx18+q6Hr8OIE/j8VIj33YBIBy+5r7LhSw1Pl
        DzdO1ojyFs9hM57wix8YCqW4IcE3+LE248+CYI7mhm88MaA=
X-Google-Smtp-Source: APXvYqzCq2tQrYgtWRpK3jplDj7YCPHm/vac42TUjOJ7mYyLMjr6dwz6nkOi9ak1FN3+t8xLYtvy7/Q+nNZoY/kIRis=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr58554082lfi.93.1578401833587;
 Tue, 07 Jan 2020 04:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20191227230447.32458-1-hdegoede@redhat.com> <CACRpkdaR4vFp=huuqvsnZTFnAmKNJmjpwM8sPpVX2aERp-LogA@mail.gmail.com>
 <20200107123841.GE32742@smile.fi.intel.com> <CACRpkdb5viFXj9S9nVU-p9ZFva1bFns83FrpXdFJHsnJMtomuA@mail.gmail.com>
In-Reply-To: <CACRpkdb5viFXj9S9nVU-p9ZFva1bFns83FrpXdFJHsnJMtomuA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 13:57:02 +0100
Message-ID: <CACRpkdavg8xbnM5-RC2m_nadk9++sbBEtTYLXAoyvxPwO1bSrA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: baytrail: Do not clear IRQ flags on direct-irq
 enabled pins
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Mastykin <mastichi@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 1:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jan 7, 2020 at 1:38 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Jan 07, 2020 at 11:35:17AM +0100, Linus Walleij wrote:
>
> > > Patch applied as non-critical fix for v5.6 with Mika's ACK.
> > > (Tell me if it's critical.)
> >
> > Can we collect it in our tree (what we are consider a proper for this) and
> > submit a PR?
>
> Sure that's true, I dropped the patch from my tree.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I also dropped the other Baytrail patch I shouldn't have picked up.
(Replace WARN...)

I blame coming back from vacation for misremembering how things
work...

Yours,
Linus Walleij
