Return-Path: <linux-gpio+bounces-8928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E26D9598A9
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5B51B232A2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 10:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8E91E792A;
	Wed, 21 Aug 2024 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIq/czgs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11F1CBEAD;
	Wed, 21 Aug 2024 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232214; cv=none; b=dWpgxjWZindRdIhOPcFq8CVnKbxAee62j6qRWUQ2PkMYRQ9u1EwmavQMBs0SC2HnTB/1oKT/N5PIYxd7NJkjvDlOMDrf8CLoJAgYZJ4liq5nu8NZ0Mmy/0HuhcxHs6hyhWQUoKX+ub2cTy3LsEczwdQpTRK9ihlEDtnCDm1zMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232214; c=relaxed/simple;
	bh=t/CSQvrauuMm+CtOl+ntlCgIHDDtGtHS2ZDMZbNdyCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ml92B5lK6gDLOXFl2bzoipYEmJtB8STHLWk6l/vlBMpgO/MOFCrSvysmOI6RADnZdVkz2ybM3dRKJ8LHeWgmNo14q7J8j7cHkx6yEVLAnHArLX0Qc1hR1ZWjSLZWZ1xZBETjd4UisrqperLy+2hek6a22Z/kzDnA4K+IsAeMrHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIq/czgs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724232212; x=1755768212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t/CSQvrauuMm+CtOl+ntlCgIHDDtGtHS2ZDMZbNdyCw=;
  b=FIq/czgsZW0BAKYkCNwGas3HzgNxtkBD26c/TXqAp2CBvTf9lhrkHfeT
   uBfigJjOMgLjoCriCoUxac3smtjLnT3FYN4oK4Jt/HhEg6U4D+zfQK32T
   Ekxj+51f9YJL9OIsuzQ98ReQOEksgwfaLbcanrUqK8idfOnpYNGKBa3nS
   R1t8L9dzY8FyDOXzeUmBHNclllwBJlIB+gHe5xnrhOHboeamJe+rTGUCa
   Oq4O1Ja2QlBj9lRwaR/WRs6vDW0O+XNWIklbZOmQtdnHndRDcKy8CDwM6
   zs/NLnL1F/ki5vguA43HbXdixFiaAD+8NvK4q0yHWP+MeFldDNc70iA3U
   g==;
X-CSE-ConnectionGUID: Ex2hzCZ5QYG8zzERjAjZeQ==
X-CSE-MsgGUID: U7AWMTtUSCKngkaRPvSGpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="40037663"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="40037663"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 02:23:31 -0700
X-CSE-ConnectionGUID: siL8DPxaQxKhLChs3QZt+g==
X-CSE-MsgGUID: RbN4J6lASDiEeCMso/RH+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61570021"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2024 02:23:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sghYm-000B9u-35;
	Wed, 21 Aug 2024 09:23:20 +0000
Date: Wed, 21 Aug 2024 17:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <202408211702.1WVqlgTb-lkp@intel.com>
References: <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20240821-023901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta%40suse.com
patch subject: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
config: nios2-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_RP1-0-0 (https://download.01.org/0day-ci/archive/20240821/202408211702.1WVqlgTb-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240821/202408211702.1WVqlgTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211702.1WVqlgTb-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_RP1
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_RP1 [=y] && PINCTRL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

