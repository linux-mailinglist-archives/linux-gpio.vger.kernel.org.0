Return-Path: <linux-gpio+bounces-27268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5940BED80C
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 21:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C86A03AB192
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 19:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1297253351;
	Sat, 18 Oct 2025 19:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfhvQ2tf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9271EF363;
	Sat, 18 Oct 2025 19:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760814051; cv=none; b=KxDCsJyYziKTwCyguuGvriOywf4f2/7jYS2MXcAT0lBeMQaEguhzoHkUyyV9eiCHbF4lS/+fJ4WRD5+zfSdOeJB9sTD3CaOrAwNaaMFtWOUf7/SjG0CQfa768LWalCs9dc6/+MsJzN/tqzI2w80sEG2SYn3ZSr3ZU3cZcRWP6Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760814051; c=relaxed/simple;
	bh=2424lkxqVqVcCWvrSYaYBR5ZLHZgG6xuHymm+xrpt38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEKChWx2Psy8nFVdfX5+9U7lrvjycdjze0K/1KFUX+NJdhtIlUpJi+uljrhaIsJdumrE1qSEYdsDMstHJur1psIhk4Bt8YiG2EsfTDI8sxOLNYWPCaKrAg6oxxoOf3FG2cngkFFVy/yq/iUCInv45Nq+4EvM/j3nca52W2qIogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfhvQ2tf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760814049; x=1792350049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2424lkxqVqVcCWvrSYaYBR5ZLHZgG6xuHymm+xrpt38=;
  b=kfhvQ2tfAkhfc6pKoq1XkSFzTOV7E66P2ZdC/riUuChuaRevtS1TvG7s
   rkp3H7ll+nG3hsRFq3xZN48d1FoZzne0xVyIJGPnnB6CBKziKGMKEZypi
   SOFyfxfNsHyEHTsDfcplFtslNSmtdrhLh+t9AMCt40oKPtL9VKaNZLBBq
   3k4NXob3EZk0ayOQN1HVrJMqXK0lc3wzsgfnodQWrMxAiUsvKBfY5LCR8
   SjpP1nkTxEJdAlhkFCZKkO0pfLtsYeeCnsbyWcgv1Zv3EFEq8AzC+nhbS
   TxvuG+FqSGVU3lY1aAdbNUhhQncUL4ZuMIUo3+qHtlbwot9O4LFjSNUR5
   Q==;
X-CSE-ConnectionGUID: cJiJjzs6SHyJ76j6irjj4Q==
X-CSE-MsgGUID: 50XcSHm9QT6AW6AynIc9kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80435716"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="80435716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:00:49 -0700
X-CSE-ConnectionGUID: Ry0YH5O6RBCK7CPjrrYbXA==
X-CSE-MsgGUID: Xwolx4EpRJWNShptZSJkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="213605488"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:00:47 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vACAW-00000000x9v-0MjN;
	Sat, 18 Oct 2025 22:00:44 +0300
Date: Sat, 18 Oct 2025 22:00:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: 104-idio-16: Define maximum valid register
 address offset
Message-ID: <aPPj22GL56sP1gOK@ashevche-desk.local>
References: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
 <20251017-fix-gpio-idio-16-regmap-v1-1-a7c71080f740@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-fix-gpio-idio-16-regmap-v1-1-a7c71080f740@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 17, 2025 at 09:58:01AM +0900, William Breathitt Gray wrote:
> Attempting to load the 104-idio-16 module fails during regmap
> initialization with a return error -EINVAL. This is a result of the
> regmap cache failing initialization. Set the idio_16_regmap_config
> max_register member to fix this failure.

> Fixes: 2c210c9a34a3 ("gpio: 104-idio-16: Migrate to the regmap API")
> Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Link: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com

Link --> Closes ?

-- 
With Best Regards,
Andy Shevchenko



