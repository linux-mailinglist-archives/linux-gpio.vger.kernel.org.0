Return-Path: <linux-gpio+bounces-182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A41F7EC92A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 18:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AA7AB20BCF
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 17:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD6435EFB;
	Wed, 15 Nov 2023 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XxlRsfwE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633FB3307B
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 17:02:32 +0000 (UTC)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087E218A
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 09:02:31 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5845213c583so3670796eaf.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700067750; x=1700672550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHo34Qa2xUQ52HA0AqSmcyR3GWlx1i7YluU8N4ZaLFs=;
        b=XxlRsfwEiXFQKxYN5mzkxPysacEmFyKUnlkts1ZvkMm5+jLwlbfj3gTjTvHDLNjyzd
         Nm7Xxmre2AhhATg5bCDVpwFShjpGU/UCw0RdJGRb42tuBHH5v9Td9I5Q1Y31522oYC+Z
         yndIt4bEzKS35QGyNLDD7pU/5IjneULcpbvRqzvX09oomUv5BN5Ht79XVqXatKg/vQ2k
         oQXq+zmxNEjCYt9p0DHytyHpSij5p1dCvotG99hjhJWbsewbzPJZ2CPM/+7TlrByPemc
         e+llHqpHDrkHM1ngecow+glS/oe1sfK3SjwEXEchnSXwejKY0qVgDFPz5PDuMaRGm18q
         aCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067750; x=1700672550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHo34Qa2xUQ52HA0AqSmcyR3GWlx1i7YluU8N4ZaLFs=;
        b=OLKO/LPJ7+DYcKD56YH2XFXLlfC2BF/S+/dr8jduL8idebLJ91va1445F2VyOYB0So
         SUhNZjvzM0wLw/o38HTAh+y8ljGPNqz9yXP3FQXcwhkI70Or2HdpAhWaBq0NypP7i/6Z
         BSLqhfMBfuwHRTX63Kau7UNeKYqqGIi6QVdqfFxY2GH+XBB4zOR0jikz9APnT0PNTQ9t
         UxpyE5D/Dp0I1pZX2vLan0EXLP0jWId9qQrBZB8Vj92nnnlmy5hpXCm05kWgnTQzUVuw
         jsyK+WJE/82hGP3rqopIq/kUoTF96nyYsOvr0uQr7sPsgnNfEgl4eZ4lfD4MqH+yyF3F
         hKKw==
X-Gm-Message-State: AOJu0YwHjA7IINxQIExh4iRmQJthNa2WQYpt/4GKXBexvmYfr1R2N0DB
	/RB/t0tAOmjXN83DR+Y/roiO15UKvmL4Tk1IVmsbcFz5eKNJunP3mMo=
X-Google-Smtp-Source: AGHT+IGuqvj3TbGcpDcBOXQqM5ceRt/wESBAKWRjWjFyOQUdP2Mwae878UWgOCJ8XpKGx3Gz2Z/Ipc/PZbILovYc+j0=
X-Received: by 2002:a05:6358:7f15:b0:168:d966:c1e8 with SMTP id
 p21-20020a0563587f1500b00168d966c1e8mr7128732rwn.30.1700067750302; Wed, 15
 Nov 2023 09:02:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114-rust-release-0_2_2-v1-1-8aed47e7f395@linaro.org>
In-Reply-To: <20231114-rust-release-0_2_2-v1-1-8aed47e7f395@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Nov 2023 18:02:19 +0100
Message-ID: <CAMRc=MfXRo6rRjM4sK-jXNRPC0Tyt8jAb3t_FsoUjiFHCF7kNg@mail.gmail.com>
Subject: Re: [PATCH libgpiod] bindings: rust: libgpiod: release 0.2.2
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Linux-GPIO <linux-gpio@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 9:43=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> Minor update the exposes feature flag and bindings for v2.1.
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 7552e5d (bindings: rust: expose v2.1 features as flag, 2023-11-06)
> bc91656 (bindings: rust: add wrapper.h to EXTRA_DIST, 2023-11-03)
> 3b40a37 (bindings: rust: fix EXTRA_DIST for examples, 2023-11-03)
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> As usual, I will publish this version once this commit gets merged.
> ---
>  bindings/rust/libgpiod/Cargo.toml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/C=
argo.toml
> index 7ddf5fd..23c3479 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -4,7 +4,7 @@
>
>  [package]
>  name =3D "libgpiod"
> -version =3D "0.2.1"
> +version =3D "0.2.2"
>  authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description =3D "libgpiod wrappers"
>  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.gi=
t"
>
> ---
> base-commit: 665f360a266c2c5dbcd4632238743e503c492b9e
> change-id: 20231114-rust-release-0_2_2-dacdafe47626
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Applied, thanks!

Bart

