Return-Path: <linux-gpio+bounces-15367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21005A2864B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8B4188874F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723FD22A1CA;
	Wed,  5 Feb 2025 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKcEAhgN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F87205E3C;
	Wed,  5 Feb 2025 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738746956; cv=none; b=Y/zH8I2QvVUGBZEx9qMYZPhm0tQRMUMikIvS5OZv00/DGvsG2yvagnEgzHPc64kBg0BJYRT4FWc6eEiZ2SKBqkpUr6Whpkstm/Ijko94u0sbTVhg/3OBPZaHH0hJapa4kxHJ5oJZ9Le/kgC8s7Hx9dse/k7zkVKgylrECG3NcWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738746956; c=relaxed/simple;
	bh=nmmWn6SkEF2ZFe23C4JsgDiF62pSRLhfA9VmwDQRdpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtFcgdyIvuo9keJU7k/klbKMWadJMQpG2g/e0X2Znz2dGBAeTeQlp68W8tbAk1rhU14kNk3wJv3ByxHo9IK+hRUxl1IMXUrNFnEzn1gWmw0fKsIaSZcAAw2SoZIhNC4fsmlC9B0JnhWQqwFKxBzou5LKDAUExR4g/csi4AySO1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKcEAhgN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738746955; x=1770282955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nmmWn6SkEF2ZFe23C4JsgDiF62pSRLhfA9VmwDQRdpM=;
  b=OKcEAhgNvdR2Go7hhT9n1zNAwE4mCqqChzO6X5d5fiZTEJSgn7S2zICy
   wxvYugNUtGgfKcfJCxKkFMsLdDyDvU5z+CqH9sG83/zdM68UMjdYSIkPY
   UpnoZrkP/XFIjVnke6hvM7QqY+O/zKZ1KNntllShEix2oTRcMYcW6Sl1J
   ovEM82hESd5WhIcl+mQrmY8YvzmlOD8ZWtCDB+zfOTe72ZzvYwiA3A4um
   bi8N2zauWUlfPh5CjLu7dd1XGd7pkg6hSfuvbmHhM4F2f5pD89NdUvUHc
   kgn+JUlOFkh7pOQCDfry1Cb+YdWkeu9wgrXTqxZVFuQv+dUQJ5smz3q++
   Q==;
X-CSE-ConnectionGUID: ksVVlm4eSsaXgYLD2BrzZQ==
X-CSE-MsgGUID: 8wpBDyvDRwC34EOnDK1caw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39003373"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39003373"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:15:54 -0800
X-CSE-ConnectionGUID: jSRyaZFTSdmsqQNm2+4tKw==
X-CSE-MsgGUID: OjiP+TL9TbGjpAku0FyU5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115817941"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:15:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfbVc-00000008R5k-1Dxs;
	Wed, 05 Feb 2025 11:15:48 +0200
Date: Wed, 5 Feb 2025 11:15:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 2/2] gpio: xilinx: Replace custom variants of
 bitmap_read()/bitmap_write()
Message-ID: <Z6MsQ7iFnhcugguR@smile.fi.intel.com>
References: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
 <20250204190218.243537-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204190218.243537-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 04, 2025 at 09:00:48PM +0200, Andy Shevchenko wrote:
> Relatively recently bitmap APIs were expanded by introduction of
> bitmap_read() and bitmap_write(). These APIs are generic ones
> that may replace custom functions in this driver, i.e. xgpio_get_value32()
> and xgpio_set_value32(). Do replace them.

...

> @@ -386,13 +371,14 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
>  	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
>  	int irq_offset = irqd_to_hwirq(irq_data);
>  	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
> +	unsigned long old_enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
>  	u32 mask = BIT(bit / 32), temp;
>  
>  	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
>  
>  	__clear_bit(bit, chip->enable);
>  
> -	if (xgpio_get_value32(chip->enable, bit) == 0) {
> +	if (old_enable == 0) {

Oh, this one is incorrect.

>  		/* Disable per channel interrupt */
>  		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
>  		temp &= ~mask;

-- 
With Best Regards,
Andy Shevchenko



