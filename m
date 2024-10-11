Return-Path: <linux-gpio+bounces-11211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296999ACEE
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13B7A287022
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3491D0E3F;
	Fri, 11 Oct 2024 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UhfZ2fZw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5541D0DD4
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675769; cv=none; b=hu1DgsceUQJxO/6Cyz0o+Se/VyKgFdxba43/XuNM6q6vGUlFLGtHcdgikq8zXfe1Wrn+D7kJevni8TOtOh7ZyKJUCu66IoMLzDXr8omrdecIvTQweYNDTZgc4o1TWokBqMkv2UhdojLH5dO+LC7xxuy32U1U0D/y52p+SfbgBvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675769; c=relaxed/simple;
	bh=oEenWqwwBvlWpd2BK+tBQnlRr9uWR7YqbUNUrbjm1dY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hg4VCPFJGf9EiaIW41VeSQ1OS2/haeMY+jLcXGmrWMkM5UXdmA7SHMCPO11hZhLhmj5ZVYTP4Yuc4TKmK1mBWx9cNWJoEbRmrDOBVBQ8s5nb4/6eCQyDRU1K1lD6WPv94q3OvzP8XvKXrvhawIPQo8MH//lraabTRTH95XIXa68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UhfZ2fZw; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso22764881fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728675765; x=1729280565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEenWqwwBvlWpd2BK+tBQnlRr9uWR7YqbUNUrbjm1dY=;
        b=UhfZ2fZwmotqQSRxqI6SVo/conmNEVjKjezoALS/HFiBgNMFu3D/vgpdhZe2GoaT1U
         eVcNBkoJRlP+6h5qsoz7c1YCbXKQaPMJiCSMEWv4wTwtu5l+je5k4U1rMboABszu3vT1
         YO8XSR23VIG3TGlq2ye9KiLR+Sh3/6pg8pYfB8JgGI7uA6hkAZNNACj2OD4ukLCG6MuQ
         ocFY8Qx0Z8IzSYzMM7RkFaB9l66it6yAGrhjTgbJFBnRqP+uqAG8NIa3RtKyvYam6Hce
         N2fl/Wz55iCQViChlwoNqSeXXCJw/jg2g93kve1GNtfoYqHlf6Xrzcom+Ho5aIjCIFUx
         eTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675765; x=1729280565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEenWqwwBvlWpd2BK+tBQnlRr9uWR7YqbUNUrbjm1dY=;
        b=KlS4jjsn/T68eQev8qJGfDoCff1IxVNVlNJxb7LZJ1I5r6uJG4GwoRV3iaZvDvOzrm
         hU6ak+MCjx3KTtVX1sYFQPHAoBVoMq9ZavBe7maP/b2zfbpyEmQnONhsnCDhaHLXhgC3
         VaT6BJkXe1+zSu2cdGTlY23LlUizi6Patv/ve7BfATFSYr3MEJPBOA+zz6O7/VAPkvTK
         Y43TiB7GOFV1h45WAfO5wQV2sWrxEkHkANrfk9gzAT55YylSo2pVUjhU7X00Kl1+7zxM
         6V3NSZXjUjMa5Y87r3324oliGA2QH1AQhCEulYW0GReGCiRCEp6icDz0M6O64FdZ+Gdj
         GXrA==
X-Gm-Message-State: AOJu0YzlQLV1WpP6PBJqehQL339ConeT/ufIaEOHTVTtPVepG4vpFjLJ
	BhSFXhZQX4nPdnF9wH8Fn8YWjL3T0nTkZDwzIWVAt1RbBfAxLRug7k5XX2sUP+sKNpUAvKruHQw
	tBxGDKaM+iLGgzJ7WmVy7kCRFoEhUHH+BQocC8+KRWbq5+3Ee
X-Google-Smtp-Source: AGHT+IFXhtGiu0BS1l/h0GV5cEtsaHcNjwARyABL6VXYXRpwOs+tOyv7UJGbtsSmecdKIGDMRk3CWn21qHwTH7tGwrY=
X-Received: by 2002:a2e:1309:0:b0:2f6:6074:db71 with SMTP id
 38308e7fff4ca-2fb32729553mr14953661fa.17.1728675764928; Fri, 11 Oct 2024
 12:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007102549.34926-1-brgl@bgdev.pl>
In-Reply-To: <20241007102549.34926-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:42:33 +0200
Message-ID: <CACRpkdajEnP=-7ia3L7sr3v02ePWqKbC2PukSLXRBecsVT6Xpw@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: use generic device_get_match_data()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 12:25=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's no need to use the OF-specific variant to get the match data.
> Switch to using device_get_match_data() and with that remove the of.h
> include. Also remove of_irq.h as none of its interfaces is used here and
> order the includes in alphabetical order.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

