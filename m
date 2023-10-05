Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C9D7BA8C6
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 20:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbjJESKg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 14:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbjJESKM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 14:10:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F56F196
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 11:09:59 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9b29186e20aso225213266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696529398; x=1697134198; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdlAd8ygLrbf4H63nBeqLB4RCzL/8+Q0PM9tQ9Q8DxA=;
        b=Buk4L7ULtzp0WHd3JGeWRH4uBnoSEz8v08/LpQetckKolAwws6M8x8DWG6UDUwZLmI
         vfR2z//pxKz9LJpbv2r63Lsm3ylz9wyekniFQMUx+60IHDi80lek5qJu2cqj6U13255O
         FN+8wRRt0OwG9OpEimXJtz6kQuac5cb6XjhDZdcxnKlbFF+mQvjoRq0w78h7d/a6EPdx
         s7Qy7Dpqlwb8b9q8kH0vQANHYCesYcwBemFx+CwCAfaHf45OiuUGL/3rPRJ1X7FDR5W/
         uzEPAwReQsPJ8cxTvTRiXSVz5GfwfVhAgVQkDE7A9MgVdPX7rW0R9ZvrKo8u5vHESu7l
         KGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696529398; x=1697134198;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mdlAd8ygLrbf4H63nBeqLB4RCzL/8+Q0PM9tQ9Q8DxA=;
        b=WPTVQFzXZR3cShfAkap+Km2B1rpr92+S+OTwdwhuXe/0gAlcP9Ak46H51SxPnR4npF
         mObpWQtPav0Wvej6aEuFfSVcMljNW9IHVlvvCEaPh6LfGn5VejfvW1oOg83LXCxZRGtQ
         OJMGKisMxeFadnr3z9TNqEZTgLbjL8nFve43OFUy7+vwj2nrhY06OTCNRERsAOmidvKZ
         T4tFjwwGEvN75bVTN8cB2yE/nfwNxx/t9AO+XfsSIaHsEtI/iGSD8ty6CA8EDTZxf+c6
         QAVA8zeE28SgDJx0T0LCaaev/y+OgubPADbjxWwMdaSFo+aNhjcdleg9oHOYlUTo+diu
         ZsNw==
X-Gm-Message-State: AOJu0YzSxF2eEDkmYyEJ1ayGAZ16085qMMCIaAh8iGdm4DmR65kMIM1b
        IIEiWDqdjO1SLdCtu+McN18suQ==
X-Google-Smtp-Source: AGHT+IHE62DNmizxVMMCv2Q0vkKHfUWnhdBY/esxgYu69j2uYwNc+Dw81udJAgS2v8EwcfqD3QtOIg==
X-Received: by 2002:a17:906:20d8:b0:9a1:bebc:8282 with SMTP id c24-20020a17090620d800b009a1bebc8282mr5294676ejc.32.1696529397876;
        Thu, 05 Oct 2023 11:09:57 -0700 (PDT)
Received: from localhost (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id kf24-20020a17090776d800b009b95787eb6dsm1546531ejc.48.2023.10.05.11.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 11:09:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 05 Oct 2023 20:09:56 +0200
Message-Id: <CW0PH9GI74F3.1B30D7MK0P0DB@ablu-work>
Subject: Re: [libgpiod][PATCH] bindings: rust: libgpiod: release 0.2.0
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231005-b4-rust-release-0_2_0-v1-1-0fab05c09962@linaro.org>
 <CAMRc=MeTHSwyTPcjm1kttCjr4GrknqM2pqfWZ8ngFWWxC8YxeQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeTHSwyTPcjm1kttCjr4GrknqM2pqfWZ8ngFWWxC8YxeQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu Oct 5, 2023 at 7:47 PM CEST, Bartosz Golaszewski wrote:
> On Thu, Oct 5, 2023 at 9:42=E2=80=AFAM Erik Schilling <erik.schilling@lin=
aro.org> wrote:
> >
> > Since we had some (potentially-)breaking changes, we bump the major for
> > the next release of the crate.
> >
> > Note:
> > I am using the term "major" as defined in the Rust SemVer compatibility
> > guide [1], where the first non-zero digit is considered as "major".
> >
>
> This makes no sense to me in terms of logical versioning but I trust
> you guys know what you're doing.

It basically allows for people to either use just MAJOR, MAJOR.MINOR
(like we do at the moment) or MAJOR.MINOR.PATCH by leaving the leading
fields 0.

I got no strong feelings on this. We could switch to MAJOR.MINOR.PATCH
with the next bump if that is more logical to your :).

