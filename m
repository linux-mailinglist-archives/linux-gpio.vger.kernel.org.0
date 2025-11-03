Return-Path: <linux-gpio+bounces-27966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C4AC2C6F5
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 15:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0059F4E68E9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 14:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADB228032D;
	Mon,  3 Nov 2025 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TN6Zsljo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CBD20125F;
	Mon,  3 Nov 2025 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762180624; cv=none; b=SCn/ywiNfJ3G2ZwSO+VAZm5vbI3ZPKxbMyNcwl82XFa/plm5aILPMCjeFTwjdeRUZBf4Or+unX16C2SnD0dLZfVeYUzSUZsobhQgn4WzNvhUmWTbHsoMonkuGdRdnc4kclYy+21rLWYz26MHf/aymPnHekqP7qFbajLD7/eYECI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762180624; c=relaxed/simple;
	bh=ONESlJrt0B1hJRr7zz4S/UVLdm+/k3OpYpvNjlrv2Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbrDJXlyPVTIsb4ghS0+rv0CwA8eIp7D7p3IW02HDYNbbsUzSO1TjsMYN9UOK/ikpchnhbMCWAICSrsb4z+4HqGvSJ+3YoRiKmthftG5eOVOJwi2Fed69ghe1Q+8KrNdRyvECe9EtDGP0bhQDrINR1PnxMlmu0oiZVOrRznRiYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TN6Zsljo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762180623; x=1793716623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ONESlJrt0B1hJRr7zz4S/UVLdm+/k3OpYpvNjlrv2Qc=;
  b=TN6ZsljoOkfeXfrZrsy2I3/fR8I495qWdq/pwcAjoaMIJ6JCw8VkRDnx
   //YWTaC4D9xd/de/Q0CrQ1h5jaCseVZpKoU+E+fYuN8AgwnRxl5NQ3JoT
   zPMu93Uo/XA3tsMfENp468q7s95/3ipDBJCszIRHa9tzQHxggO2AZG4PA
   moEmzVZCeOKf+1wh7aASTWrWxzzHtyVU4yugjzz68/cJEvtP6UDDm/nMf
   4Tgm/d/yLIK3oZDfMwmCt/05sI5L7RHp2sm4olWwAmPv3oXKG2VLd1ZYp
   GJf1MUQoOCuQI00pxmlM/mRsXvUXlPeZ9PgF0Y4/eEVfpP4/31XeDjip3
   A==;
X-CSE-ConnectionGUID: zc0Jjt9qSpCdNEOB0asc5g==
X-CSE-MsgGUID: jyX5/BWpS267DIR/982ZxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64288690"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="64288690"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 06:37:01 -0800
X-CSE-ConnectionGUID: h2uKtdXFRZ6Ir7hHE6kedQ==
X-CSE-MsgGUID: 4wEuwb8XSS6eMkJFSpaLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="192040839"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 06:37:00 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vFvfz-00000005Axr-2vI2;
	Mon, 03 Nov 2025 16:36:55 +0200
Date: Mon, 3 Nov 2025 16:36:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: fix invalid pointer access in debugfs
Message-ID: <aQi-Bs3Aw6T6ejt_@smile.fi.intel.com>
References: <20251103141132.53471-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103141132.53471-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 03, 2025 at 03:11:32PM +0100, Bartosz Golaszewski wrote:

> If the memory allocation in gpiolib_seq_start() fails, the s->private
> field remains uninitialized and is later dereferenced without checking
> in gpiolib_seq_stop(). Initialize s->private to NULL before calling
> kzalloc() and check it before dereferencing it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



