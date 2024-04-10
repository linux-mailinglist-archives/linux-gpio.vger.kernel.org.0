Return-Path: <linux-gpio+bounces-5315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A78A0109
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 22:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED7831C21D49
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 20:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047B5181B8F;
	Wed, 10 Apr 2024 20:08:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72072180A94;
	Wed, 10 Apr 2024 20:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712779687; cv=none; b=jsaRvnf72LToY6fZDsTfmNdUelwOcO/XSAoAH0tqHv3xcLceyDhRYP8EwHxC7ztV8hYRkt2AfK/LXMxxNjsfZNQIG5oXGQiZErGBFth96tLklk2a9eFR3FqR/GNPikBVSJjY4cKlVNBm/XTbkHkA6Bovr+QHqSEQxlpNdSBpmw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712779687; c=relaxed/simple;
	bh=K9GW6xct7gP1TE5/1L/rBOXnHRy1J2TWUdvEWiPrgGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCgF//yxEUis+2UifQIIZQuh0Qwbp5SVCnbll7UzpFD9R0EUd1aGFmS779UQMinyFqLO0xwhqBlbyJYvvBMHGrRwuzL4I6iAf2uGabmAEK9gc+PvW35PKs1SNPEidpjC7FmCvBU/SCpCOg3De2iaqBvyd6zJOUFCDXZlaSRXwTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 823ccMQ0QW+DVJsc5DGFRw==
X-CSE-MsgGUID: OFr/1U7NTT6TffG5mYs5Gg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8024519"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8024519"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 13:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915441900"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="915441900"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 13:08:03 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rueEj-00000003B6r-15Yj;
	Wed, 10 Apr 2024 23:08:01 +0300
Date: Wed, 10 Apr 2024 23:08:01 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: Re: [PATCH v3 6/6] mmc: sdhci-acpi: Add quirk to enable pull-up on
 the card-detect GPIO on Asus T100TA
Message-ID: <ZhbxoVrE_fWoXwGC@smile.fi.intel.com>
References: <20240410191639.526324-1-hdegoede@redhat.com>
 <20240410191639.526324-7-hdegoede@redhat.com>
 <ZhbxNdf0mGB4zbzA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhbxNdf0mGB4zbzA@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 10, 2024 at 11:06:13PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 10, 2024 at 09:16:39PM +0200, Hans de Goede wrote:

...

> > +			mmc_gpiod_set_cd_config(host->mmc,
> > +						PIN_CONF_PACKED(PIN_CONFIG_BIAS_PULL_UP, 20000));
> 
> Just noticed, the PIN_CONF_PACKED() is a helper for pinconf-generic.h. It seems
> unusual to use it directly, and AFAIU documentation, it's for static
> initialisations, however it's not explicitly said.

I stand corrected, it's said just in the comment on top of the macro
definition, while I admit there is also 'etc.' whatever it means.

> Hence, I suggest to use pinconf_to_config_packed() as others do for
> the run-time code.

-- 
With Best Regards,
Andy Shevchenko



