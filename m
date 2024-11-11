Return-Path: <linux-gpio+bounces-12817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBA9C3B51
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 10:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53FFF282F93
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 09:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04790155342;
	Mon, 11 Nov 2024 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E77xD55k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412AC137747;
	Mon, 11 Nov 2024 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318529; cv=none; b=oNMrHmz/6s/IUQLcgiNXWensvFNdeCThiRvvugTJm2LmgSODXMWXJBccSH7K2wzmkbuZ09jsVqnkTWyX14HJIe+35UXplqwz8r0MxqK+GXu92MLVaW9WLIx7Fr0Jibu53BnYN789q0IysUCUviKiudV+hBR9WHWJXJAU6N2jKYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318529; c=relaxed/simple;
	bh=TWko5uNVDqWKSEwWoDXofaTXfG/6cFiuyW/CDuISlVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daGuJ35SVb7PBhf7OnBAhKNe5TJm0fEty9d/hr15rK9HjLBsrwrIJPHEihCLhbmoyUYSiGGk8oLUa21Unisg53DpE5IETPht8YRCeLxC4fOj+SQXcs1G0afERHNAkQtdfQWDHxfvWzEo2bG04o5YaVlfUnjEiZfzHw8tcs7Daos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E77xD55k; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731318528; x=1762854528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TWko5uNVDqWKSEwWoDXofaTXfG/6cFiuyW/CDuISlVQ=;
  b=E77xD55kq/53Ptn9SyWuj0fWKMcduQpTs4Xft/bsGRxrWiw+3lM3K7dk
   VPeKdIeuTsXQmxpg/7PUkhd3xzWcPAz81jhC8XTNIk3M6kVPVAdZARWpL
   jGEk4DPbxiZXBHpDliS9Qmx7BKWdRsuljGY7lIeWovaLOu/JmplEwOuj2
   VJ661VTKJC1FQxye4A9ZBERK3OUMHT/+x8vBIugcorq+sbRKXa+pwAQ8h
   si0dLTrJwOyxofw1A7B0CrM7sqtLhZH0qCUxGlOI2z3DL9kJ/rRjtMz9u
   DdRz7eqWxrGogZxzF/e2yl9l97kmrNkNsyw0DZ3+DtRhKEN5aZF3SvAty
   w==;
X-CSE-ConnectionGUID: iJ3Ibta5Qwugpc33YWJLiw==
X-CSE-MsgGUID: LBPLdNQAREG9AwPQcCoTqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41732084"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41732084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:48:47 -0800
X-CSE-ConnectionGUID: QRGeLpDEQN+cfQe9+DuaiQ==
X-CSE-MsgGUID: acleJzvVQlKCW2tBi3NzDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="87298954"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:48:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAR2I-0000000DY1v-08mN;
	Mon, 11 Nov 2024 11:48:42 +0200
Date: Mon, 11 Nov 2024 11:48:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 3/4] gpio: rockchip: support new version GPIO
Message-ID: <ZzHS-cf8H-JjMkZd@smile.fi.intel.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-4-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-4-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 11, 2024 at 10:34:11AM +0800, Ye Zhang wrote:
> Support the next version GPIO controller on SoCs like rk3576.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



