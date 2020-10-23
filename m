Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE593296DD3
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 13:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463083AbgJWLjC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 07:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463074AbgJWLjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 07:39:01 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBA9C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 04:39:00 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id z2so1023416ilh.11
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ttz2ilgA446ExsqCLGvLmvHvdKfHBC6wXKJPciYxVW0=;
        b=bWFdD9MQgf4j6z6Gs4HXaK3ghwOZG16sFXzr7Z1AeE8ikTEV/VMRtgaRGiP88Emk1R
         F249iFW6Eew8vXNOkztFlt9Nnr63Dc/ELAYkwTEikT1cn6/9bQEXJoBpUR4ZOklqL/0G
         egjjtYzh2M/CuUyrNgVA+uscwCJUwYq4geJT7zHPx3Ul3TSbhzuKITLGCW+6vRmEks/9
         2enFMEIZyldwOq3rS3aQy3jqUpCo8CyggtRHhcN8dhmogaFpS8SN+f7dJb8iMoAOa36W
         fMTZCVrgue+mUD4oKyd9osSmLh4ZkbCMikR63P+mu5WJPtATzXArmsjSAG0pR3zxadRI
         uRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ttz2ilgA446ExsqCLGvLmvHvdKfHBC6wXKJPciYxVW0=;
        b=sbrUJCTg/ijRTPdf8i4vGeasAy1HR9rIv4qzYZT0oQpWqJsb2v2iOywfX9Xt38t2tB
         MXpy1gRbu9QW8swZSAdMybQf6Hpi3N06gotUlhrMOH2DkbWo4LdpKyHMeiky6R20/XJD
         uwyHGX9Jl2bPIFfBQmF8pfT+NxcRmUqzgWvTmPb1hSJcbQVDoDULzz/PhMppwKLQ4G89
         ueXuVQmsPypHj/1DKi9SG6kYT5zDS4hLHP/NLxubU3tf6dTcGJxzDd4yWrWfQtWSz1qH
         HGF6gMxExYyjow4o1uGcLtQ43FAc291uQPQOdAuROePk/wUu0FBv135f5Myqta77MW65
         ygIg==
X-Gm-Message-State: AOAM532t+IrMrAcvrXfQ1cYVrfa0qcpVpp7jGBwwlzJlTaSaGhhH7Tcg
        FmLBtgYZxEg2b16GPWSObRUDznfXQBfD+FvAAOax7Q==
X-Google-Smtp-Source: ABdhPJwg1PrjQ+ZuwlXUv+VRQbW7YPhwfZ9pBmb7LKW/UZU8fQqcVCpqDkPHtXb08eizkRZiXkXoKj80fhJ1EHF1SmI=
X-Received: by 2002:a92:b610:: with SMTP id s16mr1400290ili.6.1603453139807;
 Fri, 23 Oct 2020 04:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201023092831.5842-1-brgl@bgdev.pl> <CAHp75VeiGSJO5XnpQLMs=0nT=otVjC1tOsR7xp1gJ3tLHwUTaA@mail.gmail.com>
In-Reply-To: <CAHp75VeiGSJO5XnpQLMs=0nT=otVjC1tOsR7xp1gJ3tLHwUTaA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 23 Oct 2020 13:38:49 +0200
Message-ID: <CAMRc=McD7jtBQ_CPV26Pzr63T6-o_aPpYt_CT-48H_mGuhxrGw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 12:24 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Oct 23, 2020 at 12:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >

[snip]

>
> > +struct gpiod_line_bulk {
> > +       struct gpiod_chip *owner;
> > +       unsigned int num_lines;
> > +       unsigned int max_lines;
> > +       struct gpiod_line *lines[1];
>
> Why not '[]' as we do in the kernel?
>

Because I want to be able to store a single line in this structure if I do:

    struct gpiod_line_bulk bulk;

Using [] makes the size of this structure not take into account the
last array member.

> > +};
>
> > +#define BULK_SINGLE_LINE_INIT(line) \
> > +               { gpiod_line_get_chip(line), 1, 1, { (line) } }
>
> Hmm... Perhaps union can help here?
>
> union {
>   struct *lines[];
>   struct *line;
> }
>
> num_lines == 1 exactly defines this.
>

Nope because gcc will scream:

error: flexible array member in union

Bartosz
