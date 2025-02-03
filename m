Return-Path: <linux-gpio+bounces-15265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A04BA25A8F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 578B83A7A2F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6851620551F;
	Mon,  3 Feb 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpdWZSEU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C92C204F92;
	Mon,  3 Feb 2025 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588515; cv=none; b=gHnvNUjJoGenzA6owsy8xkhAlD7KbFRsjJdueoFqypZ9IkwndXWkFpKArB1O5cxvKvhDMJ4hwGXkrRrO7gt3TdWeLt5XOKcMvB+Av9IyhYbZ2sD9K4cvHWGQ06ONFYWufpaEUx+ZUDorNEHTjzKH5Rd/HelJiPtCS41TVsVo41c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588515; c=relaxed/simple;
	bh=0L4xGt+ieY162LfzxDztAH6RLlBy6Rn+fKnmApOV8CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/xkmJcrmnVfotF4IiSjWkcxfdqhQlppcOmc//Js6fUPPQ+RC7dCNHIS48GX8+wNGPCT8q0kDlaliWsk/fP+z3JpLYv8boxz655ZMyL7qRd/BDM1mittBwGzrn8o+MjLxMkN9wjpvKz06CSdtUqCH7sqLQnptVbFRtDj2vClFws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpdWZSEU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588513; x=1770124513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0L4xGt+ieY162LfzxDztAH6RLlBy6Rn+fKnmApOV8CQ=;
  b=bpdWZSEUrfTTQqfMI86weqbj9la9OVewnnISO2JQ1S5iinWHa4mCUxdX
   OLQpB4/skZuTUDez3WrSr8VobFjKHMlfVU0d9+fScj7yh+r+KFHRY8iWB
   L2AVsdbuYzubqQqjyTFlWQQY982L8cP+sLLdrgzUaKqKHcIburOkR2EZa
   sIf71Co30I1zvSdrbiqzqoeCVsyieU+M8iFy/qCuJQeQtVMwNCydcb2iz
   4yp0eboFlpkNsjrSDOGfukdvr3sRR9f14/jOPc+qxzpCoVIQH9VEFEfjL
   rHbj18J2xcNw1TUHIDNaBWz81rSTwe8gYynj16W84FqpDSeybQlmRrsJL
   g==;
X-CSE-ConnectionGUID: norB9qkEQzqX2bGkywQHNQ==
X-CSE-MsgGUID: UsM7ATUPRu+tF3aEDXnFKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39217684"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39217684"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:12 -0800
X-CSE-ConnectionGUID: /hvWj9N9TxStTCtrXssePw==
X-CSE-MsgGUID: bTtwloBQT4eHnn1Z1atBkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115287400"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 05:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 192335F0; Mon, 03 Feb 2025 15:15:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 10/14] pinctrl: cy8c95x0: Initialise boolean variable with boolean values
Date: Mon,  3 Feb 2025 15:10:36 +0200
Message-ID: <20250203131506.3318201-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'ret' variable in cy8c95x0_irq_handler() is defined as bool,
but is intialised with integers. Avoid implicit castings and
initialise boolean variable with boolean values.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index e02cab05cbfc..0aad4ed79699 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1076,7 +1076,7 @@ static irqreturn_t cy8c95x0_irq_handler(int irq, void *devid)
 	if (!ret)
 		return IRQ_RETVAL(0);
 
-	ret = 0;
+	ret = false;
 	for_each_set_bit(level, pending, MAX_LINE) {
 		/* Already accounted for 4bit gap in GPort2 */
 		nested_irq = irq_find_mapping(gc->irq.domain, level);
@@ -1095,7 +1095,7 @@ static irqreturn_t cy8c95x0_irq_handler(int irq, void *devid)
 		else
 			handle_nested_irq(nested_irq);
 
-		ret = 1;
+		ret = true;
 	}
 
 	return IRQ_RETVAL(ret);
-- 
2.43.0.rc1.1336.g36b5255a03ac


