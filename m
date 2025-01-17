Return-Path: <linux-gpio+bounces-14902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4722A151C0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5882A3AB9F9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1691487F4;
	Fri, 17 Jan 2025 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwPzjUd0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF30194A75;
	Fri, 17 Jan 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123799; cv=none; b=aDH7WK5Dyr7NwmQ1J5+1GPer058UKIsZRrFammvYQnPtmv8p9ditEal97qEhFE+1vSRAdYidWDhq89Wz1DcHSO4Q0k8f4Npjsv7S6L2u5hKS5tWGXg94N7eXEfNzs5XAd3JmJHW9jCZgJDsDErSVTqJWaGH8zwEA9V/KZ+IIhN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123799; c=relaxed/simple;
	bh=9Wmz1zI8hXI0StY74F/i9WoTb5MnW+VzoQWbPjmU8qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+AjrVKPKozoYiRg7t70fdFz6drANfHnDxD6TbEFCut0dlX4L278s98NC0y5r7FqmRAUmmZUH1j36p8yXNH9jkcT8mU4P8Y+eGOFhhRqsza2UcbXmjIx5b/qxpn4+wkaSAHX3tLNE7lGg4EoJ7fFkLVg7NcjvJWDK5JBIurkHxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwPzjUd0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123797; x=1768659797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Wmz1zI8hXI0StY74F/i9WoTb5MnW+VzoQWbPjmU8qs=;
  b=kwPzjUd0c1kZ4qrSpOzU7WAaIfUIBno9xljfeZoUpKbUCu/71L/ZAysO
   vVhpth3IksdZawnslIthoiBZ1w169NQ2Ywlw4pxf1g2WeE0CBL6SZYa3B
   L/qEKadh6XpUyQpIFRKznp3TOFAS2hcH2yWT8PvO65aNN6luKlveN7/Vx
   xv0fM0MnXDTFm315eU8iBkyGT1hQswuGmzJOS7ZBVTmvRcjxHpd0+idmB
   Mo7pQLnjPWXGPKegObwiPwac0B2+V2dGNH0tXA1qVBupCUXKTDla4snmn
   q7dYozHLA57Gx7gEt1rz0T7cYKqzMZwI4BGXgTklF0evawBTdHBi+zBtB
   Q==;
X-CSE-ConnectionGUID: KiktwdILSyKDAIYDXQT/Rg==
X-CSE-MsgGUID: lwgC+vP2SHexfaVQyZ/38w==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792843"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:12 -0800
X-CSE-ConnectionGUID: HSHz9clsSuma3v3RdDm5VA==
X-CSE-MsgGUID: 4HFyIRHFQYGX+0CvTJ1Egg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671228"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CA97C69C; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 14/16] pinctrl: cy8c95x0: Drop unneeded casting
Date: Fri, 17 Jan 2025 16:21:58 +0200
Message-ID: <20250117142304.596106-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'arg' variable in cy8c95x0_gpio_get_pincfg() is already type of u16.
No need to cast it, so drop unneeded casting.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index fc9c6d293198..7f7bc374c2fc 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -838,7 +838,7 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 	if (param == PIN_CONFIG_OUTPUT_ENABLE)
 		arg = !arg;
 
-	*config = pinconf_to_config_packed(param, (u16)arg);
+	*config = pinconf_to_config_packed(param, arg);
 	return 0;
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


