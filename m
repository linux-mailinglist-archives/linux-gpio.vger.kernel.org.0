Return-Path: <linux-gpio+bounces-9773-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3E96B6EC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7E081F25FB7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA211CF7A1;
	Wed,  4 Sep 2024 09:36:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8E1CF5EC
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442615; cv=none; b=j7cgtKLEcRO2pZlleel49c9GJ+4uUwV0RrUZ56BRpA8EnNk6wG6eCPSehy7ak8uA9rgo9MfICbAAReuyahdSgnnW/L05/IRusyd8hRrRIlJjDlGXWWrOBaeNwAoaUoBXA/fInFZwGm4roQvcLM7h3HdgME62ShydS7BuQDoKNVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442615; c=relaxed/simple;
	bh=KEaGE7fBNTkTu/l0w+xxtf1EvfoDPekvQveJuxw+zY8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=csYC10C5UHaRXihq4Nr1wF32lkiSxzWAK4iH0QeWOIn8591guvNmJwwm0Ft8Dt8K+Mz1+XeqX6C4hm+B7rRj7k0mGXj/sHYtrIF0WEzZCONvq5BD8v6DfnEF4c0GmmzvmhBR5Z8T+lnvrYN3rr9ZKp2J6Vmeh4EOdjiwtZcNwXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WzHS82rZKz1S9VS;
	Wed,  4 Sep 2024 17:36:24 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 405BC1A016C;
	Wed,  4 Sep 2024 17:36:45 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Sep
 2024 17:36:44 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <vz@mleia.com>,
	<linux-gpio@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH v2 0/4] Simplify code with helper function devm_clk_get*()
Date: Wed, 4 Sep 2024 17:23:07 +0800
Message-ID: <20240904092311.9544-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Use helper function devm_clk_get_enabled() and
devm_clk_get_optional_enabled() to simplify code.

Zhang Zekun (4):
  gpio: cadence: Use helper function devm_clk_get_enabled()
  gpio: lpc18xx: Use helper function devm_clk_get_enabled()
  gpio: mb86s7x: Use helper function devm_clk_get_optional_enabled()
  gpio: xilinx: Use helper function devm_clk_get_optional_enabled()

 drivers/gpio/gpio-cadence.c | 23 ++++++-----------------
 drivers/gpio/gpio-lpc18xx.c | 23 ++++++-----------------
 drivers/gpio/gpio-mb86s7x.c | 21 +++++++--------------
 drivers/gpio/gpio-xilinx.c  | 11 +----------
 4 files changed, 20 insertions(+), 58 deletions(-)

-- 
2.17.1


