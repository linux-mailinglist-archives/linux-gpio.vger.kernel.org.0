Return-Path: <linux-gpio+bounces-480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D87F72A5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 12:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3FD281DFA
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E431D527;
	Fri, 24 Nov 2023 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YteXy2ec"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2357E1702;
	Fri, 24 Nov 2023 03:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700825103; x=1732361103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8HBC5nuhSjPqE1UlKy9QKbtcJWfkVzdP3fyBc0MI/qE=;
  b=YteXy2ec3G6/40XyMoYl2k/QNwhz3sAx+g7lnPbYfz50wZ0NTDqszVlt
   nT8tP7wK/qmN7bSObip8O//uei9kmH9mmHSF/5nA142C4XSHI+1V+mLoN
   24qqSIe+d6bMO6TFd0ePe+3HtqOG6EoltbUX/KOfZ/jIF9tqI/Ln0eYUv
   yaW+mlIpQNKoYOB1zhP9p/HKxcZVcQTdoX/wpj7b8akfeoRH4nw1UdAYt
   WX5L2iw08VE8l9WJeXGURcS9ne6JGpTQhVRPVUm3H4XACZO0/5dTNCzx7
   HySQTM4dyYm0X6wlW/tmhy41oARvwzKd5B2fsw+aMiI5u0SyPUDIUA1Cv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396314838"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="396314838"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="911422551"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="911422551"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:25:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6UIs-0000000GhQM-2OqW;
	Fri, 24 Nov 2023 13:24:58 +0200
Date: Fri, 24 Nov 2023 13:24:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: pinconf-generic: resize the pin config
 array directly
Message-ID: <ZWCIChQ3TKtxv2b-@smile.fi.intel.com>
References: <20231120222832.4063882-1-masahiroy@kernel.org>
 <20231120222832.4063882-2-masahiroy@kernel.org>
 <CAK7LNATK3BVDZ88v7MWjzOk3Kv8CR4Tz_k77yi1OO=zc+71j=g@mail.gmail.com>
 <CACRpkdaMBrWUR8OYLPiQNNJ64mfenFyQa9f4iB+w5kZ44WjSeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaMBrWUR8OYLPiQNNJ64mfenFyQa9f4iB+w5kZ44WjSeQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 11:06:50AM +0100, Linus Walleij wrote:
> On Tue, Nov 21, 2023 at 11:21 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > On Tue, Nov 21, 2023 at 7:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > pinconf_generic_parse_dt_config() allocates memory that is large enough
> > > to contain all the config parameters. Then, kmemdup() copies the found
> > > configs to the memory with the exact size.
> > >
> > > There is no need to allocate memory twice; you can directly resize the
> > > initial memory using krealloc_array().
> > >
> > > I also changed kcalloc() to kmalloc_array() to keep the consistency with
> > > krealloc_array(). This change has no impact because you do not need to
> > > zero out the 'cfg' array.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Sorry, I retract this patch set.
> >
> > krealloc() does not save any memory
> > when the new_size is smaller than the current size.
> 
> But the first part where you switch to kmalloc_array() is still a nice change.
> 
> The fact that we use kmemdup to be able to also shrink the allocation is a
> bit of an oddity I guess, but let's run this patch by Andy Shevchenko, and
> ask what he thinks about simply introducing kmemdup_array() or if he
> has other ideas for this.

https://lore.kernel.org/all/20231017052322.2636-2-kkartik@nvidia.com/

-- 
With Best Regards,
Andy Shevchenko



