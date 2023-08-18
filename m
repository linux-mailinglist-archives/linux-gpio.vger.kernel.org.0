Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE9A78064A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Aug 2023 09:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358160AbjHRHYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Aug 2023 03:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358155AbjHRHYC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2023 03:24:02 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C06530E9
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 00:23:59 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d6a5207d9d8so2461619276.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 00:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692343439; x=1692948239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz9K2Onn9bfdPHQOzQCpvpbaVuSxlfPcU0V/gxVc1x8=;
        b=bdM1VMSqbQBDTDMOeZpLfaki3CWKXw+jA3z7OSR+YpzPl5YvDBW34kCagk4AN02GlA
         Obw2rtIRv36w/kdfv6YX9MBZkSRmCBqocJjfDJOtErktGR6D6PO6uOHM7RE/mgMH95Qy
         0h3rbzhFfhdGfbfEp73+A7bIgXO/xGm7kMIYFhk34M03AmWkynh+nw9Q7FNCABat/ew7
         cAy9zAYHJJJpI+FWUyWcdx+wNqPKZMe4Zl2XShHow2wTg4oEJEwe5XCwIkI6CU5kVnYQ
         8qQkpuZD26oSNFXfuUUWDC5qz6KMom8XXOmwLtyNOG8uWtvC6J5mmqrWe4DhzzTTWBDS
         ZeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692343439; x=1692948239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sz9K2Onn9bfdPHQOzQCpvpbaVuSxlfPcU0V/gxVc1x8=;
        b=AeilFYG9C5PHiKtarSuEmwPAHB1U7H5eEk6e3NWZmpGzk3P13fXrc9aGg9PAHhtPmG
         v5agtxzH3K8IN+UYcoNie1mJWtVYaUAtQdtEYWH6K1ldcKi7JRt5ZBDCvKdcw4JAJJ/o
         oTHC/iO5uhioHefjBNiSkH+ZTRNrZCOjR6dmvTDfnHG75wUBEkF+XJhvJq3njgzIDuk/
         feQufizb4JAMgwnRjnMZ/I7dnlYPWmCf80GWHNB7X3AscopyCexK/XE1YghcilUFEVID
         MhCNVaQB3dZT75nq5gTJEUPGB5Qn7FejSATHRU9Q6NHvX0T1ZxwVr8tfj8jXbKV9nfvp
         /wzw==
X-Gm-Message-State: AOJu0YxvRvilbAUa4ZyU61wSvWM/eMpHoDy2MLyQg+JN+4GrvbvVgFlw
        lIouPIUOrQsTrGNF4Wjh/cCLKDOYD5fX4ukYf9kAmw==
X-Google-Smtp-Source: AGHT+IHqkKgS6YVBwP4qI0oCi4uxhD3rHqRdi4aJZEjqBGn9de2hQzw+rH9P77hToYt5Jc5mptuYBhKewoUBmtL25C4=
X-Received: by 2002:a25:b189:0:b0:d4a:499d:a881 with SMTP id
 h9-20020a25b189000000b00d4a499da881mr6183417ybj.9.1692343438796; Fri, 18 Aug
 2023 00:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230815131558.33787-1-biju.das.jz@bp.renesas.com>
 <20230815131558.33787-2-biju.das.jz@bp.renesas.com> <CAMuHMdV852knZ6UoGO-_B=xir=uUJZx2O1CHL+nsK0_BB_hStg@mail.gmail.com>
 <CACRpkdbWT333HNgSc0HMUvgDBkJdEvb23ZSHsQd-yfCOu3N=Ng@mail.gmail.com>
 <CAMuHMdW658cXSAHow3FoZU1DvXioktP68fBK2nQaGGFw0DDmtg@mail.gmail.com> <CAMuHMdUzNR4vdcu_hxp=mQ0VTWOdcdeg6g5uFw0P2HG+5rGKRg@mail.gmail.com>
In-Reply-To: <CAMuHMdUzNR4vdcu_hxp=mQ0VTWOdcdeg6g5uFw0P2HG+5rGKRg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Aug 2023 09:23:47 +0200
Message-ID: <CACRpkdbUkvjjrvZ_XX14BqznytmQ=M4pWh7fLdZHH7qJUxiK2w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
 dereference in rzg2l_dt_subnode_to_map()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 17, 2023 at 5:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Thu, Aug 17, 2023 at 3:54=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, Aug 17, 2023 at 3:38=E2=80=AFPM Linus Walleij <linus.walleij@li=
naro.org> wrote:
> > > On Thu, Aug 17, 2023 at 2:44=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > need protection by a lock.  If no one objects, I will back out that
> > > > change myself, queue this patch in renesas-pinctrl-for-v6.6, and se=
nd
> > > > a PR tomorrow.
> > >
> > > Shouldn't this even go in for v6.5?
> > > Or is it non-urgent?
> > >
> > > (Maybe I already asked, I have teflon-memory.)
> >
> > If you're still taking fixes for v6.5, I can do that.
> > Else, it will have to wait for a stable backport after v6.6-rc1.
>
> IOW, please let me know if I should move these 3 commits to a fixes
> branch.

I'd say that is up to the driver maintainer, hehe :D

I can only determine if changes to the core or my own drivers
are urgent. I am hopefully sending some fixes today but if more
urgent stuff need to go in, such is life.

> BTW, they conflict with commit 060f03e95454a0f4 ("pinctrl:
> Explicitly include correct DT includes") in pinctrl/for-next...

Yeah, we'll figure it out... I think. Worst case we toss some
merge conflicts at Torvalds.

Yours,
Linus Walleij
