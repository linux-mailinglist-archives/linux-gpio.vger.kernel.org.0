Return-Path: <linux-gpio+bounces-7207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B38FDCDE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 04:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9932F284A17
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 02:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBFD1B977;
	Thu,  6 Jun 2024 02:39:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56A318C38
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 02:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717641587; cv=none; b=P0m80rVcCZv3vbJyp/hmDa13fY4KOK8wKM0/b8huZnqfLC91ByRamGB2w15yc5JahUcTriXnNVzXBhcu3rcmxwgfnU2jyvyh5qwABjaIklSw2vS1q87RBOA10N29dj8Y5ZBZCbnoQOLDYzsOVlEeBJkVX4VF9rfUhhwIUvsf3GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717641587; c=relaxed/simple;
	bh=RKGScGvp+tdSVGQml3sVvcNT4c+IC8GIDMKOXUVnX3s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pq+ca4GxWU6Cjef3Udjw41Lq9T0UEpNQs6bIJBvTdEHxg4XFhayRqW4GEOyAEmZM1ZoRgFmYrQLNZag0XX3AKJJYiaOWSRAGeFNIFpDaoI19oUfZf4quDcBLf9EcirL35iiAQd4i8eAs6RIpn1b9tpUCzxfVicHZGKL0X78sXsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VvpP4425NzPpY2;
	Thu,  6 Jun 2024 10:36:24 +0800 (CST)
Received: from dggpemm100024.china.huawei.com (unknown [7.185.36.234])
	by mail.maildlp.com (Postfix) with ESMTPS id AE22D140428;
	Thu,  6 Jun 2024 10:39:42 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100024.china.huawei.com (7.185.36.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:39:42 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 6 Jun
 2024 10:39:42 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-gpio@vger.kernel.org>
CC: <linus.walleij@linaro.org>, <dan.carpenter@linaro.org>,
	<tony@atomide.com>, <haojian.zhuang@linaro.org>, <yangyingliang@huawei.com>,
	<liwei391@huawei.com>
Subject: [PATCH v2 0/3] pinctrl: fix possible memory leak when pinctrl_enable() fails
Date: Thu, 6 Jun 2024 10:37:01 +0800
Message-ID: <20240606023704.3931561-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)

In devm_pinctrl_register(), if pinctrl_enable() fails in pinctrl_register(),
the "pctldev" has not been added to dev resources, so devm_pinctrl_dev_release()
can not be called, it leads memory leak.

And some driver calls pinctrl_register_and_init() which is not devm_ managed,
it also leads memory leak if pinctrl_enable() fails.

To fix this, introduce pinctrl_uninit_controller(), call it in the error path to
free memory and replace pinctrl_register_and_init with devm_pinctrl_register_and_init.

v1 -> v2:
  Check pinctrl_enable() return value in pcs_probe() in patch #2

Yang Yingliang (3):
  pinctrl: core: fix possible memory leak when pinctrl_enable() fails
  pinctrl: single: fix possible memory leak when pinctrl_enable() fails
  pinctrl: ti: ti-iodelay: fix possible memory leak when
    pinctrl_enable() fails

 drivers/pinctrl/core.c                  | 12 +++++++++++-
 drivers/pinctrl/pinctrl-single.c        |  7 ++++---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 11 ++++++-----
 3 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.25.1


