Return-Path: <linux-gpio+bounces-24216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73BB21697
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 22:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EDF96229D5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 20:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D902DEA73;
	Mon, 11 Aug 2025 20:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgTUPWWs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05B92D9EC9;
	Mon, 11 Aug 2025 20:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944601; cv=none; b=SNteSyvR2upTSjmnUR0WOZolGyU7wY1GrTfd/kdy90xz88CXK9hnH5fwRnCaiSIq5RA5KxrqpEgJ6EoNOUfmEkUyTaC1GOCpo8yXrpJRt8CtTSKT7IHC5PU0GcTo0ssIhU6LFHl8+RDYEFHlbApjcVwlyIh/ydvjGhSb+PaeVeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944601; c=relaxed/simple;
	bh=TnYzz1Z2MhsMhecEDaJ2A2XrQKk67TdI7gUywSENJ5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atVWkfyypSt+3OvSadiKPGL2FQOFNnU9DrxbokE8ni6hUHecMt0hoJedyNykDwTmh/waWpFEqYhPgi/ptuShK0ZObReyeSFBV7EnacUoVxs7btgVCUwb0B5pal3OxsS8H/F8l8NPsWRScYMNGtEOG/wTztcqNMOea55oW+Qlti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgTUPWWs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754944600; x=1786480600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TnYzz1Z2MhsMhecEDaJ2A2XrQKk67TdI7gUywSENJ5Y=;
  b=QgTUPWWsNGmnIt6pg3bs4kGxSr0j4FxBA67ZuVoJNFnauN7LKWDsg49m
   QcO3F4fVLNl2mXroeZdgNC1iZeM8LMDeaQJWFLCtqK/b7dC3OQrHSdQs/
   M8h/C8yMlfDOK/DARZkQs3kcrneaPpc0AM2tyErAzjzwOlY/ouwSz5kgK
   vrJUMx5p7XHo7NjH220KhW4j4NZiPjIt/xWnOiRF7q+lWq+5tGxsfL/4M
   2GdU9VAlSJcVcZV12z0zZXAkUgkSGulrUvuo14vMmyYq/PQnwGja3ZiwR
   BYMiddRoz7gFPJG8vMTGEBt0bDZpcWe8uvl2kj+olvPU9pw4pm6jlmF8M
   g==;
X-CSE-ConnectionGUID: WknkSnX2TtG1nou/tXjPqA==
X-CSE-MsgGUID: J+uSz16aQgmjSwxqoRpGvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57289142"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57289142"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:36:40 -0700
X-CSE-ConnectionGUID: KxWuz0hYSH6gytcOZn/QTQ==
X-CSE-MsgGUID: HUX9fp/tRlOCtqx+C2BqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165633105"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:36:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulZFy-000000056jy-1gvd;
	Mon, 11 Aug 2025 23:36:34 +0300
Date: Mon, 11 Aug 2025 23:36:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Thompson <davthompson@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl,
	mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] gpio: mlxbf3: revert device name logic
Message-ID: <aJpUUhCDLjUgtKXx@smile.fi.intel.com>
References: <cover.1754928650.git.davthompson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1754928650.git.davthompson@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 11, 2025 at 01:50:43PM -0400, David Thompson wrote:
> This series reverts the use of device name processing
> in the BlueField-3 GPIO driver "probe()".  Instead, the
> kernel API "platform_get_irq_optional()" should be used
> to prevent errors being logged.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



