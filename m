Return-Path: <linux-gpio+bounces-1663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E27F818A30
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 15:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28851F2B29A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 14:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72051805C;
	Tue, 19 Dec 2023 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krOtKW/G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6AA1CAAA
	for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702996693; x=1734532693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UVBO8tdrNYRZN9t5L07KY7zM0cTYLl3+qRWvJNBsPBg=;
  b=krOtKW/G4yJUO5U7mt9x4U8Hr0Q5AnwrdnebQmQcN2O2wqXLnSdum2Sc
   FmVXwl7WC+VwyjJc2ZeXMzTRHN/Zi5tnDYkx+Nf19Hs/ANsLOpWTxMAhV
   Sm0tGiwRaSO4lsdSTKRrXjxwuv6ThCx9L4RnBa/pfLqOikgIwcApK+CU+
   q0dd7RbqAi9n8gwOS1AqiSoYoDB2aF/40GDi5sAmoLtMIQAR1gh+VA+Tl
   Acup4Rf5C57iZ0+7IBjoJ4ke9sYII1v7S8GgbdPhBZ2OreYed+osSxTXt
   IougDNDAUhvwgsSuzABZ4sYdvlxF69WN9nHLUNLkrx9/TMiqWRSx7Picw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9113277"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="9113277"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:38:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="949184021"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="949184021"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:38:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rFbEW-00000007HmS-1GxG;
	Tue, 19 Dec 2023 16:38:08 +0200
Date: Tue, 19 Dec 2023 16:38:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.8-1
Message-ID: <ZYGqz-XW7LSlui2N@smile.fi.intel.com>
References: <20231218145559.2209291-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbej2mwny4i44J+3yzCfvZo_=QQVSkJnxfqrMHtETmJ8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbej2mwny4i44J+3yzCfvZo_=QQVSkJnxfqrMHtETmJ8g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 18, 2023 at 11:44:03PM +0100, Linus Walleij wrote:
> On Mon, Dec 18, 2023 at 3:56 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Rather big (by amount of touched drivers and overall due to a couple of new
> > ones) PR for Intel pin control drivers. Has been for a while in Linux Next
> > without reported errors. Please, pull for v6.8-rc1.
> 
> Pulled in and resolved a minor merge conflict (which I guess was solved also
> in -next?)
> 
> diff --cc drivers/pinctrl/intel/pinctrl-baytrail.c
> index 3c8c02043481,9b76819e606a..000000000000
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@@ -1173,7 -1136,7 +1136,11 @@@ static void byt_gpio_dbg_show(struct se
>                 void __iomem *conf_reg, *val_reg;
>                 const char *pull_str = NULL;
>                 const char *pull = NULL;
> ++<<<<<<< HEAD
>  +              unsigned long flags;
> ++=======
> +               const char *label;
> ++>>>>>>> 85a7d543f2d4c4893914b46c9236f45b3ad87573
>                 unsigned int pin;
> 
>                 pin = vg->soc->pins[i].number;
> 
> 
> Deleted both since label is defined inline, and this is how
> linux-next looks like as well.
> 
> I hope it's the right resolution!

Yes, Linux Next has the correct resolution and IIRC you were Cc'ed
to that thread where we discussed the conflict.

> The rest just applied cleanly.
> 
> Doing some test builds now before I push, thanks for all the nice
> work!

Thank you!
And happy holidays!

-- 
With Best Regards,
Andy Shevchenko



