Return-Path: <linux-gpio+bounces-5183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54789C78D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 16:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE892B2889C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 14:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4684A13F014;
	Mon,  8 Apr 2024 14:54:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6914126F07
	for <linux-gpio@vger.kernel.org>; Mon,  8 Apr 2024 14:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712588065; cv=none; b=UEGLt15BzEjk1saA76i4lDsMwk6P2maPLGKidcqsec/QSNUV2ZY90o843hiWbbBqi4fRiptBwvCibsGQRNlx4OrzeiOghTK9UXSSUR02DZ+cnzcIewwQaNTtGS7pMqX2aEfDEWrvu3tDxXI2qqsybDZxZxt9VR8Mywe97GnGmhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712588065; c=relaxed/simple;
	bh=sgL2s2d6cnjCNEkWcjX1b4ERASWy4mpb2NiDXu3RiE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgE4rSqxmJCDRPeYOJiOuuK3iENOmKNzc1TdZE/+nEaDdMUvXPjE/ub7EWeXlBRGvJ4fKlDbjK9S0ZUUBdXX24K9V2QWY1w/H6oOCJFv7zyqTJRJJdjwy4I7K1IrEkkZmrVD1jeCIUmSyhT2hn8SjKFAlAqQzcofqQRnYzK5h3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: IClEIiyLQUCvRM0wyr95iQ==
X-CSE-MsgGUID: 96fjMOa8SX6lWQBLz+ovSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7726176"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7726176"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 07:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="915367734"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="915367734"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 07:54:21 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rtqO3-00000002YU8-2oX2;
	Mon, 08 Apr 2024 17:54:19 +0300
Date: Mon, 8 Apr 2024 17:54:19 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: baytrail: Add pinconf group for uart3
Message-ID: <ZhQFGyUxcuMPzNsE@smile.fi.intel.com>
References: <20240407175049.11644-1-hdegoede@redhat.com>
 <20240407175049.11644-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407175049.11644-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Apr 07, 2024 at 07:50:49PM +0200, Hans de Goede wrote:
> GPIO_S0_SC57 / GPIO_S0_SC61 can be muxed to PCU_UART_TXD / PCU_UART_RXD,
> add a pinconf group for this.
> 
> On Bay Trail board schematics using these pins as UART these are
> called UART3_TXD / UART3_RXD, name the pinconf group "uart3_grp"
> to be consistent with the schematics.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



