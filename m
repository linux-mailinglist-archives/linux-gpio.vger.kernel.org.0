Return-Path: <linux-gpio+bounces-26802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0348BBD227
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 08:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B07033AD14A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 06:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4FB1C07C4;
	Mon,  6 Oct 2025 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z40t1c6j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E927199FBA
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759732234; cv=none; b=XwbUtQhhdP1XjhLb1kgplH+TubEKU8FGGz1nwLhsC2djcSVPgzm3YIECUPsQnyTdvD/GQVidtjJPPAYnPIJgDuAiQHLJdSB9bRWVt0f7eZNEvfhgN0lLGFX/L7LABPLdesQaVG8PvLGzbII8WDeyzpXHbB5yZG+YwOwA7gcEk+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759732234; c=relaxed/simple;
	bh=nPNpD7ALKwGoX8g9gdLXJ/FhJif6hIu+iN0IdR/qNPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/A78ikHmgANnea8VZXYmW+sZZvJFXnQiefN06pbl7y484aZjXiQlV7QupVz9D5PY/ms/VWeakCph3q5UvkRkEQYsVK8o0XJz8jTsnVZDs4udvz8eS6x81QUzGRTm1GqMTMLPnk7rsSYX2io/3i5T6O8k1AimC5QAtvn+/M/wi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z40t1c6j; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759732233; x=1791268233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nPNpD7ALKwGoX8g9gdLXJ/FhJif6hIu+iN0IdR/qNPw=;
  b=Z40t1c6jO3YGE8fyoi2uJ35NMIAHUCHxLI3zvlwpO6c9pdM298p7HF1V
   93gTtimQ/jXv0LoVuezQbv1TqdGjms/UpBIyeX/cf9er5G5cQLYcmJdK2
   qZg4POiFAx+pAg+TUkBDepclPzwd4eVbRUmd3ClC7R00RiwNVTqiuA2jO
   ky57hp6S9uaZsobXJhAJYV9N8oR2LQbLoxNrpuwtTdF0BHBkVX0tm3ckH
   RzvfWqKurI8ZtoKaY3lgPMDy0gtxBqizYnAsheMwx8xq2Krl/ZtycQlku
   vfyllKVk3ce9OUo+8+xWKvLCQroOO73OGHRIC0gbnvjmtkh8S80019jOr
   g==;
X-CSE-ConnectionGUID: Nt2OFVz/Sb6dc3+LfniL9w==
X-CSE-MsgGUID: GRToNOPaTWuFDk4vUGyxyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="49459428"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; 
   d="scan'208";a="49459428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2025 23:30:32 -0700
X-CSE-ConnectionGUID: 5UqrsLXeRBy5pl2aI26tIg==
X-CSE-MsgGUID: rgtJlrxrRBiQoyCbAnvfZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; 
   d="scan'208";a="180238586"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.24])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2025 23:30:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 174E61204CA;
	Mon, 06 Oct 2025 09:30:29 +0300 (EEST)
Date: Mon, 6 Oct 2025 09:30:29 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: usbio: Add ACPI device-id for MTL-CVF devices
Message-ID: <aONiBUplpX6iV6cM@kekkonen.localdomain>
References: <20251001212416.4871-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001212416.4871-1-hansg@kernel.org>

Hi Hans,

Thank you for the patch.

On Wed, Oct 01, 2025 at 11:24:16PM +0200, Hans de Goede wrote:
> Add "INTC10D1" ACPI device-id for MTL-CVF devices, like the Dell Latitude
> 7450.
> 
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> ---
> Note this applies on top of the addition of the new gpio-usbio driver which
> is being merged through gregkh/usb.git usb-next
> ---
>  drivers/gpio/gpio-usbio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
> index e13c120824e3..34d42c743d5b 100644
> --- a/drivers/gpio/gpio-usbio.c
> +++ b/drivers/gpio/gpio-usbio.c
> @@ -29,6 +29,7 @@ static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
>  	{ "INTC1007" }, /* MTL */
>  	{ "INTC10B2" }, /* ARL */
>  	{ "INTC10B5" }, /* LNL */
> +	{ "INTC10D1" }, /* MTL-CVF */
>  	{ "INTC10E2" }, /* PTL */
>  	{ }
>  };

-- 
Kind regards,

Sakari Ailus

