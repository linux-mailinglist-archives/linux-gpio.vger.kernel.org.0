Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEFCA7B1C62
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 14:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbjI1M1o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 08:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbjI1M1m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 08:27:42 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE25CCA
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 05:27:38 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so12400852a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695904057; x=1696508857; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIQnGLlP4hkFRMl/GKJkL/X993n1nFB/JIEZCvbEWJw=;
        b=Ajc6vh97oqsTUsy9A1wFleMJafJdIxL6YK7XeDlQbm/kN+5aCDnCz4MTbLUDP0yQcf
         C168Wd5+uZlylcTpShL9XBtq56eOIrxyFhZW8s4QOXKBf0i6K8xWvCc2kjFbOqSilqhy
         yr09luutiozNmKJT4/J18t4Zj2Src0XVA/ZAn/OKaY1u9p4z546EPiD5xfSmbIaEaEbS
         j0wF/Xzq9vqrNvpuUaRzT/56QOHoR+B0Q/gd7wEhzPT/mktNCf5WLXTMPF4nlGf6vEyX
         +5xp5sIpmXTWbpdlg3TQvRqZfhNxzGvjHN1Lfh2LsN8pjAPNQj664l1gOMuYNl8xk7l3
         Ux7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695904057; x=1696508857;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fIQnGLlP4hkFRMl/GKJkL/X993n1nFB/JIEZCvbEWJw=;
        b=SqbsPPG3pjBRZZIdcE+1vLSl5dJ4wnl8Umtz+tPc2eV6pJKb9D75HLZ88qf8USdb7k
         UDY1BUE90KGKArOIFmwMQ4N6Cp2gDvg1UkoVSR7CB9CVdh49ibnRDY1P5ASYVa4oGFmf
         A0hnQegJE4DwrY7M70pvY05A/rRnQs1vk767InpTNQLe3YydcikuEQfKWxufrSLLpxwW
         Hl1vNy6OTc8eTaa95OUhlfhWxeUfxMSuZc1d34CsihSprFIzI+2AE3ABgKYOs2cMSiGi
         oopbC2xkK8QpAS5qGWo0VewelnXgDmb7kJfvVLuBAXwPrJp+khAUOp6W7vTuVtAqyyLX
         PIVA==
X-Gm-Message-State: AOJu0Yx0MEyTLNRQmeEPDb8ynisXp1Kclzj6GVYBB/+Wue8KkkrLcCMW
        Le8RpYVtoRXT487b1pawGwCngQ==
X-Google-Smtp-Source: AGHT+IH8Qf+mEYGwj0T5bcjp5ZYasJiTtBCrMR17mYrL7ICSL2dZWMl2IQHyOyfk8K87JFQg4YjhGA==
X-Received: by 2002:aa7:c55a:0:b0:532:c81b:99b1 with SMTP id s26-20020aa7c55a000000b00532c81b99b1mr1177998edr.18.1695904056672;
        Thu, 28 Sep 2023 05:27:36 -0700 (PDT)
