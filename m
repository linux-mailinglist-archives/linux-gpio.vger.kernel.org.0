Return-Path: <linux-gpio+bounces-16318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5BA3DC60
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D22F77A2C8E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70181FE444;
	Thu, 20 Feb 2025 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Das1GRCt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41E71FCCE9;
	Thu, 20 Feb 2025 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061015; cv=none; b=VafdQyPl5PtaT0Yg7dCkHOb05tUdlI3jRXxcCA09VJc6mSh+xU0d/85YpqsP9/JdDHpkQxv2Z2RCoCHIoGGYt3IDM4NwMufjq4LmTVidjC+Ctrrc+ofbjA1ud8fkYXNC5jelfB4DTeKlNQq26P3B86ZGwHCiniUIdY85l3jUpqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061015; c=relaxed/simple;
	bh=s7VjF6617+n9tFAkxx2f2oZrFvw0Wa/Dbzzdv/P8Ge0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyBHorMkHR7ofiXF7CiCUEQ8HxtnB9FrdGhcKnbpAyOdQAud1Qj5n6a/qcKN26im+sSqaCKLQRmQcqPECnacNzSVEEjYL0koHTDuaGMSVk8NHNdK9xC5fat7tN7kZNSgK4WR0x/XmHwdfzFx8NRB3YvfASpT62s4Znk+J2t0aqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Das1GRCt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740061014; x=1771597014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s7VjF6617+n9tFAkxx2f2oZrFvw0Wa/Dbzzdv/P8Ge0=;
  b=Das1GRCtrvtNsIa/GYteS3Fba70bu7wUuQkTAWAqK9rEG1PcehrEEWHk
   kaKztNv0ItvFfIVSFDp/2vA+qwE0CwoC5UuUeXKnIBxHzFVx+H+R+Qn3j
   smIwHj1yawv4ZHhkjC20qi01vZPNBLuMajcUv3BGeA/9efEACRmKeZ4uj
   4b8wW1YkiG7a9D0e2vhO2ialxPMvkm8nOs7EhqFfnps/n5wSPXtEDJPsn
   EHp66aAOwmX4TgPVWti/7KPAJVgonyTAFQF+XFczzKPjCfj+u9DYsVNpM
   K1rksndvJztFexgS86S5+Y1w/GhaQtIoW01fS85p+mu7+kQjUcNAfcIh9
   Q==;
X-CSE-ConnectionGUID: iyLaTUXDRMOyJG1rRfSEHQ==
X-CSE-MsgGUID: glgJjXzzSMqIr8DodpuLEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51458104"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51458104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:16:50 -0800
X-CSE-ConnectionGUID: /+3y9CpmRja/YG4G/knkgQ==
X-CSE-MsgGUID: 0/difwcWTDS7v0vMzVxigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="114883167"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 20 Feb 2025 06:16:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3A9EA123; Thu, 20 Feb 2025 16:16:46 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/4] gpiolib: finish conversion to devm_*_action*() APIs
Date: Thu, 20 Feb 2025 15:44:56 +0200
Message-ID: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
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
2) adding a couple of simple helpers that GPIOLIB will rely on;
3) finishing the GPIOLIB conversion to the device managed action APIs.

The series is based on another series that's available via immutable tag
devres-iio-input-pinctrl-v6.15 [1]. The idea is to route this via GPIOLIB
tree (or Intel GPIO for the starter) with an immutable tag for the device
core and others if needed. Please, review and acknowledge.

Link: https://lore.kernel.org/r/Z7cqCaME4LxTTBn6@black.fi.intel.com [1]
Cc: Raag Jadav <raag.jadav@intel.com>

Andy Shevchenko (4):
  devres: Move devm_*_action*() APIs to devres.h
  devres: Add devm_is_action_added() helper
  devres: Add devm_remove_action_optional() helper
  gpiolib: devres: Finish the conversion to use devm_add_action()

 drivers/base/devres.c         | 11 ++++
 drivers/gpio/gpiolib-devres.c | 94 ++++++++++-------------------------
 include/linux/device.h        | 38 --------------
 include/linux/device/devres.h | 54 ++++++++++++++++++++
 4 files changed, 90 insertions(+), 107 deletions(-)


base-commit: 9deb15de8ca27cf9cba0d2bac53bbe37c836591b
-- 
2.45.1.3035.g276e886db78b


