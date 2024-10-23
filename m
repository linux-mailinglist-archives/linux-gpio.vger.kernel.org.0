Return-Path: <linux-gpio+bounces-11856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 750529ACC62
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 16:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 368FA284682
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 14:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333801CB32E;
	Wed, 23 Oct 2024 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFHzP+Mu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4CD1CB317;
	Wed, 23 Oct 2024 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693825; cv=none; b=F9ckw8uSM3qI1DnEEP6V87WRJ3gBidFGClx5/I8Hv1MoTwk3g077NrEQDin520/8kGrdIKiXhOOJcDlnn48/OgAGu1GH8vv2AXwlN+mjGQQWSGrvNhtgVmi+mHsc0m8GrlLsDspU3pOpKZClimjdGqWrwEBIU2SBn+8fhkZUaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693825; c=relaxed/simple;
	bh=rlLasSVNBDHv1golWHVmx7SaMwsDJoi84VMO0ePliHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiMEFEWYHa8VEo3PIJk77hZ3pDW3NUS17whuVCTuMhtaEfonwo9TnGPsNmMnnairNrh6kfOD95k7QPvNbQ5wQUNj9tWh1NTnJSpL6dcEeEwq8ximv3LNKwaD3WNTLJvyCcRN5Cl7Cs1OsrpCXfJ7YYX0NsaLlcqMDKn9Q55oa4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFHzP+Mu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8EAC4CEE7;
	Wed, 23 Oct 2024 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693824;
	bh=rlLasSVNBDHv1golWHVmx7SaMwsDJoi84VMO0ePliHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UFHzP+Mu4p/3k5zGsjNOga9fvG63QfeM98hbBZ6tgGKPkF5i6G3KrX4zk4POP0hYW
	 /y26jMBhYGZHGgbmqfvmbPhlxLlT9mK/tIDvqZBC5049iQ0XymV+DrpVqwqvc2rVvC
	 WULalMUOkXsv5Kx8fnp6wxBEaBK8A4y0SBR+U+KtyTOgbbIqryaWxH3BJGPiH66gIY
	 4Ipn1ML7TfMz0x9OSFrBKnWFny1Xeh22Hg7lCr2GccxidbnD2lY4Vf0dLGvX6IMF3l
	 nDvtS9gzpNQANCvEOxEASbCyNo62VYrmMnGIbdUEVQvsMAk/KaXlaLUT4u+FKw0cfd
	 LUUDKBtuyyt3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	andy@kernel.org,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 07/30] pinctrl: intel: platform: Add Panther Lake to the list of supported
Date: Wed, 23 Oct 2024 10:29:32 -0400
Message-ID: <20241023143012.2980728-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143012.2980728-1-sashal@kernel.org>
References: <20241023143012.2980728-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 37756257093bf1bda0bb034f4f1bd3219c7b2a40 ]

Intel Panther Lake is supported by the generic platform driver,
so add it to the list of supported in Kconfig.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 2101d30bd66c1..14c26c023590e 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -46,6 +46,7 @@ config PINCTRL_INTEL_PLATFORM
 	  of Intel PCH pins and using them as GPIOs. Currently the following
 	  Intel SoCs / platforms require this to be functional:
 	  - Lunar Lake
+	  - Panther Lake
 
 config PINCTRL_ALDERLAKE
 	tristate "Intel Alder Lake pinctrl and GPIO driver"
-- 
2.43.0


