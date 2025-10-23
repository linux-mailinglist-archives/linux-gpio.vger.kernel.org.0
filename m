Return-Path: <linux-gpio+bounces-27510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A95CDC00009
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 10:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 99F924E516D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 08:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804A6301487;
	Thu, 23 Oct 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArWRb9Qc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD79F2F619F;
	Thu, 23 Oct 2025 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209331; cv=none; b=dC5vFFcXHwJBaBeSpdpsHT+1EX0OybF7fQZJmHQc3YP/ISAQYpAhOgh5AXSGNKkEThmKAEcQVU0dydhVYUm1/LhuLYHRrIdkuJiGQKAi9W2SnN76z4wMcAVXuXO7qD+DQUu5AGomOwaaHHu2BE68joSvHUeQsFHghKRsMBhhJrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209331; c=relaxed/simple;
	bh=VYwavaIYWosvTj9ndD+eLeCp0NEzLcqoR4VrkixAJNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7oS4sMMZExOX5QT05GrLn3v1oxQPpL/I3MsIMwkxPLfLPL37sdN7vAMez9VTcnsJ9VHbMKx6fWK6MSmzP+a+QZsH/b8NzyAPYVDI9OkG2JRgVXCfa15f1trxshYYJ6MUYXBekL/p0ZPvke9fUJ5+VC1tke/xNlThVosEOhIK+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArWRb9Qc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761209330; x=1792745330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VYwavaIYWosvTj9ndD+eLeCp0NEzLcqoR4VrkixAJNU=;
  b=ArWRb9Qcpl9+fHYoYukB+/pp4vEjDUGW81uP9Tn8tjy/eQmrfaZjoxRy
   bi7H2YCx9Qi90A5/3hEo/kbNX+elNDkDxTkNdssSQ6EjlTHUHmChGBE7O
   z1iJBKaTvK3q/Bcf6sl44yE3icpgu11H84y1hHuYaEbBqwv0wPImEXFpl
   7IoE1y5ANVqM+BCVlZMrklg85YH/1xfS5HZFlfplPPY97aNqmwOnj/wdM
   osFO5jqMgsoJtd12lZ0lHxWVXXeCMsQLsPeRNHmzVzX2OH5kh5TX/1xM/
   X3e/yBL9JqOKOFpaQyEHtslB6zxd2AbVHOhF8l7K04sYrW60BvbAYcrYT
   A==;
X-CSE-ConnectionGUID: ENSRno7+QcWzDgIzW3TQ8w==
X-CSE-MsgGUID: mBpBTfs1T4iL94Dyo1+WTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74042458"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74042458"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:48:49 -0700
X-CSE-ConnectionGUID: 6fuIzFYsTnSFyYAiRr8QuA==
X-CSE-MsgGUID: D1yASbXsQtSI8MwpRqTJ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="188394261"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:48:47 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBr00-00000001tku-0aiJ;
	Thu, 23 Oct 2025 11:48:44 +0300
Date: Thu, 23 Oct 2025 11:48:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Haotian Zhang <vulab@iscas.ac.cn>, Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ljca: Fix duplicated IRQ mapping
Message-ID: <aPnr66W9J_VnpYgE@smile.fi.intel.com>
References: <20251023070231.1305-1-vulab@iscas.ac.cn>
 <CAMRc=MekWJPnhwLn9z4=yqC4Pjyf2xd7teKCLTUEmnBCDLeROA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MekWJPnhwLn9z4=yqC4Pjyf2xd7teKCLTUEmnBCDLeROA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 23, 2025 at 10:09:05AM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 23, 2025 at 9:02 AM Haotian Zhang <vulab@iscas.ac.cn> wrote:
> >
> > The generic_handle_domain_irq() function resolves the hardware IRQ
> > internally. The driver performed a duplicative mapping by calling
> > irq_find_mapping() first, which could lead to an RCU stall.
> >
> > Delete the redundant irq_find_mapping() call and pass the hardware IRQ
> > directly to generic_handle_domain_irq().
> 
> Andy: this looks correct to me and you already sent your PR with
> fixes, should I take it directly into my fixes tree for v6.18-rc3?

Yes, please. This driver is out of my scope, it should have its own maintainers
(from Intel). If not, I may rise this problem internally.

-- 
With Best Regards,
Andy Shevchenko



