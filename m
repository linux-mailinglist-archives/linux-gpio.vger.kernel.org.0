Return-Path: <linux-gpio+bounces-1621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C0817457
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 15:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AC0FB2242A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 14:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA33D3788C;
	Mon, 18 Dec 2023 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZtxbCHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C304200C0
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702911367; x=1734447367;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KGW08nleUKatBjWbY3R2EwuRLeH2E6OEhx9sKmOqzZs=;
  b=HZtxbCHmRSsENK1ZlwCK10ZDGmURKRaQc9CL062ijcb9i8vtQuBu8V7I
   jzYzQyvRFgwXVQwZPZ9QHR8Q7WeixqDYAu7QW8A8lT+CxIl6uj4S2VLxb
   R6A3rX2dks+Dm4SxY20Qub+JielIA+0IcUL685cj6nHcQrtG0uRc0efi+
   2U7L472Y1WsaHQVDT97pQGc5NWH8sizSlJjqhG6422OnMjvNzn35PaVjD
   CjbfpTB4gx+hv5cdPKqQYyBJOJd8Ii4YbHMPMFWL5wNnkjkwRpc+ljIru
   8wl2YsekqJY8G3qLFBmcLWEyQu6jSkRwT6UR/szlnFKCXvEycLMEbqFCc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="17074522"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="17074522"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="809866093"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="809866093"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 18 Dec 2023 06:56:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B506038C; Mon, 18 Dec 2023 16:56:03 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.8-1
Date: Mon, 18 Dec 2023 16:55:53 +0200
Message-ID: <20231218145559.2209291-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linux pin control  maintainers,

Rather big (by amount of touched drivers and overall due to a couple of new
ones) PR for Intel pin control drivers. Has been for a while in Linux Next
without reported errors. Please, pull for v6.8-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.8-1

for you to fetch changes up to ebe7f3393784857c487bf82f86813a8b1384e278:

  pinctrl: intel: Add Intel Meteor Point pin controller and GPIO support (2023-12-15 17:09:36 +0200)

----------------------------------------------------------------
intel-pinctrl for v6.8-1

* New agnostic driver to support Lunar Lake and newer platforms
* New driver for Intel Meteor Point-S (PCH for Meteor Lake-S)
* Update drivers to use new PM helpers
* Use RAII for locking in a few drivers (Raag, Andy)
* Reduce locking scope in some functions (Raag)
* Miscellaneous cleanups (Raag)

The following is an automated git shortlog grouped by driver:

alderlake:
 -  Switch to use Intel pin control PM ops

baytrail:
 -  Simplify code with cleanup helpers
 -  Move default strength assignment to a switch-case
 -  Factor out byt_gpio_force_input_mode()
 -  Fix types of config value in byt_pin_config_set()

broxton:
 -  Switch to use Intel pin control PM ops

cannonlake:
 -  Switch to use Intel pin control PM ops

cedarfork:
 -  Switch to use Intel pin control PM ops

denverton:
 -  Switch to use Intel pin control PM ops

elkhartlake:
 -  Switch to use Intel pin control PM ops

emmitsburg:
 -  Switch to use Intel pin control PM ops

geminilake:
 -  Switch to use Intel pin control PM ops

icelake:
 -  Switch to use Intel pin control PM ops

intel:
 -  Add Intel Meteor Point pin controller and GPIO support
 -  use the correct _PM_OPS() export macro
 -  Add a generic Intel pin control platform driver
 -  Revert "Unexport intel_pinctrl_probe()"
 -  allow independent COMPILE_TEST
 -  Refactor intel_pinctrl_get_soc_data()
 -  Move default strength assignment to a switch-case
 -  Make PM ops functions static
 -  Provide Intel pin control wide PM ops structure

jasperlake:
 -  Switch to use Intel pin control PM ops

lakefield:
 -  Switch to use Intel pin control PM ops

lewisburg:
 -  Switch to use Intel pin control PM ops

lynxpoint:
 -  Simplify code with cleanup helpers

meteorlake:
 -  Switch to use Intel pin control PM ops

sunrisepoint:
 -  Switch to use Intel pin control PM ops

tangier:
 -  simplify locking using cleanup helpers
 -  Move default strength assignment to a switch-case
 -  Enable 910 Ohm bias

