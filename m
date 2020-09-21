Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25969273527
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 23:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgIUVsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 17:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUVsc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 17:48:32 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14EA4C061755
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:48:32 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y2so15711238lfy.10
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E5ib293wRal30WVmPAHyB65/rydQZg86kEsOdi1hAAQ=;
        b=mTbYuudoGNb5cXyj3uRewmp9ZkNjajrFqpuH1RVo4zc2GI6WfLzingF5WIYB2T0Iag
         /uX4k3Qspaf8Hp5GCWwysMyaUf07JO1v3Y07/+K7u1nzaFZrNamBK10W/iyYzHD9YXFn
         VqGcdrpdIrMaINayw0U9qZOr9nwCWdNsmC6va75Ja1VQKI8ig/j2w+UGQkXq+k8DAktk
         IFjchqW/NkMnqhn3k045nFr/3m0zEm+KcZbMpWO4fZUxG/AUsy/a6DObztvHKPYUfs4R
         SK1ZQzagJrVD2tKa4QQHu1Xf+ilOoGN/ZPJiY07ZXbl0S9DFJ9U7mYXKgdNCE8U+Zm/W
         nbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E5ib293wRal30WVmPAHyB65/rydQZg86kEsOdi1hAAQ=;
        b=WGEoRCRWMH+GnVVnNyPWtomMVGf0OUgikdF8OrvKGf0nL4w5Ww+GmENU34EbHw0rX3
         qv2ssBVPkIf2zG7UYtB1cDpC2facJ1VfkGYI7sXoaBMSeGkbt0sCfxdILx7MZ8SvcamJ
         HI+d+yeamyjAmEea6jwiYsUGl29YnZM4fb9VtLal9xu1o6axnyiYderAUCnyNd39SKHb
         XRmALOYT9yOBiS0l/Tp0YGEA4lLkUXYHCCPpUmS47RUeW0cpA2NYGyt5LsxACKq6rRm3
         wuMCbnuFhbTaFgcrLYjTxuWBEwCWS9zpFXLReiteMcRknzmZvFfWOOhRAQEOvtPCAURz
         Nx6Q==
X-Gm-Message-State: AOAM532BUofDACE+X757jU6p2M1qW0IP46/iEUNd/3A0CXPvCaLh3kkN
        8OiE0pks3wxK1XWyIEF0NqrC2gHRgffTuMquIVzHQQ==
X-Google-Smtp-Source: ABdhPJztKSLwDNrfa1sGIOhLjP5ylktj8D5GTWRDiaj3SryXwqe4tWwZY3c76qOvJj5sN7S/SgYnQmjKvOXSO4sb8nw=
X-Received: by 2002:a05:6512:370b:: with SMTP id z11mr553864lfr.571.1600724910412;
 Mon, 21 Sep 2020 14:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200914155714.GA43910@black.fi.intel.com> <CACRpkdb7tP-Zz0ycpss885nWOx-LoT6iPmRT5b-FrBM+x8aLpA@mail.gmail.com>
 <CAHp75Vd0L7AZnWfZQBycztS_OEORb4J=DQpS_cjdOf5cSOQRkQ@mail.gmail.com>
In-Reply-To: <CAHp75Vd0L7AZnWfZQBycztS_OEORb4J=DQpS_cjdOf5cSOQRkQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Sep 2020 23:48:19 +0200
Message-ID: <CACRpkdaufgS_LKfRvGCm0BXgrHyXfaVkMrqLh2ypf-bjDhJ93Q@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.9-2
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 21, 2020 at 11:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Sep 22, 2020 at 12:08 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Mon, Sep 14, 2020 at 5:57 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > One fix for v5.9 cycle from Hans.
> >
> > Hm the pinctrl fixes are based on v5.9-rc2 and I got a ton of changes with this
> > so I suppose it is based on some other -rc.
> >
> > I will attempt to just cherry-pick it to fixes.
>
> It will break fast forward. Is it a problem to have v5.9-rc4 there?

Not really other than it is kludgy to merge it in, but is it a problem
that I just cherry-picked it and signed it off instead? Is something
built on top of it since you're concerned about fast-forwarding?

Yours,
Linus Walleij
