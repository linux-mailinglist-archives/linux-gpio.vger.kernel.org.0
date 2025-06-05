Return-Path: <linux-gpio+bounces-21038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E364AACEC7A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 10:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CBD516DF33
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 08:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8F42063F0;
	Thu,  5 Jun 2025 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uk9WtU1C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D021E7C03
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113925; cv=none; b=g2Clv29vrFqNNzyJLh8+N+Me0QaQJpwQXAYDKq4t53HqeYgIVgCHJ98dOW3FKsZQMnykpfr5w/PSUiOwhz63T0k+rmYkZ9RuA8rH4O68x4uYwj2E23Khw5lJQNIDZl1iap1pLMjivzeBSis5/U72N+fvLsGoO4w2WJWrIen2quQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113925; c=relaxed/simple;
	bh=1NQwEMsTAadf8Rjhic0nD9JvHh0kPVAmlhsevEAUFNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zr3tso6EiB/m5XXw5ZFyGzmRbigu49MDZi7TyMcdo1vwi3cDB6N/HdZY6XjWwp9znTgWFbdCpZVdso7ldH4p9dwfNMpDKpWcu+xrMRdx2ltkTv1RkpwvmUvHmTHRvfsGjTGE00Gao62PjhMENU7zwj8w7h2WiiArvJFhn0pDHgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uk9WtU1C; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a44e94f0b0so7454701cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 01:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749113922; x=1749718722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hIwGl4AWmSF6hoElJNtuRAvQSS/xs1MHz1I6edgIg7Y=;
        b=uk9WtU1CZZPa6YF1ZHFQLjYzDIa7VPpRWK+hSuFA5nU/OBzcIUedLOaT6vIer3gMVC
         rGsqdJaWQp5qPQLjI5yPY9TayL892Fc3fLdYbEtJplLHF3c8efQMz83yQ1/26JOaif8r
         t7VTMQPOuMnikFQcubznMqmCPvSfLZchRBcA8K6SYUUJ5l1In3LU+oB7kp39nnaIerk1
         S+TtrwIUV8Yk3Xty58Lqu3B5beSGADCEacdUNks5+C98wwFf3DfTYs6y/BEV0OjpGL6A
         v8G6CjXyUJZD+3w5t3w0CDYQBCGYZDM3jtW3sXdKvPwDFOWjAB/l+ln9U4OzHLdzVfOg
         lErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113922; x=1749718722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIwGl4AWmSF6hoElJNtuRAvQSS/xs1MHz1I6edgIg7Y=;
        b=oheGdR2P6kWdXCjK1MnNsRxmb4XAzKAjuFVQNIzCDChHYoXoCKSMeYNbV5Yu8PfFtf
         tJ3q6AaBxIqoFxagu3SMj9ll8rAMTA6Ggl5UVnVV1nx+zdBgdxBtu/g5tHv/zDuIeTA+
         vOmpPLnc0cN5GYauKb7fFXU2sAOJx6FAK57D0bjHAB/DLo5ztv7d0HEhGAoplXJSLfY7
         wj381kw86/qCeh4WKbY9HEoseGR4ilw/xRn9I6BcNXrn+FaONPPLRirTGaXyyjs1Qhur
         cZhOyHW4wvU1SyKl1Z3GEU7DIwvp8l+755t6Rj2Ka+gZuPzFbpT7BnggLoPrNp3L6x3G
         9ekw==
X-Forwarded-Encrypted: i=1; AJvYcCUSg7j24rorhXAuBF+Xj23skVoQ5/d9G1z3IB1/psSdyUSP8DGejcSt9AHTqz3IBQxPGkLQZR+xCWRi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9CkwwcxO5atV+5PUfZYDdsIS1WZI8+7SiEzsAQusE6Iiu0jDz
	XKQPF6NeYzPCIpvNnMc5qkiCy5j9cq52pwgudWhPl4rWywJpJTvYUqyXogRVJFsBLgjv0gGLU59
	59hwi
X-Gm-Gg: ASbGncv6QsFkuWk7W8uaa5HIieOu0iuGGkBHRjChMPWhSXU0mw0kHzbyPN6eh6xE2Bw
	X9v/Vk7Tlgj7431RVFJPrmt7t6KtiKuYk/v2rcKqCH2kXuIIeuAEx4cz6HDFaZkNVZn1FfdYc2M
	sx2LcQ8yhnYdxZZUA/cQyDSaA7Fro0YCtPDiW7mfGEERLAO2j2S2Hz1s+TeNWMNa4yIjfnkt2nO
	AO4r0uJCbKSr9emnc6a6QNgTGHOve51af0bhIrje559sWlO37dGzKaOFFMRF9X0PP4SxOa5Lx3a
	UMAgN7yNp6QAIKaWhTdvWVxqyg3WpYdtvGPG3AqofSHQ9veGmKy8
X-Google-Smtp-Source: AGHT+IHzVwtzUryCWsbLcUPjz/XzwCbzeyUYJWXH4MGlDxwfmAFeiBWb6lXCNlVECirVLgh3rGb4hw==
X-Received: by 2002:a17:902:e851:b0:234:d7b2:2ab2 with SMTP id d9443c01a7336-235e1195fe1mr70423575ad.8.1749113911275;
        Thu, 05 Jun 2025 01:58:31 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-235e48ad515sm21362345ad.102.2025.06.05.01.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:58:30 -0700 (PDT)
Date: Thu, 5 Jun 2025 14:28:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Erik Schilling <erik@riscstar.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod v2 0/3] doc: add rust docs
Message-ID: <20250605085828.hkpbamh66g4por3w@vireshk-i7>
References: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>

On 05-06-25, 10:13, Bartosz Golaszewski wrote:
> While full integration of Rust docs with sphinx is currently hard, if
> not impossible, we can still follow the pattern we used for GLib
> bindings and generate the docs using cargo, then linking to them from
> the sphinx page.
> 
> While at it: fix some minor issues in conf.py.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Pass --package=libgpiod to cargo doc to limit the scope of the docs to
>   the user-facing API of libgpiod rust bindings
> - Drop LD_LIBRARY_PATH and SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE variables
>   from the environment of cargo doc as they're not needed at build-time
> - Link to v1: https://lore.kernel.org/r/20250604-rust-docs-v1-0-8ff23924a917@linaro.org
> 
> ---
> Bartosz Golaszewski (3):
>       doc: reformat conf.py with black
>       doc: improve the readability of the prefix variable
>       doc: integrate rust docs into the sphinx build

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

