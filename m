Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D29372F13
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 19:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhEDRnC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 May 2021 13:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhEDRnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 May 2021 13:43:02 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA0AC061574;
        Tue,  4 May 2021 10:42:07 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id h11so8564702pfn.0;
        Tue, 04 May 2021 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SglDWfuEzwD2ZuEt5Yy/WwMNvHiyKUl+FRTkRohMPAQ=;
        b=TVbHP+Q3oP1gC/blTdNXdztQyAMtGnwSUEA1Hi0IjaNnXWtKXYL9i5L3uQrrJxBpXY
         JikpDT2GWp+NTiEXz531RMHpCTZ5HaLt1I7iWnqkQgcAt2nZdbccFife2Cq9/oco0Iqm
         GapluggfxiSUKjiK41TYnN7r2D2/PNYjtWwo/ngsYchBF08yatD21yK2AhOxsiuDPeg9
         c5FteI2OukDusV/zd4udZ6qH0kOuZB0z769rmGmPL7GDLjaEBnTOD80jspwpeHncaA9s
         YQT8DgLO01Espgr2Z/t1C5Ak9UouAxAyOsx1e2j+PUKG49Uy3V5LVtQtLRLip4icYHw4
         TBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SglDWfuEzwD2ZuEt5Yy/WwMNvHiyKUl+FRTkRohMPAQ=;
        b=S7DOmzxGRKcLxTVsuksAC7keefQv05rw9sB1pAaW5SwlB+lg86cZl5z/XjXgb3K8Y6
         o7n/qFLoMqtJVGcDJa7/i/WplYG2wszNeEXE1gGvu+IuIayNSoWzTF5qkdBN6btenJUF
         bi4qPUPVSeypvgdsZNvlcIcmmHWx5BPyST9OdJKKtlN48HsczctezGnAxC8jXJ0UmOWw
         NZ/wa2MW/H3RXk4DgRmY9w8k/ndZWNlrps/7NrNjQ/IBhdA/GLrasB8Dy3NQg/qiUH/q
         q/O2JQpc7lXyr0oQfzeYO/6iWE8yqmyAm0qkIocl7GrBtV0XmIjczxAQD03aol2D+m/A
         7sxA==
X-Gm-Message-State: AOAM5308ZtsGjVqy6ggzD/r9X57c6YoWFlizLGwdQFtiGkpu1OdogrTn
        R3beMNTzrVIAPNOjFn02Y9YwFDqKKMs9QVyjKHQ=
X-Google-Smtp-Source: ABdhPJzkwRKKoqIThn0Dd6gmy2yZ+6nezkkhd1L/O0RirTqwlLCde363PaXstRJiascjOSrDR7EoJ07QqJWdQzWFCW8=
X-Received: by 2002:a17:90a:246:: with SMTP id t6mr14358173pje.228.1620150127211;
 Tue, 04 May 2021 10:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210502193216.24872-1-brgl@bgdev.pl> <CAHk-=whSWp3exv8tZ2th5im_P7HF=c6iuOOVb9iSrNrd6405WA@mail.gmail.com>
 <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk> <YJCpnvKUNx+Tc+vg@zeniv-ca.linux.org.uk>
 <CAMRc=Mdh9LvUQCxcyt7ZBjitDB2noVnOptft_VORDhffxJaeCA@mail.gmail.com> <YJGFsrPBoQsKj+JZ@zeniv-ca.linux.org.uk>
In-Reply-To: <YJGFsrPBoQsKj+JZ@zeniv-ca.linux.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 4 May 2021 20:41:51 +0300
Message-ID: <CAHp75VcbWE+2d=LpkwLGcLEdO14vhhPVk2bD0+jKKnXiGoeZXQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.13
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 4, 2021 at 8:35 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Tue, May 04, 2021 at 04:17:02PM +0200, Bartosz Golaszewski wrote:

...

> So I would like to see the specifics on that as well.  _Before_ signing
> up on anything, including "we can fix it up after merge".

Bart, I think we need to split your PR to the patches w/o configfs et
al and submit to Linus to avoid missing a merge window. This stuff can
be queued later as an additional part in case being ready.

-- 
With Best Regards,
Andy Shevchenko
