Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D8E453A3D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 20:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240063AbhKPTgg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 14:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240016AbhKPTgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 14:36:36 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56BEC061766
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 11:33:38 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id w1so26642928edc.6
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 11:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1PInJfkxJ4deqRH6U7Dsrumlg8npkaytGSGqMknYo+Q=;
        b=wmdovI4VQU4FfcplTBNara1gm0/+hJKVtFOahVBFynl5rZQgqnf6a8YNiajrToETLk
         xyv2GbNeehsUrhmzxDuCCQKDKA8z1ISyKKVQXwBnabaQLtlSDkaO3SMbAXdP0qH1hnkK
         rN6s8kjPcc6poOthijYMkNjIwQz2qIVr83a9a5HkEORKXW5fhuZzRVe/773tjoHI5r3L
         vWhjza+Ye6WQEAzVT5EsgJNEJrn/MKPX9szfZm88X0V+sZbgFUQueyiWeqbIkdaBNCYx
         pmyy4PtHjOXfJ0iHM03h8Ad+HaRYUUypxBMkgCnzotInkQCHkougX5saXIKJ53aOIPam
         GlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1PInJfkxJ4deqRH6U7Dsrumlg8npkaytGSGqMknYo+Q=;
        b=6Dvpxvhqhusp+wqNmLydn15SjoFVbv3xFQIRBP+Co/sw9E9eK8XkfO6KlSbseEZt5D
         SWju2BHVgQKAWI6V8IKSVjrcqhqGSYq9/SJP0az6Xfzy7xi0ZCLN8YqsbeNBe1s81lEl
         LJnWeTCwzSCY0yGm5KzwFuGu46PBJh6WDlX37tU7d19H3x81UBn/UnvaLd4x0Zpzg3gC
         8lRlcwk96zcm59ZoIiVLr07zGhQ7GmXZ8Zk1bGaeJxW8Ap/F7a8hxE1ZDz5x8q4a0ga1
         NneRo1aKNCw0SZfkt45RV9qxPlHN4FADl31Qo7XPE1IHjN3ZaYf/PSNeHN5HCyFtyiEw
         n+1Q==
X-Gm-Message-State: AOAM532b+TFfps49IAQESN6k3sgzSvNKEdQ5Ty3DENq39L3bMVPJgMw9
        1A4PBOM1/vqjJBaDMpkCGTd4CJ6KxIdhk8ersRymSA==
X-Google-Smtp-Source: ABdhPJw+ZH9eZTF8jlmn7+anZwKdDqBuLDs7M2m5tn1HPoRgRVunqCBBGYMlmMcp4fBLP6/fY6EVfLp8YlPSrE/7D/w=
X-Received: by 2002:a05:6402:1e93:: with SMTP id f19mr13640495edf.60.1637091217376;
 Tue, 16 Nov 2021 11:33:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75Ve_qS0Qc8XLHLwFnWEPzQtgNfEeVr8q9L4gK2m5a-By0A@mail.gmail.com> <50c260a1-c6d0-1a0b-45da-ab1a2d1379c3@gmail.com>
In-Reply-To: <50c260a1-c6d0-1a0b-45da-ab1a2d1379c3@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 16 Nov 2021 20:33:26 +0100
Message-ID: <CAMRc=Mc-+ZR1PR9p=cXkfMWdKn1d1VCxmhBknSzNaDjepfpV-g@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/4] Drop ROHM BD70528 support
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 7:41 PM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> On 11/16/21 18:10, Andy Shevchenko wrote:
> > On Tue, Nov 16, 2021 at 2:52 PM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> >>
> >> Drop ROHM BD70528 support
> >>
> >> Unfortunately there has not been a big demand for ROHM BD70528
> >> IC. The few users I know control PMIC from separate M4-core,
> >> which is not running Linux. I am not aware of any users of this
> >> Linux driver.
> >>
> >> While I did really like this IC and writing the drivers for it,
> >> seems like these drivers are becoming useless burden. So, I see
> >> no point in maintaining them. Let's just drop the drivers if
> >> there is no objections to this series. :(
> >>
> >> The regulator, WDG and power-supply drivers were already dropped.
> >>
> >> The RTC and clk drivers remain in use by few other ROHM IC drivers.
> >> Nevertheless, they are already converted to not depend the BD70528
> >> defines during previous cycle.
> >>
> >> This series cleans the remaining pieces, GPIO, MFD, dt-bindings and
> >> MAINTAINER entries. The GPIO code uses defines from MFD - but the GPIO
> >> part is also depending on MFD KConfig entry - so there should be no
> >> breakages even if the patches were applied to respective subsystem trees
> >> and were not carried via single tree.
> >
> > FWIW, no objections from me.
>
> Thanks Andy!
>
> I see acks from Andu, Bartosz, Lee and Rob. It'd be nice to see ack from
> Linus W too - but other than that - I guess this is good to go. Any
> preferences regarding the tree(s) that could carry the patches? All via
> MFD or each patch merged to the subsystem it fits the best?
>
> Best Regards
>         Matti Vaittinen

Normally Lee takes MFD patches together with those touching relevant subsystems.

Bart
