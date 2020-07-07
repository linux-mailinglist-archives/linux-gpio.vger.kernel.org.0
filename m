Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA71216AF9
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgGGLCx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgGGLCx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:02:53 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128D3C061755;
        Tue,  7 Jul 2020 04:02:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e4so49409855ljn.4;
        Tue, 07 Jul 2020 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aWwBseGTVDXiJkYtAKCkAUkk39ix/lFhX+YfwYfBbjI=;
        b=k5svzcSz+XoiPh+C6HWvskDhKzxH9UTYpDwVKd3tIzgZ2PyTKNDiqy+5KWCo7TkDn5
         YrkE+GlGFo/uY1r192T7lY+YMTvX0/KYDt1/CZ/2GpFGBTd7P9hB3jB999PSN0y27fsJ
         O/0iNGfpkq3GhjGfSKRQb85VCXz0ZSaAesEOU83nTHDlDp2DoX6NdiBRYXFzpPAQRebw
         zFfD2cQtZ0SPOz9iUroyTddWpTNsnF3zmFlNfbsjFalKNQOe+2U8S/jG1JocYknVGpkN
         JM4Ku6Q/5OOYbR+VxKO9WeOwrjwtoNHa+AN21ESDsix/xcRNOu/hXKUdj1zIHg9IWeV5
         exeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aWwBseGTVDXiJkYtAKCkAUkk39ix/lFhX+YfwYfBbjI=;
        b=XSkQCefdeplt2leZA/FsyOSzXIFweborviDcvreKTaehFqp+kEbRBYYSlhhYpDYSPA
         STXcSCrwJApEoyZeHtXiGt9vqNOAQUKlJ8bGF2V+q/B/vLyOYXBEA89yjbYK/XqY2XWS
         sgQX1HIv9agg/0nFITNK2cNqntdEVxDtTuZSV+qXzsFn6cUmN5bd1g+aPYcOB4LqQrx2
         U2Gya3JoCvr9ffcgsj6jhX5m91CE06vsQXw8Xtfq5tcNNx10wODtDVYEAxvXVKoZtXL2
         JWcfQ6f/3STdgHCKyCNxDtKJGEfJo2aQHXWpc2mBJr0qyGfuXTQjys0tuuiCTWOuneXk
         YdhA==
X-Gm-Message-State: AOAM533sjWFKxjobcbn/M469fSa60OYAsclrwI3sNH4pMfi0fieeajDB
        jm2lhEsJs/3ZVKo4bMzhbMFwg9OHLNA8eYG4fE4=
X-Google-Smtp-Source: ABdhPJwg0jwUnhzfXJdR01PC7H4SAPZiIihCHzCURRHnSAuWe4SEeuO52vdMwFcwMwooklFLn0Ra1r5JurGQndzab9w=
X-Received: by 2002:a2e:99cf:: with SMTP id l15mr30474201ljj.294.1594119771434;
 Tue, 07 Jul 2020 04:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200701013320.130441-1-drew@beagleboard.org> <CACRpkdY3mUjczkJhV9BdZhUJGOgrbOMJnciBjOaPg6c9XUt8Ww@mail.gmail.com>
In-Reply-To: <CACRpkdY3mUjczkJhV9BdZhUJGOgrbOMJnciBjOaPg6c9XUt8Ww@mail.gmail.com>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Tue, 7 Jul 2020 13:02:38 +0200
Message-ID: <CAEf4M_ArGSpN5-7_zt6mQaWm8XkqTcQiOnCbs3_obCipDC1KNA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 7, 2020 at 1:01 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jul 1, 2020 at 3:33 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> > Currently, pinctrl-single only allows #pinctrl-cells = 1.
> >
> > This series will allow pinctrl-single to also support #pinctrl-cells = 2
> >
> > If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> > pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> > get the value to store in the register.
> >
> > To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> > omap.h is modified to keep pin conf and pin mux values separate.
> >
> > change log:
> > - v4: squash patches 2 and 3 together so that git biesct will not result
> >   in a boot failure
> >
> > - v3: change order of patches to make sure the pinctrl-single.c patch
> >   does not break anything without the dts patches
> >
> > - v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
> >   compile error in dtc.  I had added it per suggestion from checkpatch
> >   about having parentheses around complex values.
> >
> > Drew Fustini (2):
> >   pinctrl: single: parse #pinctrl-cells = 2
> >   ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
>
> Both patches applied to the pinctrl devel branch for v5.9!
>
> Please make sure not to create colliding patches in the DTS files merged
> through ARM SoC this merge window.
>
> Yours,
> Linus Walleij

Thanks.

Which repo/branch is the best for me to use if I am going to be
posting any further dts patches?

-drew
