Return-Path: <linux-gpio+bounces-9018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2546195C3D2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 05:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44D091C2284B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 03:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBCD224E8;
	Fri, 23 Aug 2024 03:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="gPm/GQSH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m3290.qiye.163.com (mail-m3290.qiye.163.com [220.197.32.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6132D33080;
	Fri, 23 Aug 2024 03:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724384738; cv=none; b=C6RsHWmsWQ1Hjk2kcFeCibRC2aU35nl4jggQPEZHryhXGCYLE5tJgAaFxCJmS2Bk/dn3ndJk5JR+B1CBt46nZbm7DUWI0UFl/mT3GvqnlH6esdCFxzT3uxf3jtqQmlCg7Ae7pVrHJghWgNvYmQ9c37fTXxwNVchlnvTUWra8EHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724384738; c=relaxed/simple;
	bh=619Ptvk3s5x+Kwt1YH71GP4DjnupKHf7sfmg6K79Ddo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XqDimwpHZDa0vCU2SUuvNdMH6L3pQ8xWT9HUPPsZRyC5oUK0f/IbG/+ItsN55YZygc0kouWeAZ+woKCIBJJyhPq4tgsEE4G1YgQlUIhhuCGehIhuqO/6p4JNZ1LLGpcwXKLqK/HJty3UHrb+sdP+wAVepN9s2wd5TvYg36JUvbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=gPm/GQSH; arc=none smtp.client-ip=220.197.32.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=gPm/GQSHAAxzH797ORe9emB7dVOvZbhlLMwglem7R6bcBK2S+qBaOzh7tPZWMkeHdJJ90mqvPtZzprKB0z/o3Espjj9N40MF6qssd2h5rZoA/N2iKQuSKR9oNNAhJq9oGrx9Ib5OMUlWFVVD0Ngn6XZ/2ASgJC0wA7gqcoI0lN0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=F5H5rNwV6aJTfLYYBUUqm2z4cRjXCUxTyxJDgnGMbc4=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 22DE17E02A0;
	Fri, 23 Aug 2024 11:44:57 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
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
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v2] gpio: rockchip: Update the GPIO driver
Date: Fri, 23 Aug 2024 11:43:03 +0800
Message-Id: <20240823034314.62305-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgYGVZNSUJDSBlMQkIaQh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d565e0109cfkunm22de17e02a0
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORQ6FDo*PDIwEiwwGTZPTggt
	GEwaChpVSlVKTElPSENPTUJDSExPVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUlCSTcG

GPIO driver support acpi and new version, set input direction in
irq_request_resources, fix division error and debounce config error.

Changes since v1:
- Split commits with multiple changes into separate commits.
- Adjust backportable fix to the forefront.
- Modify messages of some commits. 

Ye Zhang (11):
  gpio: rockchip: avoid division by zero
  gpio: rockchip: release reference to device node
  gpio: rockchip: resolve overflow issues
  gpio: rockchip: resolve underflow issue
  gpio: rockchip: fix debounce calculate
  gpio: rockchip: Update debounce config function
  gpio: rockchip: support 'clock-names' from dt nodes
  gpio: rockchip: support new version gpio
  gpio: rockchip: Set input direction when request irq
  gpio: rockchip: support ACPI
  gpio: rockchip: driver works without pinctrl device

 drivers/gpio/gpio-rockchip.c | 297 +++++++++++++++++++++--------------
 1 file changed, 181 insertions(+), 116 deletions(-)

-- 
2.34.1


