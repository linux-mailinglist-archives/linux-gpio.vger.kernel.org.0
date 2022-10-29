Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7716124BD
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Oct 2022 19:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiJ2RqY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Oct 2022 13:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ2RqX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Oct 2022 13:46:23 -0400
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9766C4F692
        for <linux-gpio@vger.kernel.org>; Sat, 29 Oct 2022 10:46:22 -0700 (PDT)
Date:   Sat, 29 Oct 2022 17:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1667065579; x=1667324779;
        bh=NUwKkaw74u0IYn5eC8eCgD9RWGjApCJvdStDpxkOLHQ=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=Z1t/TXY/KuLEFLsFR06ZMkygQody6JyIRVvNtxwaZrfIOf0FhlzCIIjBj4pUo03Xi
         Y/RfhcRAm2fYb9DoZtb99d0xelidxWlHCaCE+YNc9QWcpo69Fyx39kS6zaoFH62hbG
         GHDzZHaITcsu7xi48o7O+9/nUdXzrDMVWCaq7NV2Y1BkW0eOWQlFVZrwZy1+glQqCl
         NTK2ot377vVKhnFeX5GgHd2fN24k9/TcGj/iZT36zzWML1cheRVDZhEnEKkTBV5F04
         WLlL697Js3NuGv4gReaR5v3FGwMZHzNfZ31D7IrXumQd/pVDXovlUK3xzEzkT8bRer
         0YEbWLNVoeOfA==
To:     Viresh Kumar <viresh.kumar@linaro.org>
From:   =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
Message-ID: <LdOsM9sY9hpjTANe2LeBbwfLlVkyYJ_t_xde616G-VJegRUD_1nkndfgqaIdHadyiP-Ei0rjUzPYvJtUC1J_OwXEuKkdpakUMonYfKHQBgI=@protonmail.com>
In-Reply-To: <20221025064239.6dazljljxlprhqus@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org> <CANiq72m_9RK7viLpaREMGiMLuWs9m1oy9N78ok1d7uzC+18zNg@mail.gmail.com> <F4hN01T_BkoMFY7LNhQlmQPrXGv3a2byhEuDLleJfpWlfF98Dopa2FPrl4JDEoER8y7bN41KMkmWqM50YAIBK0BowT_9skmLKY8gsqYEJBc=@protonmail.com> <20221021093911.vj5todjdfqptdy7d@vireshk-i7> <YsZTLXUUjsBT-SzPWsI4ppoDBT_lGn0yfhF2r-5wfqcYxxeWWcdL2yIUcMMBmMTB-TjVUZkSqpMsvWNKTcSwoun5wzT4bbPi-ijZXUt8HWM=@protonmail.com> <20221025064239.6dazljljxlprhqus@vireshk-i7>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tuesday, October 25th, 2022 at 08:42, Viresh Kumar <viresh.kumar@linaro.=
org> wrote:


> On 21-10-22, 14:34, Bj=C3=B6rn Roy Baron wrote:
>=20
> > > impl<'b> Event<'b> {
> > >=20
> > > /// Get an event stored in the buffer.
> > > - pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Self>=
 {
> > >=20
> > > + pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Event=
<'b>> {
> >=20
> > This looks good to me.
>=20
> > > +impl<'e, 'b> Event<'e> {
> > >=20
> > > + pub fn event_clone(event: &Event<'b>) -> Result<Event<'e>>
> > >=20
> > > + where
> > > + 'e: 'b,
> >=20
> > Using `Event<'b>` on both sides should work fine. `Event` is
> > covariant in it's lifetime parameter, so `Event<'b>` can be turned
> > into `Event<'e>` with `'e` being a shorter lifetime than `'b`. What
> > you wrote here is not incorrect, so if you prefer keeping it this
> > way that is fine with me.
>=20
>=20
> That doesn't let the cloned event to live past read_edge_events().
>=20
> error[E0502]: cannot borrow `buffer` as mutable because it is also borrow=
ed as immutable
> --> libgpiod/examples/gpio_events.rs:70:50
>=20
> |
> 64 | let event =3D buffer.event(0)?;
> | --------------- immutable borrow occurs here
> ...
> 70 | let count =3D request.read_edge_events(&mut buffer)?;
> | ^^^^^^^^^^^ mutable borrow occurs here
> ...
> 86 | }
> | - immutable borrow might be used here, when `cloned_event` is dropped a=
nd runs the `Drop` code for type `libgpiod::request::Event`
>=20
> --
> viresh

I would have expected that to work fine, but as it doesn't work keeping you=
r code with two separate lifetimes is fine.

Cheers,
Bjorn
