Return-Path: <linux-gpio+bounces-28664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B536C69C6C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 15:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 350782AE7F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 14:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B201359F9A;
	Tue, 18 Nov 2025 13:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jv73WMj8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF139357A2B;
	Tue, 18 Nov 2025 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474299; cv=none; b=MXTiMR6QCgyNKPV9iSe0jloU1BGSSZrb+zkSQ1faYn+MJrvrr9lTwX0Gp9LABA0TgzXjKKQLNBOYqIpJEuxyl6ypEQNvPHjP5szAJLb5YIAC/ty5Q+DXG51pEZ42uTt2avu6Qw9jJ1rCYD7gaVODkiKUKO+YtUQbynycxcoCmMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474299; c=relaxed/simple;
	bh=GE3MUS9RWPjKmtvK6ZEq4CiJP3arTB4naS4RHRGg3pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG83SOfTpYsZwEQ+Wxw3iHR1/WH06k5MDEVbPLrOoyGkTy5gI5yvj8g8rBeuNFYF6N29qZe1D+1YWinczlXyOPIy4qUuI6Ce4LFOMD125y6ISl+ZzD3Q9tnfOUdpFLf09yxjAqnzUVg0XY08xPifWQNmT1KvyclQJOCFAvAyfqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jv73WMj8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763474298; x=1795010298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GE3MUS9RWPjKmtvK6ZEq4CiJP3arTB4naS4RHRGg3pw=;
  b=jv73WMj8DSkcf/o29ghVlS+40IrsSHxHk1XzoC+irjZ5uJNOKGEcpC1p
   P1s7CloDoDlUsrIvYI9MNg54mf1SipfkTJpbnUKmoI2WofK//w+auT+0v
   ar0pyuyFcRlagUZj0N9s4t/vvsQhV1Ug4xOTZP28Xz+s4jvN7jheQ+Vfj
   6eI2hvGntFpJxNnNmTdFeGKMj/3zaCJJNYo/arYdlHn3+HXgRmJPPpU+z
   EOiWfZO7VC/441yUIuXVd4/AEdTfgAQADRxWjxnPyvXdY3hgm57k85L+9
   Uwuu/5HZP9k4MXJUtMhHzPnBHFMm0+nCFGtb/B6PWmZNdlJz6sOjNEz3G
   g==;
X-CSE-ConnectionGUID: TjJDSjEpSQajIZmkfHR7ew==
X-CSE-MsgGUID: 7dKF6SkmTDmQQ2qyt0ELgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="83121810"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="83121810"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 05:58:15 -0800
X-CSE-ConnectionGUID: mTXr6QEVSAyJ7nNQu2zqMQ==
X-CSE-MsgGUID: Zs3fH7K4SYqSxQDm6R7J0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221666955"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2025 05:58:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0734698; Tue, 18 Nov 2025 14:58:13 +0100 (CET)
Date: Tue, 18 Nov 2025 14:58:13 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: intel: Export intel_gpio_add_pin_ranges()
Message-ID: <20251118135813.GI2912318@black.igk.intel.com>
References: <20251118123444.1217863-1-andriy.shevchenko@linux.intel.com>
 <20251118123444.1217863-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118123444.1217863-2-andriy.shevchenko@linux.intel.com>

On Tue, Nov 18, 2025 at 01:34:01PM +0100, Andy Shevchenko wrote:
> Export intel_gpio_add_pin_ranges() for reuse in other drivers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

