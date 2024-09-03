Return-Path: <linux-gpio+bounces-9612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415F09696E2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 10:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A765DB23536
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 08:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E347D200133;
	Tue,  3 Sep 2024 08:20:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F971CDFD9
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351604; cv=none; b=Gq0tdwL02pg6bSZsa/H5jtvyZ4MgQD01D9cYK069Fjpl27Sk9OzeJzITaBwKOZrTFh7zBmLW0lOTkd4JvryAi53NiXiLOWF512NLuzc6yGTiS01nUGKzhiTPayY6bii584zVYlbaz4fVgUsVtLTfq6NqkDNy+utHnBPScF+vKiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351604; c=relaxed/simple;
	bh=efBWNGHRrtSrmFuQULAf2TfI1mbhsfrBah6HXeHdNc4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uykgDsvdZoFH22wy/T2dFrLoSGVVxR1LnLJqRRxCfxVutAGnKly4YBvxbVb9vDOHgqrVJqXv/9wbiFUU/n/wPhbDnBY84bpnvMWv1ODW2kTJ1T7TbhS2Hb4ZevPXEVcSfGv4girqRHiiFB4UpGN0ocqmHb208rJ8LQzIIQ4dpog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WydmJ301BzpVNS;
	Tue,  3 Sep 2024 16:18:08 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 62126140258;
	Tue,  3 Sep 2024 16:19:59 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Sep
 2024 16:19:58 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <vz@mleia.com>,
	<linux-gpio@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH 0/4] Simplify code with helper function devm_clk_get*()
Date: Tue, 3 Sep 2024 16:06:23 +0800
Message-ID: <20240903080627.53652-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Use helper function devm_clk_get_enabled() and
devm_clk_get_optional_enabled() to simplify code.

Zhang Zekun (4):
  gpio: cadence: Use helper function devm_clk_get_enabled()
  gpio: lpc18xx: Use helper function devm_clk_get_enabled()
  gpio: mb86s7x: Use helper function devm_clk_get_enabled()
  gpio: xilinx: Use helper function devm_clk_get_enabled()

 drivers/gpio/gpio-cadence.c | 23 ++++++-----------------
 drivers/gpio/gpio-lpc18xx.c | 23 ++++++-----------------
 drivers/gpio/gpio-mb86s7x.c | 21 +++++++--------------
 drivers/gpio/gpio-xilinx.c  | 11 +----------
 4 files changed, 20 insertions(+), 58 deletions(-)

-- 
2.17.1


