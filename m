Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B6F6061A1
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 15:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbiJTN3t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 09:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiJTN3s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 09:29:48 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6F252DE5
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 06:29:46 -0700 (PDT)
Date:   Thu, 20 Oct 2022 13:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1666272580; x=1666531780;
        bh=1lXUG2xsTh8VbK1cbkG+aOMJyflUtJoIR5XHhaoXsOM=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=zUXOI+DCTpbN2FGdkraBTsqANNnVNvtEWo/k72Ix5J0R2BY9eCqJzEINtFaWX57C7
         DzClPXNSLLzNRzp6pOjOvA069R6LQ6RaAWFsBabac9CBzKU4FUgv7SgzX2pj7PHuSI
         0WhETJWLwUiCitAt0Bn1Mp+09U31M5L9uMA67n/lvMQoSYvShA9s1jRN1hc8hNvCuz
         k5tTLAD8aVj6KTr5ChcTcRzjwwStDoMRn1mpH0CG/PhB2GWaRbWteVn20iBps0pBEZ
         VxQYsQJzpE+reNNx7UMomc5rBeiMzJDcayhHJCkVXrShqC7LHlIar+uUnlk8zZDMoN
         GQQwDq+qt8shQ==
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From:   =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [PATCH V7 0/8] libgpiod: Add Rust bindings
Message-ID: <F4hN01T_BkoMFY7LNhQlmQPrXGv3a2byhEuDLleJfpWlfF98Dopa2FPrl4JDEoER8y7bN41KMkmWqM50YAIBK0BowT_9skmLKY8gsqYEJBc=@protonmail.com>
In-Reply-To: <CANiq72m_9RK7viLpaREMGiMLuWs9m1oy9N78ok1d7uzC+18zNg@mail.gmail.com>
References: <cover.1665744170.git.viresh.kumar@linaro.org> <CANiq72m_9RK7viLpaREMGiMLuWs9m1oy9N78ok1d7uzC+18zNg@mail.gmail.com>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Friday, October 14th, 2022 at 19:03, Miguel Ojeda <miguel.ojeda.sandonis=
@gmail.com> wrote:

> On Fri, Oct 14, 2022 at 12:47 PM Viresh Kumar viresh.kumar@linaro.org wro=
te:
>=20
> > Here is another version of rust bindings for libgpiod v2.0, based of th=
e
> > next/libgpiod-2.0.
> >=20
> > Pushed here:
> >=20
> > https://github.com/vireshk/libgpiod v7
> >=20
> > [I have pushed v6 and v5 there too, in case someone wants to look at th=
e
> > changes].

It looks pretty good to me. I do have a couple of minor suggestions though.

https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad51220c4=
b4e90e/bindings/rust/libgpiod/Cargo.toml#L10 should use 0.2.39 without >=3D=
 to ensure that publishing a 0.3 version of libc with breaking changes won'=
t break the build. Cargo treats "0.2.39" as ">=3D0.2.39, <0.3".

At https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad5122=
0c4b4e90e/bindings/rust/libgpiod/Cargo.toml#L13 the vmm-sys-utils dependenc=
y should be unpinned from "=3D0.10.0" to "0.10.0". Otherwise having any cra=
te depend on a newer semver compatible version will cause a build error. Wh=
ile Cargo allows multiple semver incompatible versions of a crate, it doesn=
't allow multiple semver compatible versions as it wouldn't know which vers=
ion to use for a crate that says it works with both versions.

At https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad5122=
0c4b4e90e/bindings/rust/libgpiod/src/lib.rs#L469 and elsewhere you might wa=
nt to use `CStr::from_ptr(version)`. This does the `strlen` call for you an=
d you can convert it to an `&str` using `.to_str()`.

At https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad5122=
0c4b4e90e/bindings/rust/libgpiod/src/chip.rs#L171 you could use `CString` a=
nd use the `.as_ptr()` method to get a null-terminated string. Not sure if =
it would be nicer that what you currently have though.

At https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad5122=
0c4b4e90e/bindings/rust/libgpiod/src/edge_event.rs#L46 the lifetimes are un=
clear. Is Event allowed to outlive the buffer? Can you add a lifetime annot=
ation like fn event_clone<'a>(event: &Event<'a>) -> Result<Event<'a>> if it=
 isn't allowed to outlive the buffer or fn event_clone<'a, 'b>(event: &Even=
t<'a>) -> Result<Event<'b>> if it is allowed to outlive the buffer. I'm not=
 sure which of the two the lifetime elision rules cause the current code to=
 be equivalent of, but even if it is correct, explicitly stating the lifeti=
me here is clearer IMHO.

As for the question about test skipping elsewhere in this thread, rust has =
the #[ignore] attribute to ignore tests at compile time (with a command lin=
e flag to run ignored tests anyway), but nothing to ignore tests at runtime=
 unfortunately.

Cheers,
Bj=C3=B6rn

nb: I can't reply to a mail I didn't receive directly right now due to mail=
 provider limitations. I'm working on sorting this out, but for now I'm goi=
ng to reply to the mail I did receive directly.
