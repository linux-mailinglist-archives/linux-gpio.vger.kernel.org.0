Return-Path: <linux-gpio+bounces-11061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8A0995040
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99B3B1F22072
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94AC1D9A43;
	Tue,  8 Oct 2024 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZcGNxDLf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA098190055
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394551; cv=none; b=EWTc3HfUVs0xYjXpPqmblo9mNP+PzrCGgvfBmf0RCEPwSZE5FvihMelC8EeDoDk1mQ8eS4TzghD/1foiU0A8wLcZqtl43usTMgpNeTeXjzG7jMq4Sx/x3NBr1GccDWgx8pcbCu338Dbg+rvTQREQMQ3s15mSL2r0gTTREbq/bVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394551; c=relaxed/simple;
	bh=ZWkN+g1bzGVgRe+H0bhC4JtTeyieLcuq6uNHfCOjigI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIR9v+TPqnMaotYn36sLs4j+ov7T+hUxKbbOJaYmNfk2mEaXCe43g19DgfxQANyFQifxN1iNurTht3u2pfCudFnf0F2HA8bxQ1mNN9IjMJY5Rt3NM3gwoz20svrDaLnXDu9NRacf/UHdy1Yx9vzi5Rj3Jg/T0YR3yg9rbeSSOiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZcGNxDLf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2faccccbca7so47529551fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728394548; x=1728999348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuB+18Jdhc0isS314D/f+eLeodQRX76H6zROr5I6eeE=;
        b=ZcGNxDLfple3194LADURdSycTwMTptsBiKownhLOd/XRtT91Q3w6Dt7gfc3HeioKfk
         7s36hqEm+68RIvUflGfRg/hhBrxrwgYJwjgdTjbQ8VgefhglNCWrz10kQxlker3A3iy/
         C1x3eZLul/hwdEv1oR7pNXeauit1drUuiHiofQ7XF1a9ly1ilc3PFhLasauLWCsv8tyX
         V4sYmsBST2rhZIxYg86qKzwo7xaawYAem6tzKYoHDep8ZmQwuSbW+c+XnCjZBDDTYiIC
         8N/kFVVb24zWOFEN16RC3MwKoDz/Nbvb7mc4l0iVGnNaBBvMqIw6OXjJeApjTzAgmfHq
         2ZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394548; x=1728999348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuB+18Jdhc0isS314D/f+eLeodQRX76H6zROr5I6eeE=;
        b=dPU36xZQpKksJetBiYRtyCM6qUFYbbA1mJv6vKYXObFjFQ+E3DiUDZ6A/AH992GCnK
         9ZNZeZbx2wiDKfaEEo1/kMD5IG5A2qfPvQjpj14nwDjp9W2lmDU6YtImyrVkSksc2CtY
         oZ8FlYTcCE4+3FVadyTdWe5y8avP/84ErNFdBvABrGwPEk1kiKujh81v/qYQharF8Jka
         Y2pBm6HP9rndoUxpjZp0wVyz3v5Cr/Vb+KtkUMWSxGfbgwFJP1jZCa3Vwe3kJqmZZpH1
         7Gvz2oAoBkscJ7w+przu474PkauoAkOqx04AVYl9mlePPYPwxV2IPYka2rPyd/YoMEAq
         7Jsg==
X-Gm-Message-State: AOJu0YzjSTSi0i/NbfHx7FdpyP44bQ8pngqhtTCJis4KDdgUlQthzCjH
	5xdbfW3tcwxKvGhXdbtCdYba/9aT3Zb8EJa5AE3bo+Mq0J9UIfgg9il8x4/ICQ/1S6PkTEG6ym7
	vpMjIj/XBywafUBSm6PjPzfhe67L0SWObUOMwug==
X-Google-Smtp-Source: AGHT+IFHSZI0CLQM+Vt6ArCZsOp4N2fBhqmdtI8GsSuit5Kdj5Iu3Mxg1tWrmGdcYLnLPpXnjCzy8LzZlDJytTKc3sY=
X-Received: by 2002:a05:651c:19a0:b0:2fa:c49b:d14f with SMTP id
 38308e7fff4ca-2faf3c509a5mr78563111fa.2.1728394547935; Tue, 08 Oct 2024
 06:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-22-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-22-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:35:36 +0200
