Return-Path: <linux-gpio+bounces-21029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C08CACEAA6
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 09:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8001897371
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 07:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4927C1E7C03;
	Thu,  5 Jun 2025 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NfO6bVeq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6DB1C84D9
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 07:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107358; cv=none; b=vCWHEyqkDg7CK4Sxf8lmNfp1ChtXYE018K7xzXACSE341WWCatDXkWiloXHfYGtCnI1iQtzW+gTMt6n+dC4SnIaqFBLRLA0IXN+9OKZKC17wekQzuB52Ksb8zhbeoqIUJ7+6zCfQq2akzzmxbjuv0SIVWmuGd8hcBigYdMzVm0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107358; c=relaxed/simple;
	bh=VAnrDuCsj/ftouuxW93HEoRboeceO4ZhXRxXBOHxkYc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=ID8vLWenymPL7gAYg9VBQDR+Y23/QT0kDmSWpJbvADd3sZ5GfwDdGqz20t10mmOwuXs4PjKv2kYWzd/M/LdXVHMFnibWI8xxFLEezQNv8XXnO5n2w+vcNi6LEGnGosuqQIoM6MN41dp+GYMDpjPZKc+h0NeDePcWIuZV7ai8Cvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NfO6bVeq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so119394866b.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 00:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749107354; x=1749712154; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdRHU3L9WlCsxe4PlviWg63qNglQMvknpPY4FpQninU=;
        b=NfO6bVeqqVT8ArFUY0nBfUAJlVsLb7wUFWYKKfOo4lfm5qI3Yu604RHAaBwNyL16bQ
         yACyuIoJeNmJz6NwWM9jqYgASsli8/r7QriQ+RjUoxITLvY+MfMRtSufjIDe00aT/23M
         +1QsBQYaF5TKot3PgwR5TTS9FjdFF/S736qN6UcutOdTnIBHPsLlUsW0OE12WQyjNril
         dZ8RkmS6g3aa0x2IC3cZ/mNoxQO2karbmXDPkRBszvzI8A/3wfiAUZxDu+ks0J2TcpC/
         Uitu36sDZkT1Sp3KNe0yITHvjyKRnKEzDBkqjIlNzGOAy0d+/uuNTcEGrfn9xHC+qmCv
         zTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107354; x=1749712154;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pdRHU3L9WlCsxe4PlviWg63qNglQMvknpPY4FpQninU=;
        b=j8DBYBUp31uNjkMsM10kaCUNUo1cVy6y1zlmwJcnvRcVaBtcyNPM5R1ZFeE5BWva1l
         PWVUQuHsMIpT6qtiTiWg8DI4ZD39wLY8x9+OeflEeFbsuixWl05zaWR5rtLuxVEdupai
         ZD/MA2OmQ+jhI6bDPBm0rd4b/FAxmsnN7XDDhbWphqZrMd82QS6/Q0dKWIq2WtXWDed9
         7vXSQ95nlfquuqakZp/6+2gtKaloCrQx8TGp/n504+zDeocYW5xDYmcMZhE7yEBKdFay
         Cl/NsjDd88pRNEUGCaqlVZC6kw4pmC6BIqw0nntZmBu4J2WXFGY0JDdUNZw0Mcl44QpJ
         9OAA==
X-Gm-Message-State: AOJu0Yz4UFawFlL7nPqyL+16xKW8nmY6aRtAQk36ygP/Lu+/mXoBtBw1
	GwVKVURS9omcxbR8BIg1zS15Wq4lUSKvT+Ymxaisx39AeMVS9Bbx0eq+dGomtuRsqFM=
X-Gm-Gg: ASbGncu19iLFiIyqEZ3Z9c5msgzmVvXGoyVM0RYLy1k00jYNe4JHtiKhWO7i7E9/h/K
	Zg32G4dAnQqOwm/qhB0XP88dZIeeE2q9IBCeYV3TUaWjHBjSqncHoYraOT95fwH1Vy3gl0v4BYV
	I2mfN8BB0CnpW3CW3Ia7E8FXRW/e7ScxW+vkLFxAyiBP3UumSuO1IfeDeNN+4jg9AV4TQQjoZyH
	B7DCCYU0OHiGreYjn/0K63GPW7j5PQt8/vs3t7d+39k5UGQhn7a5YNHAK7Ro6IDk8fJvboQuxg8
	3axIxr6znNA87WZW3FJPyRGvuJo=
X-Google-Smtp-Source: AGHT+IFyqkX2xVFQtR+kqVXOvps+elWSFoZ4n2pgUq/dZkEvYohZuO1U4ErgzBbOEcJCsxeRBP1lBg==
X-Received: by 2002:a17:906:7b56:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-addf8ebb630mr409258666b.36.1749107353752;
        Thu, 05 Jun 2025 00:09:13 -0700 (PDT)
