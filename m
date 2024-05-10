Return-Path: <linux-gpio+bounces-6308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C95748C295B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 19:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56152B2572C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 17:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2ED18037;
	Fri, 10 May 2024 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NACpKPyJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3EC944F
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715362439; cv=none; b=FEq4ToJvgEci8GPd1dm4zBGVlbqInrwTIQe2l9H0I2K4ECsEe2rZEjkHVsOis21MuD1IRWguQKvICtPAvShhALipsFSDV5ttak75XVn+yqb85an6nmXdCeb3Bs9Aq/ZmklRrArCHRNJtFaGiCULaceFXgaIQBle37PLlIOKKHME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715362439; c=relaxed/simple;
	bh=Jq7xsdUfMnsvmYHMCKVrq/wuboi3tK3rUO4hMEN9etg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U6A7kXMyOPvuQDJWjAYp0qNvyzWRApJ+SouY8HUSeW/R/Hr9LKASynJAdkX3tTJkQnRmnkN7D8PK58p/mY46qKlrbXDGLwbwXFWCdHpNxtArSCZqk0bxgzN9hKGPftJ2x2sECgDHcF7Atmzfasi5zazVoW1LNvYZvieQHJN4sF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NACpKPyJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715362437; x=1746898437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jq7xsdUfMnsvmYHMCKVrq/wuboi3tK3rUO4hMEN9etg=;
  b=NACpKPyJjxXwuBaC5JsIP7F5SEm48hn9PCMo1xm/+CdhNsd2LzUrKDWA
   GBDjr/nWXIc3mTY+fiareYdfTaq4qQSoWhBx3LjXvB4Y+KgL01/hxMxeC
   fvMnS2r9e1ow3SU3DxiXgTA2kxmDbCuu4bXmPtZqhzA2XSUmQjLVWe6YX
   7U/Psa4+8c52/ElBxq2WzaGWTanF4BIZqHD7g2Dc63eM70Xi+A2BYApen
   Hv5Ju6Wcq2AlJAaW5Pz6DIybXQaGkRZMdKaFPWNVo0UBoeAD4p9gx9GoW
   TezjSYasJpEPQfEU69m+Em0jEskW/BkeadFNbCGWmgaPbFo15cM9+CzPP
   g==;
X-CSE-ConnectionGUID: CGF/0lJEQle9W+oSJTTZ/A==
X-CSE-MsgGUID: Fx7t78pYSpSM0Mwa1FFtwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11217984"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11217984"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 10:33:57 -0700
X-CSE-ConnectionGUID: jFQo0lSoTL+4bNQytwrUVg==
X-CSE-MsgGUID: a/qckUoQSrWQP+bsdGpT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34330224"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 10:33:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1s5U81-00000006CDy-0nku;
	Fri, 10 May 2024 20:33:53 +0300
Date: Fri, 10 May 2024 20:33:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	William Breathitt Gray <william.gray@linaro.org>
Subject: GPIO drivers under drivers/char/
Message-ID: <Zj5agJGxhpyO4zp-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi!

Due to patch bomb from Jens, I noticed that we have two interesting drivers
(and a common library) under drivers/char/. Shouldn't we move them to
drivers/gpio/ to keep an eye on that (with the respective update of MAINTAINERS
if needed)? Also William might say something about this since those are old ISA
(?) related ones and (perhaps?) might utilise PC-104 code.

-- 
With Best Regards,
Andy Shevchenko



