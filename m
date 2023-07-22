Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F5975DC89
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Jul 2023 14:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjGVMaj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Jul 2023 08:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjGVMai (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Jul 2023 08:30:38 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7204FE0
        for <linux-gpio@vger.kernel.org>; Sat, 22 Jul 2023 05:30:37 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-48133dc9820so976218e0c.3
        for <linux-gpio@vger.kernel.org>; Sat, 22 Jul 2023 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690029036; x=1690633836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAq5/Jl2kFOPPBWJ6Pf8zB2DGLud3TAf62/km0FunJ0=;
        b=KiOM/zvlJFaOYFR81lqq/OQnA9AVYsk0MLuYUjm+xmSIOOZMGkHYaeOac+ECqmWgW0
         05t0tButmRLJIJCAtw95mYVovBOLBPA1bFvORb31P4+ySd0gfbo4tWvRGHOhxcx4hdG/
         hYgIVRrLnkg+Nw9FkZSMNzVnTFR835ITFKgejlxCy1Lydjq08SUdU2u5RlX+8n51j2K/
         s1CHvGtXAs6cYuUiQox/UpuqVG9fcHE8UnKRhM1+BpR1rcCEbpJ8vFeFKEisg7Cfg03n
         FVEQ1Fo18dKgpRRJ4NRcB9T1UGNbhB2dZvJHcRD35kmZWvsdVE2yvXuGpfIDv2SMTKIN
         UAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690029036; x=1690633836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAq5/Jl2kFOPPBWJ6Pf8zB2DGLud3TAf62/km0FunJ0=;
        b=crz2vKoDOD+WLfUMxrJOzuuz1y5I00tMM4qsXLQIABV4RSEOIgPlQcSIMqGy9UvFJj
         n26hW71j4Ir/X1s2/SuEAAYMo6gU4Frdh+sc74H4Zi1dOPkhQRCa/plDsc06+7LRIU+Q
         2AFm1jZYTSmNBXXx0yxiLGseDvcxhmje1MCiWa0yJTivv5MNOcc8X35WMW0BB7mg6fkq
         nUqED0KC834ZrcdLHuPGGQNU/zehZSkmZepo+j0CRt968RKkTbTZprAjvdzuF56eQras
         ey7go8wEspg8MAnTCiru5UxWjPODELZfpActPwwCP5gbFeX1yVvy7ynZOTnapll+kwqe
         pOPw==
X-Gm-Message-State: ABy/qLbqiH+J6PwmDZ5iussWgoKIoGCWlWZde1mcnFA7DhO2tTEaLZRS
        EZ+5HuGPh70y0/lXoP0KCzeqFXdmPHff/AIKtycIWw==
X-Google-Smtp-Source: APBJJlEQzyjgdx1Dw03GOpQ7FGdWEczTug44/HS+RPFUVvOEejX2SDl8qTHMnsaei++CkaqiAnqvu1+8FN9m1NOHlqY=
X-Received: by 2002:a05:6102:250:b0:446:e878:f24 with SMTP id
 a16-20020a056102025000b00446e8780f24mr894998vsq.14.1690029036394; Sat, 22 Jul
 2023 05:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230720144747.73276-1-brgl@bgdev.pl> <20230720144747.73276-6-brgl@bgdev.pl>
 <ZLn4V9IW0nI8djau@sol> <CAMRc=MfyHqp5gWBmAtw6MhGS3p1oMt3yKTLQGOK09kccuLq+dw@mail.gmail.com>
 <ZLs55rrghb/X3rd2@sol>
In-Reply-To: <ZLs55rrghb/X3rd2@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 22 Jul 2023 14:30:21 +0200
Message-ID: <CAMRc=Mdmxoxo3-e2iG8P=K4tsHkBGgkPFJCyXpSF+34ciskYMg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 5/5] bindings: rust: provide LineRequest::chip_name()
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 22, 2023 at 4:07=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, Jul 21, 2023 at 08:35:07PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Jul 21, 2023 at 5:15=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Thu, Jul 20, 2023 at 04:47:47PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Provide a wrapper around gpiod_line_request_get_chip_name() for Rus=
t
> > > > bindings and add a test-case.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > >  bindings/rust/libgpiod/src/line_request.rs   | 16 ++++++++++++++++
> > > >  bindings/rust/libgpiod/tests/line_request.rs | 14 ++++++++++++++
> > > >  2 files changed, 30 insertions(+)
> > > >
> > > > diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/=
rust/libgpiod/src/line_request.rs
> > > > index 1140aa9..737c06f 100644
> > > > --- a/bindings/rust/libgpiod/src/line_request.rs
> > > > +++ b/bindings/rust/libgpiod/src/line_request.rs
> > > > @@ -2,6 +2,7 @@
> > > >  // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> > > >  // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.=
org>
> > > >
> > > > +use std::ffi::CStr;
> > > >  use std::os::unix::prelude::AsRawFd;
> > > >  use std::time::Duration;
> > > >
> > > > @@ -25,6 +26,21 @@ impl Request {
> > > >          Ok(Self { request })
> > > >      }
> > > >
> > > > +    /// Get the name of the chip this request was made on.
> > > > +    pub fn chip_name(&self) -> Result<&str> {
> > > > +        // SAFETY: The `gpiod_line_request` is guaranteed to be li=
ve as long
> > > > +        // as `&self`
> > > > +        let name =3D unsafe { gpiod::gpiod_line_request_get_chip_n=
ame(self.request) };
> > > > +
> > > > +        // SAFETY: The string is guaranteed to be valid, non-null =
and immutable
> > > > +        // by the C API for the lifetime of the `gpiod_line_reques=
t`. The
> > > > +        // `gpiod_line_request` is living as long as `&self`. The =
string is
> > > > +        // returned read-only with a lifetime of `&self`.
> > > > +        unsafe { CStr::from_ptr(name) }
> > > > +            .to_str()
> > > > +            .map_err(Error::StringNotUtf8)
> > > > +    }
> > > > +
> > >
> > > I would drop the name temp var myself, but that is just a nit.
> > >
> >
> > I would too but rust was making it very difficult with borrow semantics=
. :)
> >
>
> Really?  What error are you getting?
>
> This works for me:
>
>     /// Get the name of the chip this request was made on.
>     pub fn chip_name(&self) -> Result<&str> {
>         // SAFETY: The string is guaranteed to be valid, non-null and imm=
utable
>         // by the C API for the lifetime of the `gpiod_line_request`. The
>         // `gpiod_line_request` is living as long as `&self`. The string =
is
>         // returned read-only with a lifetime of `&self`.
>         unsafe { CStr::from_ptr(gpiod::gpiod_line_request_get_chip_name(s=
elf.request)) }
>             .to_str()
>             .map_err(Error::StringNotUtf8)
>     }
>
> And the last sentence of the SAFETY comment looks redundant to me -
> it is just repeating what the signature already says.
> (otherwise the return would be something like Result<&'a mut String>)
>
> Cheers,
> Kent.

I guess it does work. This looks less obvious to me though after all,
so I left the previous version. I removed the last part of the SAFETY
comment though as per your suggestion.

Thanks
Bart
