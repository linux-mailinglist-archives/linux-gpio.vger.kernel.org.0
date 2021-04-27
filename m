Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E440736CF9B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 01:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236547AbhD0XnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 19:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236015AbhD0Xm7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 19:42:59 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1ADC06175F
        for <linux-gpio@vger.kernel.org>; Tue, 27 Apr 2021 16:42:15 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id d19so26166426qkk.12
        for <linux-gpio@vger.kernel.org>; Tue, 27 Apr 2021 16:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cfjJAQZnkStmA3Sqmrmuy2FVuDvB7XZlSFtk9HkzaZg=;
        b=P6wx+1ZZt17ZOkutajEnWlAl8FJ/W5bleBY3alYFlccuEpu7i/+ZJyEd39aosfxD4X
         ctj8whi5GlhBW/AfO95Vnt8pJfj5zy5xbG1VUcA1Gki19ixXFlSOC75dDKCavvf/eMOy
         3zMp+Ltl8VpnB0JINas8VewgIL87hJ+cAIVPjU3FQexEOKlUYgRXylJ/oOnRv9gpS4FP
         DqTd4XfDARqX5k+Mz+u1NwKiCQ2kqBmOF9ZQhPjjtLzIjgr5dcxDYK/hIThZgG08MXei
         Qj1ab11aiwJeO9ohCykKA39m3RdhL1CPFi1oFSlbGODA2+yvQ8UdBXYS8ram88r7v+Jf
         CZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cfjJAQZnkStmA3Sqmrmuy2FVuDvB7XZlSFtk9HkzaZg=;
        b=L/j2gZU8vK8kEnrdw0cBCwGTZKMUBvjYpUtoKWpZTmpBTvtIdAB8y90JesCoxg28NU
         Dfd3VlIfPg7te8VK1hmcGY+QuUTgDgaaJ5kXK1u8J7Qq3FK/YZ5Ee6D1mxqmelfu1i6J
         71+dOtmVbZlxQ8ppxfKbFXjnEfYUljUwL1k9D4LvBRsfVJ5Lkj4zaSJlDoletBj2ittC
         p0T/wkUbYax2Z7fRqwUobXZOL32sEEOd/i69q8TbwXUjCQQyhOamo9OAqRoyJEeChsPM
         nCHQgeo9tLUjML9+9e2Uml4iRtG0yKioTNAQmetBj7yEXcJgKUiJeZ/RG4WfuAcLq1Pv
         aGvg==
X-Gm-Message-State: AOAM5333v3EMAzdZ0J38O16V6E0K0QWv3TYVwWluyh5Sp0TxXVDh6anI
        +TsvUnf3OZFOAcPrgM4onDluLSio2Scj7xPpjZ3GE0K6hOmemg==
X-Google-Smtp-Source: ABdhPJx+4GSrXaH5H+0evYKnKfL9sg/QKK2H+jzrn1cC7R52oMag46Gp7tIfLyDLdNMK5h4IB45VkeQwXn+Wstw1itA=
X-Received: by 2002:a05:620a:1089:: with SMTP id g9mr25094890qkk.86.1619566934206;
 Tue, 27 Apr 2021 16:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <bug-212379-6385@https.bugzilla.kernel.org/> <bug-212379-6385-VMOjMpWM97@https.bugzilla.kernel.org/>
 <YIc40YXZh4plkhnc@zn.tnic> <CAHp75VfYKcYjiafFRmb8nBLeJ3VOs0wu6OxhysE31UStQNroiw@mail.gmail.com>
 <CAHp75VfMfghCWo_47FhtUGU_qt+Jzaz1kqY4+=oZgbzazyfPUA@mail.gmail.com>
In-Reply-To: <CAHp75VfMfghCWo_47FhtUGU_qt+Jzaz1kqY4+=oZgbzazyfPUA@mail.gmail.com>
From:   Daniel Drake <drake@endlessos.org>
Date:   Wed, 28 Apr 2021 07:42:03 +0800
Message-ID: <CAD8Lp45xrqsbq4X_8EkSh_TVd0B-BMeq=xOunq1P=SizyK5ugw@mail.gmail.com>
Subject: Re: [Bug 212379] AMD GPIO chip IRQs stops working (ELN4690, WCOM51C7, BMA250E)
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Borislav Petkov <bp@alien8.de>, Coiby Xu <coiby.xu@gmail.com>,
        Ken Xue <Ken.Xue@amd.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        vectorflaredesigns@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 27, 2021 at 10:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> Looking into history of changes it might be related to (Cc Daniel as well):
>
> commit d21b8adbd475dba19ac2086d3306327b4a297418
> Author: Daniel Drake <drake@endlessm.com>
> Date:   Wed Aug 14 17:05:40 2019 +0800
>
>    pinctrl: amd: disable spurious-firing GPIO IRQs

I think it's unlikely to be related (seems like the affected drivers
are claiming their IRQs so this would have no effect), but good to
poke every angle of course.
This could be confirmed by enabling dyndbg to see if the "Disabling
spurious GPIO" message gets emitted.

There's also a debugfs dump file for amd_gpio, could be useful to
compare this before & after the failure.

Daniel