> Applied.

Thanks! Published: https://crates.io/crates/libgpiod.

- Erik

>
> Bart
>
> > [1] https://doc.rust-lang.org/cargo/reference/semver.html
> >
> > Changelog:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > (potentially-)breaking changes:
> >   a29f3e6 (bindings: rust: rename {event,settings}_clone to try_clone, =
2023-10-04)
> >   b290348 (bindings: rust: fix soundness of line_info modeling, 2023-10=
-03)
> >   d04639d (bindings: rust: bump MSRV to 1.60, 2023-06-16)
> >
> > new functionality:
> >   808d15e (bindings: rust: allow cloning line::InfoRef -> line::Info, 2=
023-10-03)
> >   64aac85 (bindings: rust: mark all owning types as `Send`, 2023-09-28)
> >   d12ce74 (bindings: rust: provide LineRequest::chip_name(), 2023-07-20=
)
> >   53226d5 (bindings: rust: examples: add dedicated examples, 2023-06-14=
)
> >
> > other changes:
> >   0a570b6 (bindings: rust: drop unneeded Arc within Chip, 2023-09-27)
> >   a97fe96 (bindings: rust: construct chip infos by reference, 2023-09-2=
7)
> >   27afa47 (bindings: rust: remove useless clone, 2023-09-28)
> >   3f6e0bf (bindings: rust: add README.md for libgpiod crate, 2023-07-03=
)
> >   4b8357b (bindings: rust: clippy: silence false-positive on iterator, =
2023-06-30)
> >   39189f0 (bindings: rust: clippy: drop unneeded conversions, 2023-06-3=
0)
> >   46115fd (bindings: rust: clippy: silence false-positives on casts, 20=
23-06-30)
> >   901104e (bindings: rust: clippy: drop unnecessary casts, 2023-06-30)
> >   46ecbe0 (rust: examples: file comment consistency, 2023-06-24)
> >   aaed0f2 (bindings: rust: examples: replace tools examples with use ca=
se examples, 2023-06-23)
> >   b37bd9e (bindings: rust: examples: consistency cleanup, 2023-06-23)
> >   06c8ad9 (bindings: rust: package new examples in the distro tarball, =
2023-06-15)
> >
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> > After merging a couple of important soundness fixes and threading API
> > adjustments, I suggest doing a new release for the Rust bindings.
> >
> > Once this is merged, I will publish the tree of this commit to
> > https://crates.io/crates/libgpiod/.
> > ---
> >  bindings/rust/libgpiod/Cargo.toml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod=
/Cargo.toml
> > index 518e5e5..3be4aa0 100644
> > --- a/bindings/rust/libgpiod/Cargo.toml
> > +++ b/bindings/rust/libgpiod/Cargo.toml
> > @@ -4,7 +4,7 @@
> >
> >  [package]
> >  name =3D "libgpiod"
> > -version =3D "0.1.0"
> > +version =3D "0.2.0"
> >  authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
> >  description =3D "libgpiod wrappers"
> >  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.=
git"
> >
> > ---
> > base-commit: a29f3e6957914dc564c723a8fc405cd99e407fd2
> > change-id: 20231005-b4-rust-release-0_2_0-1344e6af7cc2
> >
> > Best regards,
> > --
> > Erik Schilling <erik.schilling@linaro.org>
> >

