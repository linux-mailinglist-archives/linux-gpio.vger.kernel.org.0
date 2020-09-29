Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E2927D383
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 18:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgI2QWc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 12:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbgI2QWc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 12:22:32 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1AAC061755;
        Tue, 29 Sep 2020 09:22:32 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id y14so4243615pgf.12;
        Tue, 29 Sep 2020 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BKJN/yDyCCYxNFWHrL52dQqC9q84HtuFjNr51loqPcY=;
        b=B2EVIUAA3FkPzu2No7T13EI7XoaRTOLR658uATIp3Oy3p0Jz/t+IQz8bFSJfibd77/
         Mv4MLLGRXO4nMjAYcgxG18zc/ZoTqja3EUyTT55vp/HCtBbxDsokANhgm4AP5fBX2EOp
         rs5RRYimcbAKI79D9NL6yjUK7Ua87UMo5vildos1tdaeNF+/r12YoUi8TZkW3AWDPqdX
         KgL+l7PdlrBaK79toT6fbLTJ8hV/8A2I0Um5EVZZLN5KC9WSwfpwI8ohqrfqXGZD9THz
         MnDnzAMcHt1xTX2IKiWYDmkH1x8O1M9LCWG4AnnAm1yKEt1XorQ5tv+hTHm/u4ONtoZG
         wdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BKJN/yDyCCYxNFWHrL52dQqC9q84HtuFjNr51loqPcY=;
        b=Dsdstr/z2B2k2XJ+dXyhjg7steTVMI+wIU2Q9YyEZahxNdLhhfnUidhyGSVbrwWloq
         DiqxAdt43/8PCxh8xLh+BWUn5cqSu94XKnnteq4zcfz2seUpG8ZjQ9HHXrtg7IQPzs7W
         AazjXuin9PdM7mM9Hp06UUXM5qdTjKgiUPQYYMhoGCgZFMlx/jzkijH7nq+oJi4ljnEy
         Na7JeDX0lmFbvbnezut+rSw6iZ6wBo/TWC9Qpb1lR6C6shjDLO/pKZbXTjd+jpur46h/
         bC259WnRKWpFpgvLRFtmMbdutuRBKOw6+EXo+oFv3T1nGJ5eNpthyDGduwG6MhVm5i9h
         5OwA==
X-Gm-Message-State: AOAM530sMMcbdlWfFARvYptbOC395VZ7H47s367mkh+RB2uSs1h03v8G
        QwGOtPfEfAfZbZHBJLmtUwJNCwy7GObkAPlaG/HUstDGyZIeVg==
X-Google-Smtp-Source: ABdhPJwncL3xulZxvphj4B4yPllBgQhE1PKACAOSuliBc7Fzw1sQA7LEyVfhLgUmtgNtlLysPOBozVoowniKuAl4XvY=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr4980321pfn.73.1601396551414; Tue, 29
 Sep 2020 09:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200928002807.12146-1-warthog618@gmail.com> <CAMpxmJVV5bCVAbC9WPsZwXqvYvnPLHAqEqky8w-iuPO4pDgeAQ@mail.gmail.com>
In-Reply-To: <CAMpxmJVV5bCVAbC9WPsZwXqvYvnPLHAqEqky8w-iuPO4pDgeAQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Sep 2020 19:22:13 +0300
Message-ID: <CAHp75Vdc4eVA6nLJNhH3R2LVvh4ibuVohmQMURiwPb4WxA_84Q@mail.gmail.com>
Subject: Re: [PATCH v10 00/20] gpio: cdev: add uAPI v2
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 6:13 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Mon, Sep 28, 2020 at 2:28 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > This patchset defines and implements a new version of the
> > GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
> > support for debounce, event sequence numbers, and allow for requested
> > lines with different configurations.
> > It provides some future proofing by adding optional configuration fields
> > and padding reserved for future use.
> >
> > The series can be partitioned into three blocks; the first two patches
> > are minor fixes that impact later patches, the next eleven contain the
> > v2 uAPI definition and implementation, and the final seven port the GPIO
> > tools to the v2 uAPI and extend them to use new uAPI features.
> >
> > The more complicated patches include their own commentary where
> > appropriate.

> This series looks great now. Unless there are new objections I intend
> on picking it up tomorrow.

Various nit-picks, if any, can be addressed later on.

-- 
With Best Regards,
Andy Shevchenko
