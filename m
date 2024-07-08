Return-Path: <linux-gpio+bounces-8094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D653929FC5
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 12:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DB6C1C21FCC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 10:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2968D57CB1;
	Mon,  8 Jul 2024 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqGbi4S3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D540848
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432831; cv=none; b=bj/B2HldaO46AD2QfgUugChAmgj179IR++JU91/KnT5TjlsiSlM6hhHSNXzIR71FkG0aFaZOasYIQUWonO0+KG5jeHZv/S8iNB4GkgHEPnZszVxAMRJZ9dV8YQy5oi3T3pG0pknT5ftsKiTt5jNk6CZF5n+5IdK8as0BxZWhqe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432831; c=relaxed/simple;
	bh=VZXbeueEYuqRVY23UsAI5OaQg9g3xLdypjlhInaBOj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jfl/aTFUHE6sQHDTdBkMaoe1qVJIL7eIJMO8o/AmZmcK9Lu9vdLT0HiDiftkoGobcijZdRHTi5ybXZXkfLyynlrK4xAMfiUJn6KfeiUNs/E7ra7RT8gEWB+HlcpwjbTIxTJm26CzO1VMd29kF6rdx8WoVbl0xrJwNtwSku4G6/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqGbi4S3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fb3cf78fbdso16937605ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720432829; x=1721037629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MV83KerXaOp1igutLrWJflp4aOf/41eGVafaBn8CckM=;
        b=RqGbi4S30zscx3zn2jS8cPIizSHOJtz1CsjJp0sIB9uFNjmL2I2rMXWL6GeE7h3kMe
         D4uP2HGWLikmj5PLYpyunQsEHqYsqyMB+HlGHtUTqql5lo776RPGqbENSUut+lAGxjvt
         hraREp5y0Hj/hQZHwllwcsfnMtkIDssukt/qH8sddf8JzhJpWMBMJtV2qib+F1y+pZsu
         qmFyJ5oqsNphJBCfro7f7wj1V18e8tueoXgJY8IINsJDqzVST2eHVtEBofzUIe104c9S
         AlSUCz3RZdMc1SzrrSCIXY0+lIKo60iRAm9LI3ycWc3hUcYbEbkdUXk0REZ3uC6GbWjL
         t7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720432829; x=1721037629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV83KerXaOp1igutLrWJflp4aOf/41eGVafaBn8CckM=;
        b=qiP4C97yiHz3l25q/bN3kCnVmqey1T7v0MZiPZWc8tgVMnLOGuM8j8WdKB9u1x9ulJ
         vUvuJn6UIBYeQqIFK2fQtP3f7Fr1l1+XD2gmaTlZ1UfFrDrTY/Awy4Y3+pvj0wM3zDu3
         SGop1x318RSFhj3zu7GUuXkXCrDl42WoETkN7OWcvzA8OSaTmLP9cEytILT6hkyqxQ9A
         5oxOIidZKsE0gGwmHyDo0TAziqI4gJQcL6WXX9gv/VKLk4/sdXdFPuKCkOTj1d+zGXTz
         eMdzaJJX+e53BkGG2E+Rfx6SSB53CS50q/FidXdwgsVF2Vfh6isy49bvqE5pNKAgc4rb
         YChw==
X-Forwarded-Encrypted: i=1; AJvYcCWqk6MBhK2M5YwMhQ4duHrKerbYP+OpUHCT7MiwyfsQ7IZy4TPvCm0M6UohaSRYtq1pBxGP8wxrjeQ6sW8RLDiuJ9ZtHaFiz1NiNA==
X-Gm-Message-State: AOJu0YzD9Bq6E6E7gRFECMLX1+fTtvuG/fr4quRhSwZ2PrGQG5ufynhY
	3ZFHiIDhA5RQauCJxpwn2cF0nGB6PCGs3L47uQSlJVAP/0Lo5Cv8
X-Google-Smtp-Source: AGHT+IGnfL556dHL7r41eQk6UwFhtqf42RfRjcBqhg2fXyioUXW44iwlqbzKKkg84kqbVEVVcDd0HA==
X-Received: by 2002:a17:902:db03:b0:1fb:35c1:3680 with SMTP id d9443c01a7336-1fb35c14265mr61872055ad.62.1720432828568;
        Mon, 08 Jul 2024 03:00:28 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb6b03a0absm36929355ad.250.2024.07.08.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 03:00:28 -0700 (PDT)
Date: Mon, 8 Jul 2024 18:00:23 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: cxx: tests: set direction when
 reconfiguring lines
Message-ID: <20240708100023.GA195083@rigel>
References: <20240708094827.84986-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708094827.84986-1-brgl@bgdev.pl>

On Mon, Jul 08, 2024 at 11:48:27AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Linux kernel commit b44039638741 ("gpiolib: cdev: Ignore reconfiguration
> without direction") made the direction setting mandatory for line config
> passed to the kernel when reconfiguring requested lines. Fix the C++ test
> case which doesn't do it and now fails due to the rest of the settings
> being ignored.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/cxx/tests/tests-line-request.cpp | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
> index af8b979..a99bd44 100644
> --- a/bindings/cxx/tests/tests-line-request.cpp
> +++ b/bindings/cxx/tests/tests-line-request.cpp
> @@ -208,6 +208,7 @@ TEST_CASE("values can be read", "[line-request]")
>  				.add_line_settings(
>  					offs,
>  					::gpiod::line_settings()
> +						.set_direction(direction::INPUT)
>  						.set_active_low(true))
>  		);
>

My bad - I hadn't tried the C++ or Rust tests with that patch, or I
would've patched these myself.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

for both C++ and Rust.


