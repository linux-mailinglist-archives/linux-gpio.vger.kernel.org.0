Return-Path: <linux-gpio+bounces-9593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C5968BFD
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 18:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0231E1F23AE2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 16:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569111A264E;
	Mon,  2 Sep 2024 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnNZIEpA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713401428E8;
	Mon,  2 Sep 2024 16:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725294202; cv=none; b=n6NLNm4ujtIHRyyEUY0cDfcEoEcfwSyrlhRDOLl1kAmAM54q//ub5cz2z2DQ9sOb2cOdA2Nm6ZE44CCiisWlIr/kLljHzNnEqmqX4ALuThZiTFWYbkFRRK1jo2MsTaqM0x51AShfPqlSfTN1WhwwqUP/fOshInhQQSirbS/PmE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725294202; c=relaxed/simple;
	bh=iWjG1cl1/NbcO6McdD+EpN05BnbeFzm1Nzq3sNve3PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ippS+HfUch8iw6cHDUHQjimjLwjENavmeFp8DEYaAFGygrlsxCs27QYgAwm1VEoXWWPVAJq47JaBxvp42pqXJussGbGcpwyAoCbtO8Mbo15UeEdlFFtPPiDEK38hHHyoze7lY5eJwQtiMb9n82ogEO5XFRLUlX4QF09ku89DiDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnNZIEpA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725294200; x=1756830200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iWjG1cl1/NbcO6McdD+EpN05BnbeFzm1Nzq3sNve3PQ=;
  b=cnNZIEpAfL6zzpj6j3zVg7v+eM+ohVTwwHpceQKdd8n13tdvYoeI7Y1U
   nZkNDwZitDiy6QisOEF1/PFabxrkev9CrDaSSH6POZBWvI9EAEMf7iXSt
   spdLTPAm5BMlX70IIgz0c7x9wh17C3OhgjJAZWL1ejWizD8FiVniQaGMR
   Q/c8XtnFgHSheg75GuvQMGuSwWHQ3DbNCk9j2FErtl7GO7SEqbI2UiAFH
   MVgAULzldVuK6dOgOC64yrt/+glgxcqprjHiIgymzlM+7HfZqaoTJRCLN
   P2+1jNNiwFzBq1VEUSDD5KC5baOXYRMsz2JPZiDYQbqGGyBn+ZEWhvJEl
   g==;
X-CSE-ConnectionGUID: vxWCyQt1Q+eia4Q0k/eJZA==
X-CSE-MsgGUID: 4eM839EORnKwT0GH8NVrrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23837103"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="23837103"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 09:23:15 -0700
X-CSE-ConnectionGUID: zvKgTG9+RIad6YkYZwXvOg==
X-CSE-MsgGUID: GuuWyVE6Q0K54dw94AaafQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="69288930"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 09:23:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1sl9pf-00000004Qcq-3F0O;
	Mon, 02 Sep 2024 19:23:11 +0300
Date: Mon, 2 Sep 2024 19:23:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, kernel@collabora.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mpc8xxx: Add wake on GPIO support
Message-ID: <ZtXmb-z-KwCIO1R2@smile.fi.intel.com>
References: <20240820143328.1987442-1-martyn.welch@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820143328.1987442-1-martyn.welch@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Aug 20, 2024 at 03:33:27PM +0100, Martyn Welch wrote:
> The mpc8xxx GPIO can generate an interrupt on state change. This
> interrupt can be used to wake up the device from its sleep state if
> enabled to do so. Add required support to the driver so that the GPIO
> can be used in this way.
> 
> In order for the GPIO to actually function in this way, it is necessary
> to also set the GPIO bit in the RCPM. This can be done via the device
> tree fsl,rcpm-wakeup property.

Any specific requirement(s) to:
1) avoid new PM macros (such as pm_ptr());
2) use quite outdated PM callbacks?

-- 
With Best Regards,
Andy Shevchenko



