Return-Path: <linux-gpio+bounces-9652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA6969FFE
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41357286B65
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE7851C3E;
	Tue,  3 Sep 2024 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNtvufxs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359003612D;
	Tue,  3 Sep 2024 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725372587; cv=none; b=ELbUE38uw+9m/N09fFBnr44zNGJY3CCz5PIEC1Z2hlzC0GSK2QeE2ZVGBzHbWyfaVUYIwCqHtdU79bMI6Q7o4VokhtCbHgsIxjSVrSe/Pb9rTncKuOHB5fHM5mIFNGsiSCl2nDlSN0TIBHNwMMw8K724fK+Qgw7iTSypqg6O7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725372587; c=relaxed/simple;
	bh=Iw2rgePYRDy4YBtyAyf1f9zbxTadJot1mk68x/JI+TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/qn1cpjAd44d/jZO2mZzVEnjVnpxyTTbSj3Cx7CZH2gYZ0jH9fptW2+iSPCM3qNhD1pDD6JiRcpU7R0S6rfnDCsqaFw6PscF1G001kOIKnFtCxGm6hYGMNHhzvNofcnGdlVZjVxWoqBpqTyrjwrFrMEpXPIXj6ul1oDqY0mJsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNtvufxs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725372586; x=1756908586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iw2rgePYRDy4YBtyAyf1f9zbxTadJot1mk68x/JI+TY=;
  b=YNtvufxsBnyVl6rZ1S5Ng1adJ9scHJadqKWElpLCa2/IRYe84c8E01rG
   frlyXmJL5SbZ8WS3wBda3FTNYdt17oJqKvilHi1X3WS4ZN9+/ZfhEsGwT
   ZHjEVlNg/pN1B4GT66zpGLG7b5bfGDtIJHmHJQRlQPE/dKr7XEUAzamwj
   q4U/iFOrjAxZor+xFsTjpsMepTbrzfpx1md1077AwFFiD/esxPefhJBhR
   lGMJQ3pBQPqIjQGcn8N06t7wTIqJ075nGxq+QeXmeIa8RVzCnsXdJ6w8a
   LKFoXZT6KpbTs0aJarZq/MKwBFWjkkP6NO1kQba0tWpDDZ7IoRN52LN5J
   A==;
X-CSE-ConnectionGUID: biOIzXnXTQOhe2Xnkz5vTQ==
X-CSE-MsgGUID: 62l2gzg8QTy1fKPk4doPDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27764768"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="27764768"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:09:22 -0700
X-CSE-ConnectionGUID: yjq5AXFSSOup/jIPLhTPHA==
X-CSE-MsgGUID: FuWGoJ8HRxOgvDqTVCPhCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="69067334"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:09:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slUDf-00000004jIN-0b4M;
	Tue, 03 Sep 2024 17:09:19 +0300
Date: Tue, 3 Sep 2024 17:09:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Inline
 intel_gpio_community_irq_handler()
Message-ID: <ZtcYjsy5vu81eQPu@smile.fi.intel.com>
References: <20240902141441.2683122-1-andriy.shevchenko@linux.intel.com>
 <20240903045457.GX1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903045457.GX1532424@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 07:54:57AM +0300, Mika Westerberg wrote:
> On Mon, Sep 02, 2024 at 05:14:41PM +0300, Andy Shevchenko wrote:
> > Since we have for_each_intel_pad_group() helper, there is
> > no advantage of having intel_gpio_community_irq_handler().
> > Inline it into intel_gpio_irq().
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



