Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E06B3648AB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Apr 2021 18:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239432AbhDSQ7G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Apr 2021 12:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239283AbhDSQ7G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Apr 2021 12:59:06 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AEEC061761
        for <linux-gpio@vger.kernel.org>; Mon, 19 Apr 2021 09:58:36 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id n140so36081739oig.9
        for <linux-gpio@vger.kernel.org>; Mon, 19 Apr 2021 09:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FgaZOWwxCgbBr8FV3M4A5B8r9XqZOZTqmUgzyfoA1fs=;
        b=JKYpV6aVoUfBcP0DtNgR2LMxzzmo7snB0v00NENmC1ubAJ+5bcPkWEIehJUCf3V/Uu
         qmdzhEgWKcBPFn61R6fuUhEWeBC43sIqXzKK6RBgggcwxu6T6os8V3Gk7PUVItEU0phj
         7xu0K43EEohZ93TnJy7pDldmj/xRvjEJHiJWMCxaXnbNPwJ0hllbnsRBbxN0NSGR/yDv
         s42MdZiel7TJm2BTepOkWKOJavnMQaS7q9/+oTbO5vq9b408zHcCAyZJs0un1sCXQAZs
         NqgcIMprf2fj3sdtyAZ7bIKX68KA9QvWJoHaPfcb8KGBkfVeU0rsL6GmMPIZWcULrv4E
         l3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FgaZOWwxCgbBr8FV3M4A5B8r9XqZOZTqmUgzyfoA1fs=;
        b=njczRg3sbJBobVKpv6zTmYxav7Fy8QwvAMlkp2mORB96vHNPfVYv73YkQAe6+aMEfL
         /1GX/HgfAMSnOgDGeRN3rYQ3uwQPuFCpVgNomW8bFYSlGlEwBz1DbXu4GhSaykxN0PhZ
         inu6tjjHBDim8KGx6gAeC3G3E2jhXTNxT4m4UfZzX9Jtk5sVt0Fu7ZONYHMLq5/w4VLn
         O0eWwq6vdYVnmSxaY1133OsAjuka0asCH6SA/P+EFkhdgYy48bw3AvjRnqzfers4wH+u
         CvIHqUa9V4y7uF7zIlzH5iVSdkciyTED6wZ2kZ8mWxtGpqjU6vR3TCI+EoGMw1zuy7nW
         htFg==
X-Gm-Message-State: AOAM532Z33ZTNMAfxBCiBOgfNTKXW/cOg7lAsGYLY6j17ms7AycvHzZc
        E2nlo+d0YWHbbqigM10SqbbpSaYgdnXIxNqjdHooAg==
X-Google-Smtp-Source: ABdhPJwbP4UlnjeTZRe1BOf4jiW5ncoxnVFIFgqdWoXRNBXNPgn0G6P55obzgyUNPOR2YRre1j0cEFH1dJPxoNEH/og=
X-Received: by 2002:a54:4482:: with SMTP id v2mr13818oiv.75.1618851516169;
 Mon, 19 Apr 2021 09:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210415130356.15885-1-andriy.shevchenko@linux.intel.com> <CAHp75VcVBELiTk3C79jHUtxG5xBDoa-wpFYPPXiTUfV-J0PqRQ@mail.gmail.com>
In-Reply-To: <CAHp75VcVBELiTk3C79jHUtxG5xBDoa-wpFYPPXiTUfV-J0PqRQ@mail.gmail.com>
From:   Drew Fustini <drew@beagleboard.org>
Date:   Mon, 19 Apr 2021 09:58:25 -0700
Message-ID: <CAPgEAj5yc_RKt5t=Wt5nBzXFSN0ztPbC=6HXXivmxcH1QMi66w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: core: Show pin numbers for the
 controllers with base = 0
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 19, 2021 at 3:04 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Apr 15, 2021 at 4:07 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > The commit f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
> > enabled GPIO pin number and label in debugfs for pin controller. However,
> > it limited that feature to the chips where the base is a positive number. This,
> > in particular, excluded chips where base is 0 for the historical or backward
> > compatibility reasons. Refactor the code to include the latter as well.
>
> Linus, since we got one more week, can you consider applying this one
> and the other one against kernel doc for the final release?

Thank you for the reminder.  I will test today.

-Drew
