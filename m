Return-Path: <linux-gpio+bounces-30586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C2FD2211F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 02:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01428306B788
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 01:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1910270540;
	Thu, 15 Jan 2026 01:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4LXB4Un"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E59525DAEA
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 01:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768441955; cv=none; b=kylz1nc2jM9UGRTMsXxG3eMVV+0igybczSUV7TxmdIZqZlGjneSbvr0TLPYvBRjM5Ew+ca3ZxFBJrTYZorfRCSB7h5a72bM7QdKJezGUho+YBi67jOmt9DOTrRH0W1NRhJKmvpXJF0b8Y2WUTImQOw1Y7FID+RK7+440briXP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768441955; c=relaxed/simple;
	bh=JsUIR/1OXo+BahiQ+lgaQs8O0CEy9G4etSPFreXSyck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMJ7iO3+pyVBh+/pa8Ap8VfBpyjNEFHSlBlXZO5M6kALIeKmMQUnh3Q99Gxe4Z6q+K+rN/Hd9dzwc6cexuSMUJ4bOtWawMDHsZs+/O48c239OaEAFFyGkMDqy85fWb8sFjhnrcGTh4yF9jSnqeFUySS+vqNh5f56x6UN0jYVwEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4LXB4Un; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12339e2e2c1so275937c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 17:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768441953; x=1769046753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eaGsIuvEkZT/0ZxJsJ40cQ270Lj1PGkWPT1RajGBoys=;
        b=B4LXB4UnuNfZE4VXK89k9AvbTK5J++Mk1n8+hOvknD2J0osNcirzOmmboFeCgHsgft
         tdfmN2oamg/jbgKvzOwy4TEXXWpO9p2Lp9AB8zqziUZv7vh4hZP5Vh4hJqZtxkR5MOhI
         avGiOpYpEYo9xrI28y73YSdwFBQQpWCUYMbtR/TcOBdooTWoGX0hKamZtyXnRpqTnACr
         evkMtj5jVycmmgq3Y8cfM/LQCK+MDIcgVpUuFaQ8w7ZsAfniEx0IhV+fc/LcqDJT+wuU
         N9mNt1jJFjYkoHcmfTMEWnxtp2l+ovic0Vfmoyo5w9EcZDvnDKlzqk2s+LN2Eg6x6ZBy
         ypyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768441953; x=1769046753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaGsIuvEkZT/0ZxJsJ40cQ270Lj1PGkWPT1RajGBoys=;
        b=JhTeJKf0NtdJnSqddKmnyraniNQ3Xa0JJluwbbK77CMCWn/lgUy1d8vUPKm4FqywAl
         wcHTnm3ntbRFctu9Ng91y14LA87rtTq/CQcd/N14qSAYnBmBzWq27aqUesMkBM1szLQi
         s368bWMzn8yU+Eiwz1dpZh6aOkowdQdrCOAZyj/L1dsmLxQx2B0zuGno8SIlovPt8sIi
         85wCzT++G3R1MDBxwnNDlEOyDBprZCS+isYUaY2l5fJVwLJy+1gzbTnO51kQk0rQP4cw
         Dico8gR+VmC1k7qKM7w3m2klpq4gwKHO01WW88J4i4kDQak+x5r88DzukhzCNZG09Rcn
         HsBA==
X-Forwarded-Encrypted: i=1; AJvYcCV72t8Nlwc3cuFMvFBGxVxJJhNPP0+U8NQMCxXsC/WEJO1zfmB2j1wbK69A3n63HlW0/UIh0i6xI6+F@vger.kernel.org
X-Gm-Message-State: AOJu0YxRj3gXGMkiLF+0sX93kKsTrHze8Nvq+N5kQpK51Efjel6fiJgt
	PSP84WeLiRFswCs61lnZufA0NCz2ipCSXlxC3wXuWshE4+KKG2daB87U
X-Gm-Gg: AY/fxX5aENECabm2cHyDVWU3DAN1WElQg5hd11LKdCpAid51XIq6yxdT99s33T2lVDq
	9otuNMWH2j5pkPNkXe36O7u2ehSAtFI0c8y7N1/ykwrZj2UdnhwymrLNBJdwPDu4PwVdYv6OG/k
	c+J1gQBYse/NIZizXOZP7zCGqEdZtGB1OCdccQqAPzB+dAJoySxaI3SUL3YA4oUc340Eu+fRQfD
	caAVrnWj2GH842r2HT32vjSlMWnJ/cy2qUqzOpqOAWYkxfeSC1jsJru5Hrl5bZAcoqIlpG15wsL
	GxN5OqC7dHf6AAfzhJQqXX6ExBhskw9XxqqGe5gtdpgDTUCBSC92B4vXVXLbZtjZeiQdAkfHZQ0
	pfBLy3iKrP6r9M94elGC2tQ4vN1BUJGgyr+TuJmaqhlHA6aphwS56sfr3RJ7NKIpq4KOQb3URM+
	2VAIFynRkIZQ==
X-Received: by 2002:a05:7022:6708:b0:11b:9386:a38f with SMTP id a92af1059eb24-1233d10f432mr1505698c88.22.1768441952848;
        Wed, 14 Jan 2026 17:52:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm32727140c88.11.2026.01.14.17.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 17:52:32 -0800 (PST)
Date: Thu, 15 Jan 2026 09:52:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 03/11] pinctrl: sophgo: Cleanup header includes
Message-ID: <aWhIOYIWnJy7mhkc@inochi.infowork>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 04:30:04PM +0100, Krzysztof Kozlowski wrote:
> Remove unused includes from internal headers, because they do not have
> following: bit manipulations, mutexes, spinlocks and struct devices.
> These headers are included by actual C files, which seem to have all
> necessary includes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
>  drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> index 759c0e604acf..973ab9a38fcf 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> +++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> @@ -6,11 +6,7 @@
>  #ifndef _PINCTRL_SOPHGO_CV18XX_H
>  #define _PINCTRL_SOPHGO_CV18XX_H
>  
> -#include <linux/bits.h>
>  #include <linux/bitfield.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> -#include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf.h>
>  
> diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> index d481973fcf97..1a2b00dde1fa 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> @@ -6,12 +6,6 @@
>  #ifndef _PINCTRL_SOPHGO_SG2042_H
>  #define _PINCTRL_SOPHGO_SG2042_H
>  
> -#include <linux/bits.h>
> -#include <linux/bitfield.h>
> -#include <linux/device.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> -#include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf.h>
>  
> 
> -- 
> 2.51.0
> 

Thanks.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi

