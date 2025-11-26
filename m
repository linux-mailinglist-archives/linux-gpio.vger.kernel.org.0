Return-Path: <linux-gpio+bounces-29110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02851C8B60E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 19:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2C993A8420
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 18:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E09C30C37E;
	Wed, 26 Nov 2025 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fdnrno60"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7252777FC;
	Wed, 26 Nov 2025 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180415; cv=none; b=HzqL/HGghL+T58j/xZsuCXRhx2Km0c6lVbb5kw60FIRG16jfUgw13Ha6xERIknAscsrMtIOjWVvjYob97E3f4wewXLA/y/u1X09nalO6hWyDsiUJQGz2rQtU1x9WLKjsni/2TiV+D+92QvRI5xkumd/5mtuw3C4PQv1kIGAOSdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180415; c=relaxed/simple;
	bh=Jj8WUTEqL7QvdCd8iQY3mdeC7Yp4r4T7oSOKPInFmKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfpisBH+WtfES03f0VlhAuVFR6KTbRJfRqJgXUxOiPG6cwmeuNxAFc36w6mqsJm9PyzG1S2Jc94vFS7yfHZR8pdlqG3BQvmsg7z/P28HlMvgR0HLAyhbY3xT+C10s2Iq++9vtL4zSOzvYC4ZS8jCedur/7VuvxpaQt7cwC68AmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fdnrno60; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764180413; x=1795716413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jj8WUTEqL7QvdCd8iQY3mdeC7Yp4r4T7oSOKPInFmKM=;
  b=Fdnrno60hLKaYtAhf3BlTzMfECzSXmj3jpIkCoNEw/d8NJguH7AdWDBt
   RrqBLm4u51dlmGDRQcigE+groDM1I2oJ6ZBDQJ78NhRXSn9/LyUmFpCuc
   SnxDeBqV0HLqtY06vGya4kRbx9SLPNgozi6HOCy14k5kJhb+3qnS0DXpz
   EWPP5lo6nusw8oaz8KNjw0xAg+gG0LlTakDCMmb7pOd4SFN/GDyK8tffu
   xdG6W9gPDz2mH8etCAkJTbEths+tgRnxZZ/kM75eRS+rat1mTvtpRi974
   BuYWKuphJPkQ0Ow+l+LkVS4m9FZ7Ft7mdg0HHMa7vO+LieebqZVsNrXza
   w==;
X-CSE-ConnectionGUID: VH9yggR0SOC1YnquhLZvTQ==
X-CSE-MsgGUID: sPgm37SFSniDj/f8vFj/5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76550451"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76550451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:06:52 -0800
X-CSE-ConnectionGUID: u6MYmWlrQDOKXyHhNm56hw==
X-CSE-MsgGUID: bArNWwrLSt685F6MVj/PFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193094093"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2025 10:06:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A0C9EA0; Wed, 26 Nov 2025 19:06:47 +0100 (CET)
Date: Wed, 26 Nov 2025 19:06:47 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lei Xue <lei.xue@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	yong.mao@mediatek.com, qingliang.li@mediatek.com,
	Fred-WY.Chen@mediatek.com, ot_cathy.xu@mediatek.com,
	ot_shunxi.zhang@mediatek.com, ot_yaoy.wang@mediatek.com,
	ot_ye.wang@mediatek.com
Subject: Re: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Message-ID: <aSdBt937C6Cjj_8s@black.igk.intel.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-2-lei.xue@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125023639.2416546-2-lei.xue@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 25, 2025 at 10:36:34AM +0800, Lei Xue wrote:
> Kernel GPIO subsystem mapping hardware pin number to a different
> range of gpio number. Add gpio-range structure to hold
> the mapped gpio range in pinctrl driver. That enables the kernel
> to search a range of mapped gpio range against a pinctrl device.

...

>  static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>  {
>  	struct gpio_chip *chip = &hw->chip;

>  	if (ret < 0)
>  		return ret;
>  
> +	mtk_pinctrl_gpio_range_init(hw, chip);
> +
>  	return 0;

We have a callback for that in struct gpio_chip. Any reason not to use it?

>  }

...

> +	pinctrl_add_gpio_range(hw->pctrl, &hw->range);

Not sure if this is needed.

-- 
With Best Regards,
Andy Shevchenko



