Return-Path: <linux-gpio+bounces-19027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F086A9226E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E014016C4D4
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 16:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3460D254878;
	Thu, 17 Apr 2025 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOG+tyDm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23041251785;
	Thu, 17 Apr 2025 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906441; cv=none; b=VrdR7WqmgL0WSQgMtoOXefiHCfbuW+tgl/qwvCJVVQT6L/lnf6Bw+lbBnG2A6WVx5yfc3XmZrhdk2jk/z85JYAUSm3qfXlmkfT3Behij1zixBeDS93m2dTuHrjzAlsXTxtHG7i/KgC0NNixQu1M1lk5bYD9QnUlfKXvatR2ZYWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906441; c=relaxed/simple;
	bh=qA+Gh7X5rveDAj2t+W2EEufL+HSqQ3+BiSPrQjMFRZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1rxLw2ULzY9OrpNKbwV4uqHoebqfmCgGKpUowMuqMzncHHvJPCneRCG6yyR5rXs2bkyVXpFhPQmeSzeHHTz9uDanmob2wCs/9X9Yvu3D5CPTbBjwa6uY1UFhDZinReLsNsF8UeXTlPptXEysanFjtwhwW++UV7oWuHTc3NLpM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOG+tyDm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744906439; x=1776442439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qA+Gh7X5rveDAj2t+W2EEufL+HSqQ3+BiSPrQjMFRZ4=;
  b=ZOG+tyDmW9OVaj/9D9eZIKLT4OV4XWEiYpttF1Ojps5kqnaR5ze9h2G9
   OeB3XD+AOywO/EGd8LBqdamplQbOkfDpyIBb5C4m+fWACAsIBTtVKyxYh
   eLmWgaqNDHcoqvNTqJAGJTgfsETcY8lkMpiMOx+E0jBMSbFoI73yaUUyW
   Qw3NlXYZKdCVXu3LUy7CMTuoUwnDc1wQI6XQyk8NjbBj2CS/OTR4Y/1u6
   fEFZgFHyOc1jBllGUcZCnud+CE6n1ETwBIVkamXMP40Xc64N9itv08B+c
   PCDwJWKEvgjkqolB3qY4r9Bq0Yk0VtbEBGDbvWqAUgQFxxe44k0zN//Mj
   g==;
X-CSE-ConnectionGUID: kkKBu5HcQX2yp50rB/xjHw==
X-CSE-MsgGUID: pKp2UuuhTeWt/eYEC3FvFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57148557"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57148557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:13:37 -0700
X-CSE-ConnectionGUID: oy6monnuT7a3uw5gl4+EeQ==
X-CSE-MsgGUID: b4x1RGelRk+4OeMvaniUzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135669925"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:13:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5Rro-0000000DFV6-1Y2S;
	Thu, 17 Apr 2025 19:13:32 +0300
Date: Thu, 17 Apr 2025 19:13:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 02/10] pinctrl: core: add
 devm_pinctrl_register_mappings()
Message-ID: <aAEoq6t8Tnts1eFY@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:10PM +0200, Thomas Richard wrote:
> Using devm_pinctrl_register_mappings(), the core can automatically
> unregister pinctrl mappings.

...

> +int devm_pinctrl_register_mappings(struct device *dev,
> +				   const struct pinctrl_map *maps,
> +				   unsigned int num_maps)
> +{
> +	const struct pinctrl_map **ptr;
> +	int ret;
> +
> +	ptr = devres_alloc(devm_pinctrl_unregister_mappings, sizeof(*ptr),
> +			   GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	ret = pinctrl_register_mappings(maps, num_maps);
> +	if (!ret) {
> +		*ptr = maps;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return ret;

Why not devm_add_action_or_reset()?

> +}

...

>  extern int pinctrl_register_mappings(const struct pinctrl_map *map,
>  				     unsigned int num_maps);
> +extern int devm_pinctrl_register_mappings(struct device *dev,
> +					  const struct pinctrl_map *map,
> +					  unsigned int num_maps);

No extern, please. Perhaps a clean up patch to remove existing ones?

>  extern void pinctrl_unregister_mappings(const struct pinctrl_map *map);
>  extern void pinctrl_provide_dummies(void);

...

Test robot wants you to add a forward declaration

struct device;


-- 
With Best Regards,
Andy Shevchenko



