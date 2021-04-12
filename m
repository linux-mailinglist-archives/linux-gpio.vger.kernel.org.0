Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0AF35C94F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 17:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241539AbhDLPAt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 11:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237526AbhDLPAs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 11:00:48 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB9AC061574;
        Mon, 12 Apr 2021 08:00:30 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id e13so4197687qkl.6;
        Mon, 12 Apr 2021 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v3JYVjiR9jKtJWTD4qDuq5dNX3ZUXCnHfWel/PniC+E=;
        b=OHigbybxgOy3Whva2GwM//+ZXDCFvHJKIVPZFH8P6d1Fjr5xoMPRS8PfKupK31ybSS
         Aph7ezi1wQ5cR7LC0uuuKRSfP2ISSh53/1Gp13ly99zG2oXt01Fza4prU2bQ4JtA0Cwv
         L+PagGDkzLS4OxWFI+9A2fCuiNIFRLKdqm1D3pb80HY94M9l1w2pe3eaZODblGWZiEvh
         Be7BXNjXrIWq4PdhNkAfWKSB7LXjMthXqLpo/mhMC0mZjwe3ordmdcBh1dagrXOQm+uh
         33njOSrDGNy815H8fws9ZcmKfCj+CRAD02D3dbfLFj5npw892bWr5b5+ys8rk9Q++Umc
         nd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v3JYVjiR9jKtJWTD4qDuq5dNX3ZUXCnHfWel/PniC+E=;
        b=A92EGun771tcXabJ2h08l8SlKLezYgoH6hnhgNYqG0IEqpjU4PKA9Lt+q8XSPxQF4R
         WMVI7J39v15XnyIPLWNTwodRpE75OCspS8fDxuh+QqiIL5SOoQQ6YWZ4ngoaDO7Rp5qe
         jgEyumg80pEnnqGnsuG4XdkbpmNA65iIfYB3JH51yyS/HLef/Cy5sdGEOm1Spjyhg7Kt
         dXfDJi8MiMBqtubemffW+3KmhAOBimG/CIdqdcMs227c0++d0Kvuk8Oy3zxA2bQx3Nn+
         lpR9aFzaYHUMVJNgm+hQ80NiaW+tlYyIKNjKq4ENlsy+EGn6xGgTFIkVcUJfsJFbicy0
         PJEg==
X-Gm-Message-State: AOAM531V0zsc53OvsaoMPI3fgMpjjRla+DU/Vm9gZ6R5/A8Wh12+X7T7
        FEGw0oFRTBNSWHHrGvEwtx5E60V+ddeUK3HPouw=
X-Google-Smtp-Source: ABdhPJy2/7lrVDwSC8uTtwUP/kGE41NTdnm+JG3cZiyCk4tOCrsXU83sgAVjBBG+qaUts5DLorUWzpiDYWwuBcswQPU=
X-Received: by 2002:a37:8346:: with SMTP id f67mr14706760qkd.94.1618239629721;
 Mon, 12 Apr 2021 08:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210411133030.1663936-1-pgwipeout@gmail.com> <CAHp75Ve=1EbJ1qOjnTLKOwvv-UKLfxMHS-UUp=ET0zoJ9fV=ng@mail.gmail.com>
 <2004066.IobQ9Gjlxr@diego> <CAHp75VdWES51UPiKayYZ15Mr7pS-Aaz51hKNFmyhbv2JqwPwPA@mail.gmail.com>
In-Reply-To: <CAHp75VdWES51UPiKayYZ15Mr7pS-Aaz51hKNFmyhbv2JqwPwPA@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 12 Apr 2021 11:00:18 -0400
Message-ID: <CAMdYzYrSwLd7zAo840VvQNs48ki1kwS2LdL+N96aVKrmrMRWbw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] gpio-rockchip driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Tao Huang <huangtao@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 12, 2021 at 9:34 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 12, 2021 at 4:30 PM Heiko St=C3=BCbner <heiko@sntech.de> wrot=
e:
> > Am Montag, 12. April 2021, 14:13:37 CEST schrieb Andy Shevchenko:
> > > On Sun, Apr 11, 2021 at 4:35 PM Peter Geis <pgwipeout@gmail.com> wrot=
e:
> > > >
> > > > Separate gpio driver from pinctrl driver, and support v2 controller=
.
> > > >
> > > > Tested on rk3566-quartz64 prototype board.
> > >
> > > Can you give a bit more context?
> > > Usually separation means that hardware is represented by two differen=
t
> > > IP blocks that are (almost) independent to each other. Was it the cas=
e
> > > on the original platforms? Do you have different pin controller (or
> > > it's absent completely) on some new / old platform?
> >
> > They are separate on all Rockchip SoCs.
> >
> > I.e. the pinconfig (muxing, pulls, etc) is done via some registers insi=
de
> > the "General Register Files" [area for misc registers]
> > and control for the gpio functionality is done in separate blocks
> > for each bank.
> >
> > Lumping that stuff together into one driver, was a design-mistake
> > from younger-me back in 2013 ;-)
>
> Thanks!
>
> To the submitter: Just for the future, please elaborate such things in
> the cover letter.

Apologies, I only rebased the work and reused the original cover letter.
I'll keep that in mind if this sort of situation arises again.

>
> --
> With Best Regards,
> Andy Shevchenko