Received: from localhost (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id p17-20020aa7d311000000b00532bec5f768sm9661794edq.95.2023.09.28.05.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 05:27:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 28 Sep 2023 14:27:35 +0200
Message-Id: <CVUJTBQZYN6B.17WXH28G8MKZ2@ablu-work>
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>
To:     "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of
 line_info modeling
X-Mailer: aerc 0.15.2
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
 <20230928112733.nkzirzdcdirmxr3w@vireshk-i7>
In-Reply-To: <20230928112733.nkzirzdcdirmxr3w@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu Sep 28, 2023 at 1:27 PM CEST, Viresh Kumar wrote:
> On 27-09-23, 18:29, Erik Schilling wrote:
> > diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpio=
d/src/chip.rs
> > index 81e1be6..02265fc 100644
> > --- a/bindings/rust/libgpiod/src/chip.rs
> > +++ b/bindings/rust/libgpiod/src/chip.rs
> > @@ -95,7 +95,7 @@ impl Chip {
> >      }
> > =20
> >      /// Get a snapshot of information about the line.
> > -    pub fn line_info(&self, offset: Offset) -> Result<line::Info> {
> > +    pub fn line_info(&self, offset: Offset) -> Result<line::InfoOwned>=
 {
> >          // SAFETY: The `gpiod_line_info` returned by libgpiod is guara=
nteed to live as long
> >          // as the `struct Info`.
> >          let info =3D unsafe { gpiod::gpiod_chip_get_line_info(self.ich=
ip.chip, offset) };
> > @@ -107,12 +107,16 @@ impl Chip {
> >              ));
> >          }
> > =20
> > -        line::Info::new(info)
> > +        // SAFETY: We verified that the pointer is valid. We own the p=
ointer and
> > +        // no longer use it after converting it into a InfoOwned insta=
nce.
> > +        let line_info =3D unsafe { line::InfoOwned::from_raw_owned(inf=
o) };
> > +
> > +        Ok(line_info)
>
> Maybe get rid of the extra `line_info` variable and return directly ?

Will fix in v2

>
> >      }
> > =20
> >      /// Get the current snapshot of information about the line at give=
n offset and start watching
> >      /// it for future changes.
> > -    pub fn watch_line_info(&self, offset: Offset) -> Result<line::Info=
> {
> > +    pub fn watch_line_info(&self, offset: Offset) -> Result<line::Info=
Owned> {
> >          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> >          let info =3D unsafe { gpiod::gpiod_chip_watch_line_info(self.i=
chip.chip, offset) };
> > =20
> > @@ -123,7 +127,11 @@ impl Chip {
> >              ));
> >          }
> > =20
> > -        line::Info::new_watch(info)
> > +        // SAFETY: We verified that the pointer is valid. We own the i=
nstance and
> > +        // no longer use it after converting it into a InfoOwned insta=
nce.
> > +        let line_info =3D unsafe { line::InfoOwned::from_raw_owned(inf=
o) };
> > +
> > +        Ok(line_info)
>
> Same here ?
>
> > diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/l=
ibgpiod/src/info_event.rs
> > index db60600..e88dd72 100644
> > --- a/bindings/rust/libgpiod/src/info_event.rs
> > +++ b/bindings/rust/libgpiod/src/info_event.rs
> > @@ -44,7 +44,7 @@ impl Event {
> >      }
> > =20
> >      /// Get the line-info object associated with the event.
> > -    pub fn line_info(&self) -> Result<line::Info> {
> > +    pub fn line_info(&self) -> Result<&line::Info> {
> >          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> >          let info =3D unsafe { gpiod::gpiod_info_event_get_line_info(se=
lf.event) };
> > =20
> > @@ -55,7 +55,9 @@ impl Event {
> >              ));
> >          }
> > =20
> > -        line::Info::new_from_event(info)
> > +        let line_info =3D unsafe { line::Info::from_raw_non_owning(inf=
o) };
>
> SAFETY comment ?

Good catch. Forgot that the lint is not enabled by default... Will fix
in v2.

>
> > +
> > +        Ok(line_info)
> >      }
> >  }
> > =20
> > diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/li=
bgpiod/src/line_info.rs
> >  impl Info {
> > -    fn new_internal(info: *mut gpiod::gpiod_line_info, contained: bool=
) -> Result<Self> {
> > -        Ok(Self { info, contained })
> > -    }
> > -
> > -    /// Get a snapshot of information about the line.
> > -    pub(crate) fn new(info: *mut gpiod::gpiod_line_info) -> Result<Sel=
f> {
> > -        Info::new_internal(info, false)
> > -    }
> > -
> > -    /// Get a snapshot of information about the line and start watchin=
g it for changes.
> > -    pub(crate) fn new_watch(info: *mut gpiod::gpiod_line_info) -> Resu=
lt<Self> {
> > -        Info::new_internal(info, false)
> > +    /// Converts a non-owning pointer to a wrapper reference of a spec=
ific
> > +    /// lifetime
> > +    ///
> > +    /// No ownership will be assumed, the pointer must be free'd by th=
e original
> > +    /// owner.
> > +    ///
> > +    /// SAFETY: The pointer must point to an instance that is valid fo=
r the
> > +    /// entire lifetime 'a. The instance must be owned by an object th=
at is
> > +    /// owned by the thread invoking this method. The owning object ma=
y not be
> > +    /// moved to another thread for the entire lifetime 'a.
> > +    pub(crate) unsafe fn from_raw_non_owning<'a>(info: *mut gpiod::gpi=
od_line_info) -> &'a Info {
>
> I think we can get rid of _non_owning, and _owned later on, from function=
s since
> the parent structure already says so.
>
> Info::from_raw()
> InfoOwned::from_raw()
>
> should be good enough ?

I got no strong feelings here. I first started with `from_raw`, but switche=
d to
the added suffix since `Info::from_raw` sounded ambigous to me.

>
> > -    /// Get the Line info object associated with an event.
> > -    pub(crate) fn new_from_event(info: *mut gpiod::gpiod_line_info) ->=
 Result<Self> {
> > -        Info::new_internal(info, true)
> > +    fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
> > +        self as *const _ as *mut _
>
> What's wrong with keeping `_info` as `info` in the structure and using it
> directly instead of this, since this is private anyway ?

We would still need to cast it the same way. One _could_ write:

    fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
        &self.info as *const _ as *mut _
    }

But the cast dance is still required since we need a *mut, but start
with a readonly reference.

This is required since libgpiod's C lib keeps the struct internals
opaque and does not make guarantees about immutable datastructures for
any API calls.

Technically, the 1:1 mapping of this to Rust would be to restrict the
entire API to `&mut self`. One could do that - it would probably allow
us to advertise the structs as `Sync` - but it would require consumers
to declare all libgpiod-related variables as `mut`.

- Erik

