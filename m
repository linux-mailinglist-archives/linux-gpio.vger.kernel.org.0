Return-Path: <linux-gpio+bounces-10565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED698A0E2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6C71F2820D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 11:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395EA18DF86;
	Mon, 30 Sep 2024 11:32:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147E18990E;
	Mon, 30 Sep 2024 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695947; cv=none; b=GfjeFlVOrUd5AGoUbe0CHjbf7XtxUzL2X55QeSfq58hEiKQhrDnEYnGkKUywDGc6gL8ekO3CswoGphL8M43Pb0lNiekp1YfbkL6hb6oulnXmgxy53X/ZFvi01oLyBC7aCuklidKmsFjNuRirW1yfpfGnG4DQmeIzMJF386a5gSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695947; c=relaxed/simple;
	bh=p0h2sCKgHSz3HeUQr8l9+fFxazSCWnnD4+7CyFPxJrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWaSAYBllBQhTlYrEmZZKwy4a0bYNk7AgdDQoYxEYoSHjZ9QVmj/nNc+oIK7k1H0OcbC78Permhj6a0zHfcvuH6gm4hpD/KOIV0Vgud1HEjRi6BDu9yN0ghv5/67m9U0u5/v9LAOnGRp1x0FoU9AM4vkekg45tHHAbwHtPdgaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: JD5CK3IzRQCNkahHVvl6aw==
X-CSE-MsgGUID: p9NclR1CTyaNfZ9QsW0EQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44296859"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="44296859"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 04:32:24 -0700
X-CSE-ConnectionGUID: JLbBAJ8cS3S91nDWpYyFxQ==
X-CSE-MsgGUID: m6ogHc4RRLe1dhd+xVt0qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="77353591"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 04:32:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1svEdX-0000000EdlD-2Uoa;
	Mon, 30 Sep 2024 14:32:19 +0300
Date: Mon, 30 Sep 2024 14:32:19 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: intel: platform: fix error path in
 device_for_each_child_node()
Message-ID: <ZvqMQ1O5BAmGPMxS@smile.fi.intel.com>
References: <20240926-intel-pinctrl-platform-scoped-v1-0-5ee4c936eea3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926-intel-pinctrl-platform-scoped-v1-0-5ee4c936eea3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 26, 2024 at 04:11:01PM +0200, Javier Carrasco wrote:
> This series fixes an error path where the reference of a child node is
> not decremented upon early return. When at it, a trivial comma/semicolon
> substitution I found by chance has been added to improve code clarity.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (2):
>       pinctrl: intel: platform: fix error path in device_for_each_child_node()
>       pinctrl: intel: platform: use semicolon instead of comma in ncommunities assignment
> 
>  drivers/pinctrl/intel/pinctrl-intel-platform.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> ---
> base-commit: 92fc9636d1471b7f68bfee70c776f7f77e747b97

Try hard to avoid basing your commits on Linux Next. This is a specific
subsystem and you can just use Intel pinctrl tree for that.

No need to resend this time, I fixed the issue manually.

-- 
With Best Regards,
Andy Shevchenko



