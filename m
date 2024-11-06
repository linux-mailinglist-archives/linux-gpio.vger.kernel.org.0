Return-Path: <linux-gpio+bounces-12637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BBB9BEF78
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 14:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D6C41C21735
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 13:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1581E04B2;
	Wed,  6 Nov 2024 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMmaDPjc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256031DEFD7
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730901139; cv=none; b=UqzOCZFU55LxrRcnnnDICy1b21I8dSxtQqdOjCw4v2aUGCVEIDs1otK3T/63vRvjSWb2rCXMIi3DePESbeDo+2FxTpO3KAYsjAuZHhQPX4M7JS+Mjxf18/RusQODKG6nVDbAnS+OCm4NT7WRtlOEShkUg4Dpfn6jPlt2kVqTGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730901139; c=relaxed/simple;
	bh=+b2+1w07axwNFczIGcUozL/LbFLgGfr7xipjYWkJjmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVOw8M+IxeBG1Jgb4+X3wnfH/fGWF1QhjHi5R3IM5eMd4FnNaoagc1g+Y0n18yTMbX3TOCNq9u60+C23FCPNnrJrrodrqLLyXzmLpOW16HyFb2mMpMd3oo7ilTPXesTu48jE9k/3tcPI37Cg5kL4gvu6u/yN7PVfhQLNLlukXhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMmaDPjc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730901138; x=1762437138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+b2+1w07axwNFczIGcUozL/LbFLgGfr7xipjYWkJjmI=;
  b=JMmaDPjc4YPubafD3rrMoCcCpl0bqSWWcUzZDNAgzpIjhJlHQelCy68v
   gfuxsQcW5E3LdyyW4m7r7qe1yA00sUjC+oh7Orspk5W+PAI4tEWCpWBGZ
   UqQHvuyDxt7lh9Jlj8oF+podYIoCNiXGE94WetyTQ/O33bUpTmaY4kNWP
   jcda8nPF2ZlH5vtEZ1D/D6LQJcbgZ9gBtAJnK1dNk0kWndIrkbk+3oI+U
   +veAH55gNCXVBBHsSu37HyXeO71HaFY2F3k/WaNHmtAoXan+BB9jxUx7U
   ykvJUajWTDmeYSMmrAUPRI+sikUZEA058utstu1Xdfzqrio1XWLQyNqQo
   w==;
X-CSE-ConnectionGUID: 7DmmVfSrRLCL+PflHiaz0g==
X-CSE-MsgGUID: B/rgtbx/S8SdL+nhphaDWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30126668"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30126668"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:52:17 -0800
X-CSE-ConnectionGUID: XKMArky+To6TJUbQKi9iFA==
X-CSE-MsgGUID: Tmh+TeTfQ/GN8t8o2TF3Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84100895"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2024 05:52:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4009C230; Wed, 06 Nov 2024 15:52:15 +0200 (EET)
Date: Wed, 6 Nov 2024 15:52:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.13-1
Message-ID: <Zyt0j1MZe_o7ViyK@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi Linux GPIO  maintainers,

Tiniest update for v6.13-rc1 for GPIO ACPI code. Was a few weeks in Linux Next
without any problems reported. Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.13-1

for you to fetch changes up to 12b0e305f50988b0c75f052f86d51b5353108ca5:

  gpio: acpi: switch to device_for_each_child_node_scoped() (2024-09-30 14:25:54 +0300)

----------------------------------------------------------------
intel-gpio for v6.13-1

* Use device_for_each_child_node_scoped() in ACPI routines

The following is an automated git shortlog grouped by driver:

acpi:
 -  switch to device_for_each_child_node_scoped()

----------------------------------------------------------------
Javier Carrasco (1):
      gpio: acpi: switch to device_for_each_child_node_scoped()

 drivers/gpio/gpiolib-acpi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



