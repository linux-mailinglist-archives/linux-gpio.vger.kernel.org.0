Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0AA627A7D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 11:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236600AbiKNKbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 05:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236520AbiKNKa2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 05:30:28 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E29913D11
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:30:26 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id i2so6512662vsc.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bAvmy6g7nM48tLSkxhPZRIqbuaE3HyJ28nbsjWER2Gw=;
        b=bxVpVAxAhMBO6wmUuurZqaWD+ZyxcsfPPOas/7bxgk/Yd1Ys8Lf+0N94ugpNeB07Ut
         dYxzmr2kLTUTkvyLlKQ66QEVfQ0mT0DzQYQ786l6t3X0ACQMAD2qVTaokE2mcBY+jP+J
         4l1c4H9FzIZUmn39jAbjTm4zzw3zg59H0KUidcQtH1/zH3r/DNck1y0iW6HRYbM2sfVk
         +RvYEsWqDrwLi/vfOn3XSiCtA1hmCZho9m/IKh8Vd4Q10Hby9SffBAaubu6E2WMZ4UcH
         Vo1kPZUEBzFYrOtirn2wGKLZDHyMy6p/imZ0ZtAC/JFoOWYkic1+Pc8pWK0mW2OSF+YD
         28qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAvmy6g7nM48tLSkxhPZRIqbuaE3HyJ28nbsjWER2Gw=;
        b=dhepuTN1fpS+kD9jz8q+qu2Klps1t0AssQAxIeGeBK2eY8/xgaD5W+K1TIx8HKuyEY
         wbH/3RDL5LGPngUuNf2ZClgo4hB4ZdZRvCjYOJxpO8cVSUx0epZklD5xVn57Mh/0ffuY
         JfnnsIpTmAbIVPMVbws+e1MEkIqp0UfWJ5YAZiWrVQU11CIs19U0pZmdgsSA0ooOQog8
         nYSNmM97ef1hDzscTJtr96dMB+PmIT24ZIxgsFWOD82nDXZnNw1zbvp5EHFUc0na7Z3A
         aXyGLmBixof///BWEMchs3TLUdb+DQJMj60cfn3qiVwU1cdcjZz9dNYvY7HC4ffkG3Ou
         Xetw==
X-Gm-Message-State: ANoB5plOFjVqdTWtsukAuUlvbthtIA5ik8tZ5nCIHe3nnaJQoV8ETqDv
        0C3zfkcFJUgm2VuGk+mMx9xQYMA7UUxLypJqh0CVng==
X-Google-Smtp-Source: AA0mqf48Dykc6JkHEfITonPEqH78sIeNbDmuNpx2PBa8RRGDpExiFoCmxYRea8eMc/owUo7FqnY5FGtr05fMbsMpoe8=
X-Received: by 2002:a05:6102:4187:b0:3aa:c58:66 with SMTP id
 cd7-20020a056102418700b003aa0c580066mr5552029vsb.47.1668421825675; Mon, 14
 Nov 2022 02:30:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <2a943ded955e634fc76022dd3bccdb0e8f8b4313.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=MdiNPK2jatPLy6vcN-uVgzRjk-3KJFcbpWnXQik85FBwA@mail.gmail.com> <20221114100435.djn6sskgjvkrrl6x@vireshk-i7>
In-Reply-To: <20221114100435.djn6sskgjvkrrl6x@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Nov 2022 11:30:14 +0100
Message-ID: <CAMRc=McTL86psXhngVDTT7ie7nKn8z-bvDtZoufrsiD=pmPbDw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 1/8] bindings: rust: Add libgpiod-sys rust crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 11:04 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 09-11-22, 10:07, Bartosz Golaszewski wrote:
> > On Mon, Nov 7, 2022 at 10:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > This adds libgpiod-sys rust crate, which provides FFI (foreign function
> > > interface) bindings for libgpiod APIs.
> > >
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > ---
> > >  .gitignore                            |  5 ++++
> > >  bindings/rust/Cargo.toml              |  5 ++++
> > >  bindings/rust/libgpiod-sys/Cargo.toml | 20 +++++++++++++
> > >  bindings/rust/libgpiod-sys/build.rs   | 41 +++++++++++++++++++++++++++
> > >  bindings/rust/libgpiod-sys/src/lib.rs | 13 +++++++++
> > >  5 files changed, 84 insertions(+)
> > >  create mode 100644 bindings/rust/Cargo.toml
> > >  create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
> > >  create mode 100644 bindings/rust/libgpiod-sys/build.rs
> > >  create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
> > >
> > > diff --git a/.gitignore b/.gitignore
> > > index 6c08415b390d..9f2fcf440c5d 100644
> > > --- a/.gitignore
> > > +++ b/.gitignore
> > > @@ -35,3 +35,8 @@ stamp-h1
> > >  # profiling
> > >  *.gcda
> > >  *.gcno
> > > +
> > > +# Added by cargo
> > > +
> > > +target
> > > +Cargo.lock
> >
> > This should be put into bindings/rust/.gitignore
>
> Should I resend the series with this one change ? Or just an incremental fix is
> enough ?
>
> --
> viresh

I'll fix it locally.

Bart
