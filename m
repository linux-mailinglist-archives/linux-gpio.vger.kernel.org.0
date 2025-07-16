Return-Path: <linux-gpio+bounces-23350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9903B07110
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 11:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B74B169F4E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6142EFDB1;
	Wed, 16 Jul 2025 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ghJ35+az"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9F92EF9C6
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656560; cv=none; b=qOs4/LPJawnCrB3/oKHXIBUG5S40bciJ8Yc+RfXbJx0XcctBybyT35+0tcXLug58UO8jeks2LJgZWwqgTxXQ0j7nNVRZV8JVNwjyjdAj7oJPaaGRuDUP70+9MXRl8lKv8DGGXDGz4UypxmAsF9FZgYFOAxdus9NKyyzxMb1ev/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656560; c=relaxed/simple;
	bh=gWNSA5bMeT038SwG770NbaScl1hnC1g1Pzb74ptMoLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OsY6nE1DbpYZMOfb2V4xR1sb2j2uckV2Og2+FQZG1yFLccCJXQ/uuntJY4NFDtrwMSW9HFx65dKYm7c8iCMCCjBedDumoYPRl8hsdFZ+Xhh8jB5RxDl/+hCRBa6VV6aeX1K1sH9ZmQRY1mKjWMMgFORlhcBLwO5WxA3oEhe5RA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ghJ35+az; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4555f89b236so48659765e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752656557; x=1753261357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DU+chVMZKPU+za4znspG/6bfzEqGboZ2pfvVasC68c=;
        b=ghJ35+azm1Z5dGdCCPB5ZVertZMZVqK0Lqc/EWrbVQpx3G+Zo41/K0n9X2hk3edisZ
         S9uTbkRQb2mUGMkPN45FtMwDvB4fk1Z1vQn83BINL8KmxtnC4TMhEILg+gYrFw4QHljO
         HKfEW8O9Xr9ZXHak4F/ooJPOhcwXrZA5LCaKexZOv5kqImlpWD3QsywpyACL3stWDuwh
         +6uh0Px4e0cwkzZ/q+/kpoqfw1bFPTaoVyh5hqutf4og53sJplxloVMK9+8OAYV2Z87G
         MH8HFf8vlMAfZG542WEoCqn4vaQYhlderjOtDhLtrdFXfsaLwj4+HTVwe/WIB0mkFr2R
         K4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752656557; x=1753261357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DU+chVMZKPU+za4znspG/6bfzEqGboZ2pfvVasC68c=;
        b=iffnU8fAxP7jSpR51/7iyPGn/vfd3meMxDi6itvYgN706mbB/jf3KZRKdN+EiBbSiR
         h9uXDXRpqHoiu6yyb2lS6Pb3Ffck90zOJtlcBofEo3V4E790WGj9v1iS8Z8IwRTfzOn4
         mM3Ybr2pjD/zoUYIAZ0xENl//9fPd3UiFmOsfymlXOWRzgNzcdnAcld4IlQOKcISFK5b
         3gPZtWsk2sGYiz3wJksztKjM8v012x0EYN5Df8EjAcCI4kKSYKrRE4nx+HCdW3k0/N75
         qHBaKN6L1bKvRYd1puCckMuuFxEr4acw7icuS7mnLRx06arLPlvuskhUZ8I9bCnJMuSW
         yEDg==
X-Forwarded-Encrypted: i=1; AJvYcCWDDJcce59ffP0QpT9T3NCOO1LFVHpgjwUCJ9uLfCXitGJp1SpKBsu4azo4tIEm0gPpF0ktO+JsdAdf@vger.kernel.org
X-Gm-Message-State: AOJu0YxwUDIUKuibMyuYq0kd0fwvc0y0xr6MhLjrv16QsfpvZ60l0yv0
	seuHQXuDsoGSvjnNigFk9uyI5P/pd8M6o1oGqOdeJs4e9PK7sXL4YHlN51P3O6vyP9c=
X-Gm-Gg: ASbGncsEApKy2zyEU+DiJiwQlO8vCVaD9VwxoDG2Fkl79Z9qg8xLc56Pxzj686LXjau
	ExdxVpmedGm6HWWq2QzJs8VlgkXJWBTR41l5FjmuPmaQix9G6TQS6lwB8LHluOahsXGT+gjrTvD
	CKSlNLdl/OyTOosNDvgj/RzKAac0OMDbYi633KnxAD8TKfwjvdKl+Q3JhQGxtHMBNrXTrp+FBQP
	V3sB4nOeGPkU3hidxhN5vEe8DfdvxdHPK/ppwK7ooKiiFo0jhs9ww74Rx4B9QxSlVIxpq0uf09/
	kxbfLb2pQOXi/tXJgu3HQQoQkXIwMqZ0ATt8uf+Ux0xgDmWzARn7StVpbOxcesNHtk4Zderqtdb
	9ri+XJMERa0FX6rSiu8juL5k=
X-Google-Smtp-Source: AGHT+IFd1A5c1zO9GBABwQI2kHUsUg+7vssajggMaoc11A3BqmcR80bJTa/022VUfiROeI8C7pZWxw==
X-Received: by 2002:a05:600c:3e12:b0:456:1bae:5478 with SMTP id 5b1f17b1804b1-4562e364789mr20439455e9.2.1752656556687;
        Wed, 16 Jul 2025 02:02:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e8b9:11d7:19c9:41b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f33f0sm14574135e9.2.2025.07.16.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:02:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] gpio: viperboard: Unlock on error in vprbrd_gpiob_direction_output()
Date: Wed, 16 Jul 2025 11:02:35 +0200
Message-ID: <175265653234.14840.942937667387824922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <9e72018c-e46e-4e55-83e4-503da4d022fc@sabinyo.mountain>
References: <9e72018c-e46e-4e55-83e4-503da4d022fc@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 15 Jul 2025 17:58:34 -0500, Dan Carpenter wrote:
> Unlock before returning if vprbrd_gpiob_setdir() fails.
> 
> 

Ah, of course. Applied, thanks for the catch.

[1/1] gpio: viperboard: Unlock on error in vprbrd_gpiob_direction_output()
      https://git.kernel.org/brgl/linux/c/5103fbb7b59f7a078284a345d82bdab0f0ee6d08

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

