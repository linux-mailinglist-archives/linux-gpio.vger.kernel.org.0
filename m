Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43CC775D16E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 20:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjGUSfX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jul 2023 14:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjGUSfW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 14:35:22 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EC430C8
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 11:35:18 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4813688e561so805419e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 11:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689964518; x=1690569318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Jb2O45b1H6vUvaypzXmbOgfKu+53jKzOSXPQ/AKAUI=;
        b=AblTtvQbU9yyFN7LGZuFadZr3GvMfgmMbKjLBbv0kgPFjt2KWLscZy8CI53K69yaA6
         3OAPig3jKpGsd0DoXxqDrLRJDTSZ/Q1DQJoVzEtWj0zCyuYo62smY8xyx4QxpEd3qxJ9
         iq4+J9gUK+kn/PJluxg6UgSbKWw0cyUbVfsSGV3R3aRU5Nshn/0RCBMVuV0vmK2sVg61
         xwGWowFDVPThUrIEqDFEbI9xUJ658TbqiAtRAK6Ux7jouF758eJl1HGiG8iIqcOuH5pb
         9ThnMWH2s2hyRbUAOFKXEYVahwvMhyq1EsCwNDuoaD2bBtjxJF/fT2K1TJx8eBZk29Sm
         Vsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689964518; x=1690569318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Jb2O45b1H6vUvaypzXmbOgfKu+53jKzOSXPQ/AKAUI=;
        b=PaSv04Bjm1o8myGUnFjl+gquxFBYDey2it613LKcrRoGw/Yot5o7rfxzPdWZZo+yrn
         XUvfATcVBz2dq0NWKytWprRCY/S3h2Ssbl5uWoNqcq5/Bl+ZM1XWjCnbfRMSZUpw6V/i
         5xMQGvr0JaZEPDP63uNnq0TGZbipYkiizWV33sisPZJj0Z0lSXdPlibope/ODR/EOWZP
         xl5GS54NbHmt1K4bbPVHzmbp02QYrjUidzsnjvHFh6lHQLVnZKB6j2NDGyAgpvJV/evA
         6xauNB25TRq/7kjg0PTXqUUUbFggPZCa6z/nyE0rKhzpXisyxPabOC9aovAwQXkib1rR
         Blfg==
X-Gm-Message-State: ABy/qLYkolI6dftQCkHUJHNKVeo3dXl5iOxS5Qe85Y+GIegllBla66kg
        hXLL5yhhQAr2kdeThviPnjiu8mufaTI41N93zSjntRql51vrjz3h
X-Google-Smtp-Source: APBJJlFXT6KZYddjE/Jm5G9xOJaBsNQDJXQICIhotHxp+A6wrj2Ozl/jD5sSmfVkpMWrm8rt29LOYPp5wD/ch/skKwA=
X-Received: by 2002:a1f:bf8f:0:b0:481:2dec:c25 with SMTP id
 p137-20020a1fbf8f000000b004812dec0c25mr1316709vkf.5.1689964517895; Fri, 21
 Jul 2023 11:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230720144747.73276-1-brgl@bgdev.pl> <20230720144747.73276-6-brgl@bgdev.pl>
 <ZLn4V9IW0nI8djau@sol>
In-Reply-To: <ZLn4V9IW0nI8djau@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 21 Jul 2023 20:35:07 +0200
Message-ID: <CAMRc=MfyHqp5gWBmAtw6MhGS3p1oMt3yKTLQGOK09kccuLq+dw@mail.gmail.com>
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

On Fri, Jul 21, 2023 at 5:15=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Jul 20, 2023 at 04:47:47PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Provide a wrapper around gpiod_line_request_get_chip_name() for Rust
> > bindings and add a test-case.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/rust/libgpiod/src/line_request.rs   | 16 ++++++++++++++++
> >  bindings/rust/libgpiod/tests/line_request.rs | 14 ++++++++++++++
> >  2 files changed, 30 insertions(+)
> >
> > diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust=
/libgpiod/src/line_request.rs
> > index 1140aa9..737c06f 100644
> > --- a/bindings/rust/libgpiod/src/line_request.rs
> > +++ b/bindings/rust/libgpiod/src/line_request.rs
> > @@ -2,6 +2,7 @@
> >  // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> >  // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> >
> > +use std::ffi::CStr;
> >  use std::os::unix::prelude::AsRawFd;
> >  use std::time::Duration;
> >
> > @@ -25,6 +26,21 @@ impl Request {
> >          Ok(Self { request })
> >      }
> >
> > +    /// Get the name of the chip this request was made on.
> > +    pub fn chip_name(&self) -> Result<&str> {
> > +        // SAFETY: The `gpiod_line_request` is guaranteed to be live a=
s long
> > +        // as `&self`
> > +        let name =3D unsafe { gpiod::gpiod_line_request_get_chip_name(=
self.request) };
> > +
> > +        // SAFETY: The string is guaranteed to be valid, non-null and =
immutable
> > +        // by the C API for the lifetime of the `gpiod_line_request`. =
The
> > +        // `gpiod_line_request` is living as long as `&self`. The stri=
ng is
> > +        // returned read-only with a lifetime of `&self`.
> > +        unsafe { CStr::from_ptr(name) }
> > +            .to_str()
> > +            .map_err(Error::StringNotUtf8)
> > +    }
> > +
>
> I would drop the name temp var myself, but that is just a nit.
>

I would too but rust was making it very difficult with borrow semantics. :)

Bart

> Other than that the series looks good to me.
>
> Reviewed-by: Kent Gibson <warthog618@gmail.com>
>
> Cheers,
> Kent.
