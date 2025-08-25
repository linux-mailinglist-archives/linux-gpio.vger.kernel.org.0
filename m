Return-Path: <linux-gpio+bounces-24882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4336CB33A21
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EBB11891CE5
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2A52C032E;
	Mon, 25 Aug 2025 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv4/xmRP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A32220F5C;
	Mon, 25 Aug 2025 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756112856; cv=none; b=GlpThw9RvoueP1evagmTI0JPvHvx90akDKBkupnHDo/asv1Nx7xGgcMML4hiUfBBtWfYhtvkqK9ZqomYTX0Yjo5bT5lxRJ8Q9Vty7s3SC4//fvhd5VT8mqYrT0I3W8GfYVBwgz9yeU9PKugNXLn9dwsps9SNiaUKQY86X3HsZRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756112856; c=relaxed/simple;
	bh=0afVbdqJuKr1Gb8UF4vauT+qwqgRsD9QKUHqhLHj8uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHttZktMOu+uCrGxV1UO7W4Pqkn4YBbDRUpEOp+yqyehARQD+nqB16s4piYC6P7MpVqSOgSx+ThUa6O9Zap27iM6ts9K7G70AbgjPRBw3BqTdn6NgkbG8yrqqLOVA3tyjtju+oVGLoC382uSnJb3D8kzEXeuMk3yRwwRQUoI+xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv4/xmRP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a20c51c40so32924175e9.3;
        Mon, 25 Aug 2025 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756112853; x=1756717653; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vr4qgg8QvT1htSr17vcKZvoQkQdbfOPGu2eF2Rhex4Y=;
        b=mv4/xmRPPwFDawaaocz+O8wCMWAbL5mn1nPV7HKjaF1BR40haXbVDd62n8vhyxuynd
         dxo+HMNGFEAwSZXRyS6YfAZSJ3veXexLsRANggsCMzPMdbas/rl3FsHBUYsfsCNbz4/C
         J0yOZYZR/zdegFxOVXF67pxu0hU0H6HzHeZDbKqRXP3cDqshx+mHztygIVes/Fxm1RDm
         vvfwkK/hFAzm3pAM3ihJid64P3XyEWcwN9nruxS1Wa3fdzmVE8yrpW1qwOLmSwZsQKSO
         XB7mMAYAXN20+UyAAiABO9ffqr9VmBFkj3g+iw1NnJq5Rzl2KZ6+cu7MtZvPZMtPFHwF
         iF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756112853; x=1756717653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vr4qgg8QvT1htSr17vcKZvoQkQdbfOPGu2eF2Rhex4Y=;
        b=kOHFl7EOtquGvP2NW2ZmOIT+w+IOe/gCy8+qUZ8Wsimu5FN+aJlQV5fpHrTGCrvdYI
         G29Zp4OcXsp6mD4vRtdpX5wZJkVK/DjHIQgNKy408y+/kxJZAvjyGatkU1pO/RLkzA6L
         BcmQfZAWme4zPrDWwSPe2NIk/G0lxPYKyeEhq6ZRuezuhvbVPLtKtgdFHQ5iYpvbk21/
         Sf+4rhrvp+0LNQVHaEVgS8ooK4Sa2YvR/fpD/mwEQPpVBwbQTCAneE41pdodNcrwSzuh
         Rvuyoo6XkTa/MQPZuaSzCDKVH2sarh87XoZCV32AdaeVXWbDPl1Nm8kOx1X0c8XB5UoL
         vINA==
X-Forwarded-Encrypted: i=1; AJvYcCVVAPfw/it1NIlBvEQhlPqYqI1i8+h2Cp+eGsEroe48vxm0qjtx9BgN7JAE4R9uOKqaYsuObBxNZIjPvAQ=@vger.kernel.org, AJvYcCVdDWbxUdbNmpZDNeR26REMPzs7p3ZX8Md0tCTaH6yl14go8z6xdFJJN7O0L6prqdtOZB00Za8Nq8EFCA==@vger.kernel.org, AJvYcCVz0KHc3qo9rxTSziNxaZCOFsAe4fWc/aHbHjQdABqMWD7ainQjtIpL4ttHw0yLgi5IvtLZjG13/ixl@vger.kernel.org, AJvYcCWZ8Sdydz4O+9nHOg5rFZJpw7KE/XZG3+6/PkPn26g2kz511VtG4MDUVJiLoGTGu8GMKbK4ezQZjM3zbKC1@vger.kernel.org, AJvYcCXmCtcZR9JEL1V7jRXPjr9Hotnw7yBVRj+jKYjK0+eYU03bDzNewxj7slTOOUu2GOwKDLHgFuSW1CHE@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKIJNK68y1hSiruErqjxLMdl65sjYHp306vCKCS4/81NvzWE1
	1Y8OKICFy8AeNjYM4Ax3ygrtaanQYFuTpHD52zp/f5RENv0vfdncefgz
