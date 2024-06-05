Return-Path: <linux-gpio+bounces-7154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E6A8FC4C7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 09:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C506B1F224D3
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 07:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C468918C34C;
	Wed,  5 Jun 2024 07:41:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F81618C33B
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573272; cv=none; b=khHwI7dYoy8P1SwWaCjphTHoHn4rgeIx9YzpHX8AXkNyfAm8J6VrIAx7w/Pg5OLymfIuKLQrP7Ui0DdQCTKpVzq6CVmDLy5LPYtTLtQFoXbvSJF+nkkKBY0EaKruGK3Tk/PbHrG1cWKEDvKMmN/Wba9LBxH1bl8fF4y2od8W0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573272; c=relaxed/simple;
	bh=lL6nSEtr3CrJA3k762f56lFQVLN5bVt0F1s2E8tSZow=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Nl2k3jSDU2D2QvBnpKoHS3DryoeDFLgC3QtkbFf76Dm3QOPa1FjqjJV5a8GdyreDLRNtPqGKOtl7XatTKTQ3d7AaIpJzUQDNEc4w1MrdIYu2kXtt8ATGkG1SuyxM4esBgA571T++4U9AGVcJ11+UVv6DmQozSxB8Ov/GNvRFTUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VvK6T5XmFzwRp2;
	Wed,  5 Jun 2024 15:37:05 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (unknown [7.185.36.219])
	by mail.maildlp.com (Postfix) with ESMTPS id 411D5140F52;
	Wed,  5 Jun 2024 15:41:02 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500004.china.huawei.com (7.185.36.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 15:41:02 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 5 Jun
 2024 15:41:01 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-gpio@vger.kernel.org>
CC: <linus.walleij@linaro.org>, <dan.carpenter@linaro.org>,
	<tony@atomide.com>, <haojian.zhuang@linaro.org>, <yangyingliang@huawei.com>,
	<liwei391@huawei.com>
Subject: [PATCH 0/3] pinctrl: fix possible memory leak when pinctrl_enable() fails
Date: Wed, 5 Jun 2024 15:38:24 +0800
Message-ID: <20240605073827.3380584-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)

In devm_pinctrl_register(), if pinctrl_enable() fails in pinctrl_register(),
the "pctldev" has not been added to dev resources, so devm_pinctrl_dev_release()
can not be called, it leads memory leak.

And some driver calls pinctrl_register_and_init() which is not devm_ managed,
it also leads memory leak if pinctrl_enable() fails.

To fix this, introduce pinctrl_uninit_controller(), call it in the error path to
free memory and replace pinctrl_register_and_init with devm_pinctrl_register_and_init.


Yang Yingliang (3):
  pinctrl: core: fix possible memory leak when pinctrl_enable() fails
  pinctrl: single: fix possible memory leak when pinctrl_enable() fails
  pinctrl: ti: ti-iodelay: fix possible memory leak when
    pinctrl_enable() fails

 drivers/pinctrl/core.c                  | 12 +++++++++++-
 drivers/pinctrl/pinctrl-single.c        |  3 +--
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 11 ++++++-----
 3 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.25.1


