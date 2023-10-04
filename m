Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0CD7B801C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 15:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbjJDNBu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 09:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbjJDNBu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 09:01:50 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D1498
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 06:01:46 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5362bcc7026so3750353a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 06:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696424505; x=1697029305; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQPURT2cB30aEZVuY0YniaL39V0VOCF5T3GrjWLBDKk=;
        b=d2fWxpwP6uFiO34pOxDwGZ9z29PFmz50YXzv2a168mIizJb/nenBo28aOmQHSIGSPJ
         0vYy3J5rDQtSUR80Liwga0BvJgt65duiZGKH24k/EgOCzvVIddI/9QCbZYS4JITnTgBo
         SZWfknVhohxCTn9IH1Qf4jN1l9ExRPJb7HbP6j01KcKzzis5cj5QRzOyA9bK9cdgJiJX
         L4eLPZd0A2MEd2chD1exdgkBw/xKSnxRk6IeCvJeBSdEm6dGY0EqzLMGgS5GJpmn6QSu
         OlLfxiosb1L2hfeTujl/G6RbIJ/fCo/bVcT+Fm4x5lIJwPhbJJuMqtdpiiEu/wm7b4vJ
         T7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424505; x=1697029305;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VQPURT2cB30aEZVuY0YniaL39V0VOCF5T3GrjWLBDKk=;
        b=LIymtM4zM74rKyXCbMxROV8n0YX3ejWlOPTtfE/+LnF62JwGpjkq9fDw9PzthmYsAF
         JunYJPne6n4n+ftbb9iuk6xqgD3boHhf/0p/lsxKd62g23ETFqnQ9Zn1Dwg6xDGfXNre
         qKP2fJw3iY1ZaFTSR6RobYwi2ChhWR6VdvW8U58GiQkEgAzRKIRHQC1Wfg/YYfB7AHiz
         NbGa+GOvrQEW+WPZTlcihwzUWSVwDcZBRCScEiHjgH0wVTiFF5aVh5C6iGMWO9S77ktj
         OwRZqxwNkdj/jQmT8Va9pYgY4m1ZusE5yXFr7sxAJxhyhmnSKIqqv5rDr73cQAcGF/3i
         i6JQ==
X-Gm-Message-State: AOJu0YxzuRa+MwWnYDvmD7Jn1N4LAJWHUBSWj1l5nI+t1PALv3juBsSv
        dYlZi58MUgSmHsHDCSSDPOgZDA==
X-Google-Smtp-Source: AGHT+IFey3V/7VIqf6zeHV1RIfPDrX1txSM3AsPD1URYJb0FnGPkoASOlt2LhgowSyiLKfDxd7bWJQ==
X-Received: by 2002:aa7:c301:0:b0:523:2e0e:5462 with SMTP id l1-20020aa7c301000000b005232e0e5462mr1680412edq.42.1696424489175;
        Wed, 04 Oct 2023 06:01:29 -0700 (PDT)
Received: from localhost (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id s7-20020aa7c547000000b0052595b17fd4sm2413303edr.26.2023.10.04.06.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 06:01:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 04 Oct 2023 15:01:28 +0200
Message-Id: <CVZOAJ4WAGKU.21D52ZLTSHG5G@ablu-work>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH v3 2/3] bindings: rust: rename
 {event,settings}_clone to try_clone
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>
X-Mailer: aerc 0.15.2
References: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
 <20231003-rust-line-info-soundness-v3-2-555ba21b4632@linaro.org>
 <CAMRc=MfhLtjeJk1q489kgAMdezYqyf_pLPPhhQR66n9Sq2xZfg@mail.gmail.com>
In-Reply-To: <CAMRc=MfhLtjeJk1q489kgAMdezYqyf_pLPPhhQR66n9Sq2xZfg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Oct 4, 2023 at 1:22 PM CEST, Bartosz Golaszewski wrote:
> On Tue, Oct 3, 2023 at 11:40=E2=80=AFAM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > What is getting cloned is already clear from the type. This also aligns
> > a bit better with similar methods from the `std` crate [1].
> >
> > [1] https://doc.rust-lang.org/std/index.html?search=3Dtry_clone
> >
> > Link: https://lore.kernel.org/r/CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> >  bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs | 2 +-
> >  bindings/rust/libgpiod/src/edge_event.rs                    | 3 ++-
> >  bindings/rust/libgpiod/src/line_settings.rs                 | 4 ++--
> >  bindings/rust/libgpiod/tests/line_request.rs                | 2 +-
> >  4 files changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.r=
s b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> > index ad90d7b..8dbb496 100644
> > --- a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> > +++ b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> > @@ -34,7 +34,7 @@ fn main() -> libgpiod::Result<()> {
> >          let event =3D events.next().unwrap()?;
> >
> >          // This will out live `event` and the next read_edge_events().
> > -        let cloned_event =3D libgpiod::request::Event::event_clone(eve=
nt)?;
> > +        let cloned_event =3D libgpiod::request::Event::try_clone(event=
)?;
> >
> >          let events =3D request.read_edge_events(&mut buffer)?;
> >          for event in events {
> > diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/l=
ibgpiod/src/edge_event.rs
> > index 0c0cfbc..4c940ba 100644
> > --- a/bindings/rust/libgpiod/src/edge_event.rs
> > +++ b/bindings/rust/libgpiod/src/edge_event.rs
> > @@ -25,7 +25,8 @@ use super::{
> >  pub struct Event(*mut gpiod::gpiod_edge_event);
> >
> >  impl Event {
> > -    pub fn event_clone(event: &Event) -> Result<Event> {
> > +    /// Makes a copy of the event object.
> > +    pub fn try_clone(event: &Event) -> Result<Event> {
>
> Hi Erik,
>
> This fails to apply on top of current master of libgpiod. Could you verif=
y?

Hm. Not sure what went wrong. It rebased and tests cleanly for me.
Resent them.

- Erik

>
> Bart
>
> >          // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
> >          let event =3D unsafe { gpiod::gpiod_edge_event_copy(event.0) }=
;
> >          if event.is_null() {
> > diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rus=
t/libgpiod/src/line_settings.rs
> > index f0b3e9c..41b27e2 100644
> > --- a/bindings/rust/libgpiod/src/line_settings.rs
> > +++ b/bindings/rust/libgpiod/src/line_settings.rs
> > @@ -52,8 +52,8 @@ impl Settings {
> >          unsafe { gpiod::gpiod_line_settings_reset(self.settings) }
> >      }
> >
> > -    /// Makes copy of the settings object.
> > -    pub fn settings_clone(&self) -> Result<Self> {
> > +    /// Makes a copy of the settings object.
> > +    pub fn try_clone(&self) -> Result<Self> {
> >          // SAFETY: `gpiod_line_settings` is guaranteed to be valid her=
e.
> >          let settings =3D unsafe { gpiod::gpiod_line_settings_copy(self=
.settings) };
> >          if settings.is_null() {
> > diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/ru=
st/libgpiod/tests/line_request.rs
> > index da22bea..e0ae200 100644
> > --- a/bindings/rust/libgpiod/tests/line_request.rs
> > +++ b/bindings/rust/libgpiod/tests/line_request.rs
> > @@ -272,7 +272,7 @@ mod line_request {
> >              for offset in offsets {
> >                  lsettings.set_debounce_period(Duration::from_millis((1=
00 + offset).into()));
> >                  lconfig
> > -                    .add_line_settings(&[offset as Offset], lsettings.=
settings_clone().unwrap())
> > +                    .add_line_settings(&[offset as Offset], lsettings.=
try_clone().unwrap())
> >                      .unwrap();
> >              }
> >
> >
> > --
> > 2.41.0
> >

