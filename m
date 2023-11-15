Return-Path: <linux-gpio+bounces-48-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 999687E9B6B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 12:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E7AB1F20FDC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 11:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3893F1CFAC;
	Mon, 13 Nov 2023 11:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nm/bWIkp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4B1CF91
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 11:51:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F81AD6C;
	Mon, 13 Nov 2023 03:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699876284; x=1731412284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HVv4lBRvt4SiyLr5CbCDKW2jr7XZ8tb/8lWZF7WDLzw=;
  b=Nm/bWIkpodZAwSi4BuDy2iIanY9/57fUqN+lGvhKAwONyiI9IhsXeHKg
   rcyj4WgKjGDDZ60RP3eFtemaIz1j2vvwtMIz1dmKAnIars0RF5tqPpdhf
   sgn2p2MuACyXym+zIFaQLgqKD7/Nq8hL5J6cFA979HDQ0PqoFhpm4tDg2
   Yw9d5rw3a7DaWjbCjxED0fN2h8MOfJe8Tva4VI7Fh6YDeMjf1KuHk2AZv
   vEXY0vYh9vvwXQAAwm4uhR0I9azl8VJYJzvmiVTR7pHp3vsSp0WlNXaOp
   Sv0iRKkXw38vLrwIvpaz8iT/YdnsWNz/AWj3Rpw2BqbHBAkkNQOmMaJfQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="370621948"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="370621948"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 03:51:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="764315810"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="764315810"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 03:51:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2VTK-0000000DXzp-3U7A;
	Mon, 13 Nov 2023 13:51:18 +0200
Date: Mon, 13 Nov 2023 13:51:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Raag Jadav <raag.jadav@intel.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: tangier: Enable 910 Ohm bias
Message-ID: <ZVINtm-ctWzJExpk@smile.fi.intel.com>
References: <20231030141404.3242102-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZvETetEBwnZB2r28P_m07RhYWD4XQP7Uww4B9ywfi5rQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZvETetEBwnZB2r28P_m07RhYWD4XQP7Uww4B9ywfi5rQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 02, 2023 at 08:31:22AM +0100, Linus Walleij wrote:
> On Mon, Oct 30, 2023 at 3:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Family 7 (I2C) supports special bias value, i.e. 910 Ohm.
> >
> > Enable it for configuring pin.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Neat,
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



