Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0597B7E18
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 13:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjJDLWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 07:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232833AbjJDLWk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 07:22:40 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7793EC9
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 04:22:36 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-49dc95be894so122312e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 04:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696418555; x=1697023355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjOkJQRldQl6LH5QGn3fpuDfZesu8P4IogGyEiDlMxc=;
        b=NXsz0qRf8vbzxQY/Pw6mmC8ohMto9Fs7IiVfMXiWqep350W4xSw55N1eV+vhs6iUMn
         g8vaL37rtDrMf3aNbOE82ttLgIzW3Gj6SSQSvHUaDZb6mkQfILrgsLvc7fwhCIwSZK8y
         pjqG2HsIR5cql3YUeC0YYKSRBI2Ib/2T8fIBRCGDiHiU3OgR/DQ3bUY7Hw3ny4a6uwuv
         OoMb1cOyVvUslSDVMylfXrbUO4uye1ZJ2Vldqi/+zwhDiL0fsGsfLU/8hDUmiXS8ADr9
         TeXSMAUR/y1etmJVc8SjjaU7GjGfDK7oxq8F4ZEXIzKBbMbJrq2MTgRjsk0zT1DXzQX6
         h8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696418555; x=1697023355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjOkJQRldQl6LH5QGn3fpuDfZesu8P4IogGyEiDlMxc=;
        b=R4FcwXAoyL+HB5RudIOSdoUwri6afMC2kFk2qXylbPL9xJ2U0oRHwJ7UJXhWwmhudp
         +FjqF2UtIVSWdpe1RBtEbbwkMGL7ZfxHPc5jfzYjyDXb3Za264E8J/152PepFY9l5uYD
         sKd2LarzG462twXQBRHG5tpFNS42rLSGA9u2MY7McCoWYjBXcOz6jSzaNNjNIjIB3Lf8
         48zderptBrG/btT0OkEKZDKWiNbVRnfbvlLA2/HNtGPQoIplBuEkro/vX1W3NLB/i87k
         kcWi3qhySEel8Y/mY8ABeOLlbiUgd0zregUtT81Q7Aq5jMWW4gxhY5xk531ExAwYmDlM
         2dOA==
X-Gm-Message-State: AOJu0YyWwKgzZRH2MaZmXGKzgGAQm8N9h6SeOkwViIF1bJdF6mmLytkB
        S4FfQ10dA+fLHJgfeINZxRPq5zodSmPKz2Tpk/Njsw==
X-Google-Smtp-Source: AGHT+IH4+4e3SLTvPCcc8Z9MEoMHKyPp0GIfEt6BpUN9A+L0hwF8h6XMXd8uD/dyOk/+LoWfOogdqf/OfrlhwN4o8Pg=
X-Received: by 2002:a1f:d846:0:b0:49a:1dcf:21a8 with SMTP id
 p67-20020a1fd846000000b0049a1dcf21a8mr1342719vkg.16.1696418555454; Wed, 04
 Oct 2023 04:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org> <20231003-rust-line-info-soundness-v3-2-555ba21b4632@linaro.org>
In-Reply-To: <20231003-rust-line-info-soundness-v3-2-555ba21b4632@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 13:22:24 +0200
Message-ID: <CAMRc=MfhLtjeJk1q489kgAMdezYqyf_pLPPhhQR66n9Sq2xZfg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 2/3] bindings: rust: rename
 {event,settings}_clone to try_clone
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 3, 2023 at 11:40=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> What is getting cloned is already clear from the type. This also aligns
> a bit better with similar methods from the `std` crate [1].
>
> [1] https://doc.rust-lang.org/std/index.html?search=3Dtry_clone
>
> Link: https://lore.kernel.org/r/CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs | 2 +-
>  bindings/rust/libgpiod/src/edge_event.rs                    | 3 ++-
>  bindings/rust/libgpiod/src/line_settings.rs                 | 4 ++--
>  bindings/rust/libgpiod/tests/line_request.rs                | 2 +-
>  4 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs =
b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> index ad90d7b..8dbb496 100644
> --- a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> +++ b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> @@ -34,7 +34,7 @@ fn main() -> libgpiod::Result<()> {
>          let event =3D events.next().unwrap()?;
>
>          // This will out live `event` and the next read_edge_events().
> -        let cloned_event =3D libgpiod::request::Event::event_clone(event=
)?;
> +        let cloned_event =3D libgpiod::request::Event::try_clone(event)?=
;
>
>          let events =3D request.read_edge_events(&mut buffer)?;
>          for event in events {
> diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/lib=
gpiod/src/edge_event.rs
> index 0c0cfbc..4c940ba 100644
> --- a/bindings/rust/libgpiod/src/edge_event.rs
> +++ b/bindings/rust/libgpiod/src/edge_event.rs
> @@ -25,7 +25,8 @@ use super::{
>  pub struct Event(*mut gpiod::gpiod_edge_event);
>
>  impl Event {
> -    pub fn event_clone(event: &Event) -> Result<Event> {
> +    /// Makes a copy of the event object.
> +    pub fn try_clone(event: &Event) -> Result<Event> {

Hi Erik,

This fails to apply on top of current master of libgpiod. Could you verify?

Bart

>          // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
>          let event =3D unsafe { gpiod::gpiod_edge_event_copy(event.0) };
>          if event.is_null() {
> diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/=
libgpiod/src/line_settings.rs
> index f0b3e9c..41b27e2 100644
> --- a/bindings/rust/libgpiod/src/line_settings.rs
> +++ b/bindings/rust/libgpiod/src/line_settings.rs
> @@ -52,8 +52,8 @@ impl Settings {
>          unsafe { gpiod::gpiod_line_settings_reset(self.settings) }
>      }
>
> -    /// Makes copy of the settings object.
> -    pub fn settings_clone(&self) -> Result<Self> {
> +    /// Makes a copy of the settings object.
> +    pub fn try_clone(&self) -> Result<Self> {
>          // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
>          let settings =3D unsafe { gpiod::gpiod_line_settings_copy(self.s=
ettings) };
>          if settings.is_null() {
> diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust=
/libgpiod/tests/line_request.rs
> index da22bea..e0ae200 100644
> --- a/bindings/rust/libgpiod/tests/line_request.rs
> +++ b/bindings/rust/libgpiod/tests/line_request.rs
> @@ -272,7 +272,7 @@ mod line_request {
>              for offset in offsets {
>                  lsettings.set_debounce_period(Duration::from_millis((100=
 + offset).into()));
>                  lconfig
> -                    .add_line_settings(&[offset as Offset], lsettings.se=
ttings_clone().unwrap())
> +                    .add_line_settings(&[offset as Offset], lsettings.tr=
y_clone().unwrap())
>                      .unwrap();
>              }
>
>
> --
> 2.41.0
>
