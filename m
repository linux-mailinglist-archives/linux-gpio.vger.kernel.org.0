Return-Path: <linux-gpio+bounces-9696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F096A55E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 19:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3429E1C24197
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F29A18DF6F;
	Tue,  3 Sep 2024 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="dQy7SMxr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6771C18BC3A;
	Tue,  3 Sep 2024 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725384209; cv=pass; b=EOiYF+N8rHu4h85f1i74sFO/DQJF44t74aNAyxGDfGYTK4lbX0R+GMSbPOiELASxQ/v4kpRJsu/HzYfwKt508Y3OzwXKDH5qSMMCwyjo2pjbMo5AZd8msrEbsqLgZxDD4gj2w6QKnAOYiA8jOxh9Fvhtkut5ClZilAhrnL3J+vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725384209; c=relaxed/simple;
	bh=sNvkNTkQyaiNPWQjmkuwZf549NqTHwtFvXW9lBIvGX0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VIlOLMrubFXmHXfsvGanC0a37lsGPZqZzMNOhj+C+wfAPAG2Kl3d36gA9sBmDlooXQv6VZ7CaNrN65VNBF/H/K7s0w5zauxf7fx66qKg/P4262DknW4+X4gxUUO0FDLeh3Fn5tFbdw1SyEM/2BdVxrhI5Sq6VCElgbz7uG8PiRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=dQy7SMxr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725384202; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EehSrZ8ElJ6N0Ljti7bAq92MT3FS6U2zxd7bMpiOcfRMDSkolwHFvLqnKiN0isLmvQJozxZetBOc32yVllwt8sqLukMDIYx0TddOuJw9Lp+szOtL1qquu5+261kGn7+hpg1fOME4Qiz7jOOjA9DF18VrAqMogW0cbhtM1fCthCo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725384202; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LYz0ycJpQXYT27KJy4PvXFLhezFhzDNpICkvUMqXgjU=; 
	b=nmuvfjaKpKHqC/ZwYe1xzhGn5AV5n6IwxTb/EnzTCC2wO7wb6TaAVmPUb4K+sX41bDuh3A1UmybMfLGPUijDdGeJf70hhH9a4lE43k9tR7/pAJvHSI7GiEZmAGoSo44V6WC1g4QzU8v4CdGfgIOA6+JQjISYi983Sxc81rZaaX0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725384202;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=LYz0ycJpQXYT27KJy4PvXFLhezFhzDNpICkvUMqXgjU=;
	b=dQy7SMxrw8H4+Nl4FEpPaRRfk7+mbXAEBp2lMiK/5l3D7062zRZKtGgLDwhMi6Uj
	Vamm1EyBbdZWFaaHilh12PgEIl0zA4h3z4s/hZiOBRNEnFzH9sCTNYru2TpGynQSCHX
	iTsSIeuYgvYbxHPx4pKY5/aixgqCBZFHHFZSxXQk=
Received: by mx.zohomail.com with SMTPS id 172538420028422.02274509881522;
	Tue, 3 Sep 2024 10:23:20 -0700 (PDT)
Message-ID: <073a43d53e0befcb31adb1410d6dd0363c4911a2.camel@collabora.com>
Subject: Re: [PATCH 1/2] gpio: mpc8xxx: order headers alphabetically
From: Martyn Welch <martyn.welch@collabora.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	 <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 03 Sep 2024 18:23:17 +0100
In-Reply-To: <20240903154533.101258-1-brgl@bgdev.pl>
References: <20240903154533.101258-1-brgl@bgdev.pl>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Tue, 2024-09-03 at 17:45 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Cleanup the includes by putting them in alphabetical order.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> =C2=A0drivers/gpio/gpio-mpc8xxx.c | 22 +++++++++++-----------
> =C2=A01 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-
> mpc8xxx.c
> index ab30c911c9d50..e084e08f54387 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -7,19 +7,19 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/acpi.h>
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/platform_device.h>
> -#include <linux/spinlock.h>
> -#include <linux/io.h>
> -#include <linux/of.h>
> -#include <linux/property.h>
> -#include <linux/mod_devicetable.h>
> -#include <linux/slab.h>
> -#include <linux/irq.h>
> -#include <linux/gpio/driver.h>
> =C2=A0#include <linux/bitops.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> =C2=A0#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> =C2=A0
> =C2=A0#define MPC8XXX_GPIO_PINS	32
> =C2=A0

Reviewed-by: Martyn Welch <martyn.welch@collabora.com>

