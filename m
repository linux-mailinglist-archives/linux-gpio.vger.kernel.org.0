Return-Path: <linux-gpio+bounces-15556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC191A2C787
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD9E77A3BC7
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5575C2405FA;
	Fri,  7 Feb 2025 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCSfuuV+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64368240608;
	Fri,  7 Feb 2025 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942922; cv=none; b=P5i1xxdktThTNrPqFx6fjRkkgGYgOAeEFC+uH+/pQ3qqzvFnzLhsCOuAotxF8J1m20+32Gr7TqXAz7MiroHxsf/+me8ZYBQos4zcX5xYXphg/7gBonAQaT7CSZnxr7nhgmpyIQqBSZWKIejbNyP25SUhZfRQJ9U1X5nrTzLzzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942922; c=relaxed/simple;
	bh=Qmxv67eREN21KV5OW8q8rkXUpoIPDOwrcmbL8HtjZCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVkGxUTHqqrLB02LLyh2oamKWlRBBWZgimRl5qHa2xPwsWgUAbugxjVM7qpi2LcUN7iBd9NdnmIrshfBPTMK03BT7By2QFF8KidKdpqt2KuIx/BQq5LEBH4WZ7LRw4ry72XASunEaPesh9OvbqP4hTzY+pDu/OILiEFKP/ti5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCSfuuV+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738942920; x=1770478920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Qmxv67eREN21KV5OW8q8rkXUpoIPDOwrcmbL8HtjZCA=;
  b=mCSfuuV+kybuMLSyHW2UMHfhwTqx7Ph2/hn6lF1sJvUzXa2S8vs3yQFj
   cwKucLreqm/VyVypbJyoYLKl67ze5GgymWu+YU6/eHuCsf9MSGBXPbyN/
   THhKg/nA9xqX9+C2/E2MnPgrg09kUmnc5HTtgIB3T5WmHHB2SZODg65zL
   79hiXv/ZZg3BLs2sM7qCI8T+x19+aEExs27QTcgjzFnrNgZA4rmeYAmsy
   fiVxvGQWeo7NeuhE7pP8rUL+Lijnof4QPuXkeYm3VxbXjAPXoIzxTuAaJ
   MSFqtU+DjX4FV2/AwiBzAQb9v3nZezyhWm7VlUax4YUZQjGSdmIYzbp7c
   Q==;
X-CSE-ConnectionGUID: +OWNxkbaSSujXgUsWHgc0Q==
X-CSE-MsgGUID: WQcgdRobTLaO/FYvZgTgCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39741206"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="39741206"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:41:59 -0800
X-CSE-ConnectionGUID: ZhS+pbrvT9GgGnZOX0yjjQ==
X-CSE-MsgGUID: 1VST0mTQSKK6DG9t5oBWrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111474064"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:41:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tgQUN-000000097lB-23ai;
	Fri, 07 Feb 2025 17:41:55 +0200
Date: Fri, 7 Feb 2025 17:41:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2 7/7] gpio: 74x164: Utilise temporary variable for
 struct device
Message-ID: <Z6Ypww-xXAvoCCq1@smile.fi.intel.com>
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
 <20250207151825.2122419-8-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207151825.2122419-8-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 05:17:14PM +0200, Andy Shevchenko wrote:
> We have a temporary variable to keep a pointer to struct device.
> Utilise it where it makes sense.

Urgh, this seems incomplete...
There are more lines to convert, however they do not affect ± statistics.

Tell me if I need to send full v3 or just this patch.

-- 
With Best Regards,
Andy Shevchenko



