Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5528B36C78F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 16:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236867AbhD0OLT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 10:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236516AbhD0OLR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 10:11:17 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E393C061574;
        Tue, 27 Apr 2021 07:10:32 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id j6so2046962pfh.5;
        Tue, 27 Apr 2021 07:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zjkXyIAcXxVgsu7bdndxLt7z3c290Giha2ekTv6LRpQ=;
        b=uCz8cP6M2c54QBbg3ED2zNEi0Izrz9v2SD3KquneJtS/DfUGS6oPf10M5/S+id1QWP
         J7jZmmwSx8Yf6x0MQ/XXPQ74arzGJTl37msaEhy3DoGxkjFD/WOLxa/w4NNoSIoUJzJc
         CkpQ+meW2USnp0o1ZeKhU6N6nyXJHTXoo97k4lmM0YzHDkpWt3gTA50hMfjXYAUNsXed
         lCE3yteJ99yr8Q/ybj7w1Ku39Q6RU90uhBedPv8Nqu3FG8OIjRO4n4joaJpy5F6zkOZy
         OGlkko6y7l7xzUafSpgtDuWUMlRRZXDA+WVxtLnMOMEDAY+X+CWxyI0PLa2sKTyZfAEw
         hHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zjkXyIAcXxVgsu7bdndxLt7z3c290Giha2ekTv6LRpQ=;
        b=LoE0Up5dOtK8R1MZ2iBoJIEu76tVQphPogeWQWzHqdtZvL4441kNd0BPc6nkoeA4YG
         DdHM+r0KRVTvKh5BtNNc/OsfnwcdL2bjYH422RasjHq6qTiOOt/p8Qv6veX2jnpcKDUy
         AZjEJxLAFI52DK/XRr/yIvmyQuQGbyq9edZzswQNshIZtVfCThRbiP5NDQTG/E0bXT/l
         8zHQwMZzN5rtlHK9s7SHkW+t7j7I7TKy7p4Scvqof42yb5QokFh9KFBt22zCWAvBua65
         fs9Iv3Bt+GO4/glVCIaGEJ/DKhb7kDRm4a4v+nonZaUcDRjDiZ74k9FZ+6rn/8gqsWby
         zpIQ==
X-Gm-Message-State: AOAM530GXHDbHSIVhhh/EmdtIqimxrYfTo3+n56J45bC/JMHPuMce/mw
        xw0+nm3+wNz2EFZDu5lCW3gcQnZm/H1xQ5sPoJM=
X-Google-Smtp-Source: ABdhPJwRVcNiL9bNW6Obqe4jxMtaQMcXkAr+SPngq8SrRMIlXHwxiI2jqgzFL4IGpCtP9ZYSKVPC+gdOjxyISMKOKtY=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr23569031pff.73.1619532631932; Tue, 27
 Apr 2021 07:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <bug-212379-6385@https.bugzilla.kernel.org/> <bug-212379-6385-VMOjMpWM97@https.bugzilla.kernel.org/>
 <YIc40YXZh4plkhnc@zn.tnic>
In-Reply-To: <YIc40YXZh4plkhnc@zn.tnic>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Apr 2021 17:10:15 +0300
Message-ID: <CAHp75VfYKcYjiafFRmb8nBLeJ3VOs0wu6OxhysE31UStQNroiw@mail.gmail.com>
Subject: Re: [Bug 212379] AMD GPIO chip IRQs stops working (ELN4690, WCOM51C7, BMA250E)
To:     Borislav Petkov <bp@alien8.de>, Coiby Xu <coiby.xu@gmail.com>,
        Ken Xue <Ken.Xue@amd.com>, Jeff <Jeff.Wu@amd.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     vectorflaredesigns@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: authors and contents per driver source code along with Coiby who
fixed touchpad issues in the past in the same driver.

On Tue, Apr 27, 2021 at 1:04 AM Borislav Petkov <bp@alien8.de> wrote:
>
> Switching to mail...
>
> On Mon, Apr 26, 2021 at 09:04:38PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=212379
> >
> > --- Comment #15 from Austin Kilgore (vectorflaredesigns@gmail.com) ---
> > Is this ever going to get looked at?
> >
> > Did I need to @ mention someone? Honestly asking since I don't know what to do.
> > I don't even know who needs to be told to take a look at this.
> >
> > Like I said, if this bug report is lacking information just let me know and
> > I'll test, check, or upload whatever is needed. It's really important to me
> > that this gets fixed.
> >
> > --
>
> Grepping through the tree, "amd_gpio" sounds like
> drivers/pinctrl/pinctrl-amd.c so maybe Linus might have an idea, CCed.
>
> @Linus, the bugzilla entry has some more info on what happens.
>
> @Austin: in the future, please do not CC everyone including the
> postmaster on your bug. Now you're mass-spamming 50+ people
> unnecessarily.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette



-- 
With Best Regards,
Andy Shevchenko
