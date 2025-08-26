Return-Path: <linux-gpio+bounces-24992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E6B37180
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 19:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFDD9189F709
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 17:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CD83164AF;
	Tue, 26 Aug 2025 17:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sMbTKtDJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65103314B66
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756230188; cv=none; b=UreD+T00d7qmldXMyMliO4NaCMGWrAhFH042CXSsEBQcduWpQ2UAt7ia5MSCG6f/oi4JuhLAgPGTj75H7eiouO65BRUw8Y7gJqCk0bZv05wB4+OZmmXXIE83nwlLHRhMLuwMF3chHj4YC7UeahalG0eVtbXmuPu8/BsTccPFe/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756230188; c=relaxed/simple;
	bh=/NH0Scep+LFps2LseFARTSvkcGrDm7sCfQzi0LT+EK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiq/1C+braZWFlgDTRWP78/R3CrsWZYlv1I0oAAVNlPWXtVyNGWqK5i4j1pSQx+ZtszVvWgBs06d6p+t+K4nRBi+eTMRlyKCbjQO/h/zJCVfiPToMs+JMDMrEr3Reo46+eo0r2Mp45tLksmGv0jyNYQkgn7YRaihY0CGoMErY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sMbTKtDJ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f467f3c06so1692211e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 10:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756230184; x=1756834984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdfOUyp5g+LkbfVmSjDDYLk7SD8x/p4fgyP4dtdVoWk=;
        b=sMbTKtDJLHIurgYR+P+dPyZmVdfGVCFxty/I93ZG6LixwqBGumlSIUbPb0JHOHxLvK
         PQcwEW5bU14fZEBifOCmsG9ueAUR67v6w/IRo+Pmi9i1h9mkOBR3JKEepx3KsEozR/k8
         x4Uob6V/2QnA7Df5otk+v+ZPF3eh60jf3d8EUtxvn9NyO8toilL95gHNSPb2NhzuDYXd
         2jSusP9G+6EZQoh708MTix9li1fp9VraxREjPP2r01OW4+des6RYwYQoMuOXxryarLax
         EwNphZQe+DC8R8ucGg84o893nWv1tGNMNlKenBiT5DJJV/o6hWfAL98wJYcUeuD1+xf0
         t+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756230184; x=1756834984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdfOUyp5g+LkbfVmSjDDYLk7SD8x/p4fgyP4dtdVoWk=;
        b=fz1bRMGK6uI9Oz0bqQeJ10qaix44Nx0YbTXDwWj8s43RI3YZ5NvUoyCIwuz/ldieJY
         qjV6I7YvUmRkplYra+aR1f0zDPvEw/egYNoi+pstmme1Uo11lgwWMJGf8m8hTU4Nrfno
         acs3wd8Wmqz5xKH2Cp2/E/8/4FElPlauqqcX0FPtai+XyQwuusjuB3TjIL+VI9I2AE2f
         TKhM8GwVq2Nll1CX6QmfCxgIHUzMeFL/VCmkLeW+YyMUn0OPVYpojTrplheOvhFgoO2K
         lry0wu4hfU5A4ExxqKkVg8LFmIkmimQTuUyMhPPr03avPnz79TkZIZ3tbQEQp/JCXeKh
         H2rA==
X-Gm-Message-State: AOJu0YxxCniGsPF/bW82n73h6oHFoGSM8hTu50ULAOzktJ8zJ2c2Aoc+
	rhtndtE1axfrGMmqiMhSUKtzJppHttQq9wn4NOImbWOEMK3Ia3+k7NclLvVXh3geCMQXU+HsZd5
	LfaI+5AzuMyQm0wWNgDOgn7OLkwwjOdQGavzvyaYfIw==
X-Gm-Gg: ASbGncuSsppOsPcLg+PTlfy3dayOA8HNY8LByuLRcqgKw4ZshvFIbjTli137esQF0Cb
	B4o3W5H3ugjHRo+4FcN3peda4ZvAqycqavN69aHvkGrsFzFmY9qDO8OTn/dcYIIIQfU1DKlQYrs
	w/g6h8nG12HLwyTNqXPaAkx+SUopfNMl/CZHjLJ9N5gf26W0Ro0vO45SmQbavtnXFtK9dcm1z+X
	mFaSPyild/b8DWS6Qs3d+FhxGueWrXazkT56e4=
X-Google-Smtp-Source: AGHT+IG+6nUtMqPYbdfnJ7v7uhh2LTc5j4r5xCecfnjEHS82LeRxDaqQlwVVhyuqPKj+t9rauBv3tN88u/NYfVkoPr0=
X-Received: by 2002:a05:6512:618a:b0:55f:496e:99a8 with SMTP id
 2adb3069b0e04-55f496ea237mr1648474e87.21.1756230184184; Tue, 26 Aug 2025
 10:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826174123.56862-1-brgl@bgdev.pl>
In-Reply-To: <20250826174123.56862-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 19:42:52 +0200
X-Gm-Features: Ac12FXzJwJh4uCey9ayFNTulzs-4iA3aQelhzXKMCedXOGJFFn6Vrc_vEYJAI4o
Message-ID: <CAMRc=Meuq_xHVPJEAos8sfOwMykmHGGm8hQ928yX6UcAS=90AA@mail.gmail.com>
Subject: Re: [PATCH libgpiod] build: bump required GLib version for tests to 2.74
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 7:41=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since commit c116b6f6f118 ("tests: add a test-case checking line-config
> memory usage") we're using a symbol - G_TEST_SUBPROCESS_DEFAULT - that's
> only available in GLib v2.74 and later. This version is already almost
> three years old so should be widely available. Bump the required version
> in configure.ac.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Oh and I forgot:

Reported-by: Vincent Fazio <vfazio@xes-inc.com>

> ---
>  configure.ac | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 9b6c862..fe96739 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -157,8 +157,8 @@ then
>         PKG_CHECK_MODULES([MOUNT], [mount >=3D 2.33.1])
>
>         # For core library tests
> -       PKG_CHECK_MODULES([GLIB], [glib-2.0 >=3D 2.50])
> -       PKG_CHECK_MODULES([GIO], [gio-2.0 >=3D 2.50])
> +       PKG_CHECK_MODULES([GLIB], [glib-2.0 >=3D 2.74])
> +       PKG_CHECK_MODULES([GIO], [gio-2.0 >=3D 2.74])
>
>         AC_CHECK_FUNC([atexit], [], [FUNC_NOT_FOUND_LIB([atexit])])
>         AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
> --
> 2.48.1
>

