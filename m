Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5204F734D67
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 10:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjFSIRo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 04:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjFSIRn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:17:43 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A46FE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:17:41 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-440bc794fa7so29497137.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687162661; x=1689754661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgD4qJRBXeNfcTIUMk3f0e36MarGtS5KG2SKvwvRiek=;
        b=zqcdk65E+RI4c3SU/gF5AJWCk6ZQK4ExtqmLrQLTiY9KhZcKtOWvB1s+KuWq+8g8d7
         +xqDeQW05JwxvEF7dGvRdPVEAYLbiCzbOJlTiY0YluMjAsU/DMg+vYVT0TIiIivIIHWn
         9N2GtLjF3WSxjZHpiFE9v4+WXSCOba0VU6w8iTTrtTbt6YJDhr3DZ1JgssJEHv4bbSdv
         ImkysHqMy9vxMga2/hiXIN2FmO+YqoeXmL7xMwngy/kSsbtfGWzIwmWwKFs9SWAG8ID6
         DJOQmF2/FO2xirXMfnJEIV4FZX0KXa9/OA02FT5gzaAWBj+L0o0/PZS4DYjiwTLSid6O
         jK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162661; x=1689754661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgD4qJRBXeNfcTIUMk3f0e36MarGtS5KG2SKvwvRiek=;
        b=MDggwH4ol/IjzMeYQbjhmj656riXE1fAMY6u2lg+cxhFZL5kKYpxBJGN4R2lJiutpP
         FjfsnbbPX5ELefLmtKXhEXxP5KjkTkpXmxpvDCvmrhbkMTbPsTLCqGz9qoLOQfgDazjp
         INdUQlbioBvNrHRoJzGDIi2b/UJVrOi5w5oePatTGO5K0fY8z81Jj0G0mxVQ0PoUcRv6
         4TmwfmrzD6kfHG1O5api+X3nNpxfxvALqPiIcRYl83ZtVro/WxA06/EVN0kJdam9En7q
         UxVJQ09jwpHOO+cFwVSUryfQxxlQ8MjfINsoZHyel3BcLRXalfs21JnovhrEE+2QCPr5
         rMzA==
X-Gm-Message-State: AC+VfDzzoQaXlnmx3hnXId+zyDupXxtbS//JTG0JQ7gPUliLw17wNCit
        NCPO9y5i6XOsf3xVOWH1RRifW2p84htSHticpFXbRA==
X-Google-Smtp-Source: ACHHUZ6iUMsN1kj6mdc3M+IpdnuRQWlmFL9i2AWXaUzS3rj6QTuKErnRFG8dtQ7egRHEoDLYOPFvT10Ehhl9lwPPIIY=
X-Received: by 2002:a67:f817:0:b0:43b:5552:7789 with SMTP id
 l23-20020a67f817000000b0043b55527789mr2071841vso.17.1687162660900; Mon, 19
 Jun 2023 01:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230616-msrv-v1-1-1f0ca25b8222@linaro.org>
In-Reply-To: <20230616-msrv-v1-1-1f0ca25b8222@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 19 Jun 2023 10:17:29 +0200
Message-ID: <CAMRc=McFr7XRQDDu6ptsCY+=dxkK2chsgV3PCObiq1ykEoe1Dg@mail.gmail.com>
Subject: Re: [PATCH RESEND libgpiod] bindings: rust: bump MSRV to 1.60
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 16, 2023 at 10:38=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> Specifying MSRV (minimum supported rust version) was introduced with
> Rust 1.56. So old versions of libraries do not have this restriction
> spelled out in their Cargo.toml.
>
> This means that even if we claimed a MSRV of 1.56 until now, that did
> not mean that things were actually buildable with 1.56 practically
> (without manually researching compatible versions and pinning them
> down).
>
> `bindgen` started listing a MSRV from v0.61 (requiring Rust 1.57) [1].
> So that may seem like an obvious choice. But if one attempts to build
> it with such an old version one will realize that `log` only started
> requesting a MSRV with 0.4.19 (requesting Rust 1.60) [2]. Hence, we
> would either need to manually restrict log to an old, but compatible
> release (which would unnecessarily restrict everyone on newer Rust
> versions) or just also bump our MSRV to 1.60.
>
> Rust 1.60 was released on 2022-04-07 [3] and seems like an acceptable
> choice if core components such as `log` started their MSRV tracking with
> that version. If someone is determined wanting to use this with an older
> version of Rust, thats still possible. If one has done the necessary
> manual research and pinned their versions down, one can use
> --ignore-rust-version (or a < 1.56 version of Rust that does not check
> the MSRV yet).
>
> Thanks to Manos Pitsidianakis <manos.pitsidianakis@linaro.org> for
> helping me out when I successfully confused myself somewhere.
>
> [1] https://github.com/rust-lang/rust-bindgen/blob/v0.61.0/bindgen/Cargo.=
toml
> [2] https://github.com/rust-lang/log/blob/0.4.19/Cargo.toml
> [3] https://blog.rust-lang.org/2022/04/07/Rust-1.60.0.html
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> While looking at the clippy fixes [1], I realized that things do not
> actually build with the minimum supported Rust version that we claim.
> The simplest way forward seems to be just bumping that version.
>
> [1] https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com=
/
>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Kent Gibson <warthog618@gmail.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  bindings/rust/gpiosim-sys/Cargo.toml  | 2 +-
>  bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
>  bindings/rust/libgpiod/Cargo.toml     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim=
-sys/Cargo.toml
> index af30748..1f44a31 100644
> --- a/bindings/rust/gpiosim-sys/Cargo.toml
> +++ b/bindings/rust/gpiosim-sys/Cargo.toml
> @@ -9,7 +9,7 @@ authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description =3D "gpiosim header bindings"
>  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.gi=
t"
>  categories =3D ["external-ffi-bindings", "os::linux-apis"]
> -rust-version =3D "1.56"
> +rust-version =3D "1.60"
>  keywords =3D ["libgpiod", "gpio", "gpiosim"]
>  license =3D "Apache-2.0 OR BSD-3-Clause"
>  edition =3D "2021"
> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpi=
od-sys/Cargo.toml
> index 0c814ee..b4d26e9 100644
> --- a/bindings/rust/libgpiod-sys/Cargo.toml
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -9,7 +9,7 @@ authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description =3D "libgpiod public header bindings"
>  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.gi=
t"
>  categories =3D ["external-ffi-bindings", "os::linux-apis"]
> -rust-version =3D "1.56"
> +rust-version =3D "1.60"
>  keywords =3D ["libgpiod", "gpio"]
>  license =3D "Apache-2.0 OR BSD-3-Clause"
>  edition =3D "2021"
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/C=
argo.toml
> index d6758be..518e5e5 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -9,7 +9,7 @@ authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description =3D "libgpiod wrappers"
>  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.gi=
t"
>  categories =3D ["api-bindings", "hardware-support", "embedded", "os::lin=
ux-apis"]
> -rust-version =3D "1.56"
> +rust-version =3D "1.60"
>  keywords =3D ["libgpiod", "gpio"]
>  license =3D "Apache-2.0 OR BSD-3-Clause"
>  edition =3D "2021"
>
> ---
> base-commit: 9a80247cf4a70c837055271c978afda7ef107338
> change-id: 20230616-msrv-0f1d20f5bd09
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Applied, thanks!

Bart
