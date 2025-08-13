Return-Path: <linux-gpio+bounces-24336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F1B24215
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 09:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC075A1AD6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 06:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F172D3237;
	Wed, 13 Aug 2025 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="C+3vq9hf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9472BF3DB
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 06:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755068268; cv=none; b=Kr3qe+4nV7zbQ+qBXHxPblYnyWNcW9jP3ZceIRqnt+uaWxVa1g1kNfhTjPwv9yAnt9xHuBxK8vmPevFTMDcBMLW8Qn12GLNsPRJrttaF8DdKg2+f/y58zhOiZ43GHc+YpFVMr75PL8hH7TKTXh3VRzF6tmSUa7MV0TgSJhMqlik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755068268; c=relaxed/simple;
	bh=uVBJ6vz+4jPlXgxJVpSeQrbuztd3h7ScOqKSCa4lcF8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=JpHgK5ixT0jZORw3PugQF5z0A2iDX7/bePoX67ynn99i6UBWra597vUsM1Td/zYna3Ozyv+8LJnIHDbCpwpoktCAwZWxi0Dt5kJio7OUXoLnrvSpZeaugmR1PRxp9I3kyBXlmsrjTI62w6tYP4eETaJ/zfnBM2bJ5YtOPbCvsts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=C+3vq9hf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b7961cf660so5029505f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 23:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755068263; x=1755673063; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg2/G1GViSU4LjfDQySaQw4/LLEDkDeZISNJ4SMdOfQ=;
        b=C+3vq9hfWZZCrblqoRkF98uUXWnd66eDjUNEtCg884XdysEvy47BLKyG1awS9q/mk6
         fWTgXIpbpwhNJhCAZ9bKouXWlQ889xyfOyV2iqr2zd+1z61rBBBr0rBCzM86Dy/GXm2H
         /8tQpfvKrm3XK2K4wLre8j9aAbQjidnNp4Bt7eqsd5ttsKbCOO1KB8K1GzPrQ+4jsJno
         0Fk1jI5ByhbKiOHSdEt4WnbhbFE2alNYpnSiKKX3/LJKiQiVE+Ydk/CC/lqRGJ4HJfzh
         ekNp36zO77DBV9nvAuPUEHJ+zoRUIUquZVRDjb1p4GyOUkIUzCqFlqSKIOErWm2SFrwt
         NJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755068263; x=1755673063;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hg2/G1GViSU4LjfDQySaQw4/LLEDkDeZISNJ4SMdOfQ=;
        b=CnpTH8PrDskGytT6jHWCklRbW9fGWX4Wuj0thknq7EWQex5M9KBsr1cgSnpmmW8EKa
         yL5mrzpk70rgVdySOPdpbz+PYiLilpslhlJGolLKcimPgkLD8LOn8of/T6Shp0/hjmMV
         end1b7vawORKoVSwWjwL6n1oe2TUWbOqp3k4ISqx+eihbFCGrnBlo+zvWFDNGfvA1aFa
         U0i99DQZ0izSzNHYNO/bEc8PVI2oFnViWdZ1iczYE2hBAPoIRLhRWALPrBQFFad4ltxq
         QcC2Xoc3sAGEWy+3mdsKLOMCfVQwHAxb79TExL2RTmg96iJZhM74UI/xlKd0NLPmzhNA
         AV0g==
X-Gm-Message-State: AOJu0Yy4rkNRiv1nR0W/002NA/1S4vcTaoryAW0J0FUUgN4bNtrMEGAu
	DsQtGl1PrKojIp977o3KXDvmGPIbY2aKoIWokuc8IviG2QfCMVXDnI2eAbee/a22AXg=
X-Gm-Gg: ASbGnctkJiqrQMdhoCpLcD0cmdJnIWkY7MT+1nOBeGoY1VG7VQUDWqMOGdbdqYcSFiO
	T988dGfK/2qWus9JhWHXk9N6WwzprAzlvBtNOE3VlyYjEgubU4xV5H8m8axOoNmhIJMScqf4VL9
	EnUARfozeGXSMjfCTJeRSDv2hAR70GKHcsJB39Y8LZUX/MWwtVPPb/6bFx+nnoOlgiLFGMC/kQ+
	VwbbxR0o0h0Lr9xs3toOU9cYdA0WUjQ/JN7iHjhctN1TzRLcLIV7ub6WdxcOX+wMn1MMe1xQIV8
	LglGiivv3teMymHNHSN+98kkWB1oHLXdaFcNGV72VnRioikIg5+6T8ISd8FneFCNYtYe4jR5lJy
	j4+JbrczR
X-Google-Smtp-Source: AGHT+IHAP9/7FOoxP/3YngoXGp7QUNBKjkJQq/ZAVnYmmAOf94I9USjuFHvq0E5n+MEQSB2AyJ4cHg==
X-Received: by 2002:a05:6000:18a7:b0:3b4:6577:eed5 with SMTP id ffacd0b85a97d-3b917d1ce5emr1310335f8f.12.1755068262609;
        Tue, 12 Aug 2025 23:57:42 -0700 (PDT)
Received: from localhost ([2001:9e8:d5b4:9700::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c46ee84sm45496905f8f.57.2025.08.12.23.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 23:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 08:57:41 +0200
Message-Id: <DC13RWRXSOVL.4J9R43495IEN@riscstar.com>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod 09/10] bindings: rust: update rust version
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
X-Mailer: aerc 0.20.1
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-9-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-9-372d698f23e8@linaro.org>

On Tue Aug 12, 2025 at 2:10 PM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With all previous fixes to rust bindings, we can now update the rust
> version and required edition to 2024.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod-sys/Cargo.toml | 4 ++--
>  bindings/rust/libgpiod/Cargo.toml     | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpi=
od-sys/Cargo.toml
> index 7fb5c174ec8186b6ef8cd64e1e6f25a13bd0dcd3..ab86ff8ecf871bfc3f931f8ea=
08490c4eb40eee6 100644
> --- a/bindings/rust/libgpiod-sys/Cargo.toml
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -9,10 +9,10 @@ authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description =3D "libgpiod public header bindings"
>  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.gi=
t"
>  categories =3D ["external-ffi-bindings", "os::linux-apis"]
> -rust-version =3D "1.60"
> +rust-version =3D "1.86"
>  keywords =3D ["libgpiod", "gpio"]
>  license =3D "Apache-2.0 OR BSD-3-Clause"
> -edition =3D "2021"
> +edition =3D "2024"
> =20
>  exclude =3D [
>      "Makefile.am",

Is there a particular reason to to pick this specific rust-version? This
essentially sets the floor of the MSRV (Minimum Supported Rust Version)
of this lib.

That means that it won't build with any older Rust version, which may
impact users of the lib that are still lagging slightly behind?

I would only bump this if our libs start to require it (or we use new
features ourselves). So I think we should spell out which libs/features
mandate this bump in the commit message and only update as high as we
need to.

- Erik

