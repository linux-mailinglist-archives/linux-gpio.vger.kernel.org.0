Return-Path: <linux-gpio+bounces-311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47B7F284E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 10:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B17AB21415
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 09:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042F92D603;
	Tue, 21 Nov 2023 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7dBwuCb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136E4E7
	for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 01:04:11 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so1491713a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 01:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700557450; x=1701162250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U0+AYHrjNs4ZJdfScivd4do8D+q+MGyIfUcbINfFS3c=;
        b=J7dBwuCbKTvfh6SLcv34BGbb2yiZDysa3ly5KWeGUG19wq6BDqxAqIpVsi0MkWeotE
         hAgfjqbhiqsTvmN+Ip/1DbBxjBWwXSaV3jvTuR28JPWMhL4Sbm5hUoluRMBsxslNYdfj
         PqYgSP47/f25dUyhewZfe7OsonnqGeNGSMWqHEsxsmPFOfr2QBmDeV0mWanT+3wf9Img
         55HhVczvIt8o3jvsCT90x7BnF6qxxfdTuL6xGRbcywLNCoBFA0TS7SZfNk+w8tnZTgXz
         7MjwyooyNQqRBmY8sVEfwPt94XFZwlfo6v0HCqQxwefQtyLfzSZFUwLVO2P0K1YvE8+A
         Dd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700557450; x=1701162250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0+AYHrjNs4ZJdfScivd4do8D+q+MGyIfUcbINfFS3c=;
        b=UvXCakHKq9anDPQ41DAxG1B9ju6PUx0OPQgHGLlshOUmhIef3VJSDohI6NuwvS/sKa
         3fYhjuNhYLUIf9VWR2RNFu5qhSc5ZJCP9FP+JkiSnc5Ar6/M+oNCeT26yofEL5A8ZXLB
         YXQ2S144kURd9u9GWq3nLSikdFNh3UQRh8uK2oHQHyH/IuZPbUkTFGygKR2mcWa8iAxg
         u5IAfPUUo7I4UJWtQRhfjFHYR4nbBxZ6UfVFo0XEVQ89bnapCtF+be5At48pZ9Z+wiF+
         ssvGIfnvymjXtlXRpD5v5KztHF/FzjXX0TF5V5JEF7gkQp4amSeJOTrjRao9Gm3OZKwY
         xH0A==
X-Gm-Message-State: AOJu0YzxvFTCLt0hMHnqoJTyuwRr0cd00NRugBYtu7yRSz8p33d2283a
	ydWb5kONDCR0JSMv0wkK37i0xA==
X-Google-Smtp-Source: AGHT+IGeBxD4CpCI3qSpqPW/fO21z4paEkivcRzO+VBvhwhO0AEPvWY7LOROa/ImCLUeG4S8IlBwSQ==
X-Received: by 2002:a05:6a21:a59e:b0:180:e3f1:4f60 with SMTP id gd30-20020a056a21a59e00b00180e3f14f60mr8946604pzc.45.1700557450495;
        Tue, 21 Nov 2023 01:04:10 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001cf68c80ee6sm1992728pli.141.2023.11.21.01.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:04:10 -0800 (PST)
Date: Tue, 21 Nov 2023 14:34:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Linux-GPIO <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH libgpiod] bindings: rust: libgpiod-sys: new release
Message-ID: <20231121090407.b6lrfmedtoykjnen@vireshk-i7>
References: <20231121-b4-libgpiod-sys-0-1-1-v1-1-87d53dec6252@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121-b4-libgpiod-sys-0-1-1-v1-1-87d53dec6252@linaro.org>
X-Spam-Level: *

On 21-11-23, 09:43, Erik Schilling wrote:
> During 86860fb ("bindings: rust: libgpiod: release 0.2.2"), I forgot that
> we also need a libgpiod-sys release in order to expose the new feature
> flag to raise the minimum libgpiod version.
> 
> Changelog:
> 
> 7552e5d (bindings: rust: expose v2.1 features as flag, 2023-11-06)
> bc91656 (bindings: rust: add wrapper.h to EXTRA_DIST, 2023-11-03)
> 2e6ee87 (bindings: rust: mention the libgpiod crate from libgpiod-sys, 2023-07-03)
> d04639d (bindings: rust: bump MSRV to 1.60, 2023-06-16)
> ebfed6c (bindings: rust: document build without install, 2023-06-12)
> bce8623 (bindings: rust: exclude Makefile.am from package, 2023-06-12)
> caabf53 (bindings: rust: add missing license and copyright boilerplate, 2023-06-13)
> 
> Most changes only touch the build scripts or modify packaging details.
> Bumping the MSRV and introducing a new feature does not require a major
> bump.
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> I should have done a dry-run of the release... Forgot this bump.
> 
> Will publish this + the already pushed libgpiod release once merged.
> ---
>  bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> index f90615d..eb600a9 100644
> --- a/bindings/rust/libgpiod-sys/Cargo.toml
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -4,7 +4,7 @@
>  
>  [package]
>  name = "libgpiod-sys"
> -version = "0.1.0"
> +version = "0.1.1"
>  authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description = "libgpiod public header bindings"
>  repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

