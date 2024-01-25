Return-Path: <linux-gpio+bounces-2576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276883C2B8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 13:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 094801F21A45
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 12:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2C448790;
	Thu, 25 Jan 2024 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgvE75x7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD78482CD
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 12:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706186760; cv=none; b=hcD13/OgfFGtgj4Pg31sI8UVwHlPO8++AhkLoIkLU3Uh5x2eNaC8/8l7mJYVXCT6M7+cbRhKORjkJ3O3+ee8DZLx/cb5xKivdQlP/dyLMr99zuOeuV4P3zbFQNWNR7sLa+WgeEeyoHj/BnElXAwujPFHo0kDGmdJxCCen6181iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706186760; c=relaxed/simple;
	bh=49W0snOy5jjm6ntb/jsZVJJPo3PZ3D8XwFcPnQfgHNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br5h5IGAm+qsZopGHMjCsCHS4QbBw1Fd1B9Z133X4Ynmr0wtiFrbMNzwzJnOfXN2a5fkE7n3rsX69iyrvjpivpFgukF2HS45HwZwydx5Mtu1O21LCUiaju9tPHjQreUtw442wXmAgoInXarC5d5FX+5GygmbW3fMtdot927Zlac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgvE75x7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d51ba18e1bso61007545ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 04:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706186758; x=1706791558; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=49W0snOy5jjm6ntb/jsZVJJPo3PZ3D8XwFcPnQfgHNk=;
        b=SgvE75x7/I8FSBnoamgaPjtWCMuuWqpXOPqfzHXD74arx9/KzHLOkmhAxonxfPxMXK
         qE8RnXGiOcops5q23u2/EOkYhUkdbQwZMX47D6t5g5vjXOcXj9SJmGcXqO8wJ++HFNl1
         VNxot8g/kmXuxFQBdgVh90Bf+VJFydhRJZns91GPQuJYOvGDeKRwWCG2ZpDkQ+432q6R
         ri2bQsYJYDylru5+LK4sfBOjMlyffNKfe1eS3LIsPO3q8wqkn8aO6BuF04LT7mpkf9FN
         asfHFK7WrZTUGX+xp87J0AYxiZ3HlRDLcrIbkleHO6gs+6zUmoB7W4L0o53e+hBUuEnQ
         ALZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706186758; x=1706791558;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49W0snOy5jjm6ntb/jsZVJJPo3PZ3D8XwFcPnQfgHNk=;
        b=qL/0f28C1MVuz2qteDPKlf6tvBy6jOuVm9Y6p9zoM5JizpmL742qUfS+52kTyu/vXN
         vTLCHeo4MqspVXh+o2VZU8ISeT/CAHbeiyjPlmg8EzhLAHsH3AvN80PIUIDqyoCpzjLv
         Z7oKL+2HBAxOoWrlxh8i00IU8KBjN8IeZamA3lVCutqhcEFkZFB7bOUMyvP7I8VUdEjn
         QNviwlYxFw6/5Ekua9U0yNEkCtaxAZknEkHEMYQfGU7+TENjGp0rbJ55CMTjmVhOqYzt
         N0xZ9q34mzBDLSlCysadtt/PYWw0KoIbpxHEly7STipScPG8ism63LXDpSwvHEsxud3B
         NCpQ==
X-Gm-Message-State: AOJu0YwOie1h89ectHfWE9xtkVm9QMcbytNCvexjmOMmWJWY7xQlflXL
	+9EHExuH03AQAV/82mvUkcLtgfUP/3zfM1+NE7l+RSpBaE0+1z/z
X-Google-Smtp-Source: AGHT+IGidti0MMdwaFF96qyKMnO3X1U+tWMUHDGOUm50LNvxwot8k1+210kxo1LyAzuHoW3QRWKbZw==
X-Received: by 2002:a17:902:edd7:b0:1d7:4a08:351e with SMTP id q23-20020a170902edd700b001d74a08351emr940408plk.67.1706186758506;
        Thu, 25 Jan 2024 04:45:58 -0800 (PST)
Received: from rigel ([220.235.35.85])
        by smtp.gmail.com with ESMTPSA id r18-20020a170902be1200b001d73ac054a0sm7728146pls.33.2024.01.25.04.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 04:45:58 -0800 (PST)
Date: Thu, 25 Jan 2024 20:45:53 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	=?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
Subject: Re: [libgpiod][PATCH v2] core: check for positive values returned by
 calls to ioctl()
Message-ID: <20240125124553.GA99216@rigel>
References: <20240125080629.21161-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240125080629.21161-1-brgl@bgdev.pl>

On Thu, Jan 25, 2024 at 09:06:29AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> If the kernel GPIO driver (erroneously) returns a positive value from one
> of its callbacks, it may end up being propagated to user space as
> a positive value returned by the call to ioctl(). Let's treat all
> non-zero values as errors as GPIO uAPI ioctl()s are not expected to ever
> return positive values.
>
> To that end let's create a wrapper around the libc's ioctl() that checks
> the return value and sets errno to EBADE (Invalid exchange) if it's
> greater than 0.
>
> This should be addressed in the kernel but will remain a problem on older
> or unpatched versions so we need to sanitize it in user-space too.
>
> Reported-by: José Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
> Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Kent Gibson <warthog618@gmail.com>

