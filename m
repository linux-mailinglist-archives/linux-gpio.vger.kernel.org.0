Return-Path: <linux-gpio+bounces-29037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F56C81CFA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 18:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D37C44E624C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 17:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF092BEC2D;
	Mon, 24 Nov 2025 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwUJyBAz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD10D2C1581
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003977; cv=none; b=T3kwaZjUd0azE8AcgqQUnVHl0Lunrzd9OfrA6Trai3u8CnGUybDUhtWHZLhjgiMHqxX2zay8b0MPPO/yHxdUbft3mTtPe7ba5/p55M07ONhUwtjGFTM6EL/X7GqfgCZR8tXACQnBvYM/QcZtq1Kql6dcWnz3DFMzJNLevaKatzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003977; c=relaxed/simple;
	bh=JYk0DlsmrYkHa9pnunJP5MMBiIh8+pvQoxXtIvOuszA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUBTHXFRwYtCnnUXTGBgXQNGcUwGvOOf6X666/12qavmARk9x79raS7v/4ZbZWuStU53EmR7HBBwsZwcpzIARi8wHg55mKzBLVPjpN7wb8hZp9uA4lWQY/XOW6HA18OWm0aKd0VzWrhiRaZdawWgA/OUHGyF73fiVnv8uROx3ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwUJyBAz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297ef378069so41445855ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 09:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764003975; x=1764608775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnHv7SSUkVZXm9MlHQF7vnbKRHnkGY//zn2BWH6fbi8=;
        b=MwUJyBAzQ9279jRUYy/gey3eDSFddfZgnMDp1XBvmQn2JmUMyA94hFPzfFhvrTxi3A
         cJj8Wlz3fXhfF1diLtyLd0BBm+X4O57exrGlyqWjKStfYkF7WEGCcg7+hvEeF7ZWP9Z9
         Li6zEH1tyiNYBB7rSf9Lp/eIIJ9Rnk8JbKeesmrEd/DDc7RDx6LkqhTvo/oQIMGA1MeV
         4wOoUWi7jhf9NoEjlpkwIZTFhV+Gm8wEOlvFIX2DqJda7DpKTjvHv+8QoRT3UMLxK7XW
         X9D0JAadElptu76pPK0UGsiRf7D090GanoeURyTrQfBWkJdLWnsO/n8/VEkk5yH5JeaJ
         7ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003975; x=1764608775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnHv7SSUkVZXm9MlHQF7vnbKRHnkGY//zn2BWH6fbi8=;
        b=XXlslBDhHst2H7dijEO/hDvZuQW2JU6rUdrC1rcijQq6ZfoVs1Nd6um+GG4fwyfuvD
         icap9nkFTmlMXtIRTxf1yGoMlF7u8vzFHIT1ZEVN3bRhQgIKngftRttrtwqkknAP/p0K
         ZirpM7n6tYJlfz7K3UEFro3JEI8owQtRY81z4QE1eYTlgJXOCWhitsglNrz2glPHWlNN
         3jjn8UOBUHc37Ag5W86RaIdJtsgUSbqjqEKNmUM9wluwgJBaVe5McDBOPRUTYj8IH0kc
         mY9FBmNM+LE+YNWzCDY21zq8vDIY2gT11ihDLz2ap8oQH1KR3cEzZpmpfGwZbRSNRyVj
         Pmfw==
X-Forwarded-Encrypted: i=1; AJvYcCURGLbTMEObMXNfy6dSerzqXD0t6gfi9Cnrwq4ZVuhd4IVakKbPrOeUM4kLekB0eKAjLt0yaJ8cziQi@vger.kernel.org
X-Gm-Message-State: AOJu0YwVmY7iE52Nx2y70xVoZww3Vv9cqwsWibdpDmP17Jl0uh1Gd/Z/
	ZwimkPVXQ41u/zIFqlDgFlXRV/oQdcXs/f8gpk6VFpuhNAk3nHi7+gupDuBSdsKHKhM=
X-Gm-Gg: ASbGnctwGOsTdHdhGjiN2PvKU6A8o2V56/vqvVsOE/X4Iio4HSk6wYi4YCTQt0Voq+D
	MEfazFk9yA59jXmdUN1vPmqE0i6FYy8SCSvzHwhIUh8cOMAckkiaKWyLldDn8EMWoS8iX4GPqT0
	EGRXsoXjmEMQsaJEy1n/jvPXceqTfrxCqMrnt+EgY0gPqb/cxgsiq2RF9722FR2DBjDiyQc7zAi
	n5vpzhuHwAuPkRAGYJHB93bHZTD1EHmL7NrETPMXMETSMovz35v97Hw7HYLjtir42YuZup4ipHM
	0mPW/EzmsjvdsxwU3RPx3IYrqurq76NU7LOznAfEJcW+lQpiPnWfgWxLcYOH9cBjjTMgN+ffTxA
	eiEkvpWXjAoZFHa/CljW3rMlymNSZLUKBMUkjD9S3MC4LZx5C9TNDgBeLFWDo8y8hg3KyAPK9XX
	Tr1bTkKE7jNA2YAuw4Jq6OvkVt
X-Google-Smtp-Source: AGHT+IFFll1ZBv/7+NTNtf66eRKGB3OEh6EXFU3EYSb6koOyW950nZNuI/PfU8U/2nZsnDgImLDneQ==
X-Received: by 2002:a17:903:384c:b0:27c:56af:88ea with SMTP id d9443c01a7336-29b6bfa1f66mr134598965ad.60.1764003974768;
        Mon, 24 Nov 2025 09:06:14 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:aebb:f23e:8a7c:d95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13965csm142296595ad.30.2025.11.24.09.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:06:14 -0800 (PST)
Date: Mon, 24 Nov 2025 10:06:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com, Randy Dunlap <rdunlap@infradead.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aSSQg22Kt-565T8S@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>

On Tue, Nov 04, 2025 at 02:33:10PM -0600, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
> 
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
> 
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
> 
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> 
> Shenwei Wang (5):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   docs: staging: gpio-rpmsg: gpio over rpmsg bus
>   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 +++++
>  Documentation/staging/gpio-rpmsg.rst          | 202 ++++++++
>  Documentation/staging/index.rst               |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-rpmsg.c                 | 475 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 146 ++++++
>  include/linux/rpmsg/imx_rpmsg.h               |  48 ++
>  9 files changed, 1040 insertions(+)

I started reviewing this set.  Given the size and amount of comments to go
through, it will likely take me several days.  I will tell you when I am done.

Even at this early stage of review on my side, I can already confirm the only
way to move forward with this set is by reaching a consensus that includes
Andrew, Arneaud and Linus W.

Thanks,
Mathieu

>  create mode 100644 Documentation/staging/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
> 
> --
> 2.43.0
> 

