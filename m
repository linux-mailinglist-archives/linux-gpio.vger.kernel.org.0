Return-Path: <linux-gpio+bounces-76-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED51F7EA088
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 16:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0856B20A12
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 15:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E8C21A00;
	Mon, 13 Nov 2023 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWgHIchm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007C8219FC
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 15:50:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184DCD71;
	Mon, 13 Nov 2023 07:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699890636; x=1731426636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OvhE0e6EB2MBfnzMLf19TZuoQa92OiK+vFbhUueGFsY=;
  b=dWgHIchmXxgntDaf+9+ohkkM2gVi1rPPzTWd54liIG946kVk1LgWrcvx
   o/dNeh8SOyhGLCrqy07ZPMk9yqrpAKdBKb9WwXJQcmaxVYMfHOBTajM5s
   +8sHabw2Sd3+EL1q8ViDAMtA9H1tScXq9WOzyARnr/TEcEwvB3xqawU51
   T0OKeNSpJPakSP13idhIaR4VULtIad2A0kwcytYaKSQjZKqJvyKqGM8hS
   YYn1stvBlIXPstPYAeTrz5opadtIPmUfvve5tyHUS+5bgaoQK1fSDCp8f
   jhDLMaQ9ICUBPazNnh/uaR54eObDP9q0n+5vESHKkFWwHpLxvNkk/Ss64
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375483636"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="375483636"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 07:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011573486"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="1011573486"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 07:50:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2ZCo-0000000Db83-1ARv;
	Mon, 13 Nov 2023 17:50:30 +0200
Date: Mon, 13 Nov 2023 17:50:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	mallikarjunappa.sangannavar@intel.com, bala.senthil@intel.com
Subject: Re: [PATCH v1] pinctrl: intel: allow independent COMPILE_TEST
Message-ID: <ZVJFxnif-3Q_1aAS@smile.fi.intel.com>
References: <20231113125534.4993-1-raag.jadav@intel.com>
 <20231113134251.GR17433@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113134251.GR17433@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 13, 2023 at 03:42:51PM +0200, Mika Westerberg wrote:
> On Mon, Nov 13, 2023 at 06:25:34PM +0530, Raag Jadav wrote:
> > Now that we have completed the transition to standard ACPI helpers for the
> > entire Intel pinctrl tree, we can detach COMPILE_TEST from ACPI dependency.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