X-Gm-Gg: ASbGncvCxCWIPbRMmgTGKkdLZ1L6LrguFVl9wQR5YkFz0SKZiQKlVmgeWAuIKiuvAJP
	Dis2LvgsoD1cnNy4Mb3LZIWv6vNH4Db0VmbT2kHTeG86Ji/039XzmjqB7vmiNopZwIwmb6oTydd
	jEL7XpXdA6USYnOHZAp9SsmpdzSCmmCD/G3mMLAfGB1iQ29vBqbS8/L589A99l+GCpwRGsexpRA
	oplVDJcbqWlDidhLrx1fFOH1T0x8D6BvCEiQj0BjB8a96SfjpdYxPfOo9qWbInK2dw4j0EC+s80
	NAKEsOBIa/4M/nH4Xr4tgLBJcuEKMpV6A/sgvgvd/Q9tju0aC/gFOBTL6oa6gzoMEfWW7o9KFpj
	YknI+KMucrVuldw==
X-Google-Smtp-Source: AGHT+IGdoM8nFDuaCsN//itvQR4DcfYOTg4viMn0MCLDJ9tOT8DXHl3CreL1W3WiJ/o4L5cjBiOFOw==
X-Received: by 2002:a05:600c:3147:b0:459:d408:d890 with SMTP id 5b1f17b1804b1-45b517db8e6mr107941905e9.33.1756112852397;
        Mon, 25 Aug 2025 02:07:32 -0700 (PDT)
Received: from nsa ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b57498d9csm99679345e9.22.2025.08.25.02.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:07:32 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:07:52 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
Message-ID: <jhtvuwdako2r3pgj6lwxlgb6godnleqezh6kdiswn2mqslqy7w@6p6ixj3hrckq>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <5713bb5b-3301-46bc-b30a-d2e4c58d1036@roeck-us.net>
 <2svr42ee7akwxwj5nizwe4a4hqdk4rslv7ivxraqg3jy6m3mxz@lfpn2nx4jdmm>
 <20250820200354.GA602656-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820200354.GA602656-robh@kernel.org>

On Wed, Aug 20, 2025 at 03:03:54PM -0500, Rob Herring wrote:
> On Thu, Aug 14, 2025 at 03:15:29PM +0100, Nuno Sá wrote:
> > On Thu, Aug 14, 2025 at 05:54:26AM -0700, Guenter Roeck wrote:
> > > On 8/14/25 03:52, Nuno Sá via B4 Relay wrote:
> > > > The LTC4283 device features programmable current limit with foldback and
> > > > independently adjustable inrush current to optimize the MOSFET safe
> > > > operating area (SOA). The SOA timer limits MOSFET temperature rise for
> > > > reliable protection against overstresses.
> > > > 
> > > > An I2C interface and onboard ADC allow monitoring of board current, voltage,
> > > > power, energy, and fault status.
> > > > 
> > > > It also features 8 pins that can be configured as GPIO devices. But since
> > > > the main usage for this device is monitoring, the GPIO part is optional
> > > > while the HWMON is being made as required.
> > > > 
> > > > Also to note that the device has some similarities with the already
> > > > supported ltc4282 hwmon driver but it is different enough to be in it's own
> > > > driver (apart from being added as MFD). The register map is also fairly
> > > > different.
> > > > 
> > > > Last time (for the ltc4282) I tried to add the gpio bits directly in the
> > > > hwmon driver but Guenter did not really liked it and so this time I'm doing
> > > > it as MFD.
> > > > 
> > > Nowadays I suggest that people use auxiliary drivers in such situations.
> > 
> > I see. But do you have any issue with it being MFD?
> 
> I do...
> 
> > I'm anyways tempted to the auxiliary device idea. The main usage for
> > this device is HWMON and I dunno anyone would use it only as a GPIO
> > controller. With the auxiliary device we would only need one bindings file
> > and slightly better bindings for the pins functionality.
> 
> For this reason. The driver structure influencing the binding design is 
> a problem, but I think MFD is more to blame on that.
> 

Alright, it seems we're aligning for auxiliary device on v2.

- Nuno Sá
> Rob

