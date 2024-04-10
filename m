Return-Path: <linux-gpio+bounces-5277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1329B89ECE9
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 10:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5F4F1F211C2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 08:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C1D13D294;
	Wed, 10 Apr 2024 08:01:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06013D273
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712736093; cv=none; b=f/XF0fN0QRi4RcUXDGkUpAVBIKovzJNRUHviyFUAvd5GwJKfhQkkSszlSGkoBUqKgiFEIwb5KV+9lMMzg5WMARhWViD90iAHmQ1u0F2kRmgEq5JDOupfGigV/ITVJtXrPJnASxHQBgspWNu4exCIDENfJpWTKnUXoh1/Tz0QnK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712736093; c=relaxed/simple;
	bh=J6cK7JRT5ncty4tNdgcRsQwruNPmQoaZS8U8nhSi2ao=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY7eiuJpc1DE9AaK22aZg4AybtKo3X/bnrBpcnC80afKpDkkiWR6pwg0NMPAjISFS+iZVuoY+OEqQvf0XZI7xL7ihmLQFAynoEM8m4kw7lmZZyDozXK0NP2MTWYwZ5xOvzmGVQBMVEfMWItaGCRb5lM/Zis/yE4eW+XazeWGZz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 84f589d2-f710-11ee-abf4-005056bdd08f;
	Wed, 10 Apr 2024 11:01:22 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 10 Apr 2024 11:01:21 +0300
To: kernel test robot <lkp@intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 3/3] spi: cs42l43: Add bridged cs35l56 amplifiers
Message-ID: <ZhZHUfbqLIu0U78m@surfacebook.localdomain>
References: <20240409132126.1117916-4-ckeepax@opensource.cirrus.com>
 <202404101443.tYCaeZAm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404101443.tYCaeZAm-lkp@intel.com>

Wed, Apr 10, 2024 at 03:42:35PM +0800, kernel test robot kirjoitti:
> Hi Charles,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on broonie-spi/for-next]
> [also build test ERROR on brgl/gpio/for-next linus/master v6.9-rc3 next-20240410]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/gpio-swnode-Add-ability-to-specify-native-chip-selects-for-SPI/20240409-212316
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> patch link:    https://lore.kernel.org/r/20240409132126.1117916-4-ckeepax%40opensource.cirrus.com
> patch subject: [PATCH v4 3/3] spi: cs42l43: Add bridged cs35l56 amplifiers
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240410/202404101443.tYCaeZAm-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101443.tYCaeZAm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404101443.tYCaeZAm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/spi/spi-cs42l43.c: In function 'cs42l43_has_sidecar':
> >> drivers/spi/spi-cs42l43.c:262:50: error: invalid use of undefined type 'struct acpi_device'
>      262 |                 ret = acpi_get_local_address(adev->handle, &function);
>          |                                                  ^~

Oh, yes, this should take ACPI_HANDLE_FWNODE() (and the adev will gone AFAIU?).

-- 
With Best Regards,
Andy Shevchenko



