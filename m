Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96EA975D8DD
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Jul 2023 04:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjGVCHm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jul 2023 22:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjGVCHl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 22:07:41 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C8B3C03
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 19:07:40 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6b9defb366eso2133760a34.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689991660; x=1690596460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5h9AY+pCBos2pL+OG68oMbqfjEo2Hw3g8tU/I9V52YM=;
        b=Lj3VSjHTXG3ZNHsAxC8zdt2Beja8WZ07KGUlfRsr8EUMXO9XQHZmIZbhXai/pY3L7V
         G+4ODR+4o4i3aFvpswnktWaNabpjP8R1b/NGcGoEFaOZs4Rj7V6ssxge+Fs0BUvrICPB
         a0g3H7t6d/M78DG66SUYVbov2ajO96dZd/hoUI2UibKjOglIhqf256XaIfFEuJxVdk4C
         7nBKDO/03Lq4PdILpiBIpG7H3Uq/WfwfcDfY66Eqm4h5EeWsZYpL26c+/9X3DFLinIio
         aFb4sbemuSgJ7FOjyZLQuiyLzjm7eJSHVxW5DynSIMgxXyfYSUCWzqPr0vVTvaV17JHw
         GFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689991660; x=1690596460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5h9AY+pCBos2pL+OG68oMbqfjEo2Hw3g8tU/I9V52YM=;
        b=QeslTL7suH1soX45jg8JgNP3HHTQQC2VqEmnPtzjrxYeGew9U7hqOpL30RizgSgj0F
         xgwlWsfWvKXjxnAn8F/7QFileC6RbBG6y0N2MdCJiWSFhzczVleSiT2w+NJnNLNfsiSO
         UKWExJt9lwFzn0bOUDM1t3yXHxs2IJbQxV8vodo7yVTWj+4lpGkuuszTnLckn3HkBq5+
         crVJyqYXQOHB3l/nc1A1wFBlRltPwSFdSlu9vrc4hR5M5UJPAdHc6lR8U+mOTMkfiTMR
         jYNi1xT9ksvSGdDZWz4h2MSiGtcTBU6utrPvVWUowm0aHMyLFChuISe2UnXR+sZ5ynHn
         hzOw==
X-Gm-Message-State: ABy/qLbz1ReGbNCBXSwVAizFdvAwatjIJzDv6F8G04ad5Ue5IkH0Gscc
        cvf0+/+5y1SNgIPJ+zskX6oGb/nsj1g=
X-Google-Smtp-Source: APBJJlFBkxkzuHH2RdDoV+G4TXwJJfyOHBkmyBGBg/gLzB5sBJIJtKCbjP+gszns/MFCb8wjnwdzFQ==
X-Received: by 2002:a05:6870:a446:b0:1b7:4684:f5bf with SMTP id n6-20020a056870a44600b001b74684f5bfmr4495180oal.56.1689991659821;
        Fri, 21 Jul 2023 19:07:39 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i23-20020aa78b57000000b00682d79199e7sm3532388pfd.200.2023.07.21.19.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 19:07:39 -0700 (PDT)
Date:   Sat, 22 Jul 2023 10:07:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2 5/5] bindings: rust: provide
 LineRequest::chip_name()
Message-ID: <ZLs55rrghb/X3rd2@sol>
References: <20230720144747.73276-1-brgl@bgdev.pl>
 <20230720144747.73276-6-brgl@bgdev.pl>
 <ZLn4V9IW0nI8djau@sol>
 <CAMRc=MfyHqp5gWBmAtw6MhGS3p1oMt3yKTLQGOK09kccuLq+dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfyHqp5gWBmAtw6MhGS3p1oMt3yKTLQGOK09kccuLq+dw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 21, 2023 at 08:35:07PM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 21, 2023 at 5:15 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jul 20, 2023 at 04:47:47PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Provide a wrapper around gpiod_line_request_get_chip_name() for Rust
> > > bindings and add a test-case.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  bindings/rust/libgpiod/src/line_request.rs   | 16 ++++++++++++++++
> > >  bindings/rust/libgpiod/tests/line_request.rs | 14 ++++++++++++++
> > >  2 files changed, 30 insertions(+)
> > >
> > > diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
> > > index 1140aa9..737c06f 100644
> > > --- a/bindings/rust/libgpiod/src/line_request.rs
> > > +++ b/bindings/rust/libgpiod/src/line_request.rs
> > > @@ -2,6 +2,7 @@
> > >  // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> > >  // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> > >
> > > +use std::ffi::CStr;
> > >  use std::os::unix::prelude::AsRawFd;
> > >  use std::time::Duration;
> > >
> > > @@ -25,6 +26,21 @@ impl Request {
> > >          Ok(Self { request })
> > >      }
> > >
> > > +    /// Get the name of the chip this request was made on.
> > > +    pub fn chip_name(&self) -> Result<&str> {
> > > +        // SAFETY: The `gpiod_line_request` is guaranteed to be live as long
> > > +        // as `&self`
> > > +        let name = unsafe { gpiod::gpiod_line_request_get_chip_name(self.request) };
> > > +
> > > +        // SAFETY: The string is guaranteed to be valid, non-null and immutable
> > > +        // by the C API for the lifetime of the `gpiod_line_request`. The
> > > +        // `gpiod_line_request` is living as long as `&self`. The string is
> > > +        // returned read-only with a lifetime of `&self`.
> > > +        unsafe { CStr::from_ptr(name) }
> > > +            .to_str()
> > > +            .map_err(Error::StringNotUtf8)
> > > +    }
> > > +
> >
> > I would drop the name temp var myself, but that is just a nit.
> >
> 
> I would too but rust was making it very difficult with borrow semantics. :)
> 

Really?  What error are you getting?

This works for me:

    /// Get the name of the chip this request was made on.
    pub fn chip_name(&self) -> Result<&str> {
        // SAFETY: The string is guaranteed to be valid, non-null and immutable
        // by the C API for the lifetime of the `gpiod_line_request`. The
        // `gpiod_line_request` is living as long as `&self`. The string is
        // returned read-only with a lifetime of `&self`.
        unsafe { CStr::from_ptr(gpiod::gpiod_line_request_get_chip_name(self.request)) }
            .to_str()
            .map_err(Error::StringNotUtf8)
    }

And the last sentence of the SAFETY comment looks redundant to me -
it is just repeating what the signature already says.
(otherwise the return would be something like Result<&'a mut String>)

Cheers,
Kent.
