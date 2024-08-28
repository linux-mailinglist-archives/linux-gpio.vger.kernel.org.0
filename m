Return-Path: <linux-gpio+bounces-9289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE2696303F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 20:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C3A328120D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 18:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C571AB53D;
	Wed, 28 Aug 2024 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDxOaroe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA531AB503;
	Wed, 28 Aug 2024 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870431; cv=none; b=uPUXuluAexEhEPmSy2WtQiK2XiMndObpQkvQveLL3Zeux5i7aJqQxSax+dP6witujjwPtCTBTAYQ2mzYsHPYnZBTgWcENSJ5/MI6due4UMey2if0NCePZk/wXIZDI9lU7k6KlEuEGDrNcE6r+jv7yDxIRTvyNWUjGZyoxjA3zGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870431; c=relaxed/simple;
	bh=DEG2zDpZcmT7CL/4pnxpHHqX4Y7b5MP4HcXf7NZ1b8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FuHF68F/j9oZArhycmyDSjZmNcRJuVIy8Vm4Px2dzK/1RXvjgG75QxNfT7RnAknTnbIjJGPD6s0v5Ly4YfwQY/A0OasAvnGD5R9b1OWahKAt124iD+oWh7+orx9El9eFmLiX+SncEOFaAfL2OG6khfJgGIWLU5le3nvswE0FAiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDxOaroe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724870430; x=1756406430;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DEG2zDpZcmT7CL/4pnxpHHqX4Y7b5MP4HcXf7NZ1b8A=;
  b=nDxOaroe7IHKGdIwwRp/FZU9k+9lRdMZJ2zyc20R7F8kg5bE+oJZXeNM
   9cYmfJxn4A5juJpku5WlCNWGYaJf6MDm1i65Cmmb1kogakuPwx4rM8hnD
   lXp8v2DI3UKRP4btrZOhOjt6HavxYd8kD4Apq+rarL9knDKhAGYX/wgm3
   DkfEyyM7PqvSkFr/TyRXVPuIEqAgUtTvDZs0lMDVlY41tzVJOjQvkiZqe
   2mR33drECuZ3762tTwSQQplI/N+DiaCZUIP++Dj43j/r9CvUS7xBSvgGC
   7Vk+uqpn6WNuY9jaKMB1qY8ajKT/6lh7iajbm6xi8JhBJtFYf/0Bj5gkt
   Q==;
X-CSE-ConnectionGUID: NHjJ/kZRTo6VJUksVv3ptA==
X-CSE-MsgGUID: ubaRTmxFQaCZN6Iiv4OugA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="13265374"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="13265374"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 11:40:27 -0700
X-CSE-ConnectionGUID: +cxe670gQwS8wXGcVVqK7w==
X-CSE-MsgGUID: MFSHQG4eS7+PcSFzru3rVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63376483"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2024 11:40:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BD4B9143; Wed, 28 Aug 2024 21:40:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 0/5] pinctrl: intel: High impedance impl. and cleanups
Date: Wed, 28 Aug 2024 21:38:33 +0300
Message-ID: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We would need a high impedance implementation for a quirk, so here it
is. While doing this series I also noticed a couple of opportunities
to clean up, hence two more patches (1st and 5th).

Andy Shevchenko (5):
  pinctrl: intel: Move debounce validation out of the lock
  pinctrl: intel: Refactor __intel_gpio_set_direction() to be more
    useful
  pinctrl: intel: Add __intel_gpio_get_direction() helper
  pinctrl: intel: Implement high impedance support
  pinctrl: intel: Introduce for_each_intel_gpio_group() helper

 drivers/pinctrl/intel/pinctrl-intel.c | 239 ++++++++++++++++----------
 1 file changed, 150 insertions(+), 89 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


