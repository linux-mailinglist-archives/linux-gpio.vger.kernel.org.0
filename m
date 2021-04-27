Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774E736C7B2
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 16:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236461AbhD0O0i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 10:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236358AbhD0O0i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 10:26:38 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1E2C061574;
        Tue, 27 Apr 2021 07:25:55 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id a12so1650301pfc.7;
        Tue, 27 Apr 2021 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XmqaGzesN0SmjSrY2Dk2eAML4vSg4n/rnT2eDpt7oE8=;
        b=gyoHtAVkWeSljBk3I4Fm/iWJ1oEDShb2O6IQZuvtpuEIotkDCihu0N0ry1Dly1xbWk
         WysUQmGz8yyKtrb3YNV5Iu9AWue5dk7/MjeVx7pvshB2ePojDSqzT2SfRja6mbDxP9b7
         dhNr6gixva6IQTiAyAw075WxrJTbPWuK4bNa8215fygmo0UXXGxmVqU5V+JSO7SzCC39
         B7tXOpLgm/GS/4Wvy674FNxQr5W0i/8JQnSphkOMQntE3DLzv8rNZKnTnzrrZXwAtHvq
         DA8a3NM+xyGDWdFDBAqhZJimeB6CJEhZwi0639MlG4vuouClefRpWDti3gCkpSFMX+WQ
         d9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XmqaGzesN0SmjSrY2Dk2eAML4vSg4n/rnT2eDpt7oE8=;
        b=KQIPSdpQoX7bsOUn6yggyRjB6HIwKsh1mcWplyIIstWnIaTE7Udqh8ekneQtYqmaCy
         xBr3l45JsoIky6zgiUYnSFzBsgmMCB6Dy1dcb0ZhNGMoFQ5h+pXCCxs5ZoFI0eB78ziS
         d/GQg4KIEjgD2oGQsMd3j9VAuxyTt/6rJjL+krsw5wVG76fKF4jT5cm5owALWrJtGoeg
         csNasy5zNnRrp/inMRv7XVBrqlG7DCIPyrOPMgaM/WSUy+1AblHr37n4q61ccaH1Pm+7
         hwe51GThywlPsohiFb4gpK5qFHSEvDshzfv3Qq5o5Wa9UJgnTKP4Nr0NWvjZKdGKpH8L
         gNUA==
X-Gm-Message-State: AOAM5336HkiS9ktYCe8KhIM415hRsKJXeqvYYHpGU63Kl0efhVBWILEf
        G7ElRKPNuiMulKGCA7xTlQ19pkntYzJ6qpfVhJo=
X-Google-Smtp-Source: ABdhPJyDSass2cwQdgjSYcJZZ8XxP7imOdvRKXttGEUgkWl2Jnc6Pdlnlq3Hs6f3TgzXXhKR47PECohr3AF1CtMUrsU=
X-Received: by 2002:a63:a847:: with SMTP id i7mr21790345pgp.203.1619533554990;
 Tue, 27 Apr 2021 07:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <bug-212379-6385@https.bugzilla.kernel.org/> <bug-212379-6385-VMOjMpWM97@https.bugzilla.kernel.org/>
 <YIc40YXZh4plkhnc@zn.tnic> <CAHp75VfYKcYjiafFRmb8nBLeJ3VOs0wu6OxhysE31UStQNroiw@mail.gmail.com>
In-Reply-To: <CAHp75VfYKcYjiafFRmb8nBLeJ3VOs0wu6OxhysE31UStQNroiw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Apr 2021 17:25:39 +0300
Message-ID: <CAHp75VfMfghCWo_47FhtUGU_qt+Jzaz1kqY4+=oZgbzazyfPUA@mail.gmail.com>
Subject: Re: [Bug 212379] AMD GPIO chip IRQs stops working (ELN4690, WCOM51C7, BMA250E)
To:     Borislav Petkov <bp@alien8.de>, Coiby Xu <coiby.xu@gmail.com>,
        Ken Xue <Ken.Xue@amd.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Daniel Drake <drake@endlessm.com>
Cc:     vectorflaredesigns@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 27, 2021 at 5:10 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> +Cc: authors and contents per driver source code along with Coiby who
> fixed touchpad issues in the past in the same driver.
>
> On Tue, Apr 27, 2021 at 1:04 AM Borislav Petkov <bp@alien8.de> wrote:
> >
> > Switching to mail...
> >
> > On Mon, Apr 26, 2021 at 09:04:38PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=212379
> > >
> > > --- Comment #15 from Austin Kilgore (vectorflaredesigns@gmail.com) ---
> > > Is this ever going to get looked at?
> > >
> > > Did I need to @ mention someone? Honestly asking since I don't know what to do.
> > > I don't even know who needs to be told to take a look at this.
> > >
> > > Like I said, if this bug report is lacking information just let me know and
> > > I'll test, check, or upload whatever is needed. It's really important to me
> > > that this gets fixed.
> > >
> > > --
> >
> > Grepping through the tree, "amd_gpio" sounds like
> > drivers/pinctrl/pinctrl-amd.c so maybe Linus might have an idea, CCed.
> >
> > @Linus, the bugzilla entry has some more info on what happens.
> >
> > @Austin: in the future, please do not CC everyone including the
> > postmaster on your bug. Now you're mass-spamming 50+ people
> > unnecessarily.

Looking into history of changes it might be related to (Cc Daniel as well):

commit d21b8adbd475dba19ac2086d3306327b4a297418
Author: Daniel Drake <drake@endlessm.com>
Date:   Wed Aug 14 17:05:40 2019 +0800

   pinctrl: amd: disable spurious-firing GPIO IRQs


-- 
With Best Regards,
Andy Shevchenko
