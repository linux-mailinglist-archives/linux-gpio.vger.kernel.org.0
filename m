Return-Path: <linux-gpio+bounces-961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A4803442
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 14:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E3EF1C20A98
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 13:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2FC24A1F;
	Mon,  4 Dec 2023 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJWi8vuA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA5FAC;
	Mon,  4 Dec 2023 05:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701695812; x=1733231812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ruNQAEGel56sXK2lguhT42sAf9ycNnOllBZQjHkiz68=;
  b=PJWi8vuAeDGxWmC51xOgTiB7Xwmd+3IsWThqlM69FemK1I7ldZaurLM3
   TARm+gcD43ls55I2Q72/39L0Yef7FHoDTwEmC66R8rNtk1vZikF7Ft/bS
   A3XqwGC7dBcvOzeDjMS3q04OXdlEcKypy47jVyioKncz6EsFnZPmy8Ksl
   40ByOlgx9BrT7+z1MUPlSMUHfwugqZoPGSXbJ82SatM8NqkPcsywc0u6V
   U18yfhxYNnMUtJ2qd+eb0vX2MxYKR7tOlZnSWt9iD5MbP+wlwr7QAlx35
   s4HpL8ELMwXkOUHplEfyvy6H5BQLNdWCBYSmaRaGuBcf7CgLKQwdvrjna
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="629373"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="629373"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:16:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="774254311"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="774254311"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:16:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rA8oZ-00000001kz7-47cN;
	Mon, 04 Dec 2023 15:16:47 +0200
Date: Mon, 4 Dec 2023 15:16:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 02/10] gpio: wm831x: use gpiochip_dup_line_label()
Message-ID: <ZW3RPxjsNPacT9Si@smile.fi.intel.com>
References: <20231204093509.19225-1-brgl@bgdev.pl>
 <20231204093509.19225-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204093509.19225-3-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 04, 2023 at 10:35:01AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the new gpiochip_dup_line_label() helper to safely retrieve the
> descriptor label.

...

>  	for (i = 0; i < chip->ngpio; i++) {
>  		int gpio = i + chip->base;
>  		int reg;
> -		const char *label, *pull, *powerdomain;
> +		const char *pull, *powerdomain;

Make it reversed xmas tree?

-- 
With Best Regards,
Andy Shevchenko



