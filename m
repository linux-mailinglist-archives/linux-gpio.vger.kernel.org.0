Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5563F27EF46
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 18:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgI3Qdy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 12:33:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:33014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgI3Qdy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 12:33:54 -0400
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EE232087D;
        Wed, 30 Sep 2020 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601483633;
        bh=1O4lOqfyVB4oTb4crlwIc0lAP0SUUw2QidU8mzgA6Xw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TO8SqM/ZFmVTJLnCSlBppXbSIh9FIrsJ9XgLZstk7U9AvTy3zxi4LgiUe2rxc6gxT
         7QMpdjpMM6inMlenW85XE3Xdo0uJaVLwuPoo54Nv053Pc+2qdo7dqUEU96q6ND3V1A
         kinSJ4UzVFWvs6B6a+RrbPokLvdIHNwmefMYHqEw=
Received: by mail-il1-f177.google.com with SMTP id f15so2339709ilj.2;
        Wed, 30 Sep 2020 09:33:53 -0700 (PDT)
X-Gm-Message-State: AOAM532YW5LXa9/nkbgJUfk3x8k1qezK5J+Uiu7qw6/frFDCtxGw1Y7z
        RL4MScu50XGWIV2gv1H2jp+kGO/UddQlMGnPeGU=
X-Google-Smtp-Source: ABdhPJxXM2Kr0C/YtBqYVYU1FPUtTxS5zLOfFi5/zR5/xuZTLomxJNlDGyhFBdcKLMwwtM+l7Fs8uZnNR9LuUdTsFF0=
X-Received: by 2002:a92:d842:: with SMTP id h2mr3008966ilq.176.1601483632564;
 Wed, 30 Sep 2020 09:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200821075452.1543610-1-enric.balletbo@collabora.com>
 <99821f85-9a38-7591-f982-872603b6ce8a@collabora.com> <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
 <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com>
In-Reply-To: <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 30 Sep 2020 09:33:41 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
Message-ID: <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Free eint data on failure
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>, hsinyi@chromium.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 1:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Sep 27, 2020 at 7:57 PM Sean Wang <sean.wang@kernel.org> wrote:
>
> > v2 seems the same with v1 or I was missing something.
> >
> > I just thought we call devm_ioremap_release to explicitly to free
> > resource when a certain failure occurs after
> > devm_ioremap_resource?
>
> What is the semantics around mtk_build_eint()?
>

mtk_build_eint is to add external interrupt function to the
corresponding bound pins.
mtk pinctrl driver still can work (than means probe() successfully) to
keep pinctrl functional even with there is an error in mtk_build_eint.
So the patch is used to explicitly free those data on failure in
mtk_build_eint to let unused data is being free:ed immediately.

thanks,
Sean

> If it is called on the probe path no explicit free:ing is
> necessary: anytime probe() exits with an error code,
> any devm* resources will be free:ed.
>
> Yours,
> Linus Walleij
