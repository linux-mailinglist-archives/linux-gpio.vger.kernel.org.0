Return-Path: <linux-gpio+bounces-7116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AFF8FAE2D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 10:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC90D1F28051
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 08:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86E6142E8F;
	Tue,  4 Jun 2024 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="ZgU1iul7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F35142E71;
	Tue,  4 Jun 2024 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.21.196.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717491528; cv=none; b=WI1Y3XjvhnE7yFV9OGIE3oCPgAIzzoWJPggYLPciBzdPrhhvZRx7VFmrqsLPYP/Gy06reWZ8UfDmwcaUZ2n/YFlGCdbHXW0zCyl7N88Awm51/vUpT1dlAmTHxBcB6bS566BWkadkGellSJ00tIC2zexRF1RqCgoOdzu9d8I1SgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717491528; c=relaxed/simple;
	bh=dpIDF/YbBFgO2oSu5RRfW9qIVcr/oCA3zBT1X4KwP0E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=af1g5hVaFo3Q6yxYkm/IWDETCE3/kfVHJAcMbPWbZdWPv0qDRRdhCbro5lcyhyhzcRmCfgp6Owa4cYIw7dqY3uypGpE4WF+uZzNBeco2GY1yONBVwzRqptUL6tfzlJgKW9obiNcANqDs0SxFjlicjKZwMTAlacmZKGNNtng5hxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=ZgU1iul7; arc=none smtp.client-ip=72.21.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1717491527; x=1749027527;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v2V1o2viLXeAgNEK6V7mTUegvdT8n0htUvDVnf6ehNM=;
  b=ZgU1iul7dbKbKzYCQoSgG6SS0W8J+zVzXF8yltIUovy/o+EuPz2zVlNA
   u2jvhOyOuTVMgLn5hCJ0dkHJByg3VFZL0Ut+7ssaRwzf0gwhDZEERu1om
   SZ7D828685x7QVrtnwgevvXuTQ1bgnQWpz1wm5mt6hITHMAZNmYKEjPnY
   8=;
X-IronPort-AV: E=Sophos;i="6.08,213,1712620800"; 
   d="scan'208";a="405470835"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 08:58:44 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.17.79:14198]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.41.97:2525] with esmtp (Farcaster)
 id 41c359f9-cbe6-4d4a-a01f-c2b59da844a1; Tue, 4 Jun 2024 08:58:42 +0000 (UTC)
X-Farcaster-Flow-ID: 41c359f9-cbe6-4d4a-a01f-c2b59da844a1
Received: from EX19D002EUA002.ant.amazon.com (10.252.50.7) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 4 Jun 2024 08:58:40 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D002EUA002.ant.amazon.com (10.252.50.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 4 Jun 2024 08:58:40 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com
 (10.253.65.58) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Tue, 4 Jun 2024 08:58:39 +0000
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id 37E5E20C69; Tue,  4 Jun 2024 08:58:39 +0000 (UTC)
From: Hagar Hemdan <hagarhem@amazon.com>
To:
CC: Maximilian Heyne <mheyne@amazon.de>, Norbert Manthey <nmanthey@amazon.de>,
	Hagar Hemdan <hagarhem@amazon.com>, Linus Walleij <linus.walleij@linaro.org>,
	Patrice Chotard <patrice.chotard@st.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] pinctrl: fix deadlock in create_pinctrl() when handling -EPROBE_DEFER
Date: Tue, 4 Jun 2024 08:58:38 +0000
Message-ID: <20240604085838.3344-1-hagarhem@amazon.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In create_pinctrl(), pinctrl_maps_mutex is acquired before calling
add_setting(). If add_setting() returns -EPROBE_DEFER, create_pinctrl()
calls pinctrl_free(). However, pinctrl_free() attempts to acquire
pinctrl_maps_mutex, which is already held by create_pinctrl(), leading to
a potential deadlock.

This patch resolves the issue by releasing pinctrl_maps_mutex before
calling pinctrl_free(), preventing the deadlock.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Fixes: 42fed7ba44e4 ("pinctrl: move subsystem mutex to pinctrl_dev struct")
Suggested-by: Maximilian Heyne <mheyne@amazon.de>
Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
---
only compile tested
v2: Updated the commit msg.
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index cffeb869130d..f424a57f0013 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1106,8 +1106,8 @@ static struct pinctrl *create_pinctrl(struct device *dev,
 		 * an -EPROBE_DEFER later, as that is the worst case.
 		 */
 		if (ret == -EPROBE_DEFER) {
-			pinctrl_free(p, false);
 			mutex_unlock(&pinctrl_maps_mutex);
+			pinctrl_free(p, false);
 			return ERR_PTR(ret);
 		}
 	}
-- 
2.40.1


