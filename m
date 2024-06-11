Return-Path: <linux-gpio+bounces-7372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9CF9044EA
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 21:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42890B2233C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 19:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADBC84E18;
	Tue, 11 Jun 2024 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I+vXeC90"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFBD4D8BB
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718134545; cv=none; b=IobxjgBUHsp/m2+dA6kV2DeCFLg+EQ78jZ1S2k3BP63mBOLtR7cgwLNq3EWw82UwgUPyE8s9Wn8Iw7P+4YcW6YXpFchkx3zn09q1ZW5XM32F35672os9EPazVG/BElLUjTNDD2yUx2FNKgwdHlwvdVdTAtHqnvVKt96tKS1ekGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718134545; c=relaxed/simple;
	bh=UihAQMm+FcJJTawnUL9q7pMbGjD7d0lXPw28piV7hpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIyI9jeVZ6eC7AM0LH2zTv/fgBZn/T9WXLL2N3k51ibAMwd9MMx4xpyk8l8FYw3hr/j6iZQt7icU/QLZjg5Gm2NuxLD76iZanOi6kUgixGJGvUBwhYO1tzH91bZ0A30/YOGgWGEJJppLsMFxPwMRYRV+laJVHIJGto7hyUdXkPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=I+vXeC90; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so1927504e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 12:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718134542; x=1718739342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atPtHtmfTYnBfoJzYt90iCXz8itpK/Lpg375kmIri/k=;
        b=I+vXeC905Y5xuKB58FdvEnLbqYwcvfqHyEW+LW9aqLHc587ltIhT0JdMdSv+14vhtA
         yTRWs0w+0NfhB7yO5lMTxDzbpbU9b+7h8/q3xzIWxVZidJ2muKqoNvcgn2dHiCfymhjb
         ouI6nUht6Phcm0dSeTpKWNgj+ytOd2mijSgerEeuj4dIcWAWQi7REkYjESg6oSbICDx3
         jkk6yfIGvuqRGvoglH1Q134NGB7FE0iOVOByJVfR8vfC+6kdRhDI8gjAha2LRbkqOdlQ
         3cqpQMWoSBAhzY+RytC+yS9eZQXJd62+NpUSZyLgcQBcwRMrAHZBQYyoZCPuxnKum9Yc
         DAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718134542; x=1718739342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atPtHtmfTYnBfoJzYt90iCXz8itpK/Lpg375kmIri/k=;
        b=s6wx6cP8mClV3zZPaEqOOKqRuCTt+cAGJULKx3FxrmXzvHJbF5e3vxATwUHVYU+RHZ
         riosyxlqUpnvcW4cUYRDs2djkwZhNz/1hcqPCj2bF17URzBHCl6PoMT84F5VsS1YoeNw
         vCf8AWXI/7J4zXeTcVxLgmQhC/TBye6DFHhw5FoS9bnIuXeJNfPzWa/LgfBK4ST60u5I
         ErhmAUkj3yS8eNZVa3RBg7dgYmdabRX2Yt9/wOfqqi9nRsj2nz2WavGxSqV994hS/Lxs
         hH1PYNyJxul5VPriNO8eCYU6UaHkAMwfN8CcVs7g+zWAnBl0awmcwkQ+775NETZN32Kg
         bJIA==
X-Gm-Message-State: AOJu0YxKAxbe3tmWk8GcPxKiWnMrlGcbnlH14dkXTGN2mgcgGknkVTYL
	uS4eknnCgSK3Laib36CczFtvKkmd4jiKq4K2Yli3vAZ4ZaLmzNu7+QlZ4ciwQSyMCqzjQkG+SWi
	L+cx0luE8lFSuL4u2SX4TMSnIIIjmfvvaDg4CWZSGooj1JDOc
X-Google-Smtp-Source: AGHT+IFe/RlYbR/DO+/akyxYAtI/EJ5X599VvGZ9dpv7xRl3rVaOFsQkW2ZJTPlUZfzXniLgAn5xJnp/8bJtxrQnoS0=
X-Received: by 2002:a05:6512:3b9c:b0:52c:99ed:4c9a with SMTP id
 2adb3069b0e04-52c99ed55acmr45137e87.59.1718134541746; Tue, 11 Jun 2024
 12:35:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606181309.476805-1-vfazio@gmail.com>
In-Reply-To: <20240606181309.476805-1-vfazio@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Jun 2024 21:35:31 +0200
Message-ID: <CAMRc=MeMmC_tYRXk3xUXR4P3et=UpF171vrwhPyiVNuMoP=Ppg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2] bindings: python: add script to generate
 sdist and wheels
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 8:13=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wro=
te:
>
> Introduce a shell script that generates an sdist tarball and PEP 600/656
> conformant wheels.
>
> The wheels are generated via cibuildwheel, a tool provided by the Python
> Packaging Authority (PyPA) [0]. The tool leverages toolchains within
> containers maintained by PyPA [1] to generate wheels that are runnable
> on hosts that meet the platform compatibility tag [2] requirements.
>
> By default, the script creates X86_64 and AArch64 CPython 3.9-3.12
> wheels for glibc and musl libc based systems.
>
> These defaults can be overridden via CIBW_* environment variables [3].
>
> [0]: https://cibuildwheel.pypa.io/en/stable/
> [1]: https://github.com/pypa/manylinux/
> [2]: https://packaging.python.org/en/latest/specifications/platform-compa=
tibility-tags/
> [3]: https://cibuildwheel.pypa.io/en/stable/options/#options-summary
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
> Changes v1 -> v2:
>  - spaces -> tabs
>  - conform to `shellcheck -oall` recommendations
>  - simplify in-script documentation
>  - miscellaneous grammar fixups
> ---
>  bindings/python/generate_pypi_artifacts.sh | 132 +++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100755 bindings/python/generate_pypi_artifacts.sh
>
> diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python=
/generate_pypi_artifacts.sh
> new file mode 100755
> index 0000000..5e526be
> --- /dev/null
> +++ b/bindings/python/generate_pypi_artifacts.sh
> @@ -0,0 +1,132 @@
> +#!/usr/bin/env sh
> +#
> +# This is a script to generate an sdist and wheels for publishing to PyP=
I.
> +#

One more nit: can you add SPDX headers for the license and copyright,
so that it passes the `reuse lint` check?

Bart