Received: from localhost ([2001:9e8:d5bf:a700::f39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c2abe0sm9893799a12.8.2025.06.05.00.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 09:09:12 +0200
Message-Id: <DAEET50ME6NU.294ZRFRVH2DX7@riscstar.com>
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Vincent Fazio"
 <vfazio@xes-inc.com>, "Kent Gibson" <warthog618@gmail.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Erik Schilling" <erik.schilling@linaro.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod 3/3] doc: integrate rust docs into the sphinx
 build
X-Mailer: aerc 0.20.1
References: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
 <20250604-rust-docs-v1-3-8ff23924a917@linaro.org>
In-Reply-To: <20250604-rust-docs-v1-3-8ff23924a917@linaro.org>

On Wed Jun 4, 2025 at 11:53 AM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Follow the pattern we established with GLib bindings: generate a separate
> set of docs for the rust bindings, make them part of the generated doc
> bundle and point to the rust index.html from the dedicated sphinx page.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .readthedocs.yaml |  3 +++
>  docs/conf.py      | 38 +++++++++++++++++++++++++++++++-------
>  docs/rust_api.rst | 22 ++++++++++++++--------
>  3 files changed, 48 insertions(+), 15 deletions(-)
>
> diff --git a/.readthedocs.yaml b/.readthedocs.yaml
> index 5f4f5ac4954de70e060f1a7b2eafe3a731620c16..d81900c9ad9a60d8530b58e38=
add3a3a353da718 100644
> --- a/.readthedocs.yaml
> +++ b/.readthedocs.yaml
> @@ -14,6 +14,7 @@ build:
>    os: ubuntu-24.04
>    tools:
>      python: "3.12"
> +    rust: "1.86"
>    apt_packages:
>        - autoconf
>        - autoconf-archive
> @@ -24,6 +25,8 @@ build:
>        - gir1.2-glib-2.0-dev
>        - gobject-introspection
>        - graphviz
> +      # Needed for stdbool.h in rust build
> +      - libclang-dev

Mostly it is needed for bindgen, right?

>        - libglib2.0-dev-bin
>        - libgudev-1.0-dev
>        - libtool
> diff --git a/docs/conf.py b/docs/conf.py
> index 04d1cea2a2175166555993c3e936e7cf1ebd0fe6..8c7bed234c98990f01adaec6c=
a3d6db2c3171c65 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -54,15 +54,16 @@ except ImportError:
> =20
>  html_theme =3D "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
> =20
> +# We need to know where to put docs generated by gi-docgen and cargo but
> +# app.outdir is only set once the builder is initialized. Let's delay ru=
nning
> +# gi-docgen until we're notified.
> +#
> +# For some reason on RTD we're in the docs/ directory while during a loc=
al
> +# build, we're still in the top source directory.
> +prefix =3D "../" if os.getenv("READTHEDOCS") =3D=3D "True" else "./"
> +
> =20
> -# We need to know where to put docs generated by gi-docgen but app.outdi=
r is
> -# only set once the builder is initialized. Let's delay running gi-docge=
n
> -# until we're notified.
>  def make_glib_docs(app):
> -    # For some reason on RTD we're in the docs/ directory while during a=
 local
> -    # build, we're still in the top source directory.
> -    prefix =3D "../" if os.getenv("READTHEDOCS") =3D=3D "True" else "./"
> -
>      subprocess.run(
>          [
>              "gi-docgen",
> @@ -77,8 +78,31 @@ def make_glib_docs(app):
>      )
> =20
> =20
> +def make_rust_docs(app):
> +    subprocess.run(
> +        [
> +            "cargo",
> +            "doc",
> +            "--manifest-path",
> +            f"{prefix}/bindings/rust/libgpiod/Cargo.toml",
> +            "--target-dir",
> +            f"{app.outdir}/rust/",
> +        ],

This would narrow it down to only the libraries that actually matter:

diff --git a/docs/conf.py b/docs/conf.py
index 8c7bed2..e5baeb2 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -82,8 +82,11 @@ def make_rust_docs(app):
     subprocess.run(
         [
             "cargo",
             "doc",
+            "--no-deps",
+            "--package=3Dlibgpiod",
+            "--package=3Dlibgpiod-sys",
             "--manifest-path",
             f"{prefix}/bindings/rust/libgpiod/Cargo.toml",
             "--target-dir",
             f"{app.outdir}/rust/",

As the other stuff is just build dependencies, we probably do not need
to include it in the output? But not having a strong opinion here.

- Erik


