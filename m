Return-Path: <linux-gpio+bounces-13818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 748259EE8EE
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 15:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13459188B37A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 14:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B300E21506B;
	Thu, 12 Dec 2024 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXyZe+Pa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635A8837;
	Thu, 12 Dec 2024 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734013987; cv=none; b=HFcDShlA2ksEOgoXx/qZyiX6oU1ReOW9fg8vOlCsz9xjr24W1QBl4Iay5KXkgTz8+MeWXGIgFE7sUdFXcPLnaQru2wM2HqTNd7yY/aM8AnpUdKY9CzMJ6FZE36R4ifceiZx0RYGOX4CfnSSoaRl/1DV307DF6hjHOy7gb0KpqJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734013987; c=relaxed/simple;
	bh=d8IYpiVfpeymjC/aJgakUmWE7prVO4zr6IEzNLCH2J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m44BR3TgigPGyUruVERdturtUOHpbgpRGi128YcVs2ctZKgw4GU1iffYAkSoS+XCfDvkIFMEjzLY8eK50iP0Keyl9w1i7IfeeV0xi6hEc68fLZF9IYbQXtWkGqSq2j/y2nK/TXEcgXyz99r9nr6gDuGYV07NiSRA8pOOac9bZxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXyZe+Pa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734013986; x=1765549986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=d8IYpiVfpeymjC/aJgakUmWE7prVO4zr6IEzNLCH2J4=;
  b=bXyZe+PaMGbrGITAwdMnuIzyx/H0HqlvAewatnZHDSB+LnBV0EEeR/IO
   5c35THQwVEplsWBo2FOy5YQeIq9RWetg+a1fukzkT/P53sHlKkrQdI2uR
   JpJj+hSWhHynqWjdIK0TEXIfQhNajsKxUE/IRUXKOcQq1VE42e0O2npfL
   tFfvkrizpHZ4BCOjOrooOZLs5IWSedw3xXzUi26QrZ4dCCaXD9/7c9RNS
   lmp2OzbBqTMEbEN4WcWBdCvb+hND1+8EBvbqUhmXltWhWZwbe83M8+r1H
   bokwaeXZa21Ti+6KkZPHLaflBkYkK2z1/K/81klVikhaUAm1kOGapdu8p
   A==;
X-CSE-ConnectionGUID: rW3FKeuRRvOuYCawWyUtfA==
X-CSE-MsgGUID: zHA8f+plQruUT1BWqy0xpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45113452"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="45113452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:32:56 -0800
X-CSE-ConnectionGUID: mSB4RwXeQgCxf9FsOJVn/g==
X-CSE-MsgGUID: +PkYQM5aRdq23a7grLhiqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="96786531"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:32:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tLkFE-00000006vHG-28xo;
	Thu, 12 Dec 2024 16:32:48 +0200
Date: Thu, 12 Dec 2024 16:32:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, Linus Walleij <linus.walleij@linaro.org>,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z1r0EPC9gumruFKU@smile.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
 <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
 <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 07, 2024 at 04:46:18PM +0200, Raag Jadav wrote:
> On Fri, Nov 29, 2024 at 04:20:14PM +0200, Andy Shevchenko wrote:
> > On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> > > On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> > > 
> > > > This series introduces a more robust and cleaner devm_kmemdup_array()
> > > > helper and uses it across drivers.
> > > 
> > > For the series:
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > 
> > > It seems like Andy will push it to me which is excellent.
> > 
> > Yep, that's the plan after we get all necessary ACKs.
> 
> Greg, anything I can do to move this forward?

Greg, is it possible to give your Ack or comment or guidance of the preferences
with the first patch?

-- 
With Best Regards,
Andy Shevchenko



