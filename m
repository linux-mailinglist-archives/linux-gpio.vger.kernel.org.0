Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620D339D5A4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 09:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhFGHOX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 03:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhFGHOW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 03:14:22 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65A7C061766;
        Mon,  7 Jun 2021 00:12:16 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso15763512otu.10;
        Mon, 07 Jun 2021 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4laDKWizxMRTWJeK1bmtcZo8viWJSxK47fdeYF6K918=;
        b=YLLpsZnf3HZnm8LmxGahyfPr4u6yFkot1cfYVSVPpCO2MpvA4Y7PxR6JlzzU0xiU+j
         O9M0oWIXf/cBZVK+6e+JX5+Vd5Y5VJo8bBVuC+IXmlxPfW5jLyeBlUkwwFI6OwYM45HP
         iHaWfJav0phhM+OE14+mmPzonbtyTVbmH7zL2oZ+lQr063TPy/hlucGwgn9IboxWDM/J
         +mGBa5i1a8Ivpy0hqX6tCscEQlD90oDGLBc8i1Ea2i/h6k1iU7yMPFlRtLVeOyuVB3i8
         RH5R4m3y/1XmFY0+x3riK6kPGGs2CeZ5al3/ZZ+1ctKG5F+vaf2e9I9ipKMypsuHv4tD
         SVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4laDKWizxMRTWJeK1bmtcZo8viWJSxK47fdeYF6K918=;
        b=BMyGTBZyowhZTe2/6AEDRsa5D2y88gSdzasNZ+wVCJgTedBDFssWxyy/j9trK5/6zk
         T3VhuH1SSOw1tBzkErURJuoibO/ZQX6SFlFWfTmAxIwUMLDO6KCy0umnwF1yfc3Eod+b
         GE33lyfRMID03ro4Pt3hDcvpGLHBlJHL4Xtu47BEdVP3olt5gZdRohYDvBz4BxWJeEu2
         IgO0uv3+R6IBBlZz06Lg4OFnyssFv/IZTj9djbEx3Ha6yhoZB5N4MvNBmXBvDWZKEuPB
         XPRc6INhKe16fuHzZVdY4a7HG8mS9HkVVTqWhJ74yzixwvqMrNQhJ0gPGGZsTsm79a8K
         vBtw==
X-Gm-Message-State: AOAM532fPz0OoJT+Ug4rP9XpUp8LWKTCz7iOXlH+oFCEK6iWBToytvt1
        HRpRI5NyVR82BgaMMG4ZKt9NkQ08Dpl+Jxi9CdkMAHz/MXE=
X-Google-Smtp-Source: ABdhPJza2sXXp8y/aoj4BcEn4Gs/f1mRIKtiVhnDLh90E3441M+NY5kHL2KdYO0iRpA4HCCarFx6FT4jXH4+JHtoYMU=
X-Received: by 2002:a9d:4592:: with SMTP id x18mr12612447ote.74.1623049936152;
 Mon, 07 Jun 2021 00:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210604055536.20606-1-sergio.paracuellos@gmail.com> <CACRpkdbmu32csSoptceUcaVYxXSFwk316k5Ru09KCodvLXMOPA@mail.gmail.com>
In-Reply-To: <CACRpkdbmu32csSoptceUcaVYxXSFwk316k5Ru09KCodvLXMOPA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 7 Jun 2021 09:12:05 +0200
Message-ID: <CAMhs-H9q4ZX_wpO1m6Dk-+LJtXBHiHVcfdE20GB3-u_49===+g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: ralink: pinctrl-rt2880: avoid to error in
 calls if pin is already enabled
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Jun 7, 2021 at 9:10 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jun 4, 2021 at 7:55 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>
> > In 'rt2880_pmx_group_enable' driver is printing an error and returning
> > -EBUSY if a pin has been already enabled. This becomes in anoying messages
> > in the caller when this happens like the following:
> >
> > rt2880-pinmux pinctrl: pcie is already enabled
> > mt7621-pci 1e140000.pcie: Error applying setting, reverse things back
> >
> > To avoid this just print the already enabled message in the pinctrl
> > driver and return 0 instead to don't confuse the user with a real
> > bad problem.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> > Changes in v2:
> >     - Fix commit message s/is/if
>
> I just fixed up the commit manually instead, no big deal.

Oh, I see :)

Thanks!!
    Sergio Paracuellos
>
> Thanks!
> Linus Walleij
