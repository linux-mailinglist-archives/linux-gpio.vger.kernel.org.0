Return-Path: <linux-gpio+bounces-4173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE9873BEC
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 17:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8310F1C243FA
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 16:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F6E13791C;
	Wed,  6 Mar 2024 16:17:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9782D7B8
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709741869; cv=none; b=umsC8pETLbvmUqV5y523K8XgchQubsw+yrwAkwF3pSIY/ntSbKxu7ImFJoQA9MC2X6/yC+BX5Ko16Nk5b1/tJMzTTAmRf4/0GDZ2NJLh2PSw6sSP1zYLLXJUYVyXB003dmvQuYkedIY0ztPyet9RUBxM+wPtxZ1GYFTpND7n8as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709741869; c=relaxed/simple;
	bh=52waUGUw1TfRZhNKZC9WDhChnWW0YKN4M/Sl2YHw+kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZttJRCcHqZXOAMC9inl464yAMODlraaJ1GJSZCwMcSu2PjADgd8Ahrg9LLQMOV5/gMKJwmN6wE0fuMDLE4djm6rczckJ3ycdIgzB12cFGbKKh+E6RbIdrPA7EgHlW82htw2pg/X2bkBA/C80NR7mON4pDJZM60x/g35uJsZehI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15776541"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="15776541"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 08:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="914182949"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="914182949"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 08:17:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1rhtxe-0000000AJF9-3vuJ;
	Wed, 06 Mar 2024 18:17:42 +0200
Date: Wed, 6 Mar 2024 18:17:42 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: nomadik: Back out some managed resources
Message-ID: <ZeiXJjJ0zZUX1UuE@smile.fi.intel.com>
References: <20240305-fix-nomadik-gpio-v2-1-e5d1fbdc3f5c@linaro.org>
 <CAHp75Vc2+wx=82kx1qMsXH3uWX4tMdDEMXLm=MqB869-=bcGeg@mail.gmail.com>
 <CACRpkdZCXE6VBa3f7asSNYF7Esn5nHnxf0QJfibT7TcfSE52FQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZCXE6VBa3f7asSNYF7Esn5nHnxf0QJfibT7TcfSE52FQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 06, 2024 at 01:51:09PM +0100, Linus Walleij wrote:
> On Wed, Mar 6, 2024 at 12:20 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> Fixed them both when applying! Thanks!

There is still an issue with error path. The problem is that the populate is
called too early and even though the failure of let's say gpiochip_add_data()
(as it seems the only one that really needed the restoration) will NOT reverse
the all allocated gpio_pdev/gpio_dev related resources.

Hence what I see is
1) move populate as down as possible in probe();
2) create unpopulate counterpart;
3) call it in probe().

-- 
With Best Regards,
Andy Shevchenko



