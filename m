Return-Path: <linux-gpio+bounces-17108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA4DA4FCFA
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 11:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E344168FE6
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8B22309B9;
	Wed,  5 Mar 2025 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsyFrjkj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9437223714;
	Wed,  5 Mar 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172227; cv=none; b=LXW5NsFo6vkijZAYjwCoTZ5aHTwVZRsf4twGSIYcH50GmL+W2IrIZ7cy1lODV2HGGX3IY+ofF66LjqqxUTsYmYUJYjdkYh6MozYlKGq3SsEdV2Ep87V8F13p7HkJfGiF/f5TS32OZz7RjNy2EsYirpLklRXfAix6jD2U59Ji6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172227; c=relaxed/simple;
	bh=WX8dmil2AirHqiEUBrw0AiYasFZtpK3RZuuWUW3dBzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqFc/RKHIvRvaGhFEAmdPysGKgcHGC65+0ZZvld27NqUdkoz7xFVmk43qatYZm1raU6Fmn0fOvkPG76929bUHJ7Jb9RHmIEe4hRFm6elbFnszHOhKzJSnR40pzo9cv8gJwo9I8daxr3rBbCamt0/+kUaOVQL59z3Pe40NFY5RsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsyFrjkj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741172226; x=1772708226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WX8dmil2AirHqiEUBrw0AiYasFZtpK3RZuuWUW3dBzI=;
  b=GsyFrjkjCYC8nQc2TaHUIDIEYp0dPgQ7G8nSwePkUbEsoBlmnrtHwQe8
   5TYOXmy79tG6VyB9oddoM8P4V+iF/BHx86U+x3R1mTDEotzCOoiAVhJ14
   wtfYDfrcaKntwfn9A9s7kOCPLJeIWWbv5Ybwm5ehlFahdVVXpgEfV6NAx
   Uyf8OM6dqPvmsHFChhrktZYXEXFebk9cybHyuRi5/zsDbgixKaXz0s//T
   OEVaJEpa03EKRxuEOrs4Iiy+dmzbUA4ZvQ56Awvna4H5ayrg3myorbgpa
   BGCsV8kfnUFVHhkYxpAK6DX8b+62H9be53R4cI4DJA9WBsssuSQtepP6Z
   w==;
X-CSE-ConnectionGUID: 0ynDwd3WTS25sSRPZoPFoQ==
X-CSE-MsgGUID: Izd3iMrwToqyJxr493D2tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67497646"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="67497646"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:57:03 -0800
X-CSE-ConnectionGUID: Di/Q7k2RSK65jce0wtbufA==
X-CSE-MsgGUID: 2FkXNLdUTT6xks+0slydOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="118483428"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2025 02:56:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B16F6324; Wed, 05 Mar 2025 12:56:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH net-next v4 4/4] dt-bindings: ieee802154: ca8210: Update polarity of the reset pin
Date: Wed,  5 Mar 2025 12:55:37 +0200
Message-ID: <20250305105656.2133487-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
References: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code has been updated to follow what datasheet says about
the polarity of the reset pin, which is active-low. Update
the device tree bindings accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/devicetree/bindings/net/ieee802154/ca8210.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt b/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
index a1046e636fa1..f1bd07a0097d 100644
--- a/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
+++ b/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
@@ -20,7 +20,7 @@ Example:
 		reg = <0>;
 		spi-max-frequency = <3000000>;
 		spi-cpol;
-		reset-gpio = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+		reset-gpio = <&gpio1 1 GPIO_ACTIVE_LOW>;
 		irq-gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		extclock-enable;
 		extclock-freq = 16000000;
-- 
2.47.2


