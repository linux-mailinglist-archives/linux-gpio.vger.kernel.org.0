Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEDED6079AC
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 16:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiJUOfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 10:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbiJUOfF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 10:35:05 -0400
X-Greylist: delayed 90312 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 21 Oct 2022 07:34:58 PDT
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A03C3D581
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 07:34:53 -0700 (PDT)
Date:   Fri, 21 Oct 2022 14:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1666362892; x=1666622092;
        bh=zrqEAyUabzDqvGKOhjdFgLb4LMmkwnETvoeParHnDAI=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=eAs75HATfvflsQrDnC4HwrHI5ehhLruWiRJsJhg+tFhn0qtoNTaBpNHNIQjDpGd6P
         LDPWTFfRt5Zn5yZVz6q5bFhTY3WCBJ93OxSQmeb7hLZ8iBtifv+bs6GYvOS4rpGACk
         DohGjQTs6xZz/qxhjml1DyEvWj48TwgbX4HhjIm40h+4YMAJVcGe8CcMLUT6f8thp3
         LNq5rN2DTka/yPz1sABDWAl9ylQnqbFM23gpqUHw3pTS9JR1sv7jjTyS9dJ3VT0M8W
         I9AQwuEimRwus1i9Da+KjM07yFXuNwf85D60WnGwcd5BDhni5gihpq8yA6kqaG9dEX
         KA9AGFKTirtzA==
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
Message-ID: <YsZTLXUUjsBT-SzPWsI4ppoDBT_lGn0yfhF2r-5wfqcYxxeWWcdL2yIUcMMBmMTB-TjVUZkSqpMsvWNKTcSwoun5wzT4bbPi-ijZXUt8HWM=@protonmail.com>
In-Reply-To: <20221021093911.vj5todjdfqptdy7d@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org> <CANiq72m_9RK7viLpaREMGiMLuWs9m1oy9N78ok1d7uzC+18zNg@mail.gmail.com> <F4hN01T_BkoMFY7LNhQlmQPrXGv3a2byhEuDLleJfpWlfF98Dopa2FPrl4JDEoER8y7bN41KMkmWqM50YAIBK0BowT_9skmLKY8gsqYEJBc=@protonmail.com> <20221021093911.vj5todjdfqptdy7d@vireshk-i7>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Friday, October 21st, 2022 at 11:39, Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:

> Hi Bj=C3=B6rn,
>=20
> I have bounced (mutt's feature) the initial emails to your and other
> email ids that Miguel added. The patches should be in your inbox now.

Thanks! I receive the patches.

>=20
> On 20-10-22, 13:29, Bj=C3=B6rn Roy Baron wrote:
>=20
> > At
> > https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad512=
20c4b4e90e/bindings/rust/libgpiod/src/lib.rs#L469
> > and elsewhere you might want to use `CStr::from_ptr(version)`. This
> > does the `strlen` call for you and you can convert it to an `&str`
> > using `.to_str()`.
>=20
> > At
> > https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad512=
20c4b4e90e/bindings/rust/libgpiod/src/chip.rs#L171
> > you could use `CString` and use the `.as_ptr()` method to get a
> > null-terminated string. Not sure if it would be nicer that what you
> > currently have though.
>=20
>=20
> These two were nice. Thanks.
>=20
> > At
> > https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad512=
20c4b4e90e/bindings/rust/libgpiod/src/edge_event.rs#L46
> > the lifetimes are unclear. Is Event allowed to outlive the buffer?
> > Can you add a lifetime annotation like fn event_clone<'a>(event:
> > &Event<'a>) -> Result<Event<'a>> if it isn't allowed to outlive the
> > buffer or fn event_clone<'a, 'b>(event: &Event<'a>) ->
> > Result<Event<'b>> if it is allowed to outlive the buffer. I'm not
> > sure which of the two the lifetime elision rules cause the current
> > code to be equivalent of, but even if it is correct, explicitly
> > stating the lifetime here is clearer IMHO.
>=20
>=20
> An Event created using Event::new() can't outlive the buffer, though
> an Event created using Event::event_clone() can.
>=20
> I tried to play around it based on your suggestion and here is the
> diff, does it make sense ?
>=20
> diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/lib=
gpiod/src/edge_event.rs
> index b36c23601bb4..0d328ebb2b03 100644
> --- a/bindings/rust/libgpiod/src/edge_event.rs
> +++ b/bindings/rust/libgpiod/src/edge_event.rs
> @@ -33,7 +33,7 @@ pub struct Event<'b> {
>=20
>=20
> impl<'b> Event<'b> {
>=20
> /// Get an event stored in the buffer.
> - pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Self> {
>=20
> + pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Event<'b>=
> {

This looks good to me.

>=20
> // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to l=
ive as long
> // as the `struct Event`.
> let event =3D unsafe {
> @@ -52,22 +52,6 @@ impl<'b> Event<'b> {
>=20
> })
> }
>=20
> - pub fn event_clone(event: &Event) -> Result<Self> {
>=20
> - // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
> - let event =3D unsafe { gpiod::gpiod_edge_event_copy(event.event) };
> - if event.is_null() {
> - return Err(Error::OperationFailed(
> - OperationType::EdgeEventCopy,
> - Errno::last(),
> - ));
> - }
> -
> - Ok(Self {
> - buffer: None,
> - event,
> - })
> - }
> -
> /// Get the event type.
> pub fn event_type(&self) -> Result<EdgeKind> {
>=20
> // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
> @@ -105,6 +89,27 @@ impl<'b> Event<'b> {
>=20
> }
> }
>=20
> +impl<'e, 'b> Event<'e> {
>=20
> + pub fn event_clone(event: &Event<'b>) -> Result<Event<'e>>
>=20
> + where
> + 'e: 'b,

Using `Event<'b>` on both sides should work fine. `Event` is covariant in i=
t's lifetime parameter, so `Event<'b>` can be turned into `Event<'e>` with =
`'e` being a shorter lifetime than `'b`. What you wrote here is not incorre=
ct, so if you prefer keeping it this way that is fine with me.

> + {
> + // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
> + let event =3D unsafe { gpiod::gpiod_edge_event_copy(event.event) };
> + if event.is_null() {
> + return Err(Error::OperationFailed(
> + OperationType::EdgeEventCopy,
> + Errno::last(),
> + ));
> + }
> +
> + Ok(Self {
> + buffer: None,
> + event,
> + })
> + }
> +}
> +
>=20
> --
> viresh

Cheers,
Bj=C3=B6rn
