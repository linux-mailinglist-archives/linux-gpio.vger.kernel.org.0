Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B32E2A8393
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 17:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgKEQez (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 11:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgKEQey (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 11:34:54 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C614AC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 08:34:54 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id v12so1775745pfm.13
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 08:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Qwf4Zj5N+1JuJPQNqpXWlgnV03WB+MR9BHzXJZpWVs=;
        b=NZzSe7ukV2JFdz0ofQ0d638TqQdeEQCHVx0JA3VwaYSJ++4RqBpCLwyeqoKKTQCXfV
         UphkvU0KA0gDQZ3dUtARCFmYzkWJvaRuT7ElpeD0LwQnbJOKIeV0CzkNKj4HbqK1PoPk
         /kqbSWOhhfT32gDi9gFKai/39STLKZho2Uw+AoDY+fJEyMUXMvMwV/4ZRKJae/fwqMma
         EWH7gPz66e/ZmekBkB/SkebzLsalkYvrbrJ50SLP1ntiR/riB99t/7lqg6SyF5XJ0Ul2
         OQ6uf07l5Mrvp2RnTZoScuzvc45JofCeDu2lY1Y7Gyhxa+fjTAlp5H9WCTH+59ThMQU0
         mfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Qwf4Zj5N+1JuJPQNqpXWlgnV03WB+MR9BHzXJZpWVs=;
        b=JvWxC9iNosFl96P+YHVMZYRZHIqpn2/BBsm8BnQPBfkqDtNWd4aIZJK5GGzkiAFc3f
         7AZOu7+rkUv93Qz1Ospom2FicsRwNznt2BlPHE/YUCpKsC6qbWOH2B027yxg88E1ji2+
         MPTngiUN5OPe5vxxILSMT0AmRYHP3FYVYn5MyMTfrloOnxLCSor6im445oEMu44/oid4
         3m0O2UjNK9r3DW5cRNtnLZB7pY/xpKqM/Owsnksq87LqNfKYlu60/9uJd9XsdAdmbox2
         rJ0gjBrGvL5PbudUAItlZSjAYnNUjD3qHM4GbRcgNyESZ/PYoqIUVVOIykcDfRaMfeDS
         KxuQ==
X-Gm-Message-State: AOAM530E4qrlNvZCM19fgATHXMas/NQFLP3tN2IV3hfGKXM3JYcjbtxn
        OyO8bg5MXhbKlLEbtUzbFXBsxoi2djhdu2giOUq2PhkbMB8=
X-Google-Smtp-Source: ABdhPJyxl132JNTmcCyVknabcH4bOz9cO5RX0t9ASV4mPcehLQD2gqZzW5Hxd2e3KHm9YY6ST2/C+Hng33A+FJ9ZP1Y=
X-Received: by 2002:a63:d54e:: with SMTP id v14mr3230047pgi.203.1604594094326;
 Thu, 05 Nov 2020 08:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20201104230703.21466-1-coiby.xu@gmail.com> <CAHp75VcczvAHE8wztdFkGE=9QKbPFCJ0wxnE9CGjqayi+oZp=g@mail.gmail.com>
 <20201105144755.rqnq5ut6szauj4az@Rk>
In-Reply-To: <20201105144755.rqnq5ut6szauj4az@Rk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 18:35:42 +0200
Message-ID: <CAHp75Ve4XiAG7hS_QmwOiTLfFabAvgWHUoWxsHUpY+RTdMHujQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] pinctrl: amd: debounce filter fixes
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 4:48 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> On Thu, Nov 05, 2020 at 02:41:12PM +0200, Andy Shevchenko wrote:
> >Missed mailing list.
>
> Sorry, I don't understand this comment. Which mailing list was missed?

The cover letter (this message) has missed the mailing list AFAICT.
How I see it is a private message addressed to me and Linus personally.

> >On Thu, Nov 5, 2020 at 1:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
> >>
> >> There are three fixes (and one improvement) that fix the debounce
> >> filter issues in pinctrl-amd.
> >>
> >> Changelog v2:
> >>  - Message-Id to Link and grammar fixes for commit messages [Andy Shevchenko]
> >>
> >> Coiby Xu (4):
> >>   pinctrl: amd: fix incorrect way to disable debounce filter
> >>   pinctrl: amd: use higher precision for 512 RtcClk
> >>   pinctrl: amd: print debounce filter info in debugfs
> >>   pinctrl: amd: remove debounce filter setting in irq type setting
> >>
> >>  drivers/pinctrl/pinctrl-amd.c | 56 +++++++++++++++++++++++++++--------
> >>  1 file changed, 44 insertions(+), 12 deletions(-)
> >>
> >> --
> >> 2.28.0
> >>
> >
> >
> >--
> >With Best Regards,
> >Andy Shevchenko
>
> --
> Best regards,
> Coiby



-- 
With Best Regards,
Andy Shevchenko
