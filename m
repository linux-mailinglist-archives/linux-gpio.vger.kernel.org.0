Return-Path: <linux-gpio+bounces-19039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82DA92441
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 19:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D8C63B2063
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 17:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AA62561D7;
	Thu, 17 Apr 2025 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL20jg/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5361D07BA;
	Thu, 17 Apr 2025 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744911804; cv=none; b=tbFt6YR+KIejqa7e1csPItUThyNyBZRmWRyUCtZUfS0SaZ8FQLKtab3L/PmZPXR0oozInIwsauN9WQQQBepgE+PhnIO9ziqn4DvLPKhQQE73sEkkxg6BZqR+oXP3A5vluy8HDmpgV56Q6De9YzxjJcWTOV4yqT/GfHVMZK11qVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744911804; c=relaxed/simple;
	bh=HOU9D8Tr1wyG17PxZF00nccoqnffa7pCB2iwguhoNFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrfeayMJ/paHUJuipVY1vBs13NV/kIvQ1yXXlKnLh+hXFIkY/LBo9N4l+7XNDDsdgea6mP9E+kt8t9kb4X7zWgZImz6KVQ7VMYYmUUb5zw3HE1i9ros527/6vNFseLIf7cplfqtr8vWh4IRH1mQREE101dFXMXw0zo89kKXM3xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL20jg/f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744911803; x=1776447803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HOU9D8Tr1wyG17PxZF00nccoqnffa7pCB2iwguhoNFE=;
  b=TL20jg/fpFVmGsH7l6y3D/kuZSHxaksgeQA041L2JFy54eZEqAKqVeFr
   jlpTqgna9UGhez86lWomOIMKw7FSNbK1Nzs0OlqeEEGTfEoTywvmDSNxw
   cvYjKllvmEugDnzJ7/nMoDIZGVOfGiXWaYfk3nNiuWIkVoveMu5gu+FEg
   JK429Uam4vF0KebQm8xHmVXEPxYTMbxFeOTBgZTUonmaB+YSGm8g7JD8U
   97f1q9IvoP3bD6pXVcw4BrG7/VAOVpgayngCPUn01NzEIcFEm+KqqSAGf
   RoNlO4CN49PKzZc6E8XOYAZOG0ZVLmi/hZyZgIiBMHijWiRvq032WiCrt
   A==;
X-CSE-ConnectionGUID: OvJNB0NORWyN0BcxnyieQA==
X-CSE-MsgGUID: Z1pZYe/vSuu8KoD6JQ6mnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46443131"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46443131"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:43:22 -0700
X-CSE-ConnectionGUID: PZlmb22xQsGH3hLx3udUdA==
X-CSE-MsgGUID: OpKaz/nCT0e1Njp6rPAyRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130894124"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:43:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5TGd-0000000DGpd-3vEW;
	Thu, 17 Apr 2025 20:43:15 +0300
Date: Thu, 17 Apr 2025 20:43:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 09/10] gpio: aggregator: add possibility to attach
 data to the forwarder
Message-ID: <aAE9s6BDjKYoATxs@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-9-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-9-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:17PM +0200, Thomas Richard wrote:
> Add a data pointer to store private data in the forwarder.

...

> -int gpio_fwd_register(struct gpiochip_fwd *fwd)
> +int gpio_fwd_register(struct gpiochip_fwd *fwd, void *data)

Since it comes from outside there is no need to have a getter at all.
No? Currently I don't understand how this change is used.

-- 
With Best Regards,
Andy Shevchenko