tigerlake:
 -  Switch to use Intel pin control PM ops

----------------------------------------------------------------
Andy Shevchenko (30):
      pinctrl: intel: Provide Intel pin control wide PM ops structure
      pinctrl: alderlake: Switch to use Intel pin control PM ops
      pinctrl: broxton: Switch to use Intel pin control PM ops
      pinctrl: cannonlake: Switch to use Intel pin control PM ops
      pinctrl: cedarfork: Switch to use Intel pin control PM ops
      pinctrl: denverton: Switch to use Intel pin control PM ops
      pinctrl: elkhartlake: Switch to use Intel pin control PM ops
      pinctrl: emmitsburg: Switch to use Intel pin control PM ops
      pinctrl: geminilake: Switch to use Intel pin control PM ops
      pinctrl: icelake: Switch to use Intel pin control PM ops
      pinctrl: jasperlake: Switch to use Intel pin control PM ops
      pinctrl: lakefield: Switch to use Intel pin control PM ops
      pinctrl: lewisburg: Switch to use Intel pin control PM ops
      pinctrl: meteorlake: Switch to use Intel pin control PM ops
      pinctrl: sunrisepoint: Switch to use Intel pin control PM ops
      pinctrl: tigerlake: Switch to use Intel pin control PM ops
      pinctrl: intel: Make PM ops functions static
      Merge patch series "pinctrl: intel: Use NOIRQ PM helper"
      pinctrl: tangier: Enable 910 Ohm bias
      pinctrl: tangier: Move default strength assignment to a switch-case
      pinctrl: intel: Move default strength assignment to a switch-case
      pinctrl: intel: Refactor intel_pinctrl_get_soc_data()
      pinctrl: intel: Revert "Unexport intel_pinctrl_probe()"
      pinctrl: intel: Add a generic Intel pin control platform driver
      pinctrl: lynxpoint: Simplify code with cleanup helpers
      pinctrl: baytrail: Fix types of config value in byt_pin_config_set()
      pinctrl: baytrail: Factor out byt_gpio_force_input_mode()
      pinctrl: baytrail: Move default strength assignment to a switch-case
      pinctrl: baytrail: Simplify code with cleanup helpers
      pinctrl: intel: Add Intel Meteor Point pin controller and GPIO support

Raag Jadav (3):
      pinctrl: intel: allow independent COMPILE_TEST
      pinctrl: intel: use the correct _PM_OPS() export macro
      pinctrl: tangier: simplify locking using cleanup helpers

 drivers/pinctrl/intel/Kconfig                  |  21 +-
 drivers/pinctrl/intel/Makefile                 |   2 +
 drivers/pinctrl/intel/pinctrl-alderlake.c      |   5 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c       | 230 +++++-------
 drivers/pinctrl/intel/pinctrl-broxton.c        |   5 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c     |   5 +-
 drivers/pinctrl/intel/pinctrl-cedarfork.c      |   5 +-
 drivers/pinctrl/intel/pinctrl-denverton.c      |   5 +-
 drivers/pinctrl/intel/pinctrl-elkhartlake.c    |   5 +-
 drivers/pinctrl/intel/pinctrl-emmitsburg.c     |   5 +-
 drivers/pinctrl/intel/pinctrl-geminilake.c     |   5 +-
 drivers/pinctrl/intel/pinctrl-icelake.c        |   5 +-
 drivers/pinctrl/intel/pinctrl-intel-platform.c | 225 ++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c          |  32 +-
 drivers/pinctrl/intel/pinctrl-intel.h          |  14 +-
 drivers/pinctrl/intel/pinctrl-jasperlake.c     |   5 +-
 drivers/pinctrl/intel/pinctrl-lakefield.c      |   5 +-
 drivers/pinctrl/intel/pinctrl-lewisburg.c      |   5 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c      |  72 ++--
 drivers/pinctrl/intel/pinctrl-meteorlake.c     |   5 +-
 drivers/pinctrl/intel/pinctrl-meteorpoint.c    | 465 +++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c   |   5 +-
 drivers/pinctrl/intel/pinctrl-tangier.c        |  32 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c      |   5 +-
 24 files changed, 889 insertions(+), 279 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-intel-platform.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-meteorpoint.c

