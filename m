Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC7E27E575
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgI3Jos (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3Jos (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:44:48 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E85C061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:44:47 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z17so1322964lfi.12
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WL11sBXLZ19AyMPBgN4fqg2oLH3/T9YBMeitWtVqQ/k=;
        b=oy1kHdxJzpUDXc2wgXHmamh88c/bMhDuQMrop7rT2HVN0ZsgOgg3EEUbSmNFm4RVo4
         BWgiMnwg6H+UgV8WtiAyE4T7PSWUOo3E8hMSD06ARwjzT9OCKISx3BlKnI8R/g2pCm40
         lP0AdPq5nFd7esYWC1SmBIx4dOMh8cnBUhHjntqPg9n9yExro26+maHK0FgJuPxlRe0S
         /84Rzy9ldnlMyu4/JAs7kb320x+yDGA31pprdHFu9+QOB9rj+e8u8LZ2DbqtiJT1zwRl
         4BUmy95B0bjsBYmmZCc6QZl90eX7/ZKhYXqIX9Z1JI6WAD2AcVwFmrs+CnuOgfoD0a99
         FnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WL11sBXLZ19AyMPBgN4fqg2oLH3/T9YBMeitWtVqQ/k=;
        b=dRkrnN2pNocLZJJrpDs4sixTdmc/cbyObKwKZkSP4DjKf36nLbU0jDopbq/Ev27kq2
         PpUZWklPoqQeTHkL+i2m6yETpN8OgZM32+/R+IZw3pt6PkHWSQ168U0DCC/8MG362ZBe
         bJ2V3Y9r+foPLrHtfy2VTSwsX9RCI7R/3x0p1gUCFSNhTbiZDBAC4e26p40gD7JEfDVE
         i/dWIbC9hmM9FoCukWQ8871BbkJByjq+EB5ErGmi1EUPrCUI++tlLin+9NmiGcuVcAXH
         qP+JQMW7NU8XIWX/GxpvIg31GiE251rUrjHS+LcDpRhfKyVSoQgoK3C3MJZop6IMypeO
         GvIQ==
X-Gm-Message-State: AOAM530crFpF+LTaTNQ9gxo72alJ+b8GfoYSk4er0rAEACe76X96xiMC
        YaZWfi7aolORWi8s9Avy367e+5zkZ173odiNyPyUoQ==
X-Google-Smtp-Source: ABdhPJwfvMzERH1pqD+3C43rbf+TvTmP7uVIAxU6xyVV2NL+yPxtsPJuV3sBw0UuO9ineASJZM+NQ+jMthA0ESuIUrU=
X-Received: by 2002:a05:6512:370b:: with SMTP id z11mr542708lfr.571.1601459086051;
 Wed, 30 Sep 2020 02:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYgHt6ajbLPfajQ8ZJn9=SHfRiDZV6gDbwAPB8XSQBpGA@mail.gmail.com> <CAHp75Vf2Ztqxfth31cysC3JWpcr813OxG8W3FUBQ4HhCbrd=Qg@mail.gmail.com>
In-Reply-To: <CAHp75Vf2Ztqxfth31cysC3JWpcr813OxG8W3FUBQ4HhCbrd=Qg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 11:44:34 +0200
Message-ID: <CACRpkdY2cQZioG3hY5cyf9WQLMuf_LW0R5B=ArvQ4wvc0cm_Ww@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: tigerlake: Fix register offsets for TGL-H variant
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 3:30 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Sep 29, 2020 at 4:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Sep 29, 2020 at 1:03 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > It appears that almost traditionally the H variants have some deviations
> > > in the register offsets in comparison to LP ones. This is the case for
> > > Intel Tiger Lake as well. Fix register offsets for TGL-H variant.
> > >
> > > Fixes: 653d96455e1e ("pinctrl: tigerlake: Add support for Tiger Lake-H")
> > > Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > I could apply this one for fixes as you indicated in another thread,
> > does the other two patches depend on it?
>
> Logically -- yes, functionally -- no. They may be applied for v5.10
> or, as I said, v5.11 (but in the latter case I will do it the usual
> way, via our branch).

OK since they are all ACKed I just applied all three for v5.10.

Thanks!
Linus Walleij
