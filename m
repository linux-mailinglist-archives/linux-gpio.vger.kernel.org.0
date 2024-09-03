Return-Path: <linux-gpio+bounces-9654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE56496A014
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E1B31C2450B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B61A186E51;
	Tue,  3 Sep 2024 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="VfBjbu/G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m3272.qiye.163.com (mail-m3272.qiye.163.com [220.197.32.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C713FE55;
	Tue,  3 Sep 2024 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725372734; cv=none; b=mraAdLXRSxcT6eNdRZOWpNZv3bmlkmPxX9iNtv3UVFbCH2IHoBizhZgYXScexKSxF+i0Z282MrblWV5l94AlbAiWFuOq9IOdtkTTFdy0AXUy9zIXKhQgvJMScNDzXk50yw4lu4u+vkgKAzXoTHQnvdje3h7kIazWSk7wH/ikZPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725372734; c=relaxed/simple;
	bh=UeiK1wLyZBDQlGDJCkhKV3j4EVW2BHI4KOCpr8fLuFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e9AWi1n/gqgbV9g1i+PCi0ojw+MtuqOyiUEqus7zTw8KVrw/fnaQKV2efSst7y8mjZ72sK0NSKCHYhXEwAWRBfY/6uO4ksoQ1hmhguO3O2pzPfzfl6nX8R76JJ9KH7grze0neX2Uq9RasF3eYliJW/y2JwSK/e8EaTGgVE+Fz0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=VfBjbu/G; arc=none smtp.client-ip=220.197.32.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=VfBjbu/G4Zhzvb/kuPYrls1VcUI/FDjJPfg9g8uLZe2eq0bZiUgzDjpmQ+4Ntq8VpJi+j2fhDSaH+yaBTAo/9ZAQeeLVkyhXbQtNg2+RzdqbsZQhtFF1DTbQIAhoP+OpyCqmhPDtVOG0SqD7ohr90OX5EnF0jQQr+cObq9Gptn0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=mu4O+2UrPgqXaxroJrztwkPwlplzDcAtYXJiR52xTfE=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id C58307E06EC;
	Tue,  3 Sep 2024 15:37:01 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: [PATCH v3 00/12] gpio: rockchip: Update the GPIO driver
Date: Tue,  3 Sep 2024 15:36:37 +0800
Message-Id: <20240903073649.237362-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtCGFZJGh4fT0JKSh5MGktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a91b6d0cb2d09cfkunmc58307e06ec
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6FCo*FzIrMEk4PBJNFR4q
	AQtPCjxVSlVKTElOSE9CS0lIS0pPVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUNJTTcG

GPIO driver support acpi and new version, set input direction in
irq_request_resources, fix division error and debounce config error.

Changes since v1:
- Split commits with multiple changes into separate commits.
- Adjust backportable fix to the forefront.
- Modify messages of some commits.

Changes since v2:
- Optimize version number comments.
- Modify the GPIO version judgment logic.
- Use devm_clk_get_enabled to simplify the code.
- Use guard instead of mutex_lock to simplify the code.
- Use irq_hw_number_t and irqd_to_hwirq() in the request irq function.
- Since list_first_entry cannot return NULL, remove the NULL check.
- Temporarily do not add support for ACPI.

Ye Zhang (12):
  gpio: rockchip: avoid division by zero
  gpio: rockchip: release reference to device node
  gpio: rockchip: resolve overflow issues
  gpio: rockchip: resolve underflow issue
  gpio: rockchip: fix debounce calculate
  gpio: rockchip: Update debounce config function
  gpio: rockchip: support 'clock-names' from dt nodes
  gpio: rockchip: explan the format of the GPIO version ID
  gpio: rockchip: change the GPIO version judgment logic
  gpio: rockchip: support new version gpio
  gpio: rockchip: Set input direction when request irq
  gpio: rockchip: replace mutex_lock() with guard()

 drivers/gpio/gpio-rockchip.c       | 151 ++++++++++++++++++-----------
 drivers/pinctrl/pinctrl-rockchip.h |   2 +
 2 files changed, 99 insertions(+), 54 deletions(-)

-- 
2.34.1


