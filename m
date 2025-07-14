Return-Path: <linux-gpio+bounces-23206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7FB0399C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 10:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E713A9BB2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 08:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A3B236A9F;
	Mon, 14 Jul 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ryc56FAA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED87464
	for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481977; cv=none; b=GzSgbfkNlZEWJL7b0L1JPw4rIfNWE/pn8YZxB1E0g99dZUa206Z7sSZyQihPZhIcfvRuY4gnFKWmWJLz196WtB+AwIKk2sfYWRZk4bf1FTvMZVWMtGE+MLJix7EY5qL9zb/J05R8HsFflnF085A0hDgCiLbFLcFZ8lOu5K/peMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481977; c=relaxed/simple;
	bh=tOzCB4tvfWEkzn8q1AwI6+lc6TQgqnJs9+lWsJftkew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NcIC0oyykZVS4/kpLRHKn/89DUu3EFzoSw0zwI/k7HZfVRgLhh7Zuzoao3Btezp8p/02Pi5C15O9tI8uvHIkQbCF7AuQvI3kmRRrXRNEU/Po+WcT/tvsm2Ds5O5Z3L+KsvrGjwT85c/7h29Vv5X4Btl9M+ZOzeM3Z3QnldNRSPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ryc56FAA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752481976; x=1784017976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tOzCB4tvfWEkzn8q1AwI6+lc6TQgqnJs9+lWsJftkew=;
  b=Ryc56FAAciBRgLCLD7y1PHDfqpqptlsYb6SK6ZfnFIzJ5TUT9N8rJbxS
   9licnTX4ZcgXHtuvYbMwn1NZlNiXRJastUCbRscC1NPZmJnhsM8EvfAYO
   W8v7QZW51M2d29OUnCDv94/K1sT2QdXXT2/IG+HsdOfLznCWDOKgwjYPJ
   Qut4XLPfYQdwXS6DHNsRv7LYqrhRHdoOG86iKAYt6GZT1Jee0kpZ5zt+g
   eUmAognZaADzr+434AXFnDZBSTEshAdE68eBeVj6kq+a7gE/+aBCf1M0r
   bpjk7iEv3GCVcMYWQNS3VVDCiPjvWE4Y2HSdzgCbXcaK/IOSF0f/d+uAI
   A==;
X-CSE-ConnectionGUID: OUwMQ904Rt+TfyqkLNsNQg==
X-CSE-MsgGUID: Zo7WN5sbQMqqtsNefdXIaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54604119"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="54604119"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:32:55 -0700
X-CSE-ConnectionGUID: TCFAvHHHTxea9dUWF5JnlA==
X-CSE-MsgGUID: OhH7W+K4S3eNCb0I58J/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="162545601"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 14 Jul 2025 01:32:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0FF95152; Mon, 14 Jul 2025 11:32:51 +0300 (EEST)
Date: Mon, 14 Jul 2025 11:32:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.16-2
Message-ID: <aHTAs5TtETHMUw-Q@black.fi.intel.com>
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

Only a single quirk for this cycle which was in Linux Next for a few weeks.
Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.16-2

for you to fetch changes up to 9ab29ed505557bd106e292184fa4917955eb8e6e:

  gpiolib: acpi: Add a quirk for Acer Nitro V15 (2025-06-09 23:09:24 +0300)

----------------------------------------------------------------
intel-gpio for v6.16-2

* Add a quirk for Acer Nitro V15 against wakeup capability

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: Add a quirk for Acer Nitro V15

----------------------------------------------------------------
Mario Limonciello (1):
      gpiolib: acpi: Add a quirk for Acer Nitro V15

 drivers/gpio/gpiolib-acpi-quirks.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
With Best Regards,
Andy Shevchenko



