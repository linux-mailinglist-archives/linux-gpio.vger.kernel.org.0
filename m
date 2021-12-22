Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60CF347CED1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 10:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236562AbhLVJHG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 04:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhLVJHG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 04:07:06 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0782DC061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 01:07:06 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id o20so5861518eds.10
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 01:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OH9lUZGvbIYsFS6r93OdVkoyWwer11g866A2zNPeehk=;
        b=r3WN6KoV0SzdgtxvaGk6qQynqc2rvj3SjmK9MBxRug7Pb+EVJpUK3t+F+yktx2DuJc
         OBYJ2S/tGlHwp1SwDX3Tk8FzNeauleOXb8tli4nGClkgMNhBrB5Ix0fTy1fZ49TXXAdD
         2zmt7dP0B7bijNj6jcyR5tlg2IMGqdpZNx90la65lXq+rIS/tpWu1Xm0N3FCPJn1YdV3
         sVjtI99DrXEc8h+K9oqIjtQ/ZRjSkQmJ/zpQHi4QlRjTedfonW7XGiqlDGfZBk2S4CWi
         A5DG5wlrtcO62lxYpYfdJNGpLp/TihBJ092A4EYWpnn0zu66tWHrhZlqA6gWE9bQckw8
         h80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OH9lUZGvbIYsFS6r93OdVkoyWwer11g866A2zNPeehk=;
        b=SRg6M8BjFbxXaHOoNI+D+58E6dmwm2oAtNx00As+oMuo/tx5KUyfGjAWiNNjkh4Vxb
         9/zQNK77ujKAgK5aNjqFB5pV7Vxbiq8lUYe6boHKUZS1KsuRzAvUJ0fNpvyUW9DSGUFp
         rm6fIRlFD0PIq0W5ntNI8ez4/2TmtLaeu9ecETxkhybeIwhqaRQggXwmgrRdb2Tr66T4
         lWyOl4QzoqrrVxLc2NIz0RdjfYbrh+sW50gm1Jz0UzT2yW7aS2AtL5nyAMUVW0YSEkta
         juRMpqscpOzRqO4ToUbT67Qb3hPMFwyqAL3VhIatn7vUr6cc27TqDlJ6EGOCg92ePozv
         7/MQ==
X-Gm-Message-State: AOAM532SpU+pwYA4tK/Fu19idzldD2+sjT6/l/x1ODlTVMvTnjIt6xBb
        2vcs7OKkbNKw/gtiAuvYW7AxDBJgK2v/tYeMOV02UQ==
X-Google-Smtp-Source: ABdhPJwlTOwQkimbTWuIr5y0SujyhX/GH7oxW5rFLOJAM7Fb2ZmmwI2kQCMkhG9muS1yczRmhCgRLzxKggSNitGnEZ0=
X-Received: by 2002:a17:907:7208:: with SMTP id dr8mr1727842ejc.697.1640164024530;
 Wed, 22 Dec 2021 01:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20211220132439.1194-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Md3bpCJe_eFBjiKuhCRO_xqnFxSc1sw100fgNmajy6gaw@mail.gmail.com>
 <CAHp75VcbaYXfDpc7xE=asSqUspscRoHfqrg-yMtx=uo5UNqxfw@mail.gmail.com>
 <CAMRc=MfWqV8UFWLaJO7JSo7N6MhYVMWdquMDJU7xR5gu8604AQ@mail.gmail.com> <CAHp75VfhY9zFxC_vDj0OH0Y0ah3RUgEEYO9p_uQsm7Xe63QF8w@mail.gmail.com>
In-Reply-To: <CAHp75VfhY9zFxC_vDj0OH0Y0ah3RUgEEYO9p_uQsm7Xe63QF8w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Dec 2021 10:06:53 +0100
Message-ID: <CAMRc=Mfn9P30niRMNqV4f7VByzV0a+Sf2vS4OcU1qPa4o1O8Lg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused local OF node pointers
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-unisoc@lists.infradead.org,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 21, 2021 at 9:21 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Dec 21, 2021 at 9:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Mon, Dec 20, 2021 at 4:11 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Dec 20, 2021 at 5:09 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > On Mon, Dec 20, 2021 at 2:24 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > > -               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", dev->of_node);
> > > > > +               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
> > > >
> > > > This is unrelated though. Can you make it a separate patch?
> > >
> > > It actually makes use of the local np IIRC.
> > > It's related, no?
> >
> > No, the np pointer is already used elsewhere. You just replace the
> > dev->of_node here with np. Rightfully so, but it's not part of this
> > commit logically.
>
> I see. Probably I missed that somehow.
> Nevertheless, do you want a new version or can you just revert that
> particular change?
>
> --
> With Best Regards,
> Andy Shevchenko

I removed it and queued the rest.

Bart
