Return-Path: <linux-gpio+bounces-29252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E3CA3906
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 13:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C54D3008482
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 12:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3E82C11D9;
	Thu,  4 Dec 2025 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S14wUThV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2708933E371;
	Thu,  4 Dec 2025 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764850289; cv=none; b=j9E2kU7SCF3wRDFT/gVREy3tgIT+lWVhyQPb4M5Q1z+Nze3vFOa/zbMLFJeEOZtTfPH87XDIp8G7iJw/hNY3LQ52G0QzegzPrtcZmNyIXXaVi00xWH4lgO7M86xVXkerM00az64phYyXmNOjul4DZfqLjxkFKmPofeVurORXEJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764850289; c=relaxed/simple;
	bh=dVJYtUojdB3YgxG9G+0MwCPm8dNZ2Sl3DAr01aG8fp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIlHs/gtf3UKurDid5ifRhpgCS3CtUURMIDnMEyfK0yjoI2teJhZDainN//auA0KrME6WVFl9X0v5wu1KtQ4DrlIPN5XT5a+n4aDfvqPoUWoIdrwo5iytEa55nDdt4Qbz0M2xfjbsQFgTPZN2begXbvQ58OKcxNB1UexwdKgY/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S14wUThV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764850288; x=1796386288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVJYtUojdB3YgxG9G+0MwCPm8dNZ2Sl3DAr01aG8fp8=;
  b=S14wUThV7QvusnWIhBgmxE+4Hg2csWqorRCezcGzBjbJNd5eMIYifMkd
   SIBbUwRwht8xGvALoQc5YTNrhxS7+uN2BCE22/0WbAuxz4XxlDcw9BcoC
   KD1WWQMujMYTmnHghfQsr5QeCSxJABaaGeiEB6IkhbvQgLvqya7XylMZf
   HewTltj0m9oZ3Nb39Zq6qRAN4YoovyxheOQ5ynCgKbOCcM4uJQWwjhUQz
   Psk9DmWjSr6/LqnYiIAu/hpgeAqUlkv1iVF9euQMJb+JVSbdomWki4eip
   TG6V3j6BIFZxe+O17tKSnu2Zh374YJil0FfQ50AO8H7dQWaUUs4rK/zDn
   Q==;
X-CSE-ConnectionGUID: 37R1nSz4TPOTQ4ePQi1nhQ==
X-CSE-MsgGUID: 2iVNdEbARvOgElcNruiB0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78217321"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="78217321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:11:27 -0800
X-CSE-ConnectionGUID: jkULcuBWRbyRt8Ocq6v+og==
X-CSE-MsgGUID: e7yl/3IFTDWXb7OkJOnx5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195077792"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:11:24 -0800
Date: Thu, 4 Dec 2025 14:11:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Yulin Lu <luyulin@eswincomputing.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: add CONFIG_OF dependencies for microchip drivers
Message-ID: <aTF6ai3PCK6B_EJI@smile.fi.intel.com>
References: <20251204095024.1031947-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204095024.1031947-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 04, 2025 at 10:50:14AM +0100, Arnd Bergmann wrote:
> 
> The two newly added drivers fail to link on builds without
> CONFIG_OF:
> 
> x86_64-linux-ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pinconf_generic_dt_node_to_map_all':
> pinctrl-pic64gx-gpio2.c:(.text+0xc9): undefined reference to `pinconf_generic_dt_node_to_map'
> x86_64-linux-ld: drivers/pinctrl/pinctrl-mpfs-iomux0.o: in function `pinconf_generic_dt_node_to_map_all':
> pinctrl-mpfs-iomux0.c:(.text+0xc9): undefined reference to `pinconf_generic_dt_node_to_map'
> 
> Add a Kconfig dependencies.

This will reduce the compile test base. In other drivers we usually put
ifdeffery in the code.

-- 
With Best Regards,
Andy Shevchenko



