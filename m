Return-Path: <linux-gpio+bounces-15696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED525A30427
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 08:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B24A73A1716
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 07:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCD51E9B24;
	Tue, 11 Feb 2025 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjDoB5BQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0F1E9B06;
	Tue, 11 Feb 2025 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257553; cv=none; b=oRc7ofuDKVFpKK3CtkDMQyp79WnNESy4eV0YEKa4UF0ywtfeO92VUPdSOHictVd0hEsSBQhszTwCDCd80HuYe9aOct59vyVWuqeNyoXBwdUXOOjqal133qor6PZaTwGtRoj1vyM4xhdXXQXfRW6e6WLZmMycegwSpna4B1czATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257553; c=relaxed/simple;
	bh=hajK+H8/OOzhf2LpTlRWz2++os+SDAm2g05VQUq4XZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jny7y2ibVa9zgkk70ghY9DlgIsERi6SMUbemEDWSuimABExeXypulYNin0f6g3jFKuSRfu5AxvVYJ5o5cMSDrFRUZs81TLi8cBJ1wL9ihskKebgcPRqzSRYHXDyfmg1VEywFKfQO2QW+Ix6XUesAFy1eRDp/k8pQPZyKGbfmKjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjDoB5BQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739257551; x=1770793551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hajK+H8/OOzhf2LpTlRWz2++os+SDAm2g05VQUq4XZE=;
  b=SjDoB5BQFzGUuqdDHdGoVKJP7+U6kfLXhskvRF7Ff3T7+mmBiwTrU7sX
   pzBTGF8nmNVt5EcxS6x8S0EUaINjaPAujrzhhJxQhi5ufcPYEhEM8vKkf
   TnRpASSsdxc3pQ2AU8amPWb3NaY2+7MfB9U2b3ehv2l1kHmekz9TOhejf
   +PgdSiGX6WPwm8YFj/XFe6MzqhePjou1AGygcVEHuA/bMxWok8NNKo8M2
   EnQj3TSyCs9ynw67o5y89UqFr06CloSZx/e+c1YZjr+V+LR0EdOuSTzqM
   6h2BW2za/IUABngeWbJJgIztO65BHilJbIuRskBC8lZXKHReB8F7jjn7p
   A==;
X-CSE-ConnectionGUID: NqXb9PKERf+UUN3o3G5Rcg==
X-CSE-MsgGUID: QEDzxWHJT2qR6RTayfh5GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40008336"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="40008336"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 23:05:50 -0800
X-CSE-ConnectionGUID: w6VhlQP/TS2Vgnke3Ll7Jw==
X-CSE-MsgGUID: +bp9aVKwS2aoPGMxXh7Bcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113317099"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2025 23:05:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8B9662CA; Tue, 11 Feb 2025 09:05:46 +0200 (EET)
Date: Tue, 11 Feb 2025 09:05:46 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Alexis GUILLEMET <alexis.guillemet@dunasys.com>
Subject: Re: [PATCH v1 0/2] pinctrl: intel: Fix PWM initialisation
Message-ID: <20250211070546.GY3713119@black.fi.intel.com>
References: <20250210195230.490904-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210195230.490904-1-andriy.shevchenko@linux.intel.com>

On Mon, Feb 10, 2025 at 09:44:49PM +0200, Andy Shevchenko wrote:
> It appears that PWM instantiated from pinctrl-intel is configured
> to a wrong flow. This mini-series to fix the issue. Note, patch 1
> is comprehensive documentation paragraph to explain what the difference
> in the programming flow and what the SoCs are affected.
> 
> The issue had been reported privately, hence no Closes tag.
> I haven't added the Tested-by, so to make sure that it (still) works
> I ask Alexis to give the formal Tag here in a response to the series.
> 
> The idea is to route this via pin control tree as there are already two patches
> against PWM handling in pinctrl-intel. There is no need to backport that, it's
> optional, because it wasn't worked from day 1, and hence no Cc: stable@.
> 
> Cc: Alexis GUILLEMET<alexis.guillemet@dunasys.com>
> 
> Andy Shevchenko (2):
>   pwm: lpss: Clarify the bypass member semantics in struct
>     pwm_lpss_boardinfo
>   pinctrl: intel: Fix wrong bypass assignment in
>     intel_pinctrl_probe_pwm()

Both,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

