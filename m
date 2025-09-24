Return-Path: <linux-gpio+bounces-26557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F202CB9B784
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 20:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7AD6162393
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 18:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DA32E0923;
	Wed, 24 Sep 2025 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvtOKgXl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAEBAD5A
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758738318; cv=none; b=ms/1j+cSbNaaFnjWq/SWdHVMZomlytig7I+9hLsfd9NwyRuX4N29OW8o9i5zdsJpWNW7xA8zWbxQ9Dh9cWKVKLJRPEmTDiPP6tetrxbNRSOoVL/hbgBoLvnx4Ma72vxp659xetG8+N4Et/TBnZiXt7kz4VzyMHK2gRAIsWcuaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758738318; c=relaxed/simple;
	bh=g97455aHztfid/mxTIWRxfLc4DSmVKssfpZqo3D8+SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvlrmoe6wUvwji7Rw0ptLFHgo0VmjgqFCGLUsgo6FNOkV5n+L9Q+RxahWBZrcbC/5VajXv62vM11XbwtnnuOVgSW3dnVZhP0bXuNput87mM7PDm2xaoou9mhaZ3aeOA+vPiFA0BVOJNrTQWiyGyAubN9uoCbTIpEiw46V7EVO5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvtOKgXl; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7761b83fd01so147704b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758738316; x=1759343116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6YgjPyD/CCV5XJY8PLF8Hf+Jbbmg9hnJHEyTuJhhjQc=;
        b=bvtOKgXl3shv4YjcgA06OXdHR968qVWEkukCgTBFU5ZT3pYPZrVx9FeOFVpQn7GZK8
         Y/v6S4dn/MCA5Zq9aM7uLLa4jv36KPZkUfuyfW6W1WY/wO6yS9JHlA+RUyO4s5hzbTQ2
         0h951+EoGtpYK3+oadW+a0AlkpDcCaoGTvITkxkfxCSi4ChmmG3ecwIiLzfWcBVNBE4h
         2KUz5spEy7Nj2SmogiXX3zbKvIYLFeQa+x5RwqGd6YWgyM0Xdc9eRlpvdPy4g4hcfnND
         r30Xv0QUFePiTmrt0bQCksav4PkWHuFj+9U9WNac3sEl6Q/zZD6QJl7EYb4ly6gi0I2/
         mE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758738316; x=1759343116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YgjPyD/CCV5XJY8PLF8Hf+Jbbmg9hnJHEyTuJhhjQc=;
        b=ndcHiQxN986iBUWnu/lBvjb3esbzKFEJNjlR5yMqRljcauM47/Op2yz/6Kqh7lrNRO
         y32pg8G6Hlp2KZyvZRqr7hoMR+tbNJYC8yO1ISvEyx4Cgp6IDHCyCxqS4Q1anmK2txle
         CS5Orj9yZEsa6IxvlQ3kqXaUALK48iOjbJc3xU40UiM21oir5yjhDT9irfcwbo16Xjb8
         ZlZvNjFTn+LAuz4jPdaPB+M7SwaIIldNMnE2LDSmWCoXiuKr7GRCyTDD34rVbS6JpTAc
         hH3XjqyC00oQ2KHmtit9g4x25sQR3NeShZrn8MeY4GLL5G0RgHsNb1aSRiRnACWq0IPV
         1KPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxOn9PeVGbSPoMKgfTFqBdO+FXmq7c6jVNDT0MOTSrcbwXrnagUV0Q2958s/Ls+pPueneSf81GyqEY@vger.kernel.org
X-Gm-Message-State: AOJu0YycDxBHenN77Ip9+4/xIntPmHhkrslGEY5Gh5E7FTWBIA7M3nlh
	xFAmDEopmIiIIPncG9xI0/zszqBSFHyDRS+KJ1M649efKBmi8t8n+GU4
X-Gm-Gg: ASbGncs1ILTzZm8to8z7dEtdCJPqh3mGEqeh3sW3zntQFKd75PaT61sLuMgPMXCQaL2
	VrzyXK1kMpxj3FMUk3MgF1GTRZ6H4In8KqGbK8VGb5nzX6Tbm7qqSpSbP2Y41s4E21/hNgkQej6
	V9TGkenyB5vSIhV9M0Ay0ho8GF3k37pEp85NOUJn4aaGWUQv/Riv29WCCdmCHdoUniaDifNHr2W
	GRPbyc+EbA86SQYBXraf/vS0fDgKdq+uemW1cHiO2dl8sd/+MEPharSbOD8FznfLs5btl8c1/1X
	qgQ+c7Q+vRl3CppMwPFDP5CcWI0+vOZFmgBNq/skVYBdMnaJ93YqvoonjOvOkM020XZ8rjVXnCo
	Qf+po1ipb5DYHQdA2cLtjg4PZbQRSlTlD0g==
X-Google-Smtp-Source: AGHT+IEpqtHdu0dI46MtGn1c8K5pz/tU5t+99UVSknOsKwdK2FcxqnWLxMvVRgkYkwlIxwrVnQBnnA==
X-Received: by 2002:a05:6a20:918e:b0:24c:f8f:2b95 with SMTP id adf61e73a8af0-2e7d0ad11ddmr748774637.40.1758738315675;
        Wed, 24 Sep 2025 11:25:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f4c4:bad6:f33e:ddc9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5510fd4872sm16344912a12.32.2025.09.24.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:25:15 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:25:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>

Hi Bartosz,

On Wed, Sep 24, 2025 at 04:51:28PM +0200, Bartosz Golaszewski wrote:
> Here's a functional RFC for improving the handling of shared GPIOs in
> linux.
> 
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
> 
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
> 
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
> 
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.

How is this different from the existing gpio-backed regulator/supply?
IMO GPIOs are naturally exclusive-use resources (in cases when you need
to control them, not simply read their state), and when there is a need
to share them there are more appropriate abstractions that are built on
top of GPIOs...

Thanks.

-- 
Dmitry

