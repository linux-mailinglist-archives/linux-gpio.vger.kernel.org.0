Return-Path: <linux-gpio+bounces-702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFB7FDC3F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 17:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006A6282961
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1708514AB9;
	Wed, 29 Nov 2023 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D3EBF;
	Wed, 29 Nov 2023 08:09:44 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372561778"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="372561778"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:09:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="797963434"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="797963434"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:09:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r8N7t-00000000TvN-29fS;
	Wed, 29 Nov 2023 18:09:25 +0200
Date: Wed, 29 Nov 2023 18:09:25 +0200
From: Andy Shevchenko <andy@kernel.org>
To: =?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, bstruempfel@ultratronik.de
Subject: Re: [PATCH v2] gpiolib: sysfs: Fix error handling on failed export
Message-ID: <ZWdiNZ-ckoWbMDLV@smile.fi.intel.com>
References: <20231128141321.51669-1-boerge.struempfel@gmail.com>
 <ZWYVVvB0O-CBIbos@smile.fi.intel.com>
 <CAEktqcv8NC0Cy+wo7nRGOp9USoBdta=n=mrbo-WomxgcmWN5nQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEktqcv8NC0Cy+wo7nRGOp9USoBdta=n=mrbo-WomxgcmWN5nQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 29, 2023 at 04:13:44PM +0100, Börge Strümpfel wrote:
> On Tue, Nov 28, 2023 at 5:29 PM Andy Shevchenko <andy@kernel.org> wrote:
> > On Tue, Nov 28, 2023 at 03:13:21PM +0100, Boerge Struempfel wrote:

...

> > Fixes tag?
> > (`git log --no-merges --grep "Fixes:" will show you examples)
> 
> I thought it was optional. But I have added it for the next version.

It's optional. We want to have this only when it's real fix at the table,
and to me this one fits. Otherwise, put into the comment area (after
the '---' cutter line) why it shouldn't be considered as a such.

-- 
With Best Regards,
Andy Shevchenko



