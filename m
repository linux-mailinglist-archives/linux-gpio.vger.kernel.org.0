Return-Path: <linux-gpio+bounces-15664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 962DFA2F99D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 20:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C1163AB56D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 19:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2582505BB;
	Mon, 10 Feb 2025 19:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oLHU6J4o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E402505AC;
	Mon, 10 Feb 2025 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739217158; cv=none; b=EtnG5ySVIshxkC+YReJfQ3cmlK0yNAGPrHx57qDQL2K5te1ozdzmFCi8rz3NlStdLEF+gDqwfe08OuiYkhOWRntzWdrJ0OMvGbO36awNO7+jCcDSEWtneEndQcDy9De2npOB+TVE0SCm55Iq3WnXITG3YiYZq6pvEVBP9Jz/ji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739217158; c=relaxed/simple;
	bh=A1smERkQ7tLAEPCrqvp+5IIzk4F01vWVmsR3HQOXMNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUmqvlzuIgjVxSm7aU38AnFNWm5nNlG0QUrXSOZklvgP/UaJxwA8kIBV57puNigr/3S8v4ai4WJOceH25YZGW8ZiNl50IKE8HU7SAHgQlJ3JVHAHmw6pzhWVFJ7q54hWPxI7GHHyFXpgtNw/IJJ7QB4SGpxITLkILYsV6yzKAck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oLHU6J4o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739217156; x=1770753156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A1smERkQ7tLAEPCrqvp+5IIzk4F01vWVmsR3HQOXMNs=;
  b=oLHU6J4oXyxeQtzT443niKF4ucs3NPyQUtiNNvw2j0LNqGvnNC3xZhlB
   rIer/pHZNAap5Dd0xrdxdhtT8RqcfmehKg+j9DiBiwNVaaaG/QYKPKaAX
   +B9EIxQXZoIjS0nOamlaVPTZdGcp9ehqytAOUNrPqp7fBQGzLdYCQ9IKA
   iDfHjcAEjXcWeKvt/9NDsv6VqDsheUHfHPyhrXf84Q+GInvoReG1VxXE3
   dHECSi3+Ik9sXMZm4y1mkVzu49v00zhXWQVfaqzd0CyFbYfm1e2O1rLsf
   N68iHqqutmOR//rhCZXC4Vx9CUUxI1aYPStN6tJmLF0zrqUTQcHshdmBI
   A==;
X-CSE-ConnectionGUID: +WtRKza/QhSJaar4p0/Zeg==
X-CSE-MsgGUID: y9rmVOabSu2QLNba37IJfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40085020"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="40085020"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 11:52:35 -0800
X-CSE-ConnectionGUID: UIjBdXxFRiqVc8DukIR9MQ==
X-CSE-MsgGUID: 3Oml8hwSSJK9uKMxeFskNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="143148720"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2025 11:52:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C517A10F; Mon, 10 Feb 2025 21:52:31 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v1 1/2] pwm: lpss: Clarify the bypass member semantics in struct pwm_lpss_boardinfo
Date: Mon, 10 Feb 2025 21:44:50 +0200
Message-ID: <20250210195230.490904-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250210195230.490904-1-andriy.shevchenko@linux.intel.com>
References: <20250210195230.490904-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of an odd comment, cite the documentation, which says more clearly
what's going on with the programming flow on some of the Intel SoCs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/platform_data/x86/pwm-lpss.h | 33 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/linux/platform_data/x86/pwm-lpss.h b/include/linux/platform_data/x86/pwm-lpss.h
index 752c06b47cc8..f0349edb47f4 100644
--- a/include/linux/platform_data/x86/pwm-lpss.h
+++ b/include/linux/platform_data/x86/pwm-lpss.h
@@ -15,9 +15,36 @@ struct pwm_lpss_boardinfo {
 	unsigned int npwm;
 	unsigned long base_unit_bits;
 	/*
-	 * Some versions of the IP may stuck in the state machine if enable
-	 * bit is not set, and hence update bit will show busy status till
-	 * the reset. For the rest it may be otherwise.
+	 * NOTE:
+	 * Intel Broxton, Apollo Lake, and Gemini Lake have different programming flow.
+	 *
+	 * Initial Enable or First Activation
+	 * 1. Program the base unit and on time divisor values.
+	 * 2. Set the software update bit.
+	 * 3. Poll in a loop on the PWMCTRL bit until software update bit is cleared.+
+	 * 4. Enable the PWM output by setting PWM Enable.
+	 * 5. Repeat the above steps for the next PWM Module.
+	 *
+	 * Dynamic update while PWM is Enabled
+	 * 1. Program the base unit and on-time divisor values.
+	 * 2. Set the software update bit.
+	 * 3. Repeat the above steps for the next PWM module.
+	 *
+	 * + After setting PWMCTRL register's SW update bit, hardware automatically
+	 * deasserts the SW update bit after a brief delay. It was observed that
+	 * setting of PWM enable is typically done via read-modify-write of the PWMCTRL
+	 * register. If there is no/little delay between setting software update bit
+	 * and setting enable bit via read-modify-write, it is possible that the read
+	 * could return with software enable as 1. In that case, the last write to set
+	 * enable to 1 could also set sw_update to 1. If this happens, sw_update gets
+	 * stuck and the driver code can hang as it explicitly waits for sw_update bit
+	 * to be 0 after setting the enable bit to 1. To avoid this race condition,
+	 * SW should poll on the software update bit to make sure that it is 0 before
+	 * doing the read-modify-write to set the enable bit to 1.
+	 *
+	 * Also, we noted that if sw_update bit was set in step #1 above then when it
+	 * is set again in step #2, sw_update bit never gets cleared and the flow hangs.
+	 * As such, we need to make sure that sw_update bit is 0 when doing step #1.
 	 */
 	bool bypass;
 	/*
-- 
2.45.1.3035.g276e886db78b


