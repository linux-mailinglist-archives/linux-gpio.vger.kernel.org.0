Return-Path: <linux-gpio+bounces-16951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B4A4C345
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 15:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5717A1665D1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8014A2139D2;
	Mon,  3 Mar 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kL0McG5C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F90212D6C;
	Mon,  3 Mar 2025 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741011718; cv=none; b=FVP8lfhtPzcZaST+oHIdoVcUTHG/j4sCfo2zDfaQaS7ZDr+aO/TrgvMmQiMdlXT6KvkojHcfgjfLpdTd700Rvtrl+gNGA2mQsLW85TqfOy/wcURIckgUdW7SS+qlX4TJxjkvQOEX3bXYOiSdfuY8ELsYwCC2b5EtxpM5d5pA65Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741011718; c=relaxed/simple;
	bh=UuYUSQSBgPnBRJILEBpz2qvKXWkThHolQP9J8kqJKhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQISrLZFqkRL4BF63FHzouN3C5BTi300fVQP2tJ6nFkT1XqB1EfrDYcqs5qry26Cgpc2HoSSejfoO8UD6EDXwM4dLHH8wZ+Krf3z9kHIA7X4qx4I0o1/IhecRRWf+dVgBFVIQes5r0csQtzodTza68GVvEb9in/W0desLrdF8C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kL0McG5C; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741011717; x=1772547717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UuYUSQSBgPnBRJILEBpz2qvKXWkThHolQP9J8kqJKhs=;
  b=kL0McG5C1/RZFJr009onubg0vy9THZRLxnuN5AAzRBUbnXnC16E2F7Qu
   EcOAehjI/Y2+qM3SFJOnuS9csVyEv2fPxJ7D1GjVq0TYcNBugapZtGt3/
   vSXl1WYOkkQm+SdCZ3qHuaDGjQ9l1xm8qNvWyzGa2TIpeJzW2bzRQsBbJ
   XrIGkVjyq54xgio6aUtZ9mk06JUJQCgQotSUizQfGN0V67L+ZNc/blM6f
   Ud2yb7izrl3vFtEpqTWsxXNieWw9dnONen/4pTDYo4NQMt+OQFO3MlnBJ
   u1GUhcAEClVWwS4++Dt0XD7/8Uk25MJM2pvxLw46FmgiagGW+yjJtBTfG
   A==;
X-CSE-ConnectionGUID: XevJ/ne5RSGfcj/3OJb9vA==
X-CSE-MsgGUID: e3LQw/vZRa67aZbNh/4e0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42008349"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="42008349"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:21:56 -0800
X-CSE-ConnectionGUID: zw0iAN2PRIWsq4jDZOaKhQ==
X-CSE-MsgGUID: +l97LuGnQmCCqjeqFlfHqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118721988"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:21:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp6g4-0000000Gput-1Gyb;
	Mon, 03 Mar 2025 16:21:52 +0200
Date: Mon, 3 Mar 2025 16:21:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: intel: drop repeated config dependency
Message-ID: <Z8W7AIwN3AiurzqM@smile.fi.intel.com>
References: <20250303135506.323533-1-raag.jadav@intel.com>
 <20250303140332.GZ3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303140332.GZ3713119@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 04:03:32PM +0200, Mika Westerberg wrote:
> On Mon, Mar 03, 2025 at 07:25:06PM +0530, Raag Jadav wrote:
> > We already have ACPI dependency for Intel pinctrl menu. No need to
> > repeat it.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



