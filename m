Return-Path: <linux-gpio+bounces-7101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F11078FABB9
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 09:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8953AB24CB2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 07:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624DE13FD92;
	Tue,  4 Jun 2024 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="pBijYBAz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com [52.119.213.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D031384B3;
	Tue,  4 Jun 2024 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717485549; cv=none; b=K8GD+O7gJRtJcCY1uuGApDi1S4HxIfyjuUwTYCsFRlGUay28XQYkk0BQWrd+LQTIw+aQ8I7zyiELi/hivt/+FS5ihmX11hIKZeLl5EIZocb8D7bfj4ZdeUpeaNBtDzHBR+6B7+vhmdz308dnkjBQlEULjxW5k0+s4OvZTeLrlvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717485549; c=relaxed/simple;
	bh=xrGEEFvoeXT5v2MKDHwCNgGHXWgoxI6p1f8dDx6tgUg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ExV3z3t/JaDY1a/uD8RJoyjJU5l+TuBZTo/n68otGI2LhO7NwkEh3ZiIv8VURerBEop0YQfMNKXGtHYfu55N9FoPSrNe2ipQYuXpe+9lrdVrNJsCLa0c2Vh4QOOokbRN2NGFNF9zO2Yy15tS15ilMY8OrVoQvNN8w1LOpY2jEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=pBijYBAz; arc=none smtp.client-ip=52.119.213.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1717485547; x=1749021547;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kclrf8KySIptVgJEtPJnsHbvRaXwlOgrkvZYDe1s2Ao=;
  b=pBijYBAzLrhqFpEp7cTNTIt2mKt9aBDg8fY32cblg3jX/kJxEQSRA3be
   0xTiRzzcsMKBYsjM/3T5m7jSk87oHaFPiGLDC7+++e2zrCUL3WYtxBsbf
   OZdhSLFBaDzCkWAHBA17EhSh0mIHs/IYI+BGN7k5O153H8v984Ao9eW93
   A=;
X-IronPort-AV: E=Sophos;i="6.08,213,1712620800"; 
   d="scan'208";a="637067064"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52002.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 07:19:05 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.10.100:9626]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.6.62:2525] with esmtp (Farcaster)
 id a4b5c5d6-02c3-4a6a-9783-2c0d9fef58cb; Tue, 4 Jun 2024 07:19:04 +0000 (UTC)
X-Farcaster-Flow-ID: a4b5c5d6-02c3-4a6a-9783-2c0d9fef58cb
Received: from EX19D008EUA002.ant.amazon.com (10.252.50.179) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 4 Jun 2024 07:19:03 +0000
Received: from EX19MTAUWC001.ant.amazon.com (10.250.64.145) by
 EX19D008EUA002.ant.amazon.com (10.252.50.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 4 Jun 2024 07:19:03 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com
 (10.253.65.58) by mail-relay.amazon.com (10.250.64.145) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Tue, 4 Jun 2024 07:19:02 +0000
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id 7F73220C65; Tue,  4 Jun 2024 07:19:02 +0000 (UTC)
From: Hagar Hemdan <hagarhem@amazon.com>
To:
CC: Maximilian Heyne <mheyne@amazon.de>, Norbert Manthey <nmanthey@amazon.de>,
	Hagar Hemdan <hagarhem@amazon.com>, Linus Walleij <linus.walleij@linaro.org>,
	Patrice Chotard <patrice.chotard@st.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl: fix deadlock in create_pinctrl() when handling -EPROBE_DEFER
Date: Tue, 4 Jun 2024 07:19:01 +0000
Message-ID: <20240604071901.3343-1-hagarhem@amazon.com>
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

Fixes: 42fed7ba44e4 ("pinctrl: move subsystem mutex to pinctrl_dev struct")
Suggested-by: Maximilian Heyne <mheyne@amazon.de>
Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
---
Only compile-tested.
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index ee56856cb80c..29d9ef535dbe 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1102,8 +1102,8 @@ static struct pinctrl *create_pinctrl(struct device *dev,
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


