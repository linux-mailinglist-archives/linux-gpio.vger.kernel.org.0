Return-Path: <linux-gpio+bounces-17492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA4A5DAFD
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 12:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9081D3B78E8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 11:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324A723C8A0;
	Wed, 12 Mar 2025 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AW58oiWE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9860B79C2;
	Wed, 12 Mar 2025 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741777242; cv=none; b=sZH3Z/RU+keX+RCqU3yJsUZe+YuPE4hBehVNvt83Dcf5FN8D6Adu8Hx/l9ctBPeughCfi2qPFLr52mPIrU/MpbIqO+ahs1buLE+Vi9gbUXDl3ZE66yyb3X+AIUvN70fK985C0eT0yU1ItwcdYaGgiFmj6u1wbYv2uh1txVslOXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741777242; c=relaxed/simple;
	bh=ww6KYxwFmPNgh5epbKVMsZNlArQLX5tZ9ZkYOcMUtaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOFpPk/VSsBmXmxFiV/SrUPr/vfPmRgk5fg8vH3on+XBApg78AE/jvxAFuxRbvKH4M0/HDW6ki9+ycWfVmRcBD8TNZ6248D+cxQe7EaSMrIItArv8TKuac5JEHv/mFCLP60EaPqNb3BR+UetD70e0zMc+KFMZaBxPL7cBX3kssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AW58oiWE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741777240; x=1773313240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ww6KYxwFmPNgh5epbKVMsZNlArQLX5tZ9ZkYOcMUtaQ=;
  b=AW58oiWE5iaE8wRLWcZEu1VTyg1f40mrLG9ESEzcSF/CkiNbr4a2BGPj
   1eBrAHo8VeWUX67fOy+/utWy+LBh6+4WBl2mFB6m2FKeuxSm3SG2Is2qS
   298gldlfBkWh9+Trh4Ky4pPpt7D/on6z+ImsvC55/uz+NzabXdsWgui5k
   TKSSivTEA+v1zfu0pfgFGpE6yPdGQwsMvCeXtc6TToXTVAol6n+09xFWs
   AdseNvdMfcRz5gM9moVaS/Gr4X2sq9+yAuCMJcbliutWfiegCMjvS0yl4
   U8/Gj009JJ09QslirmweSK/f2Vp9O0cuTEN+8UaHI2KVe86L2csbwuqRf
   A==;
X-CSE-ConnectionGUID: 0yaSJzfCSn6t3h8hdYN0Qg==
X-CSE-MsgGUID: m85h5fmfR8ujMYlZ4kA05Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="43053581"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="43053581"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:00:40 -0700
X-CSE-ConnectionGUID: XOdJPwgETFqW1VHH6fmeCw==
X-CSE-MsgGUID: X5qBw6dDTw6fhERcVzuntg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125243323"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:00:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsJpD-00000001q30-34y3;
	Wed, 12 Mar 2025 13:00:35 +0200
Date: Wed, 12 Mar 2025 13:00:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z9FpU0Ik_4yCU9XB@smile.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-3-raag.jadav@intel.com>
 <Z8_aJqNKK9AgBnK8@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8_aJqNKK9AgBnK8@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 11, 2025 at 08:37:26AM +0200, Raag Jadav wrote:
> On Fri, Mar 07, 2025 at 10:52:28AM +0530, Raag Jadav wrote:
> > Now that we have Intel MFD driver for PSE GPIO, depend on it.

> Andy, any guidance on GPIO?

I'm not sure what we are waiting here from me. Hadn't I reviewed your GPIO
part already?

-- 
With Best Regards,
Andy Shevchenko



