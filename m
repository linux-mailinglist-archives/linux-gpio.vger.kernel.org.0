Return-Path: <linux-gpio+bounces-16331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE93A3E086
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 17:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE525189EE61
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D889206F0C;
	Thu, 20 Feb 2025 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzXns6wX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA62D1FE46F;
	Thu, 20 Feb 2025 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068569; cv=none; b=QooGQL5jRbWl2GKxJfXr2PHv5EcRhCc2cdQTtnOnOyo1HU04EzZBj8cIXkzIrFQxQ4uR8f0anvol9zTPTX2c/ESNqnffigCt/I+SO3fJ+OyVSitpQRdCA+T68zIhvNfp/lP5dD5507kujEOj/Ee+gvjcgEi+qPbY154nzNgHY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068569; c=relaxed/simple;
	bh=ZizhwF/prwc2v8f0MbKp11PKRTGxk53ZE1x8sx5NPYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fA4khR0WfAgkOfsD58d43AaGwKu6fO2p9oqojUszVP6Fd95JN2m7OUo7+QamRqWV7cKX/ykvl08LVrnaJ3RfLepuF2089kZv7Emb0ujX6Qt8o4gMheHzIMKH3rpX5Rg2qOdMXYVOvqpzv7bDC15GymMgYKE7ZmRk1VJSqk4bMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzXns6wX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740068568; x=1771604568;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZizhwF/prwc2v8f0MbKp11PKRTGxk53ZE1x8sx5NPYc=;
  b=jzXns6wXtCjiuA/4WArNKExdHNkJvRCEOu0gIjH/9DCa/eEjkqb/GnEV
   GzGzwDms98bouMdnSKDnjyhljfKTGtAhr5+VVqz0VAFcl15W8bxuga9xl
   JapxIOMSijfbYuVssCTUiOn7BRMiHt9i35ns0acgIyr9u0a5r4wMCCl6T
   39eNGTjy2CsOX6waKtqTx8XWcJqpj8R7X+CcYkbaG1iGTamaXi82d4Her
   lX7vD0/Rj8qsp0bEnkVl1esYf5rv6cM3GHgmjK5xwzBsWYspMubNMvoqx
   Z69edw749bAIQjG6qy5bk994hx7WJk+JyBXrB89t1U5wGqLWU+9/kjYb7
   w==;
X-CSE-ConnectionGUID: WajsKgfhTKGGbSp8U54Hvg==
X-CSE-MsgGUID: JUMuK4L9TD2NLkTKRGQ45g==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40043968"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40043968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:22:45 -0800
X-CSE-ConnectionGUID: gKfbFocXTxegozFRGIuW3Q==
X-CSE-MsgGUID: cTRgpcheTj6H1RzSRz+ICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115061335"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2025 08:22:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A51ED2D0; Thu, 20 Feb 2025 18:22:40 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/3] gpiolib: finish conversion to devm_*_action*() APIs
Date: Thu, 20 Feb 2025 18:20:25 +0200
Message-ID: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
calls. This mini-series is for that. The necessary prerequisites are here
as well, namely:
1) moving the respective APIs to the devres.h;
2) adding a simple helper that GPIOLIB will rely on;
3) finishing the GPIOLIB conversion to the device managed action APIs.

The series is based on another series that's available via immutable tag
devres-iio-input-pinctrl-v6.15 [1]. The idea is to route this via GPIOLIB
tree (or Intel GPIO for the starter) with an immutable tag for the device
core and others if needed. Please, review and acknowledge.

Changelog v2:
- dropped actually unneeded patch (Raag)
- rewrote last patch as suggested (Raag)
- collected tags (Raag)

Link: https://lore.kernel.org/r/Z7cqCaME4LxTTBn6@black.fi.intel.com [1]
Cc: Raag Jadav <raag.jadav@intel.com>

Andy Shevchenko (3):
  devres: Move devm_*_action*() APIs to devres.h
  devres: Add devm_is_action_added() helper
  gpiolib: devres: Finish the conversion to use devm_add_action()

 drivers/base/devres.c         | 11 +++++
 drivers/gpio/gpiolib-devres.c | 90 ++++++++++-------------------------
 include/linux/device.h        | 38 ---------------
 include/linux/device/devres.h | 41 ++++++++++++++++
 4 files changed, 77 insertions(+), 103 deletions(-)


base-commit: 9deb15de8ca27cf9cba0d2bac53bbe37c836591b
-- 
2.45.1.3035.g276e886db78b


