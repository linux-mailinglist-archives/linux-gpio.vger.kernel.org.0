Return-Path: <linux-gpio+bounces-12864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F00D9C5830
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CF0128430D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 12:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D9D148828;
	Tue, 12 Nov 2024 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XvM4TnJy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718713C914
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415580; cv=none; b=ngsfXBI2ThqAs6BzCEKgvCGpmWHFbEf48NEcNR9/98qO0uW0k5MLav5CSrl8wpXSJWLN/fCsKlUbRPvo87uqGahjey9TRzeLKhvs0KSfYDa4rrZb99pUp6C5BbV5ddekpp+BpMCgKxVpx3dA/fvda0SZ+p7rK1JXJDj4cix4MCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415580; c=relaxed/simple;
	bh=1r/vz/IKWqPeBwfO0JtQMzhKeTLfLukwLaSWnh7m8ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oX5q93EEdw8/huDKVJG9k8NtdKtjbAMB3frOYKgdKvyMLKXJT9Rf7Mh0B7yljeL8blCTfHay8c7Zctkdxwmp/p3wX1T1CFvVAHbigDU/rz+OjootlF0Bk6JcOb2gsw+CPDuTQm30mX6nkJMiHZr/ZnoEaLxSOYwJXxTIsorBlQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XvM4TnJy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e3f35268so6172998e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 04:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731415576; x=1732020376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g53Jx55f+DRm2Tl4QApizISiw481Zx1tAfmvNnQYg1s=;
        b=XvM4TnJyquWYDBBgasVOqfx4tQHA6+nibgyxo+NhgRzgRb68D23J/IT6XYvlbKIbfb
         TuTLSvmiW308eYLmvMxDLl8jUHMtwg9E7DuE6EvyzATpQ6BQtuHK9QC7YBD2sK7dTDil
         9Jtd09fPqO2B7VsBJIz7pixLLA7tO6AvmNxs8m6GWl/pqMiwUrVQgS/hM7ytaEhiy/ln
         DNVfnVrfCGTdmMG7mwaYHyi/WlImS4/ZGgObHhVKOPkYJvAfvnlon8kGQ2onx1eb2IeW
         pBE/fC4l4NAPxaLxIEvpefwRh2F+iOIG5BqyQVmdhXZiTLc974pqSxGOyT6aHMmLFTrj
         x7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731415576; x=1732020376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g53Jx55f+DRm2Tl4QApizISiw481Zx1tAfmvNnQYg1s=;
        b=KjxVu0cdyFfZEwX6RXJEk6u8vzCJN6Z/xRGVqiHBlzbJukflyKsD/lN480wWhbjbVz
         pI7URXTIPx7/o/7Whk9zw6gUhwzr5uycuexM5fUOc+h0L1yGGp9x3DYnW/pWprhSQq+v
         xlF05AYtB9YVbwHYjJrvxpMScRGjlmQdZIFluEfgrvLW0h/DzNqHKe0aoeeue0KrPD0x
         8CIxqkEZkFenJBe10dRtIqKgfwmrrXO+Ig812cUrOrORK2LGvDOPhrAoq021adxODmgx
         PKz1utCUYeroFC1uFFHx1eLuZvjUvjF0W4JHnL7niD73ItZMqffzsdlRC7P/VHgKVezV
         6iCg==
X-Gm-Message-State: AOJu0YyWXOvpHFp3k5KPmQMBHM1wHeqkNQk/Nf5xoCnE7PA2vNo5ilCO
	ZWgcpDnXrO6EGdhfYfWGdnRd5Rz6w/h0qEQN9Lhdm3+gN1t8FwGncozVj9cRNiwnTACXRmszK7f
	tG0kNDHeuTYRB6Bm4BD5j4OUr/AYdXVhpfoaaOw==
X-Google-Smtp-Source: AGHT+IFtdhu2zIMRFejU9hlzgpn/lB3kYiRPGvtSnEAQ88+2dXHDZAQqUgwdlNX0nPEkyo4bHw3lPbFwiNj8wYCXEZQ=
X-Received: by 2002:a05:6512:10c4:b0:535:66ff:c681 with SMTP id
 2adb3069b0e04-53d862ebe7dmr7504629e87.48.1731415576227; Tue, 12 Nov 2024
 04:46:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106142248.305219-1-vfazio@xes-inc.com>
In-Reply-To: <20241106142248.305219-1-vfazio@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 13:46:05 +0100
Message-ID: <CAMRc=Mfm68m52UicB8ZvTuc_Djs-4jzUo=-6YmQzGtfq0BDOmA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: generate CPython 3.13 wheels
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 3:32=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> w=
rote:
>
> Support for CPython 3.13 was added to cibuildwheel in 2.21.3 and
> advertised by build in 1.2.2.post1.
>
> Update the dependencies used by generate_pypi_artifacts.sh so CPython
> 3.13 wheels are now generated.
>
> Closes: https://github.com/brgl/libgpiod/issues/106
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/generate_pypi_artifacts.sh | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python=
/generate_pypi_artifacts.sh
> index c2fb79f..d5dbd31 100755
> --- a/bindings/python/generate_pypi_artifacts.sh
> +++ b/bindings/python/generate_pypi_artifacts.sh
> @@ -108,8 +108,7 @@ python3 -m "${venv_module}" .venv
>  venv_python=3D"${temp_dir}/.venv/bin/python"
>
>  # Install build dependencies
> -# cibuildwheel 2.18.1 pins the toolchain containers to 2024-05-13-0983f6=
f
> -${venv_python} -m pip install build=3D=3D1.2.1 cibuildwheel=3D=3D2.18.1
> +${venv_python} -m pip install build=3D=3D1.2.2.post1 cibuildwheel=3D=3D2=
.21.3
>
>  LIBGPIOD_VERSION=3D${src_version} ${venv_python} -m build --sdist --outd=
ir ./dist "${source_dir}"
>  sdist=3D$(find ./dist -name '*.tar.gz')
> --
> 2.34.1
>
>

Did I get that right on github - this should wait until the typing and
other reworks are in place?

Bart

