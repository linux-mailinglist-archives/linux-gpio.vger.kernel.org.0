Return-Path: <linux-gpio+bounces-23698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4CDB0F50A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 16:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AEB11C869A6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 14:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBE52E7630;
	Wed, 23 Jul 2025 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfXjum3+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF52283138;
	Wed, 23 Jul 2025 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753280167; cv=none; b=MYS88TOOqcvyty1F8w79Hqaa4QkcxPWX2sI9xYotOlYfuPBy5Dpf6G/oPdCisDwC3cy7i/uZ/0sNwJRhOr9rY1ISU01sl46KV5IVlxy7L0VIOnXpBxl6fKWCvKfvtrCbBi0Fe5cw1vFJ6HewdTmQv6SkHtxYN2T0C8kzV8WvAEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753280167; c=relaxed/simple;
	bh=gdg3yubKvZuSoKpb+Megb/w2lvlgTJOOlMInvqzCRLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEZMYwk/L1LSAjJeDTimFFnZG1ppPk+y/TgrKoeb3NfgjopleaDMhGuZMmRflOaakjmjRIrHVCZYQK1JHRuLf8sEXhM0pBuxHlZdzKhqMkLAzK+Gc2IHdld/hX78ZPPQwHK0TvtLRHnTbuoXgd3TpJSAQVzmjewdgS9x/G7JRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfXjum3+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753280166; x=1784816166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gdg3yubKvZuSoKpb+Megb/w2lvlgTJOOlMInvqzCRLY=;
  b=BfXjum3+KEPTs81B20judLql/oiAoCE1AQnxmThwKQ2YnlMezqmCKBhO
   kFfKiwEF+I/ptsbSgeMjhs40WrGY8RtANUGipIVGVXcpA4Z2uVHQpJFIH
   dlYpD04UDFFDxWwujughThsVsaBZjJ7mhpEauOjDWLkrKTIC48miujsGf
   3qiiXDMtYkH9Y5H00KXStkcw3S4IjJCSfinPBrFh+fL/P1ya1umRUM5D/
   3DtZlHHWhGTl/6szsv0zDgbpYW4mhTMJnlGBldqpvYTFKXcJVDkwTrYph
   beQ7jZvRuM2sgua3/EUkZ+olYmDXwgoyf/nIN0mkE+GCblSdW04xO+CaM
   g==;
X-CSE-ConnectionGUID: rXtE1gDbS1CiwfBjLp12dQ==
X-CSE-MsgGUID: A2JHMoy+S1yA96bWbkdwjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66636903"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="66636903"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:16:05 -0700
X-CSE-ConnectionGUID: ez9PgGFwSjCzgkaQSsjnEg==
X-CSE-MsgGUID: sgPKVpYUTDigY8A5TKyUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159936583"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:16:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ueaGF-00000000JIN-02ws;
	Wed, 23 Jul 2025 17:15:59 +0300
Date: Wed, 23 Jul 2025 17:15:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	Peng Fan <peng.fan@nxp.com>, Lee Jones <lee@kernel.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: make legacy interfaces optional
Message-ID: <aIDunk2sw4DSDgV3@smile.fi.intel.com>
References: <20250722153634.3683927-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722153634.3683927-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 22, 2025 at 05:35:43PM +0200, Arnd Bergmann wrote:
> 
> The traditional interfaces are only used on a small number of ancient
> boards. Make these optional now so they can be disabled by default.

...

> +#ifdef CONFIG_GPIOLIB
> +#include <linux/gpio/consumer.h>
> +#endif

>  #ifdef CONFIG_GPIOLIB
> -
> -#include <linux/gpio/consumer.h>
> -

Why is the above needed to be changed?

-- 
With Best Regards,
Andy Shevchenko