Message-ID: <CAMRc=Mf9Ea2YCtcGP+Z_kPvV040d=+1kHLGdwi5rkzPopf25Rg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 22/22] bindings: python: configure and document
 dev dependencies
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Mypy [0] is a popular static type checker that validates attribute and
> variable use and ensures function arguments adhere to type annotations.
>
> Ruff [1] is a popular Rust-based Python linter and code formatter. It
> has support for a large set of linting rules [2] and largely complies
> with the Black format [3].
>
> Add documentation to the README for how to run the tools.
>
> [0]: https://mypy.readthedocs.io/en/stable/
> [1]: https://docs.astral.sh/ruff/
> [2]: https://docs.astral.sh/ruff/rules/
> [3]: https://docs.astral.sh/ruff/formatter/#black-compatibility
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/README.md      | 17 +++++++++++++++++
>  bindings/python/pyproject.toml | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/bindings/python/README.md b/bindings/python/README.md
> index cb5cee62cc46980ce2484bc85d8686ffb8622e59..89c824cebbd735624159a5b30=
a8bbee2c55e896e 100644
> --- a/bindings/python/README.md
> +++ b/bindings/python/README.md
> @@ -112,3 +112,20 @@ make python-tests-run
>
>  from the `libgpiod/bindings/python` directory as root (necessary to be a=
ble
>  to create the **gpio-sims** used for testing).
> +
> +## Linting/Formatting
> +
> +When making changes, ensure type checks and linting still pass:
> +
> +```
> +python3 -m venv venv
> +. venv/bin/activate
> +pip install mypy ruff
> +mypy; ruff format; ruff check
> +```
> +
> +Ideally the gpiod library will continue to pass strict checks:
> +
> +```
> +mypy --strict
> +```
> \ No newline at end of file
> diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.t=
oml
> index f6bf43c0a20edc76bfa51a98e7d523c8dadefea1..43e85a72daaea50c07a527d7b=
388ac9a4396a3d8 100644
> --- a/bindings/python/pyproject.toml
> +++ b/bindings/python/pyproject.toml
> @@ -3,3 +3,39 @@
>
>  [build-system]
>  requires =3D ["setuptools", "wheel", "packaging"]
> +
> +[tool.mypy]
> +python_version =3D "3.9"
> +files =3D [
> +  "gpiod/",
> +  "tests/",
> +]
> +
> +[[tool.mypy.overrides]]
> +module =3D "gpiod.line.*"
> +strict_equality =3D false # Ignore Enum comparison-overlap https://githu=
b.com/python/mypy/issues/17317
> +
> +[tool.ruff]
> +target-version =3D "py39"
> +include =3D [
> +  "gpiod/**/*.py",
> +  "gpiod/**/*.pyi",
> +  "tests/**/*.py",
> +  "tests/**/*.pyi",
> +]
> +
> +[tool.ruff.lint]
> +select =3D ["B", "E", "F", "I", "UP"]
> +ignore=3D[
> +  # Ignore chained exception warnings for now: https://docs.astral.sh/ru=
ff/rules/raise-without-from-inside-except/
> +  "B904",
> +  # Never enforce line length violations. Let the formatter handle it. h=
ttps://docs.astral.sh/ruff/formatter/#conflicting-lint-rules
> +  "E501",
> +  # Ignore new Union (|) syntax until we require 3.10+
> +  "UP007",
> +]
> +
> +[tool.ruff.lint.per-file-ignores]
> +"gpiod/__init__.py" =3D ["F403", "F405"]  # ignore warnings about star i=
mports
> +"tests/__main__.py" =3D ["F403"]
> +"tests/**.py" =3D ["F841"]  # ignore warnings about unused variables
> \ No newline at end of file
>
> --
> 2.34.1
>

LGTM

Bart

