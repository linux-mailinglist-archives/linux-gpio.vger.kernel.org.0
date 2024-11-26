Return-Path: <linux-gpio+bounces-13299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F99D9F46
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 23:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B10CB253FD
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 22:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA441DF984;
	Tue, 26 Nov 2024 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHP++id9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94E91B6D0E;
	Tue, 26 Nov 2024 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732660826; cv=none; b=IPSBI9a7nsCfhjIrSe5G+rZqcWqudZcWCSzMq4zziiJ/vnnXieIXZ2AaXiLOkQ4eYEKOajp/QRsVtRxo/uyUciTmkjHT2H49UnC4ty0A1avzLox+8ePDxFeevTYPeGRlZ104imMdTbc8tvBG9j+TtIO0OjFWuRB5RlsLM1mn3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732660826; c=relaxed/simple;
	bh=7fOFft3Csi6Eo6ZzguKO6MAVCc1CWxXxGJ3tqathIrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOZza84dvtl8m1SzCFra7cV7ONog9k4gYmdiYpk4a7m2rKxDd8zosGAUxf+NmCathKutl+sFL7/wdDxUQuZXgv9V5ikFv37hb3/1gmdqxgen9XNrqmt4GOFl/P9qwAgCMXh2dfdTD5AMwGw4mtWIENDIYkWzam9zDh2NbAJ00sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHP++id9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732660825; x=1764196825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7fOFft3Csi6Eo6ZzguKO6MAVCc1CWxXxGJ3tqathIrA=;
  b=lHP++id921mJHcSiUlI894XMkuFXyq8oadlUW150an4ly48C7Ea81YE5
   cxS7gGGkaO3YY3LwvsK5sqNLp89b9xvlhmrrqnl8mChGznCMdEvYK1vGU
   wVGgAKUET4Pvnabse0j1HQ/xGUvR4T+EWzN2qtXz6MQPA27Xu3voDUg1N
   FiqnafokHcgxwKoFRtm+vkCv6cnlLGTLvrbO4YGlYNbyBbTaeITyo8v2c
   BE54R9GF/A+rfHmlGjVn6EmjloVz11ac7cD7RnSyb8SbwERvmQFPmKO9u
   dZLo4itgCr7vsq/NCQvVj5lJlvCxmXM1tEC9+qPMy8voPrIGcMtL4jaVi
   A==;
X-CSE-ConnectionGUID: lP/Yt+hKQsOKbbdzGX3NBQ==
X-CSE-MsgGUID: JfOKF9KPTs+wruGJoNSR5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43507226"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="43507226"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 14:40:24 -0800
X-CSE-ConnectionGUID: LsLWlJ3rRYyMEIezA/e5gA==
X-CSE-MsgGUID: clKQ7jF8SP+vsPhwgzqZNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="96674924"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 14:40:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tG4EE-00000001Rga-2GVB;
	Wed, 27 Nov 2024 00:40:18 +0200
Date: Wed, 27 Nov 2024 00:40:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z0ZOUkDiBhKNK8E6@smile.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126172240.6044-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 26, 2024 at 10:52:34PM +0530, Raag Jadav wrote:
> This series introduces a more robust and cleaner devm_kmemdup_array()
> helper and uses it across drivers.


I believe the best is to route this via Intel pin control tree, but we need
an Ack from Greg and Dmitry. Or share your vision on this.

> Raag Jadav (6):
>   devres: Introduce devm_kmemdup_array()
>   pinctrl: intel: copy communities using devm_kmemdup_array()
>   pinctrl: tangier: use devm_kmemdup_array()
>   pinctrl: pxa2xx: use devm_kmemdup_array()
>   input: sparse-keymap: use devm_kmemdup_array()
>   ASoC: Intel: avs: use devm_kmemdup_array()
> 
>  drivers/input/sparse-keymap.c           | 3 +--
>  drivers/pinctrl/intel/pinctrl-intel.c   | 6 ++----
>  drivers/pinctrl/intel/pinctrl-tangier.c | 5 ++---
>  drivers/pinctrl/pxa/pinctrl-pxa2xx.c    | 8 ++++----
>  include/linux/device.h                  | 5 +++++
>  sound/soc/intel/avs/boards/da7219.c     | 3 ++-
>  sound/soc/intel/avs/boards/es8336.c     | 3 ++-
>  sound/soc/intel/avs/boards/nau8825.c    | 3 ++-
>  sound/soc/intel/avs/boards/rt274.c      | 3 ++-
>  sound/soc/intel/avs/boards/rt286.c      | 3 ++-
>  sound/soc/intel/avs/boards/rt298.c      | 3 ++-
>  sound/soc/intel/avs/boards/rt5663.c     | 3 ++-
>  sound/soc/intel/avs/boards/rt5682.c     | 2 +-
>  13 files changed, 29 insertions(+), 21 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



