Return-Path: <linux-gpio+bounces-29234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 018CACA053E
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 18:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF7BD316EF64
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 17:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D903A1CE3;
	Wed,  3 Dec 2025 16:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4EfOPyJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8543A1CE5;
	Wed,  3 Dec 2025 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781095; cv=none; b=NvndLQnP0LTypbikRgd7ucVrEGoiqrJlw6DwrWVLrNfWrr2ll91f/nl38f3FnuhCtt/xURUOlFIwbSfAxX51otBomPfM1tgprLqKUnnYEF34yYfYzKf1jVFpkPqi0IPO9Sb1/XChYidEpHflaHZf/bGAyNKsUB9U4PboASwIdZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781095; c=relaxed/simple;
	bh=BKBmICu+aoF5QSf9WzxXEkCdJD7gvJb6hcltDbFFiZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXj46Gp15xZVzowHWGCP4T7oGVM9K79JzqtxNgWEksRZAFGWQwiFOhqYobZd76vc6j6Pv8TvbMQFCjqaR9sVHY9ecKB0hfxZq50h1ZXVokyPD9It4JYjCK5MmlUzSbqlkZ4PKY9qm+MlBk6U4u/0MC2/lOpVHHDhIlm5gMaKoAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4EfOPyJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764781093; x=1796317093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BKBmICu+aoF5QSf9WzxXEkCdJD7gvJb6hcltDbFFiZw=;
  b=D4EfOPyJkywhKrHp+RVL1DqsgCfrGjXF4S06pp0rqQlDFQ605hgBPF/G
   VMMEHpoTrNYWPByA7Cz7Li2A3bLEQ1RRRb2gj4uRh/INltGbbn46zPotY
   TxVEU3eP/9iUKE+IvBYPosfOUq7P20Wk6SpztIWWdsQxfxZ8YtvZV+CJN
   4KW67cg/6J7/iTLXk6q5M+kNKukRt1RsiHTIGD2paZ9ZtIlPfaE4Cf/a8
   GbfqPCDznJHt0g1tj7RkQhnyC5id8lqx9yCG0eEXcGOz7pllUaNFOrkf/
   PeAb7fwdLkaAcwOPFrF7dJXyzoJwbILLEMEwB+eSpTUxINxMUpkFuahvz
   w==;
X-CSE-ConnectionGUID: W+WlqAg2T1eyZMxVCXO1UQ==
X-CSE-MsgGUID: iFKB1Vz8RHWASEJKQf7PNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77463158"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="77463158"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 08:58:11 -0800
X-CSE-ConnectionGUID: mo53Gx0+QJeXIIDNsjiKGw==
X-CSE-MsgGUID: 0FON3fS7SZGFhkgIe07W5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="195542453"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 08:58:09 -0800
Date: Wed, 3 Dec 2025 18:58:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: brgl <brgl@kernel.org>,
	"mathieu.dubois-briand" <mathieu.dubois-briand@bootlin.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	=?utf-8?B?5Y2g5L+K?= <zhanjun@uniontech.com>,
	=?utf-8?B?6IGC6K+a?= <niecheng1@uniontech.com>,
	stable <stable@vger.kernel.org>,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: Re: [PATCH v2] gpio: regmap: Fix memleak in gpio_remap_register
Message-ID: <aTBsHvvpw-avP93a@smile.fi.intel.com>
References: <20251203141557.2652348-1-guanwentao@uniontech.com>
 <aTBOSfH9KyI0epZB@smile.fi.intel.com>
 <tencent_7AA5492F0C3086555B6EF720@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_7AA5492F0C3086555B6EF720@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Dec 03, 2025 at 11:12:39PM +0800, Wentao Guan wrote:
> Hello Andy:
> 
> I did not found ae495810cffe ,thought it is that:
> Fixes: 00aaae60faf5 ("gpio: regmap: add the .fixed_direction_output configuration parameter"),


> I will add it to v3.

No, please don't. This is wrong.

$ git tag --contains ae495810cffe
next-20251022
...

$ git branch -a --contains ae495810cffe | grep gpio
  remotes/brgl/gpio/for-current
  remotes/brgl/gpio/for-next

So it will be part of v6.19-rc1, which means your patch should be based
on that three.

-- 
With Best Regards,
Andy Shevchenko



