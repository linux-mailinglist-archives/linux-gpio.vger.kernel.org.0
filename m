Return-Path: <linux-gpio+bounces-122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A7C7EBCC0
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 06:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31A9B1F254C4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 05:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5372023D9;
	Wed, 15 Nov 2023 05:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OKp4xr3Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962607E
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 05:22:44 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA43DB
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 21:22:43 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-35ab17957c3so14614365ab.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 21:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700025762; x=1700630562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f0CeLwMKj6is4sL3kFs2Q4HOMmubUPBQNpBNbnT1nRA=;
        b=OKp4xr3Yn39H6dywuetwnEk0o66KGLN/pF70hGLloxgLWdw9adjArFUGPeh9WST+Db
         hd+YidsnswMRSXuvy6CVZLz/Bkwf7R2/KQX11Iq5C1gUpGZKxR6fWdadswjjsUahN1a7
         fo0ok9RNPJ3DII8ajUiD+oHpUWVmEPkBspF2RYx+OhLjpAiFz1DTjFe4E3+VMplMLtx0
         UA4BhpqyacQqsjCJSEIWp7TOlz8W4OJ0kpb2cvK6dw1UD82cn+Lmnkx8cGvPCxo/b4gl
         CaYc75H6NAMrXkDDVcq44EW9b/my/058OAWUoUCXUZUHp1fDQ/2+3f2ZXAeAaqprxdQU
         k+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700025762; x=1700630562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0CeLwMKj6is4sL3kFs2Q4HOMmubUPBQNpBNbnT1nRA=;
        b=sTAGjUaQcgFrsD+Rz+Dz6FUqAEPPF17b5SDcAlvAfn6iwqZ8z5SXXYoGYeFIRquCeS
         m0uf0OMh4/m8V4WRXPhZqkO8DkSFXiLBOxOVxeogoJMmpRWKxlXCyeKeCsRRA5ydQRBu
         oeEOULgeZrGNTts6l+hGgV7XgoEvb2G0yQUM20NCbE0TT6nqIK6BavK/4nEqo9DVPAGP
         ofmzmZQNr8frwtvYfFdqIXNTXXjcNiUMFocpPdxCfKzPCJPhY7ux+m8CHoiaWOBcrHYy
         LTJM2nqzHiEQr1BLRtcQaS6WSkiUkbA7oHRy2z+pJcLjyRU3IVUYbGAxNM8/p9WWXFkN
         ZBkA==
X-Gm-Message-State: AOJu0YwICAQYIvyshtBzJttcAHplcMvQmhMvK4LFOFbl6JZnNe5jUDdO
	VjWBbhSbmsdJjAAu2+J6jsMiUA==
X-Google-Smtp-Source: AGHT+IEQ0XT64uaFx+Mn+5gCE5ma0MrgTzUWQDzOaWxASOkrmpH8B7/nx7VUFTPB3ZMM7dzPocCY+A==
X-Received: by 2002:a05:6e02:1542:b0:35a:b283:d14c with SMTP id j2-20020a056e02154200b0035ab283d14cmr13154547ilu.3.1700025762224;
        Tue, 14 Nov 2023 21:22:42 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id b16-20020aa78710000000b006c341cf08f9sm2131084pfo.140.2023.11.14.21.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 21:22:41 -0800 (PST)
Date: Wed, 15 Nov 2023 10:52:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Linux-GPIO <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH libgpiod] bindings: rust: libgpiod: release 0.2.2
Message-ID: <20231115052238.7pibaizsbxcu6pg5@vireshk-i7>
References: <20231114-rust-release-0_2_2-v1-1-8aed47e7f395@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114-rust-release-0_2_2-v1-1-8aed47e7f395@linaro.org>

On 14-11-23, 09:43, Erik Schilling wrote:
> Minor update the exposes feature flag and bindings for v2.1.
> 
> Changelog:
> ==========
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
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
> index 7ddf5fd..23c3479 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -4,7 +4,7 @@
>  
>  [package]
>  name = "libgpiod"
> -version = "0.2.1"
> +version = "0.2.2"
>  authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description = "libgpiod wrappers"
>  repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

