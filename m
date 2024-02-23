Return-Path: <linux-gpio+bounces-3710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE1D8611C3
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 13:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DDE81F27EA9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 12:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EFA76C83;
	Fri, 23 Feb 2024 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsUThaTj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389C52B9BF
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708692293; cv=none; b=c5fhKxZvqWpJKS5gfSytpDpr34vaG6TOW5F2EHATIouyevkf3Hx2k3inEd4fmL0H6iGGLz2gg926m+9jaQQckEmokohoaxOogkKDSHR8XA1nWrnIqdaOJuUuYMg01AyBHtAWehU+EqnUR+dzuZ1jyzKSwVo/Pi/ARCFeMTvkiOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708692293; c=relaxed/simple;
	bh=b/UO3jRgroBCiJFXQjAsX/BMig/L0J0hJEBx5Jz0O0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ro4eop39GWtlcg/ok8KItQjoC0ypUuqVXNTqcdSZZOrIgW0oonjx8TlJfdpMLpVOS3bUZBuGIhI747ugNjYtp6Jccmu1GZLPIVrfaAXDnz6ck7pcrADFK+s7t8FcxQTMrtisq4SLl1qAuTw2flP+11RpSVkUiLU0kafGJjXeqiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsUThaTj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708692291; x=1740228291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/UO3jRgroBCiJFXQjAsX/BMig/L0J0hJEBx5Jz0O0s=;
  b=PsUThaTjOPD5C/XFws9+fdqvQ2RlaUd24H2dheHC5tf1QjA0sAOAv7ea
   kRTfb8b0529F+gEPI4hKC769/Jx85VwuZN9HDMoUpOsiLo1XLAQqMch83
   2U/Zlo7CHhI2CwV6+7oa4V/gIx9UtWyXKOZJzmH0VyNyhYQNQOKfnqa34
   bWCsKfmKIyou97KFfZ5XUGKrKV/axvAEhrTGHx27jI61qCjDhsrpu0Fc1
   dED0p2WAMR/f+MyzesQ/jQRx5kPXaKw9zRaxblpL/8fKoroTqs3TlE7U1
   gCGp0l9ZiZ2m/1aOsIIDQYQB8aDQZVPVgAqwxsE4BnG5krKlLpxCznVaw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14415777"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="14415777"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 04:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="10562090"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Feb 2024 04:44:49 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdUup-0007Vs-2w;
	Fri, 23 Feb 2024 12:44:40 +0000
Date: Fri, 23 Feb 2024 20:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: "andy.shevchenko" <andy.shevchenko@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to
 `iowrite64'
Message-ID: <202402232058.4eDf4GRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0
commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/47] gpio: mmio: Support 64-bit BE access
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240223/202402232058.4eDf4GRs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402232058.4eDf4GRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402232058.4eDf4GRs-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/gpio/gpio-mmio.o: in function `bgpio_write64':
>> gpio-mmio.c:(.text+0x12e1): undefined reference to `iowrite64'
   /usr/bin/ld: drivers/gpio/gpio-mmio.o: in function `bgpio_read64':
>> gpio-mmio.c:(.text+0x131d): undefined reference to `ioread64'
   /usr/bin/ld: drivers/gpio/gpio-mmio.o: in function `bgpio_write64be':
>> gpio-mmio.c:(.text+0x1361): undefined reference to `iowrite64be'
   /usr/bin/ld: drivers/gpio/gpio-mmio.o: in function `bgpio_read64be':
>> gpio-mmio.c:(.text+0x139d): undefined reference to `ioread64be'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

