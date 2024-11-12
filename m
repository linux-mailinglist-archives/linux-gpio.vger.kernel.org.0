Return-Path: <linux-gpio+bounces-12860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C191E9C5511
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 11:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 882E028AA46
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 10:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B57F1CD20A;
	Tue, 12 Nov 2024 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cE529qV5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7323DAC18;
	Tue, 12 Nov 2024 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407888; cv=none; b=rlNJdkCe8b2RoHo6lS9DlCUVL3eVoIBucJgWDFlClXKFzm6fFrom3NoUVAoHOd+7lBD/Hcw0qhaYsftYeEKtcEhvTZU4qgWHwKscQwvaPOgZj8gAvc0qwW9Wb9fONgyVNBDgMb2jWAzzBKGv6J6O/s3mZJ0T1mwrwqdnsUZGHqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407888; c=relaxed/simple;
	bh=qF8JGdf/0mGdjzYO7DP7kHts4/WoQANssCTIjAVjDss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXyxClc0TdPo28Aayq26yoI7Coni5KnYXYYlWYFSI2pYP8lZeE+JKc83LDDQXkTbefjiToE6MKIT9KLNf0HiWfXqlinNc0l8J35kvYFMQNwbqga5UbUS4F+2c8SG82gJx7nATRmoF/0jT3UtnKdj8wza4OiI+3FlVrWuBH5ETE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cE529qV5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731407887; x=1762943887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qF8JGdf/0mGdjzYO7DP7kHts4/WoQANssCTIjAVjDss=;
  b=cE529qV5i7iQAcdAsEhbuzZ9lAL2Wk1X+rhplr+FVoDrpJaFBhCnNmkd
   O7hrXBvAvpo0/ibyZIcGXz+GnxYFX9p5qnjDsANAd6KqMYDxzj1kVUhQI
   zeK9zFZwkvY4/5Z0o5qp9Uv00dodOqkc/6PJ7yOtL1R00ZMo3vQ7iOe8P
   nzxcX6FDIOVAiUDWbEojg/+yO6UYLVUAEnj+zoi1sWxN+W84MjXqhxPzt
   ot0sljSL16N7kWEtPngqI1VcHyi5TCzqr6cNMZEN75Nqp5WyAns2LaDrj
   sGyJFLy8RLLDXnBTO2FqNS82nKcSRMt0vyj9kDbR9T5OXtwWgGEJpbJjO
   g==;
X-CSE-ConnectionGUID: o159H8hATGGR04/qlGJgZw==
X-CSE-MsgGUID: Y/Jbt6HZQ/G6Fj+4C/gOeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31330498"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="31330498"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:38:06 -0800
X-CSE-ConnectionGUID: 77uiAGmWTViu8lVPjZb/aQ==
X-CSE-MsgGUID: qBYZYSd5RK6zlTAA1PN46A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87343607"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:38:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAoHX-0000000DwKd-44wz;
	Tue, 12 Nov 2024 12:37:59 +0200
Date: Tue, 12 Nov 2024 12:37:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v5 2/4] gpio: rockchip: change the GPIO version judgment
 logic
Message-ID: <ZzMwB8UQUR6BYAzI@smile.fi.intel.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-3-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112015408.3139996-3-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 12, 2024 at 09:54:06AM +0800, Ye Zhang wrote:
> Have a list of valid IDs and default to -ENODEV.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



