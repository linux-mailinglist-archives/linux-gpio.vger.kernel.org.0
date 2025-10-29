Return-Path: <linux-gpio+bounces-27804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB3C1A16B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 911144E111D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64543346B9;
	Wed, 29 Oct 2025 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeQdr/1X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99DB30BF53;
	Wed, 29 Oct 2025 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761738125; cv=none; b=TXhPs8xlVUAojevDwpssgki/QEbrJqgANMskHtQGRQA0e0/PMSEQ+vNBSgBWxP3dt+X6X9cJ5mkfIQyAjNrxedi6eS0MD65StKFlDJtjR9gtReDDWvToDgbgkib+6V4HFtHkl3A7OmcZ/sFV7y3NnAFDpeTL5/f6b8WUEfx2iVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761738125; c=relaxed/simple;
	bh=CWuanT4v89ELYuCd8YftnASQ94vUasO0QCGZu7kMtN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pO2CRi/a4d8ldFFd4PPFm8U7LYKO58sCYFHcosUiOPYR5Xkzz6s463Z3TQUKJWK/+IesUBcFOu53cRPgQ7RfaPNH+SFu19sTM5DPElsIGINNldq50HiyGbL7iatNMhSlsFDi3x6NQTdwEGqfGTs8gLFI9xdZZmHBMRnN5CKP5Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeQdr/1X; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761738124; x=1793274124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CWuanT4v89ELYuCd8YftnASQ94vUasO0QCGZu7kMtN0=;
  b=FeQdr/1XArOu2pfSe+uusea5G6d+4zj25pfFxPMckNw264XlPadxuvka
   +UTqpj3X37q1/hZvi2NhWO+T4bC/HRBfsai2++FTykXoHY/EquFEyuc38
   EQK4v7Jo/nLiBJrLqQ/y2E+H9fm1HUe5RNoH2RdMd4/N5ywHyNVxTvg6U
   6li110I7xc0jS9kgRmMkajzJDzr8Uh2q9pDthASxv4Ys21M7GQLjC7K3l
   1jhlTLSEERgjYwaY8hD0/ad079ErlGTusJc5FvIaz1ZRTT4eqIFEpVvvP
   OopJjqDx8X+e+5D4meI1HaE0mT4lRREnFMRhtPfLa2GhdPeYxrmDEN2UG
   Q==;
X-CSE-ConnectionGUID: i6O8d8mRSem569vz1pO6tg==
X-CSE-MsgGUID: ufQTnPpWR0O6UGDmTgGrRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="51429798"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="51429798"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:42:02 -0700
X-CSE-ConnectionGUID: 4nHoIBj6QnSvV/LLtgGNBQ==
X-CSE-MsgGUID: Tm0xW4g9SaCREL+ybcXZHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="189702787"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:41:55 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE4Yq-00000003bB9-1kAi;
	Wed, 29 Oct 2025 13:41:52 +0200
Date: Wed, 29 Oct 2025 13:41:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 01/10] string: provide strends()
Message-ID: <aQH9gE_fB119CW3l@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-1-71c568acf47c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-gpio-shared-v3-1-71c568acf47c@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 12:20:37PM +0100, Bartosz Golaszewski wrote:
> 
> Implement a function for checking if a string ends with a different
> string and add its kunit test cases.

...

> +/**
> + * strends - Check if a string ends with another string.
> + * @str - NULL-terminated string to check against @suffix
> + * @suffix - NULL-terminated string defining the suffix to look for in @str
> + *
> + * Returns:
> + * True if @str ends with @suffix. False in all other cases.
> + */
> +static inline bool strends(const char *str, const char *suffix)
> +{
> +	unsigned int str_len = strlen(str), suffix_len = strlen(suffix);
> +
> +	if (str_len < suffix_len)
> +		return false;
> +
> +	return !(strcmp(str + str_len - suffix_len, suffix));
> +}

Can you rather re-use strcmp_suffix() from drivers/of/property.c?

-- 
With Best Regards,
Andy Shevchenko



