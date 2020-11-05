Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28302A7A05
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbgKEJGG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:06:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730399AbgKEJGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:06:05 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7790C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:06:04 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id y184so1171905lfa.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YtAIGT05ka0U0U8qTU5HJgv3fZIJWc6IOm4akHQZnO0=;
        b=AC9JM14LMsctAtear3fUzCllWj493psDLQ1BL8q9dQOyyWrzYT7yNZsGro4Nb1swdY
         6y3DOyGh/8hmqEOcDlMtNUEyoGu6ETovmrIRLs3DBdNT1XRwUEbJz1TTR3T2CNGaPrAU
         ZlHQjbUC5578tGJgft1mTnJynn2yMXPg7uJRIbow4GRyLARi9QD7S7X1+X9iBe5iPXjf
         no4LP7gwwSipaTdkVHW3FDrAaTcaQLtShb40KBODE+Jj4rrSpQzz2rTJKQctYkP5a7if
         3YaUPwRbwMLh6uCmDsRvVvC/WxJuAv8dNu5mQ0fbxvgS1HqRj+9qIh51ayrPcuJ9p+aG
         UtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YtAIGT05ka0U0U8qTU5HJgv3fZIJWc6IOm4akHQZnO0=;
        b=kMeRN9iN/Ktt5qXrnfWUb74RvkXOpsPBtq5MzxvyI0LTSKrpUjO1Ur4MWBCKHrYTps
         +9ojgKgZd6aPcD6j/I3HWIkmepgjcDsBII0Qy+h0decl5yDOwzlfoxiWyElTJyo8nwqb
         kglMn+XS29q2uHIV3ljjy5vCfxW5YEwlj46diCh6WBm9uh6Kd9nlS4jllhLcOTtcaH/d
         iJ5gTcupZ5oWLX3ID+2eU6umtz4eF2EK6nOaStv0OPF6FO36yQDXi1ZrDEq8Puzv4Lz0
         laXd6rbXVwqe2oySsVFEfBMNCFTtok8DOz2tSfHDIBPFU6in2JIYXeQSSLzaCcXMfkxY
         AnjA==
X-Gm-Message-State: AOAM532KbeqNX/7b6h7REonxFpkVys78TBvsH1QrAmsX4AJfqH4+p3J/
        tIayvCzWYdwzzarJ+0+cIU5eyyH4JklBZKzeY6bdM+BP2taXBA==
X-Google-Smtp-Source: ABdhPJznzdNj+7qQRYYY4KOB2aPbXr30TKpk6FaQy68J/HD625ljr2hyUNl0p2cq0ea//+TbgOTGUUZO7gIe/dprIRY=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr638206lfc.260.1604567163431;
 Thu, 05 Nov 2020 01:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
 <20201022165847.56153-3-andriy.shevchenko@linux.intel.com>
 <CAMpxmJWhENX6bEWihp5hFjDnbXz5asdmEpw96_SJdx1v3+U1AA@mail.gmail.com> <CAHp75VdBahEEB5qnbbquPBG+iErEaupoAA-f1vTroAXoLLJFNw@mail.gmail.com>
In-Reply-To: <CAHp75VdBahEEB5qnbbquPBG+iErEaupoAA-f1vTroAXoLLJFNw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:05:52 +0100
Message-ID: <CACRpkdZAFNqq-z5xBgtjdt5LXNMR32wtWjMt7yRm6azDmuMndA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpiolib: of: Use named item for enum gpiod_flags variable
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 3:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 26, 2020 at 4:40 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Thu, Oct 22, 2020 at 6:58 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Use named item instead of plain integer for enum gpiod_flags
> > > to make it clear that even 0 has its own meaning.
>
> > This patch doesn't seem to depend on the others in this series so I
> > applied it to my tree. Let me know if that's not the case. I'll let
> > you take the ACPI patches.
>
> It's fine, thanks! I have just sent an additional message to elaborate
> my vision, but again, the approach for this patch you chose is just
> fine.

I might have lost track of the state of this patch set and mix it
up conceptually with some other patch sets so bear with me if
there are mistakes.

I see that Bartosz applied this one patch at least.

Yours,
Linus Walleij
