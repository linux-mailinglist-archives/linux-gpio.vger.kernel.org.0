Return-Path: <linux-gpio+bounces-11498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C299A1B28
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23BE6B216E9
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 06:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61CE1991C3;
	Thu, 17 Oct 2024 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uvv8GNmK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432AC199229
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148281; cv=none; b=S3RbGDFEzzAuDnzOEHzCfTMk3zJEFM0Ru5Peyo6FZEjTfVZByR/q3UMypfxkBCfnY2OIB4384Yc+orU3/fi0vy+kMswWsKA5UjfeA3QWZ86iyahop1cWQz+tG3qKP9iki+5flDNCjtNDt21AAIsrRJrAVQsoz1ufY69RWS7Zdyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148281; c=relaxed/simple;
	bh=nWPyk0xjdLUBPEKl4GUQRTzeuVZoo5l7wvCj2Q4Lr8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mF+BHkaXh3Qi43XOsooVYYv14W/3go/xJLPPm9QcflW5ztKLrTdpSmNqB7VY82v8ODPKe8lQDFKMRIcmISzZALhfakoNkv9PEImAoORdnsALkwKqxAmhPIY+KTyjniOtXZf/L2TV4R4ZcYgWGx3Zit2hhh84hOVxB492a5iCvac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uvv8GNmK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4fd00574so369120f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729148278; x=1729753078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JiHy9DBfPGoOwPe9LIm7IdDlVShok0a+7Xn6NpnfFM=;
        b=uvv8GNmK0/VmcsUWhqaDSdvbuGDQdmHFMR7v5c8iDQ6PFk9YJ9y8VMOwx6M7VpeL1i
         kGicv/u3qL481id+Wz1NXAYieFjq9Nk6k6JNDA2QIkhb+ZJf+6RgAQnuIpR+pURLoU6F
         nilfdOfWr3Cjy49bE+RR1EW96ID+L8tsKIRMSBdfCO9Vnp6NCvvtIdRQ++gw4EbzLpy9
         UYsRyM8qAe93zjlb/t1O6nZAA0rNHxsSwo0Zb/t++8Izm7koiA5VLwkzsJAjFhOLg0cG
         vM6aDNCdqNbjAShmSkC4lbxs+Uu2TzBaLqkWFnXLzEidmFjfO/vUDeGD/XD1IC/6z1S3
         AWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729148278; x=1729753078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JiHy9DBfPGoOwPe9LIm7IdDlVShok0a+7Xn6NpnfFM=;
        b=d+OUivAmjCvER6qaNV/EjElaWoo0JP48YNsz7lQ/gB5in4obN7c2ZjMWO83H9D2flo
         GrBQhE+AckcjsGtmD5n+Ixm7DmpKvD5JhtCClbgk1HohGTSqj/yVICzLbu8j2J+mXjqD
         sH+b7rMFWsranByE0jabX/CBDusNNzkl50A/IahgYsFdxoKiK5qNAv5uGNUpa65uxDSS
         eEANpVowMBd2+u1KEF1ZABGtKb3L2Tp92VQm1a2TIdVNox9gh88Sx8Ev1rWwitgfZxG+
         Ed8UjgztfemmVJ3nf4p/eBvVv5Hr4A+jMH4EicU1ib/uLWK5LFw3Y4NNDNbfGVSIUJ0i
         uxig==
X-Forwarded-Encrypted: i=1; AJvYcCVaXtxh1It13/8mAmDX9ibXG0wnO0phLD/PFyP9zDZX/IK4RGmSdY40AALgiU2Qwlq5z1KRWhRIxj32@vger.kernel.org
X-Gm-Message-State: AOJu0YyP6VbOZihpuaTilSfSy362+fvbKjDYMOQ/oEsqrsmnAV8gXwLT
	Uq9xoERrkuWzXjMOMEmsN+sHvIPDF7jrWGgIY7OVt4OO2mCr8YOJTU29lThLELE=
X-Google-Smtp-Source: AGHT+IG06539h5BJ4i1Fc1xVQWrkBnNeCO7nVb2uZuOumDiHgt43qVhxnEsNwW6Qm5eAjJ9JwtyUtA==
X-Received: by 2002:adf:f6cc:0:b0:371:8685:84c with SMTP id ffacd0b85a97d-37d93e1299amr1046421f8f.15.1729148278498;
        Wed, 16 Oct 2024 23:57:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa87adasm6260026f8f.29.2024.10.16.23.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:57:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: constify gpio class
Date: Thu, 17 Oct 2024 08:57:52 +0200
Message-ID: <172914826141.5858.39054182081271488.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014121831.106532-1-brgl@bgdev.pl>
References: <20241014121831.106532-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Oct 2024 14:18:30 +0200, Bartosz Golaszewski wrote:
> All class functions used here take a const pointer to the class
> structure. We can constify gpio_class.
> 
> While at it: remove a stray newline and use a tab in the struct
> definition for consistency with the line above.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: sysfs: constify gpio class
      commit: b6f7aeaf1bfd8d78d55868f0857e397b06a01777

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

