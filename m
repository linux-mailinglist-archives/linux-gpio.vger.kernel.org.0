Return-Path: <linux-gpio+bounces-15946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6441CA34D9D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E0603A4059
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B0624502A;
	Thu, 13 Feb 2025 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jf0AyP2B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CBA241678;
	Thu, 13 Feb 2025 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739471141; cv=none; b=tjCqOCwb5Pl1UqA/e+hqLxIdGKlBFW48yHuncP7WgyO3dHq+6fq9/q4K1w6ZR0Kf9QfM7g75rECIKAbNenoZQLhH8274xxHi9LnKo1AJebbifQZR385Vr88TiB0i6rL0+iWehX20JDXOXPW8ihAF0By2hze7LyuGAQhKWGRzzqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739471141; c=relaxed/simple;
	bh=feGGHOi3zI3MPTYTRwIv47zVrsjrDEIKTSIWX8tUD9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEM8vSfH6zRjIq8LrnpW73BoLbhbas2s4U+qDchYJSsBdt60Q40u6agJsU2ZTIJx4s4hd4nY+kvLJUzFV3ZvjFuiWzifgCrKB31hpVBSkCMrlkjok5dOqABiOQy0oBqbfXU7NDo40LLMv8CefsBTcDDr6wODp0w5IKtOShS36/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jf0AyP2B; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739471140; x=1771007140;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=feGGHOi3zI3MPTYTRwIv47zVrsjrDEIKTSIWX8tUD9w=;
  b=jf0AyP2BUUN13t5lMBpWk8AMKpgQCoSSHxgYNjXKsA5FIhLsii8qrDHP
   wTuAOSkcS0HDnSOdM0aVToLLUINrzFyIvNQjbLKMrbRo/N8PYD28Jalzk
   E6z1BNPCs7PJIJikBO8NVS2VnfZ7lPPARmD8NeB6ofo0FPfc8xxrE05z4
   21ip2gffmo3BRqHr0IvhVhnfSAXPz0gkfHCXl4dRIqKXKiw/g6PX3wNfZ
   Ox5adR2AtMWOTXOw4ZLB2DS9v+gRcPViic+OtBkY+sRfVAhe7NFB3S5ow
   BNSAqCRoCU7nqtCcQQsM97yVgSQGvnhXxQfxwtBdfRvh1ppJdEUHXfV5g
   Q==;
X-CSE-ConnectionGUID: DNrDaqBdSGmJCy8/CMT8Ug==
X-CSE-MsgGUID: q+eYHp8SRkS8X+8jZDTqYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51177673"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="51177673"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:25:35 -0800
X-CSE-ConnectionGUID: 2kv5/gDFTa2LCfXXmvCe7A==
X-CSE-MsgGUID: PQkSx2DlREChrWj3GYuAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113721779"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2025 10:25:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EAC3B1FD; Thu, 13 Feb 2025 20:25:28 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexandru Ardelean <aardelean@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] gpiolib: Make code more robust by using for_each_if()
Date: Thu, 13 Feb 2025 20:23:59 +0200
Message-ID: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of opencoding with long lines, use for_each_if() macro
which makes intention clearer and less error prone.

In v2:
- moved original for_each_if() implementation to the global header (Bart)

Andy Shevchenko (2):
  drm: Move for_each_if() to util_macros.h for wider use
  gpiolib: Switch to use for_each_if() helper

 include/drm/drm_util.h      | 16 +---------------
 include/linux/gpio/driver.h |  7 ++++---
 include/linux/util_macros.h | 15 +++++++++++++++
 3 files changed, 20 insertions(+), 18 deletions(-)

-- 
2.45.1.3035.g276e886db78b


