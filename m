Return-Path: <linux-gpio+bounces-12815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9FD9C3B49
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 10:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4E11C21072
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 09:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7651E1779BB;
	Mon, 11 Nov 2024 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwlsqB/B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A4F156C6F;
	Mon, 11 Nov 2024 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318419; cv=none; b=G0XJ7CMKI7JdOviITOqS7d27IpbbNaqVdHP0/eb6EO88jysbh7plC8ZEimInxQukM+aWEPQqOr8jIwbJH6nAm6GafXejnID3RvwAN+7uFKKXnM+2W8XnXhYUkICIOCOHX7dYoUThE+s+J4fqnlxWekDo+jZwbQSRbk/CMhFxq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318419; c=relaxed/simple;
	bh=tWMIM6L6n/2GE8nZCCMK37Kf4CStm+u//iiEsM6/VpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFwDf0Edfxa+DjqGrdN0bjC/5xX/mcxfCyszHmpjGKW4Lykgq0Mp28FhiH+4YpX/eRTzPXh0q2OJsVh4nJ1hRWjOakm00hnk8Trjv/3EIfUSalVkps5bBqn/dEsgG98NGIjKjrtRakfJVcZZIrLjzocCclcEEfQ3hgpIQnNaolg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwlsqB/B; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731318417; x=1762854417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tWMIM6L6n/2GE8nZCCMK37Kf4CStm+u//iiEsM6/VpU=;
  b=CwlsqB/BII6ba4lULKBllfRzJyhlI2dG3hQRr/0blthTfCVn6LTTcuhX
   fmhWp5NKJL3OFPpBtHFCT2qe40VwJ5WwG5mLgYvIWRQoynwh5qpZxLShA
   vCuRmKiAFAWFJlFfoP/o76a9hBx64KCbcnZbleEMzgZrJS55lG1Zc3RAv
   XROS+hO4Wq1OB35P2wc7j+9WGBMYHUQafk2reSjTvYshrFyMCF2vtIjzr
   3SnH/lC2wBXVOhYNW+X+tFwrS78bNnGlJiGLG5oIBvO1JmUNfmYIxruet
   s9+D+TAFj8j3WuVnxuM5x33FYfDDRfbkpkqW5CCiTElKNg+y5yYfgO6l+
   w==;
X-CSE-ConnectionGUID: 5Ac6J4zbSFKGZX9oxgUItw==
X-CSE-MsgGUID: Xg+AVdbUQcutYo07900oow==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="33980010"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="33980010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:46:57 -0800
X-CSE-ConnectionGUID: MNzfa4EfQpaCk0tgmnhcXQ==
X-CSE-MsgGUID: nywjpN4iQPyfmRFzaRoFCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86997425"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:46:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAR0U-0000000DXzD-0Yvg;
	Mon, 11 Nov 2024 11:46:50 +0200
Date: Mon, 11 Nov 2024 11:46:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO
 version ID
Message-ID: <ZzHSiYyK9VjyzBBm@smile.fi.intel.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-2-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 11, 2024 at 10:34:09AM +0800, Ye Zhang wrote:
> Remove redundant comments and provide a detailed explanation of the
> GPIO version ID.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



