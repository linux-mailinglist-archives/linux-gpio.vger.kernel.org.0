Return-Path: <linux-gpio+bounces-2979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E15849C31
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 14:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57F131F229D6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 13:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF8C20DCB;
	Mon,  5 Feb 2024 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLoGcfIV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F79249F7
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707140932; cv=none; b=hXvAREaC7o8NUO0wTxQWuGa8oLBoIXUnXZ4M/Vy1shLqmZP7mwz0+ZlPORbfP49/zNHwQTp+PvjluY0ruimTZ6PRmy07rnozWPwDVHPCJeCHfqcAl7HRWDlCwMA87dXAIXr+9yxynmbywWGJofkTvsJZABMxZ45hR2IhyNOO/9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707140932; c=relaxed/simple;
	bh=GwUtIvzUy7tYnJaqvRubatFhqM+f855E9qpfns6yQpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6EuhsJI4V9b5ppIzGDb8wBsiGLALpAo3sSQ9PLyOPO5fCk69wlEI1qvdV5QCgFFVGfuBM/Y0pien1aPkJ337VXwoAWySuI65780gnSUTvFI5f8f8cLqpJBfmUyz/cW7SBipEy0ukC5K7yTfKuRwisY05/pSncFufqr11QGqQLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLoGcfIV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707140931; x=1738676931;
  h=resent-from:resent-date:resent-message-id:resent-to:date:
   from:to:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=GwUtIvzUy7tYnJaqvRubatFhqM+f855E9qpfns6yQpw=;
  b=HLoGcfIVeaKVzwWiOX9ePjiwwnFjh+JL+UF89O16MyN+3mq0q+I1Nrha
   67vNTS6kB/KqESxadAuxq8y2oMSSUtuG79xBeKZbDhQycqek9LqUxeSpv
   Yk15rQ+oXzdyEayukDc+sk0GbxXcM+BkJifE24xgcnaHuixP8Pg+HpIPm
   +4QJKLndjcb0V/zYtAdQJ9wzgZst2srST6+b/dA9ZtP51NVsRbtAqzNeF
   erlas7LDbvlmOd/UpSJoIPgRbRrUPhkQPX6/j81RFjWr8DE1QgwGQ1VDK
   NO+XgX8epRcAD/hhlq0BpOekOPS6zBEIGRg3hiAnKJrMbLy5wjm3ANZIp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="430925"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="430925"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 05:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="909300463"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="909300463"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 05:48:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rWzL4-000000025pV-1263;
	Mon, 05 Feb 2024 15:48:46 +0200
Resent-From: Andy Shevchenko <andriy.shevchenko@intel.com>
Resent-Date: Mon, 5 Feb 2024 15:48:45 +0200
Resent-Message-ID: <ZcDnPSGDwS5t9L8W@smile.fi.intel.com>
Resent-To: brgl@bgdev.pl, linux-gpio@vger.kernel.org
Date: Mon, 5 Feb 2024 14:16:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 06/23] gpio: add SRCU infrastructure to struct
 gpio_desc
Message-ID: <ZcDRuRCT9xE48cYi@smile.fi.intel.com>
References: <20240205093418.39755-1-brgl@bgdev.pl>
 <20240205093418.39755-7-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205093418.39755-7-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 05, 2024 at 10:34:01AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the GPIO descriptor with an SRCU structure in order to serialize
> the access to the label. Initialize and clean it up where applicable.

...

> +	for (i = 0; i < gdev->ngpio; i++)
> +		cleanup_srcu_struct(&gdev->descs[i].srcu);

for_each_gpio_desc()?

(It might be that the latter should be reworked a bit first, dunno)

...

> +			for (j = 0; j < i; j++)
> +				cleanup_srcu_struct(&desc->srcu);

What does this loop mean?

> +			goto err_remove_of_chip;
> +		}

...

> +err_cleanup_desc_srcu:
> +	for (i = 0; i < gdev->ngpio; i++)
> +		cleanup_srcu_struct(&gdev->descs[i].srcu);

As per above (use existing for_each macro),

...

> +	struct srcu_struct	srcu;
>  };

I am wondering if moving it to the top of the struct will give a more
performant code.

-- 
With Best Regards,
Andy Shevchenko



