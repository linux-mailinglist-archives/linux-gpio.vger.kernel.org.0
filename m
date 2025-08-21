Return-Path: <linux-gpio+bounces-24760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA23EB2FF52
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 17:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323CBAE7257
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 15:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2869E31CA78;
	Thu, 21 Aug 2025 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2Wq8P83"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A49F2FB605
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790975; cv=none; b=ZVfT4KRzoqSwu25VW6B/g+ejW0CHX+4hDy3ltT04scTmnIYkT9WuNzyGtPCe7eENc9UfFPrq+VFBJmQt1fuV2bHXHdUqp9hMR5r1PIuq2TbvEBbua0oyKD2pVWbvZTQXeh5ESvoE+VJsTNpuJ5YLqzGusIXmAVyRLqQja+C2NYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790975; c=relaxed/simple;
	bh=ulaKKuMFEh3GN08F3YvQ8Hhzx649cNmHCD6Ci/OtU3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTaMKsQMfB2H0TCNZdyOt5ouN4geX131WTKfh+Cn0jV37TJNjPWqaqJ4/8vLHZIhnjU/iiI9PcOx09kGcNYCg3ZhYEPpJ1+kiwwBROV0TjlmC6C9mZXdzEtLvAEKuyXQapU7WEZa0YznrBiLeCuryxURo/uM5b+9yyHxwN6w0q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2Wq8P83; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755790974; x=1787326974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ulaKKuMFEh3GN08F3YvQ8Hhzx649cNmHCD6Ci/OtU3I=;
  b=O2Wq8P83rYAyuv/iUs2Sga43Q8eE+D1GFTFzzNSlGJtS7W3TeTvbq5NB
   3xXTTogPFmP+iv9vwNIclkvUp+PKR4UbDLQ3GWkXhPKYKL5f15fe1WZqG
   FmKZpie78GDpqPNoz9TS7bS0/7b6yexOofAJriVdgnbWfp0SWy1OdK2Uj
   DtAw8oiTOUdgJxgu3xLJuC2nFS5bNWYl8n/A8n7me44/QBDkvqwLVtWSx
   VsoVYUFv0+zPa4n0IgFpEtFvRLnpkfyRDUdqmBu9Sha7aAXGwiqgCV479
   S7PvVt2stjoFP/jNyHrvZ1mG+O4V7YVEGaou9IL5qaoHG80HASkiNBTLo
   A==;
X-CSE-ConnectionGUID: Ix0zbzbhS3+nee+8E13sgQ==
X-CSE-MsgGUID: EI79HnH1SqifM0NfIPq4Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68683958"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68683958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 08:42:54 -0700
X-CSE-ConnectionGUID: 1aZbdN/3SE6C3y6qQdF+RA==
X-CSE-MsgGUID: KnpHtS3QSX6HTdhLvYit6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199424511"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 08:42:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1up7RB-00000007H8L-2NEU;
	Thu, 21 Aug 2025 18:42:49 +0300
Date: Thu, 21 Aug 2025 18:42:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Basavaraj.Natikar@amd.com,
	Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: amd: Don't access irq_data's hwirq member
 directly
Message-ID: <aKc-eRIeLP3DOjQN@smile.fi.intel.com>
References: <20250821144942.2463014-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821144942.2463014-1-superm1@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 21, 2025 at 09:49:11AM -0500, Mario Limonciello (AMD) wrote:
> There is an irqd_to_hwirq() intended to get the hwirq number. Switch
> all use to it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

>  	pm_pr_dbg("Setting wake for GPIO %lu to %s\n",
> -		   d->hwirq, str_enable_disable(on));
> +		   hwirq, str_enable_disable(on));

Not related to this series, just wondering if it makes sense to have this to be
in IRQ chip core (OTOH, it will not tell about GPIO per se, just about an IRQ
chip).

-- 
With Best Regards,
Andy Shevchenko



