Return-Path: <linux-gpio+bounces-8755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D6952A09
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 09:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD9021F22CFF
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 07:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9661C17B514;
	Thu, 15 Aug 2024 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="kDMz1WBB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1011.netease.com (mail-m1011.netease.com [154.81.10.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED69C13A26F;
	Thu, 15 Aug 2024 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707743; cv=none; b=nCOvJsiLkAcKhz3UZkChIg3t3ezVa3LqDZNgc9y+4drCiMUqq8PdrHnGcCfZR1UsMC/a7++S8TpA1RxACuLwG8vK+g8217md4E+CbNGyAs1OD1ZrsP78iA2Q5IkONfugWY11KCOSgmB1h1mNFt5p104woaYkkCSI7jCXgexA2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707743; c=relaxed/simple;
	bh=KJ8q/jikV/cKfiJf5tY+6LEtasPaMvlhZ3R2hwDIU5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nUxt2MtyV0mYJvDeV/NRYmcUIfPH+/z8r5Yip2f0GkLBxEmyLbmkFe1QuUbR94duVxNdR+VOmltmgxhRUkCblp6MtkKQo+f0wTMMzLPKanHiyUBSxpz6JQzJHY+NwZfeWQ328K7BC9Abotbd2Y2G+xFJLKfIXjC6gu3TRNN64lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=kDMz1WBB; arc=none smtp.client-ip=154.81.10.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=kDMz1WBBsBfHQZV2b5BpKoJVgnMAPlDDoxOl9sEKiv2VY0x4ceyMeQc1A9V/UlbzV8GAR3R7ONPbfsL14bK6tDS1UeMzGaAaPsRyGAvzOHI9n2yd4g03yLnPbOFJyawP3CWSvYatoQCjkycm672VBrfcb0waRX3bzDJyEhNJsOo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=nRi56lvQd1lb/9/v3V4eyAuo18seJA3Hj2x5njyEgPU=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 157447E0193;
	Thu, 15 Aug 2024 15:17:18 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v1 0/5] gpio: rockchip: Update the GPIO driver
Date: Thu, 15 Aug 2024 15:16:46 +0800
Message-Id: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhJH1YdHk8YTxkaHUlIT0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9154e5e70909cfkunm157447e0193
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NlE6FCo5CzI4NUM*QyoeKEkD
	PkIKCTZVSlVKTElITEtNSUhCSE1CVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkxLQzcG

GPIO driver support acpi and new version, set input direction in
irq_request_resources, fix division error and debounce config error.

Ye Zhang (5):
  gpio: rockchip: support acpi
  gpio: rockchip: support GPIO_TYPE_V2_2
  gpio: rockchip: Set input direction in irq_request_resources
  gpio: rockchip: avoid division by zero
  rockchip: gpio: fix debounce config error

 drivers/gpio/gpio-rockchip.c | 286 ++++++++++++++++++++++-------------
 1 file changed, 180 insertions(+), 106 deletions(-)

-- 
2.34.1


